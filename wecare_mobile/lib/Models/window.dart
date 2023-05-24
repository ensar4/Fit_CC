import 'dart:convert';

class Window {
  String naziv;
  int id;
  bool otvoren;
   Window({
    required this.naziv,
    required this.id,
    required this.otvoren,
  });

  Window copyWith({
    String? naziv,
    String? opis,
    bool? otvoren,
  }) {
    return Window(
      naziv: naziv ?? this.naziv,
      id: id, 
      otvoren: this.otvoren,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'naziv': naziv,
      'id': id,
      'otvoren': otvoren,
    };
  }

  factory Window.fromMap(Map<String, dynamic> map) {
    return Window(
      naziv: map['naziv'] as String,
      id: map['id'] as int,
      otvoren: map['otvoren'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Window.fromJson(String source) =>
      Window.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Kettle(naziv: $naziv, opis: $id, otvoren: $otvoren,)';
  }

  @override
  bool operator ==(covariant Window other) {
    if (identical(this, other)) return true;

    return 
        other.naziv == naziv &&
        other.id == id &&
        other.otvoren == other.otvoren; 
  }

  @override
  int get hashCode {
    return naziv.hashCode ^ id.hashCode;
  }
}