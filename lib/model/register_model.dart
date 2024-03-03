class SignUpRequest {
  final String fullName;
  final String phoneNumber;
  final String email;
  final String password;

  SignUpRequest({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'phone_number': phoneNumber,
      'email': email,
      'password': password,
    };
  }
}
