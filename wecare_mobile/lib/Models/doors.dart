import 'dart:convert';

class Doors {
  String naziv;
  int id;
  bool stanje;
  DateTime vrijemeZakljucavanja;
  DateTime vrijemeOtkljucavanja;

   Doors({
    required this.naziv,
    required this.id,
    required this.stanje,
    required this.vrijemeZakljucavanja,
    required this.vrijemeOtkljucavanja
  });

  Doors copyWith({
    String? naziv,
    String? opis,
    bool? stanje,
    DateTime? vrijemeZakljucavanja,
    DateTime? vrijemePaljenja
  }) {
    return Doors(
      naziv: naziv ?? this.naziv,
      id: id, 
      stanje: this.stanje,
      vrijemeZakljucavanja: this.vrijemeZakljucavanja,
      vrijemeOtkljucavanja: vrijemeOtkljucavanja
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'naziv': naziv,
      'id': id,
      'stanje': stanje,
      'vrijemeZakljucavanja':vrijemeZakljucavanja,
      'vrijemePaljenja':vrijemeOtkljucavanja
    };
  }

  factory Doors.fromMap(Map<String, dynamic> map) {
    return Doors(
      naziv: map['naziv'] as String,
      id: map['id'] as int,
      stanje: map['stanje'] as bool,
      vrijemeZakljucavanja: DateTime.parse(map['vrijemeZakljucavanja']),
      vrijemeOtkljucavanja: DateTime.parse(map['vrijemeOtkljucavanja'])
    );
  }

  String toJson() => json.encode(toMap());

  factory Doors.fromJson(String source) =>
      Doors.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Kettle(naziv: $naziv, opis: $id, stanjeStruje: $stanje, vrijemeZakljucavanja: $vrijemeZakljucavanja, vrijemeOtkljucavanja:$vrijemeOtkljucavanja)';
  }

  @override
  bool operator ==(covariant Doors other) {
    if (identical(this, other)) return true;

    return 
        other.naziv == naziv &&
        other.id == id &&
        other.stanje == other.stanje &&
        other.vrijemeZakljucavanja==other.vrijemeZakljucavanja&&
        other.vrijemeOtkljucavanja==other.vrijemeOtkljucavanja;
  }

  @override
  int get hashCode {
    return naziv.hashCode ^ id.hashCode ^ stanje.hashCode;
  }
}