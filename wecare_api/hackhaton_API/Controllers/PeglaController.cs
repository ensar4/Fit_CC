using hackhaton_API.Data;
using hackhaton_API.Models;
using hackhaton_API.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace hackhaton_API.Controllers
{

    //[Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class PeglaController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public PeglaController(ApplicationDbContext dbContext)
        {
            this._dbContext = dbContext;
        }


        [HttpPost]
        public ActionResult Snimi([FromBody] PeglaAddVM x)
        {
            Pegla? objekat;

            if (x.Id == 0)
            {
                objekat = new Pegla();
                _dbContext.Add(objekat);
            }
            else
            {
                objekat = _dbContext.Pegla.Find(x.Id);
            }

            objekat.Id = x.Id;
            objekat.Naziv = x.Naziv;
            objekat.Opis = x.Opis;
            objekat.StanjeStruje = x.StanjeStruje;
            objekat.HomeId = x.HomeId;

            _dbContext.SaveChanges();
            return Ok(objekat);
        }
		[HttpGet]
		public ActionResult GetByHouse(int? homeId)
		{
			var data = _dbContext.Pegla
				.OrderBy(s => s.Id).
				Where(s => s.HomeId == homeId)
				.Select(s => new PeglaGetVM
				{
					Id = s.Id,
					Opis = s.Opis,
					Naziv = s.Naziv,
					StanjeStruje = s.StanjeStruje

				})
				.AsQueryable();
			return Ok(data.Take(100).ToList());
		}

		[HttpGet]
        public ActionResult GetAll()
        {
            var data = _dbContext.Pegla
                .OrderBy(s => s.Id)
                .Select(s => new PeglaGetVM
                {
                  Id=s.Id,
                  Opis =s.Opis,
                  Naziv=s.Naziv,
                  StanjeStruje=s.StanjeStruje

                })
                .AsQueryable();
            return Ok(data.Take(100).ToList());
        }

      

        [HttpPost("{id}")]
        public ActionResult Delete(int id)
        {
            Pegla? obj = _dbContext.Pegla.Find(id);

            if (obj == null)
                return BadRequest("pogresan ID");

            _dbContext.Remove(obj);

            _dbContext.SaveChanges();
            return Ok(obj);
        }
    }
}
