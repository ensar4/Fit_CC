using hackhaton_API.Data;
using hackhaton_API.Models;
using hackhaton_API.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace hackhaton_API.Controllers
{

    //[Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class SenzorDimaController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public SenzorDimaController(ApplicationDbContext dbContext)
        {
            this._dbContext = dbContext;
        }


        [HttpPost]
        public ActionResult Snimi([FromBody] SenzorDimaAddVM x)
        {
            SenzorDima? objekat;

            if (x.Id == 0)
            {
                objekat = new SenzorDima();
                _dbContext.Add(objekat);
            }
            else
            {
                objekat = _dbContext.SenzorDima.Find(x.Id);
            }

            objekat.Id = x.Id;
            objekat.Stanje = x.Stanje;
            objekat.HomeId = x.HomeId;

            _dbContext.SaveChanges();
            return Ok(objekat);
        }

        [HttpGet]
        public ActionResult GetAll()
        {
            var data = _dbContext.SenzorDima
                .OrderBy(s => s.Id)
                .Select(s => new SenzorDimaGetVM
                {
                  Id=s.Id,
                  Stanje=s.Stanje,
                })
                .AsQueryable();
            return Ok(data.Take(100).ToList());
        }

      

        [HttpPost("{id}")]
        public ActionResult Delete(int id)
        {
            SenzorDima? obj = _dbContext.SenzorDima.Find(id);

            if (obj == null)
                return BadRequest("pogresan ID");

            _dbContext.Remove(obj);

            _dbContext.SaveChanges();
            return Ok(obj);
        }
    }
}
