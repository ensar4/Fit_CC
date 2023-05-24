using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace hackhaton_API.Models
{
    public class SenzorDima
    {
        [Key]
        public int Id { get; set; }
        public bool Stanje { get; set; }
      

        [ForeignKey("HomeId")]
        public Home Home { get; set; }
        public int HomeId { get; set; }


    }
}
