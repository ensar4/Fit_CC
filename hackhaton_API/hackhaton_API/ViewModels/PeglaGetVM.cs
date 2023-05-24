namespace hackhaton_API.ViewModels
{
    public class PeglaGetVM
    {
        public int Id { get; set; }
        public string Naziv { get; set; }
        public string Opis { get; set; }
        public bool StanjeStruje { get; set; }
        public int HomeId { get; set; }
        public int TipId { get; set; }
    }
}
