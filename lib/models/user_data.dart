import 'dart:convert';

class UserData {
 final String ?name;
 final String ?username;
 final String ?email;
 final String ?passord;
 final String ?cPassword;
 final String ?phone;
 final String ?gender;
  UserData({
    this.name,
    this.username,
    this.email,
    this.passord,
    this.cPassword,
    this.phone,
    this.gender,
  });
 

  UserData copyWith({
    String ? name,
    String ?username,
    String ?email,
    String ?passord,
    String ?cPassword,
    String ?phone,
    String ? gender,
  }) {
    return UserData(
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      passord: passord ?? this.passord,
      cPassword: cPassword ?? this.cPassword,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
    );
  }

  UserData merge(UserData model) {
    return UserData(
      name: model.name ?? this.name,
      username: model.username ?? this.username,
      email: model.email ?? this.email,
      passord: model.passord ?? this.passord,
      cPassword: model.cPassword ?? this.cPassword,
      phone: model.phone ?? this.phone,
      gender: model.gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'passord': passord,
      'c_password': cPassword,
      'phone': phone,
      'gender': gender,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
   // if (map == null) return null;
  
    return UserData(
      name: map['name'],
      username: map['username'],
      email: map['email'],
      passord: map['passord'],
      cPassword: map['c_password'],
      phone: map['phone'],
      gender: map['gender'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) => UserData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserData(name: $name, username: $username, email: $email, passord: $passord, cPassword: $cPassword, phone: $phone, gender: $gender)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UserData &&
      o.name == name &&
      o.username == username &&
      o.email == email &&
      o.passord == passord &&
      o.cPassword == cPassword &&
      o.phone == phone &&
      o.gender == gender;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      passord.hashCode ^
      cPassword.hashCode ^
      phone.hashCode ^
      gender.hashCode;
  }
}
