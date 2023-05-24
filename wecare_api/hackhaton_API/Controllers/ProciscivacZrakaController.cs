using hackhaton_API.Data;
using hackhaton_API.Models;
using hackhaton_API.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace hackhaton_API.Controllers
{

    //[Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class ProciscivacZrakaController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public ProciscivacZrakaController(ApplicationDbContext dbContext)
        {
            this._dbContext = dbContext;
        }


        [HttpPost]
        public ProciscivacZraka Snimi([FromBody] ProciscivacZrakaAddVM x)
        {
            ProciscivacZraka? objekat;

            if (x.id == 0)
            {
                objekat = new ProciscivacZraka();
                _dbContext.Add(objekat);
            }
            else
            {
                objekat = _dbContext.ProciscivacZraka.Find(x.id);
            }

            objekat.Id = x.id;
            objekat.Naziv = x.naziv;
            objekat.Stanje = x.stanje;
            objekat.VlaznostZraka = x.vlaznostZraka;
            objekat.HomeId = x.homeId;

            _dbContext.SaveChanges();
            return objekat;
        }

		[HttpGet]
		public ActionResult GetByHouse(int? homeId)
		{
			var data = _dbContext.ProciscivacZraka
				.OrderBy(s => s.Id).
				Where(s => s.HomeId == homeId)
				.Select(s => new ProciscivacZrakaGetVM
				{
					id = s.Id,
					vlaznostZraka = s.VlaznostZraka,
					stanje = s.Stanje,
					naziv = s.Naziv

				})
				.AsQueryable();
			return Ok(data.Take(100).ToList());
		}

		[HttpGet]
        public ActionResult GetAll()
        {
            var data = _dbContext.ProciscivacZraka
                .OrderBy(s => s.Id)
                .Select(s => new ProciscivacZrakaGetVM
                {
                  id=s.Id,
                  vlaznostZraka =s.VlaznostZraka,
                  stanje =s.Stanje,
                  naziv=s.Naziv
                })
                .AsQueryable();
            return Ok(data.Take(100).ToList());
        }

      

        [HttpPost("{id}")]
        public ActionResult Delete(int id)
        {
            ProciscivacZraka? obj = _dbContext.ProciscivacZraka.Find(id);

            if (obj == null)
                return BadRequest("pogresan ID");

            _dbContext.Remove(obj);

            _dbContext.SaveChanges();
            return Ok(obj);
        }
    }
}
