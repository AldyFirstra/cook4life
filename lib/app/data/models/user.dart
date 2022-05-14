class User {
  int id;
  String name;
  String email;
  String foto;
  String? token;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.foto,
      this.token});

  factory User.fromMap(Map map) {
    return User(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        foto: map['foto'],
        token: map['token']);
  }

  toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'foto': foto,
      'token': token
    };
  }
}
