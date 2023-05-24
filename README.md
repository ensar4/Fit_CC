# WeCare
Članovi tima su: 
- Eldar Šoše
- Lejla Marić
- Ensar Lizde

# O projektu

WeCare projekat je namijenjen za skrbnike i porodice koje imaju starog ili bolesnog člana. Skrb o staroj ili bolesnoj osobi je veoma teška i zahtjevna pa skrbnici nemaju mnogo vremena za sebe. Pametna narukvica u kombinaciji sa mobilnom aplikacijom pruža skrbnicima da ostave staru ili bolesnu osobu na kraći ili duži period bez nadzora. Samim time će imati mogućnost da unaprijede svoje fizičko i/ili mentalno zdravlje. 

Pametna narukvica će imati konekciju na WI-FI te time slati podatke o vitalnim znacima osobe, da li je osoba pala te lokaciju te osobe na online bazu podataka. Sa online baze podataka ti podaci će se prikazivati na mobilnoj aplikaciji jednog ili više skrbnika. Također jedan skrbnik će moći nadgledati više narukvica. 

Korištene tehnologije:
 - .net framework
 - flutter
 - firebase
 - arduino
 - sql

# Pametna narukvica

Pametna narukvica je trenutno u verziji prototipa te nema sve funkcionalnosti koje su zamišljene.
Prototip je rađen koristeći mikrokontorler node MCU8266 te senzora: 
 - Senzor za otkucaje srca
 - MPU6050
 - GPS
 - 
Narukvica će moći biti u vise verzija
Trenutne funkcionalnosti su:
 - Konekcija na WI-FI
 - Mjerenje otkucaja srca
 - Detekcija pada
 - Lokacija

Neke od funkcionalnosti koje su planirane za budućnost su:
- Podsjetnik za lijekove
- Panik dugme
- Personalizacija izgleda
- Konekcija na WI-FI preko SIM kartice

# Mobilna aplikacija
Mobilna aplikacija je trenutno u razvoju. 
Neke od funkcionalnosti koje trenutno postoje su:
 - Login/Register sistem
 - Očitavanje svih podataka sa narukvice(otkucaji srca, pad, mapa sa lokacijom)
 - Dio o nekoliko mogućih bolesti
 - FAQ

Funkcionalnosti koje su planirane:
 - Pregled i uredivanje profila
 - Dodavanje novih narukvica te brisanje starih
 - Detaljne informacije o bolestima

Također pored ovih osnovnih funkcionalnosti, aplikacija će imati i plaćene verzije:
1. Silver paket:
      - Podsjetnik za lijekove,
      - Brzi poziv hitnoj sluzbi
      - Ocitavanje radni po parametrima vitalnih znakova(npr. otkucaji srca poviseni, saturacija snizena tada osobe hoda)
2. Gold paket:
      - Historija vitalnih znakova(sedmica, mjesec)
      - Korisnicka podrska uzivo(chat sa korisnickom podrskom)
      - Edukativni videi


# Dnevnik

Prototip aplikacije je urađen kao web stranica koja je bila na pola puta 24.4.
Međutim odlučili smo da je mnogo pristupačnije da se pravi mobilna aplikacija. Mobilna aplikacija se radi od 1.5.
Prototip narukvice smo započeli raditi 4.5 međutim zbog loše kvalitete senzora u našoj državi taj proces duže traje.

