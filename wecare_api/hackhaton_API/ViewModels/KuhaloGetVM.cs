namespace hackhaton_API.ViewModels
{
    public class KuhaloGetVM
    {
        public int Id { get; set; }
        public string Naziv { get; set; }
        public string Opis { get; set; }
        public bool StanjeStruje { get; set; }
        public DateTime? VrijemeGasenja { get; set; }
        public DateTime? VrijemePaljenja { get; set; }
        public int HomeId { get; set; }
        public int TipId { get; set; }
    }
}
