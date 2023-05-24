using hackhaton_API.Data;
using hackhaton_API.Models;
using hackhaton_API.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace hackhaton_API.Controllers
{

    //[Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class KlimaController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public KlimaController(ApplicationDbContext dbContext)
        {
            this._dbContext = dbContext;
        }


        [HttpPost]
        public Klima Snimi([FromBody] KlimaAddVM x)
        {
            Klima? objekat;

            if (x.id == 0)
            {
                objekat = new Klima();
                _dbContext.Add(objekat);
            }
            else
            {
                objekat = _dbContext.Klima.Find(x.id);
            }

            objekat.Id = x.id;
            objekat.Naziv = x.naziv;
            objekat.Stanje = x.stanje;
            objekat.Temperatura = x.temperatura;
            objekat.Mod = x.mod;
            objekat.BrzinaPuhanja = x.brzinaPuhanja;
            objekat.HomeId = x.homeId;

            _dbContext.SaveChanges();
            return objekat;
        }

        [HttpGet]
        public ActionResult GetAll()
        {
            var data = _dbContext.Klima
                .OrderBy(s => s.Id)
                .Select(s => new KlimaGetVM
                {
                    id = s.Id,
                    naziv = s.Naziv,
                    stanje = s.Stanje,
                    mod = s.Mod,
                    brzinaPuhanja = s.BrzinaPuhanja,
                    temperatura = s.Temperatura

                })
                .AsQueryable();
            return Ok(data.Take(100).ToList());
        }
		[HttpGet]
		public ActionResult GetByHouse(int? homeId)
		{
            var data = _dbContext.Klima
                .OrderBy(s => s.Id).
                Where(s => s.HomeId == homeId)
				.Select(s => new KlimaGetVM
				{
					id = s.Id,
					naziv = s.Naziv,
					stanje = s.Stanje,
					mod = s.Mod,
					brzinaPuhanja = s.BrzinaPuhanja,
					temperatura = s.Temperatura

				})
				.AsQueryable();
			return Ok(data.Take(100).ToList());
		}




		[HttpPost("{id}")]
        public ActionResult Delete(int id)
        {
            Klima? obj = _dbContext.Klima.Find(id);

            if (obj == null)
                return BadRequest("pogresan ID");

            _dbContext.Remove(obj);

            _dbContext.SaveChanges();
            return Ok(obj);
        }
    }
}
