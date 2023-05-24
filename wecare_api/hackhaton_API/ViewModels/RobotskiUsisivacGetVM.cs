namespace hackhaton_API.ViewModels
{
    public class RobotskiUsisivacAddVM
    {
        public int id { get; set; }
        public string naziv { get; set; }
        public bool stanje { get; set; }
        public DateTime vrijemePaljenja { get; set; }
        public DateTime vrijemeGasenja { get; set; }
        public int homeId { get; set; }
        public int tipId { get; set; }
    }
}
