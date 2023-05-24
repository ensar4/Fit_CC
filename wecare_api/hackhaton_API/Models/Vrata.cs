using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace hackhaton_API.Models
{
    public class Vrata
    {
        [Key]
        public int Id { get; set; }
        public string Naziv { get; set; }
        public bool Stanje { get; set; }
        public DateTime? VrijemeZakljucavanja { get; set; }
        public DateTime? VrijemeOtkljucavanja { get; set; }

        [ForeignKey("HomeId")]
        public Home Home { get; set; }
        public int HomeId { get; set; }


    }
}
