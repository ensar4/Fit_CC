using hackhaton_API.Data;
using hackhaton_API.Models;
using hackhaton_API.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace hackhaton_API.Controllers
{

    //[Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class TlakomjerController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public TlakomjerController(ApplicationDbContext dbContext)
        {
            this._dbContext = dbContext;
        }


        [HttpPost]
        public Tlakomjer Snimi([FromBody] TlakomjerAddVM x)
        {
            Tlakomjer? objekat;

            if (x.id == 0)
            {
                objekat = new Tlakomjer();
                _dbContext.Add(objekat);
            }
            else
            {
                objekat = _dbContext.Tlakomjer.Find(x.id);
            }

            objekat.Id = x.id;
            objekat.Naziv = x.naziv;
            objekat.OtkucajiSrca = x.otkucajiSrca;
            objekat.Tlak = x.tlak;
            objekat.HomeId = x.homeId;

            _dbContext.SaveChanges();
            return objekat;
        }

        [HttpGet]
        public ActionResult GetAll()
        {
            var data = _dbContext.Tlakomjer
                .OrderBy(s => s.Id)
                .Select(s => new TlakomjerGetVM
                {
                    id = s.Id,
                    naziv = s.Naziv,
                    tlak=s.Tlak,
                    otkucajiSrca=s.OtkucajiSrca

                })
                .AsQueryable();
            return Ok(data.Take(100).ToList());
        }

      

        [HttpPost("{id}")]
        public ActionResult Delete(int id)
        {
            Tlakomjer? obj = _dbContext.Tlakomjer.Find(id);

            if (obj == null)
                return BadRequest("pogresan ID");

            _dbContext.Remove(obj);

            _dbContext.SaveChanges();
            return Ok(obj);
        }
    }
}
