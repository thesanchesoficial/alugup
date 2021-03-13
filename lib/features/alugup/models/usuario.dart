import 'dart:convert';

class User {
  String id;
  String name;
  String email;
  String password;
  String phone;
  String birthDate;
  String cpf;
  
  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.birthDate,
    this.cpf,
  });

  User copyWith({
    String id,
    String name,
    String email,
    String password,
    String phone,
    String birthDate,
    String cpf,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      birthDate: birthDate ?? this.birthDate,
      cpf: cpf ?? this.cpf,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'nome': name,
      'email': email,
      'senha': password,
      'telefone': phone,
      'nascimento': birthDate,
      'cpf': cpf,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'],
      name: map['nome'],
      email: map['email'],
      password: map['senha'],
      phone: map['telefone'],
      birthDate: map['nascimento'],
      cpf: map['cpf'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password, phone: $phone, birthDate: $birthDate, cpf: $cpf)';
  }
}
