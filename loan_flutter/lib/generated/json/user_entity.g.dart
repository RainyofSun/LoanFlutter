import 'package:loan_flutter/generated/json/base/json_convert_content.dart';
import 'package:loan_flutter/Entity/user_entity.dart';
import 'package:loan_flutter/Util/http/base_model.dart';


UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
  final UserEntity userEntity = UserEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userEntity.name = name;
  }
  return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  return data;
}

extension UserEntityExtension on UserEntity {
  UserEntity copyWith({
    String? name,
  }) {
    return UserEntity()
      ..name = name ?? this.name;
  }
}