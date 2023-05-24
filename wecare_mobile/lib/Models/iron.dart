import 'dart:convert';

class Iron {
  int id;
  String naziv;
  String opis;
  bool stanjeStruje;

   Iron({
    required this.id,
    required this.naziv,
    required this.opis,
    required this.stanjeStruje
  });

  Iron copyWith({
    String? id,
    String? naziv,
    String? opis,
    bool? stanjeStruje
  }) {
    return Iron(
      naziv: naziv ?? this.naziv,
      opis: opis ?? this.opis, 
      id:  this.id, 
      stanjeStruje: this.stanjeStruje,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'naziv': naziv,
      'opis': opis,
      'stanjeStruje': stanjeStruje,
    };
  }

  factory Iron.fromMap(Map<String, dynamic> map) {
    return Iron(
      id: map['id'] as int,
      naziv: map['naziv'] as String,
      opis: map['opis'] as String,
      stanjeStruje: map['stanjeStruje'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Iron.fromJson(String source) =>
      Iron.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Iron(id: $id, naziv: $naziv, opis: $opis, stanjeStruje: $stanjeStruje)';
  }

  @override
  bool operator ==(covariant Iron other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.naziv == naziv &&
        other.opis == opis &&
        other.stanjeStruje == other.stanjeStruje;
  }

  @override
  int get hashCode {
    return id.hashCode ^ naziv.hashCode ^ opis.hashCode ^ stanjeStruje.hashCode;
  }
}