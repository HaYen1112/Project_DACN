
class Users {
  final String email;
  final String password;
  final String phone;
  final String name;
  final String address;

  Users({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.password,
});
 static Users fromJson(Map<String, dynamic> json) => Users(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      password: json['password'],

  );
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone': phone,
    'address': address,
    'password': password,

  };

}