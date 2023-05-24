using hackhaton_API.Data;
using hackhaton_API.Models;
using hackhaton_API.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace hackhaton_API.Controllers
{

    //[Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class VrataController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public VrataController(ApplicationDbContext dbContext)
        {
            this._dbContext = dbContext;
        }


        [HttpPost]
        public ActionResult Snimi([FromBody] VrataAddVM x)
        {
            Vrata? objekat;

            if (x.Id == 0)
            {
                objekat = new Vrata();
                _dbContext.Add(objekat);
            }
            else
            {
                objekat = _dbContext.Vrata.Find(x.Id);
            }

            objekat.Id = x.Id;
            objekat.Naziv = x.Naziv;
            objekat.Stanje = x.Stanje;
            objekat.VrijemeZakljucavanja = x.VrijemeZakljucavanja;
            objekat.VrijemeOtkljucavanja = x.VrijemeOtkljucavanja;
            objekat.HomeId = x.HomeId;

            _dbContext.SaveChanges();
            return Ok(objekat);
        }

		[HttpGet]
		public ActionResult GetByHouse(int? homeId)
		{
			var data = _dbContext.Vrata
				.OrderBy(s => s.Id).
				Where(s => s.HomeId == homeId)
				.Select(s => new VrataGetVM
				{
					Id = s.Id,
					Naziv = s.Naziv,
					Stanje = s.Stanje,
					VrijemeOtkljucavanja = s.VrijemeOtkljucavanja,
					VrijemeZakljucavanja = s.VrijemeZakljucavanja
				})
				.AsQueryable();
			return Ok(data.Take(100).ToList());
		}

		[HttpGet]
        public ActionResult GetAll()
        {
            var data = _dbContext.Vrata
                .OrderBy(s => s.Id)
                .Select(s => new VrataGetVM
                {
                  Id=s.Id,
                  Naziv=s.Naziv,
                  Stanje=s.Stanje,
                  VrijemeOtkljucavanja=s.VrijemeOtkljucavanja,
                  VrijemeZakljucavanja=s.VrijemeZakljucavanja
                })
                .AsQueryable();
            return Ok(data.Take(100).ToList());
        }

      

        [HttpPost("{id}")]
        public ActionResult Delete(int id)
        {
            Vrata? obj = _dbContext.Vrata.Find(id);

            if (obj == null)
                return BadRequest("pogresan ID");

            _dbContext.Remove(obj);

            _dbContext.SaveChanges();
            return Ok(obj);
        }
    }
}
