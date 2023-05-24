import 'dart:convert';

class Usisivac {
  String naziv;
  int id;
  bool stanje;
  DateTime vrijemeGasenja;
  DateTime vrijemePaljenja;

   Usisivac({
    required this.naziv,
    required this.id,
    required this.stanje,
    required this.vrijemeGasenja,
    required this.vrijemePaljenja
  });

  Usisivac copyWith({
    String? naziv,
    String? opis,
    bool? stanje,
    DateTime? vrijemeGasenja,
    DateTime? vrijemePaljenja
  }) {
    return Usisivac(
      naziv: naziv ?? this.naziv,
      id: id, 
      stanje: this.stanje,
      vrijemeGasenja: this.vrijemeGasenja,
      vrijemePaljenja: this.vrijemePaljenja
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'naziv': naziv,
      'id': id,
      'stanje': stanje,
      'vrijemeGasenja':vrijemeGasenja,
      'vrijemePaljenja':vrijemePaljenja
    };
  }

  factory Usisivac.fromMap(Map<String, dynamic> map) {
    return Usisivac(
      naziv: map['naziv'] as String,
      id: map['id'] as int,
      stanje: map['stanje'] as bool,
      vrijemeGasenja: DateTime.parse(map['vrijemeGasenja']),
      vrijemePaljenja: DateTime.parse(map['vrijemePaljenja'])
    );
  }

  String toJson() => json.encode(toMap());

  factory Usisivac.fromJson(String source) =>
      Usisivac.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Kettle(naziv: $naziv, opis: $id, stanjeStruje: $stanje, vrijemeGasenja: $vrijemeGasenja, vrijemePaljenja:$vrijemePaljenja)';
  }

  @override
  bool operator ==(covariant Usisivac other) {
    if (identical(this, other)) return true;

    return 
        other.naziv == naziv &&
        other.id == id &&
        other.stanje == other.stanje &&
        other.vrijemeGasenja==other.vrijemeGasenja&&
        other.vrijemePaljenja==other.vrijemePaljenja;
  }

  @override
  int get hashCode {
    return naziv.hashCode ^ id.hashCode ^ stanje.hashCode;
  }
}