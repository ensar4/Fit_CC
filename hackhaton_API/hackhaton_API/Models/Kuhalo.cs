using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace hackhaton_API.Models
{
    public class Kuhalo
    {
        [Key]
        public int Id { get; set; }
        public string Naziv { get; set; }
        public string Opis { get; set; }
        public bool StanjeStruje { get; set; }
        public DateTime? VrijemeGasenja { get; set; }
        public DateTime? VrijemePaljenja { get; set; }

        [ForeignKey("HomeId")]
        public Home Home { get; set; }
        public int HomeId { get; set; }



    }
}
