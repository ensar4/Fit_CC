using hackhaton_API.Models;
using System.ComponentModel.DataAnnotations.Schema;

namespace hackhaton_API.ViewModels
{
    public class TlakomjerAddVM
    {
        public int id { get; set; }
        public string? naziv { get; set; }
        public int otkucajiSrca { get; set; }
        public int tlak { get; set; }
        public int homeId { get; set; }
        public int tipId { get; set; }
    }
}
