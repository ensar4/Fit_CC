using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Reflection.Metadata.Ecma335;

namespace hackhaton_API.Models
{
    public class Klima
    {
        [Key]
        public int Id { get; set; }
        public string Naziv { get; set; }
        public bool Stanje { get; set; }
        public int Temperatura { get; set; }
        public string Mod { get; set; }
        public int BrzinaPuhanja { get; set; }

        [ForeignKey("HomeId")]
        public Home Home { get; set; }
        public int HomeId { get; set; }


    }
}
