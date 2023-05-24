import 'dart:convert';

class Korisnik {
  String ime;
  String prezime;
  String adresaKuce;
  int kucaId;

   Korisnik({
    required this.ime,
    required this.prezime,
    required this.adresaKuce,
    required this.kucaId
  });

  Korisnik copyWith({
    String? ime,
    String? prezime,
    String? adresaKuce,
    int? kucaId
  }) {
    return Korisnik(
      ime: ime ?? this.ime,
      prezime: prezime ?? this.prezime,
      adresaKuce: adresaKuce ?? this.adresaKuce,
      kucaId: kucaId ?? this.kucaId
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ime': ime,
      'prezime': prezime,
      'adresaKuce': adresaKuce,
      'kucaId': kucaId,
    };
  }

  factory Korisnik.fromMap(Map<String, dynamic> map) {
    return Korisnik(
      ime: map['ime'] as String,
      prezime: map['prezime'] as String,
      adresaKuce: map['adresaKuce'] as String,
      kucaId: map['kucaId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Korisnik.fromJson(String source) =>
      Korisnik.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Korisnik(id: $ime, personId: $prezime, appartmentId: $adresaKuce, kucaId: $kucaId)';
  }

  @override
  bool operator ==(covariant Korisnik other) {
    if (identical(this, other)) return true;

    return other.ime == ime &&
        other.prezime == prezime &&
        other.adresaKuce == adresaKuce &&
        other.kucaId == other.kucaId;
  }

  @override
  int get hashCode {
    return ime.hashCode ^ prezime.hashCode ^ adresaKuce.hashCode ^ adresaKuce.hashCode;
  }
}