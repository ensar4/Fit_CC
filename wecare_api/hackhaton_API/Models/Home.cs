using System.ComponentModel.DataAnnotations;
using System.Reflection.Metadata.Ecma335;

namespace hackhaton_API.Models
{
    public class Home
    {
        [Key]
        public int Id { get; set; }
        public string Naziv { get; set; }
        public string Adresa { get; set; }


    }
}
