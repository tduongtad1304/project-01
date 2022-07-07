import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String token;
  const User({
    required this.token,
  });

  @override
  List<Object> get props => [token];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['data']['token'] ?? '',
    );
  }

  User copyWith({
    String? token,
  }) {
    return User(
      token: token ?? this.token,
    );
  }
}
