namespace hackhaton_API.ViewModels
{
    public class KlimaGetVM
    {
        public int id { get; set; }
        public string naziv { get; set; }
        public bool stanje { get; set; }
        public int temperatura { get; set; }
        public string mod { get; set; }
        public int brzinaPuhanja { get; set; }
        public int homeId { get; set; }
        public int tipId { get; set; }
    }
}
