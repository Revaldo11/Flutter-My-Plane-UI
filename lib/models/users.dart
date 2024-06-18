import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String? name;
  final String email;
  final String? password;
  final int? balance;
  final String? hobby;

  const UserModel({
    required this.id,
    this.name,
    required this.email,
    this.password,
    this.balance,
    this.hobby,
  });

  @override
  List<Object> get props => [
        id,
        name ?? '',
        email,
        password ?? '',
        balance ?? 0,
        hobby ?? '',
      ];
}
