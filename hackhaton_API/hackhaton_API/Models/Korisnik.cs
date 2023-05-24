using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace hackhaton_API.Models
{
    public class Korisnik
    {
        [Key]
        public int Id { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string? BrojTelefona { get; set; }
        public string Mail { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        [ForeignKey("HomeId")]
        public Home Home { get; set; }
        public int HomeId { get; set; }
    }
}
