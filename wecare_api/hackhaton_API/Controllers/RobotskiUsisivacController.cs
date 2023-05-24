using hackhaton_API.Data;
using hackhaton_API.Models;
using hackhaton_API.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace hackhaton_API.Controllers
{

    //[Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class RobotskiUsisivacController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public RobotskiUsisivacController(ApplicationDbContext dbContext)
        {
            this._dbContext = dbContext;
        }


        [HttpPost]
        public RobotskiUsisivac Snimi([FromBody] RobotskiUsisivacAddVM x)
        {
            RobotskiUsisivac? objekat;

            if (x.id == 0)
            {
                objekat = new RobotskiUsisivac();
                _dbContext.Add(objekat);
            }
            else
            {
                objekat = _dbContext.RobotskiUsisivac.Find(x.id);
            }

            objekat.Id = x.id;
            objekat.Naziv = x.naziv;
            objekat.Stanje = x.stanje;
            objekat.VrijemePaljenja = x.vrijemePaljenja;
            objekat.VrijemeGasenja = x.vrijemeGasenja;
            objekat.HomeId = x.homeId;

            _dbContext.SaveChanges();
            return objekat;
        }

		[HttpGet]
		public ActionResult GetByHouse(int? homeId)
		{
			var data = _dbContext.RobotskiUsisivac
				.OrderBy(s => s.Id).
				Where(s => s.HomeId == homeId)
				.Select(s => new RobotskiUsisivacGetVM
				{
					id = s.Id,
					naziv = s.Naziv,
					stanje = s.Stanje,
					vrijemePaljenja = s.VrijemePaljenja,
					vrijemeGasenja = s.VrijemeGasenja

				})
				.AsQueryable();
			return Ok(data.Take(100).ToList());
		}

		[HttpGet]
        public ActionResult GetAll()
        {
            var data = _dbContext.RobotskiUsisivac
                .OrderBy(s => s.Id)
                .Select(s => new RobotskiUsisivacGetVM
                {
                    id = s.Id,
                    naziv = s.Naziv,
                    stanje = s.Stanje,
                    vrijemePaljenja = s.VrijemePaljenja,
                    vrijemeGasenja = s.VrijemeGasenja

                })
                .AsQueryable();
            return Ok(data.Take(100).ToList());
        }

      

        [HttpPost("{id}")]
        public ActionResult Delete(int id)
        {
            RobotskiUsisivac? obj = _dbContext.RobotskiUsisivac.Find(id);

            if (obj == null)
                return BadRequest("pogresan ID");

            _dbContext.Remove(obj);

            _dbContext.SaveChanges();
            return Ok(obj);
        }
    }
}
