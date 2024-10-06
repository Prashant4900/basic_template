import 'dart:convert'; // For jsonEncode and jsonDecode

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    this.name,
    this.email,
    this.phone,
    this.dob,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      dob: json['dob'] != null ? DateTime.parse(json['dob'] as String) : null,
    );
  }

  factory UserModel.stringToJson(String jsonString) {
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return UserModel.fromJson(jsonMap);
  }

  final String? name;
  final String? email;
  final String? phone;
  final DateTime? dob;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'dob': dob?.toIso8601String(),
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    DateTime? dob,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      dob: dob ?? this.dob,
    );
  }

  String jsonToString() => jsonEncode(toJson());

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        dob,
      ];
}
