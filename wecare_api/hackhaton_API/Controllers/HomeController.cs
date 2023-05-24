using hackhaton_API.Data;
using hackhaton_API.Models;
using hackhaton_API.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace hackhaton_API.Controllers
{

    //[Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class HomeController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public HomeController(ApplicationDbContext dbContext)
        {
            this._dbContext = dbContext;
        }


        [HttpPost]
        public ActionResult<HomeGetVM> Snimi([FromBody] HomeAddVM x)
        {
            Home? objekat;

            if (x.id == 0)
            {
                objekat = new Home();
                _dbContext.Add(objekat);
            }
            else
            {
                objekat = _dbContext.Home.Find(x.id);
            }

            objekat.Id = x.id;
            objekat.Naziv = x.naziv;
            objekat.Adresa = x.adresa;

            _dbContext.SaveChanges();

            //var obj = _dbContext.Home.Where(h => h.Id == objekat.Id);

            return Ok(objekat.Id);
        }

        [HttpGet]
        public ActionResult GetAll()
        {
            var data = _dbContext.Home
                .OrderBy(s => s.Id)
                .Select(s => new HomeGetVM
                {
                  adresa=s.Adresa,
                  naziv=s.Naziv

                })
                .AsQueryable();
            return Ok(data.Take(100).ToList());
        }

      

        [HttpPost("{id}")]
        public ActionResult Delete(int id)
        {
            Home? home = _dbContext.Home.Find(id);

            if (home == null)
                return BadRequest("pogresan ID");

            _dbContext.Remove(home);

            _dbContext.SaveChanges();
            return Ok(home);
        }
    }
}
