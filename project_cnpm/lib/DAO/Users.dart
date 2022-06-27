
class Users {
  final String email;
  final String password;
  final int rule;

  Users({
    required this.email,
    required this.password,
    required this.rule,
});
  static Users fromJson(Map<String, dynamic> json) => Users(
      email: json['email'],
      password: json['password'],
      rule: json['rule'],
  );
  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'rule': rule,
  };

}