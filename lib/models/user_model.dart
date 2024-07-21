class User {
  final String userName;
  final String password;
  final String name;
  final String mobileNumber;
  final String? profilePictureUrl;
  final String email;
  final String phone;
  final String address;

  User({
    required this.userName,
    required this.password,
    required this.name,
    required this.mobileNumber,
    this.profilePictureUrl,
    required this.email,
    required this.phone,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'password': password,
      'name': name,
      'mobileNumber': mobileNumber,
      'profilePictureUrl': profilePictureUrl,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userName: map['userName'],
      password: map['password'],
      name: map['name'],
      mobileNumber: map['mobileNumber'],
      profilePictureUrl: map['profilePictureUrl'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
    );
  }
}
