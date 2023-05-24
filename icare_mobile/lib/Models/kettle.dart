import 'dart:convert';

class Kettle {
  String naziv;
  String opis;
  bool stanjeStruje;
  DateTime vrijemeGasenja;
  DateTime vrijemePaljenja;

   Kettle({
    required this.naziv,
    required this.opis,
    required this.stanjeStruje,
    required this.vrijemeGasenja,
    required this.vrijemePaljenja
  });

  Kettle copyWith({
    String? naziv,
    String? opis,
    bool? stanjeStruje,
    DateTime? vrijemeGasenja,
    DateTime? vrijemePaljenja
  }) {
    return Kettle(
      naziv: naziv ?? this.naziv,
      opis: opis ?? this.opis, 
      stanjeStruje: this.stanjeStruje,
      vrijemeGasenja: this.vrijemeGasenja,
      vrijemePaljenja: this.vrijemePaljenja
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'naziv': naziv,
      'opis': opis,
      'stanjeStruje': stanjeStruje,
      'vrijemeGasenja':vrijemeGasenja,
      'vrijemePaljenja':vrijemePaljenja
    };
  }

  factory Kettle.fromMap(Map<String, dynamic> map) {
    return Kettle(
      naziv: map['naziv'] as String,
      opis: map['opis'] as String,
      stanjeStruje: map['stanjeStruje'] as bool,
      vrijemeGasenja: DateTime.parse(map['vrijemeGasenja']),
      vrijemePaljenja: DateTime.parse(map['vrijemePaljenja'])
    );
  }

  String toJson() => json.encode(toMap());

  factory Kettle.fromJson(String source) =>
      Kettle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Kettle(naziv: $naziv, opis: $opis, stanjeStruje: $stanjeStruje, vrijemeGasenja: $vrijemeGasenja, vrijemePaljenja:$vrijemePaljenja)';
  }

  @override
  bool operator ==(covariant Kettle other) {
    if (identical(this, other)) return true;

    return 
        other.naziv == naziv &&
        other.opis == opis &&
        other.stanjeStruje == other.stanjeStruje&&
        other.vrijemeGasenja==other.vrijemeGasenja&&
        other.vrijemePaljenja==other.vrijemePaljenja;
  }

  @override
  int get hashCode {
    return naziv.hashCode ^ opis.hashCode ^ stanjeStruje.hashCode;
  }
}