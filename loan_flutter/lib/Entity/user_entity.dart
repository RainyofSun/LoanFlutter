import 'package:loan_flutter/Util/http/base_model.dart';
import 'package:loan_flutter/generated/json/base/json_field.dart';
import 'package:loan_flutter/generated/json/user_entity.g.dart';
import 'dart:convert';
export 'package:loan_flutter/generated/json/user_entity.g.dart';

@JsonSerializable()
class UserEntity extends BaseModel {
	String? name = '';

	UserEntity();

	factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

	@override
  Map<String, dynamic> toJson() => $UserEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}