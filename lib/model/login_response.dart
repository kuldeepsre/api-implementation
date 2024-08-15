class LoginResponse{
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? status;
  String? avatar;
  String? fullName;
  LoginResponse(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.status,
        this.avatar,
        this.fullName});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    status = json['status'];
    avatar = json['avatar'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['status'] = this.status;
    data['avatar'] = this.avatar;
    data['fullName'] = this.fullName;
    return data;
  }
}
class LoginException implements Exception {
  final int statusCode;
  final String message;
  final String error;

  LoginException({
    required this.statusCode,
    required this.message,
    required this.error,
  });

  @override
  String toString() {
    return 'LoginException: $message (status code: $statusCode, error: $error)';
  }
}