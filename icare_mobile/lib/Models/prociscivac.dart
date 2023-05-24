import 'dart:convert';

class Prociscivac {
  int id;
  bool stanje;
  String naziv;
  int vlaznostZraka;

   Prociscivac({
    required this.id,
    required this.stanje,
    required this.naziv,
    required this.vlaznostZraka
  });

  Prociscivac copyWith({
    String? id,
    bool? stanje,
    String? naziv,
    int? vlaznostZraka
  }) {
    return Prociscivac(
      id: this.id,
      stanje: this.stanje,
      naziv: naziv ?? this.naziv,
      vlaznostZraka: vlaznostZraka ?? this.vlaznostZraka
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'stanje': stanje,
      'naziv': naziv,
      'vlaznostZraka': vlaznostZraka,
    };
  }

  factory Prociscivac.fromMap(Map<String, dynamic> map) {
    return Prociscivac(
      id: map['id'] as int,
      stanje: map['stanje'] as bool,
      naziv: map['naziv'] as String,
      vlaznostZraka: map['vlaznostZraka'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Prociscivac.fromJson(String source) =>
      Prociscivac.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Prociscivac(id: $id, stanje: $stanje, naziv: $naziv, kucaId: $vlaznostZraka)';
  }

  @override
  bool operator ==(covariant Prociscivac other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.stanje == stanje &&
        other.naziv == naziv &&
        other.vlaznostZraka == other.vlaznostZraka;
  }

  @override
  int get hashCode {
    return id.hashCode ^ stanje.hashCode ^ naziv.hashCode ^ vlaznostZraka.hashCode;
  }
}