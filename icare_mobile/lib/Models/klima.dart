import 'dart:convert';

class Klima {
  int id;
  String naziv;
  bool stanje;
  int temperatura;
  String mod;
  int brzinaPuhanja;

   Klima({
    required this.id,
    required this.naziv,
    required this.stanje,
    required this.temperatura,
    required this.mod,
    required this.brzinaPuhanja,
  });

  Klima copyWith({
    String? id,
    String? naziv,
    bool? stanje,
    int? temperatura,
    String? mod,
    int? brzinaPuhanja
  }) {
    return Klima(
      naziv: naziv ?? this.naziv,
      stanje: stanje ?? this.stanje, 
      id:  this.id, brzinaPuhanja: this.brzinaPuhanja, mod: this.mod, temperatura: this.temperatura,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'naziv': naziv,
      'stanje': stanje,
      'temperatura': temperatura,
      'mod': mod,
      'brzinaPuhanja': brzinaPuhanja,
    };
  }

  factory Klima.fromMap(Map<String, dynamic> map) {
    return Klima(
      id: map['id'] as int,
      naziv: map['naziv'] as String,
      stanje: map['stanje'] as bool,
      temperatura: map['temperatura'] as int,
      mod: map['mod'] as String,
      brzinaPuhanja: map['brzinaPuhanja'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Klima.fromJson(String source) =>
      Klima.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Korisnik(id: $id, naziv: $naziv, stanje: $stanje)';
  }

  @override
  bool operator ==(covariant Klima other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.naziv == naziv &&
        other.stanje == stanje;
  }

  @override
  int get hashCode {
    return id.hashCode ^ naziv.hashCode ^ stanje.hashCode;
  }
}