using hackhaton_API.Models;
using System.ComponentModel.DataAnnotations.Schema;

namespace hackhaton_API.ViewModels
{
    public class MotionSensorAddVM
    {
        public int id { get; set; }
        public string naziv { get; set; }
        public bool pokretDetektovan { get; set; }
        public bool osobaPala { get; set; }
        public int homeId { get; set; }
        public int tipId { get; set; }
    }
}
