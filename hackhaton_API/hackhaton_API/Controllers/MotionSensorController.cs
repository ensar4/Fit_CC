using hackhaton_API.Data;
using hackhaton_API.Models;
using hackhaton_API.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace hackhaton_API.Controllers
{

    //[Authorize]
    [ApiController]
    [Route("[controller]/[action]")]
    public class MotionSensorController : ControllerBase
    {
        private readonly ApplicationDbContext _dbContext;

        public MotionSensorController(ApplicationDbContext dbContext)
        {
            this._dbContext = dbContext;
        }


        [HttpPost]
        public MotionSensor Snimi([FromBody] MotionSensorAddVM x)
        {
            MotionSensor? objekat;

            if (x.id == 0)
            {
                objekat = new MotionSensor();
                _dbContext.Add(objekat);
            }
            else
            {
                objekat = _dbContext.MotionSensor.Find(x.id);
            }

            objekat.Id = x.id;
            objekat.Naziv = x.naziv;
            objekat.PokretDetektovan = x.pokretDetektovan;
            objekat.OsobaPala = x.osobaPala;
            objekat.HomeId = x.homeId;

            _dbContext.SaveChanges();
            return objekat;
        }

        [HttpGet]
        public ActionResult GetAll()
        {
            var data = _dbContext.MotionSensor
                .OrderBy(s => s.Id)
                .Select(s => new MotionSensorGetVM
                {
                    id = s.Id,
                    naziv = s.Naziv,
                    pokretDetektovan = s.PokretDetektovan,
                    osobaPala = s.OsobaPala,
                    homeId = s.HomeId,

                })
                .AsQueryable();
            return Ok(data.Take(100).ToList());
        }

      

        [HttpPost("{id}")]
        public ActionResult Delete(int id)
        {
            MotionSensor? obj = _dbContext.MotionSensor.Find(id);

            if (obj == null)
                return BadRequest("pogresan ID");

            _dbContext.Remove(obj);

            _dbContext.SaveChanges();
            return Ok(obj);
        }
    }
}
