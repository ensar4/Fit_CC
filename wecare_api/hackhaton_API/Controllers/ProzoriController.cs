using hackhaton_API.Data;
using hackhaton_API.Models;
using hackhaton_API.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace hackhaton_API.Controllers
{

    //[Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class ProzoriController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public ProzoriController(ApplicationDbContext dbContext)
        {
            this._dbContext = dbContext;
        }


        [HttpPost]
        public ActionResult Snimi([FromBody] ProzoriAddVM x)
        {
            Prozori? objekat;

            if (x.Id == 0)
            {
                objekat = new Prozori();
                _dbContext.Add(objekat);
            }
            else
            {
                objekat = _dbContext.Prozori.Find(x.Id);
            }

            objekat.Id = x.Id;
            objekat.Naziv = x.Naziv;
            objekat.otvoren = x.otvoren;
            objekat.HomeId = x.HomeId;

            _dbContext.SaveChanges();
            return Ok(objekat);
        }


		[HttpGet]
		public ActionResult GetByHouse(int? homeId)
		{
			var data = _dbContext.Prozori
				.OrderBy(s => s.Id).
				Where(s => s.HomeId == homeId)
				.Select(s => new ProzoriGetVM
				{
					Id = s.Id,
					Naziv = s.Naziv,
                    otvoren = s.otvoren

				})
				.AsQueryable();
			return Ok(data.Take(100).ToList());
		}
		[HttpGet]
        public ActionResult GetAll()
        {
            var data = _dbContext.Prozori
                .OrderBy(s => s.Id)
                .Select(s => new ProzoriGetVM
                {
                  Id=s.Id,
                  Naziv=s.Naziv,
                })
                .AsQueryable();
            return Ok(data.Take(100).ToList());
        }

      

        [HttpPost("{id}")]
        public ActionResult Delete(int id)
        {
            Prozori? obj = _dbContext.Prozori.Find(id);

            if (obj == null)
                return BadRequest("pogresan ID");

            _dbContext.Remove(obj);

            _dbContext.SaveChanges();
            return Ok(obj);
        }
    }
}
