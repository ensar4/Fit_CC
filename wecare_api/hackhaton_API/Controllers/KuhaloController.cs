using hackhaton_API.Data;
using hackhaton_API.Models;
using hackhaton_API.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace hackhaton_API.Controllers
{

    //[Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class KuhaloController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public KuhaloController(ApplicationDbContext dbContext)
        {
            this._dbContext = dbContext;
        }


        [HttpPost]
        public ActionResult Snimi([FromBody] KuhaloAddVM x)
        {
            Kuhalo? objekat;

            if (x.Id == 0)
            {
                objekat = new Kuhalo();
                _dbContext.Add(objekat);
            }
            else
            {
                objekat = _dbContext.Kuhalo.Find(x.Id);
            }

            objekat.Id = x.Id;
            objekat.Naziv = x.Naziv;
            objekat.Opis = x.Opis;
            objekat.StanjeStruje = x.StanjeStruje;
            objekat.VrijemePaljenja = x.VrijemePaljenja;
            objekat.VrijemeGasenja = x.VrijemeGasenja;
            objekat.HomeId = x.HomeId;

            _dbContext.SaveChanges();
            return Ok(objekat);
        }

        [HttpGet]
        public ActionResult GetAll()
        {
            var data = _dbContext.Kuhalo
                .OrderBy(s => s.Id)
                .Select(s => new KuhaloGetVM
                {
                  Opis =s.Opis,
                  Naziv =s.Naziv,
                  StanjeStruje=s.StanjeStruje,
                  VrijemeGasenja=s.VrijemeGasenja,
                  VrijemePaljenja=s.VrijemePaljenja

                })
                .AsQueryable();
            return Ok(data.Take(100).ToList());
        }

		[HttpGet]
		public ActionResult GetByHouse(int? homeId)
		{
			var data = _dbContext.Kuhalo
				.OrderBy(s => s.Id).
				Where(s => s.HomeId == homeId)
				.Select(s => new KuhaloGetVM
				{
					Opis = s.Opis,
					StanjeStruje = s.StanjeStruje,
					Naziv = s.Naziv,
					VrijemeGasenja = s.VrijemeGasenja,
					VrijemePaljenja = s.VrijemePaljenja

				})
				.AsQueryable();
			return Ok(data.Take(100).ToList());
		}

		[HttpPost("{id}")]
        public ActionResult Delete(int id)
        {
            Kuhalo? obj = _dbContext.Kuhalo.Find(id);

            if (obj == null)
                return BadRequest("pogresan ID");

            _dbContext.Remove(obj);

            _dbContext.SaveChanges();
            return Ok(obj);
        }
    }
}
