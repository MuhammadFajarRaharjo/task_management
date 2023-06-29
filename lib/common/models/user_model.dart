// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final int id, isVerivied;

  UserModel({
    required this.id,
    required this.isVerivied,
  });

  UserModel copyWith({
    int? id,
    int? isVerivied,
  }) {
    return UserModel(
      id: id ?? this.id,
      isVerivied: isVerivied ?? this.isVerivied,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isVerivied': isVerivied,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      isVerivied: map['isVerivied'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(id: $id, isVerivied: $isVerivied)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.isVerivied == isVerivied;
  }

  @override
  int get hashCode => id.hashCode ^ isVerivied.hashCode;
}
