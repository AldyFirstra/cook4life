class User {
  int id;
  String name;
  String email;
  String foto;
  String? token;
  String fcm;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.foto,
      required this.fcm,
      this.token});

  factory User.fromMap(Map map) {
    return User(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        foto: map['foto'],
        token: map['token'],
        fcm: map['fcm'] ?? '');
  }

  toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'foto': foto,
      'token': token,
      'fcm': fcm
    };
  }
}
