namespace hackhaton_API.ViewModels
{
    public class VrataAddVM
    {
        public int Id { get; set; }
        public string Naziv { get; set; }
        public bool Stanje { get; set; }
        public DateTime? VrijemeZakljucavanja { get; set; }
        public DateTime? VrijemeOtkljucavanja { get; set; }
        public int HomeId { get; set; }
        public int TipId { get; set; }
    }
}
