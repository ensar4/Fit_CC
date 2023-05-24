using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Reflection.Metadata.Ecma335;

namespace hackhaton_API.Models
{
    public class Tlakomjer
    {
        [Key]
        public int Id { get; set; }
        public string Naziv { get; set; }
        public int OtkucajiSrca { get; set; }
        public int Tlak { get; set; }

        [ForeignKey("HomeId")]
        public Home Home { get; set; }
        public int HomeId { get; set; }


    }
}
