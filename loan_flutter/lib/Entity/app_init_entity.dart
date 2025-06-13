import 'package:loan_flutter/Util/http/base_model.dart';
import 'package:loan_flutter/generated/json/base/json_field.dart';
import 'package:loan_flutter/generated/json/app_init_entity.g.dart';
import 'dart:convert';
export 'package:loan_flutter/generated/json/app_init_entity.g.dart';

@JsonSerializable()
class AppInitEntity extends BaseModel {
	String? dDyzm4T = '';
	String? ve6CV = '';
	String? j8GBJn5 = '';
	@JSONField(name: 'AIiwgXcd')
	dynamic aIiwgXcd;
	String? a0es = '';
	String? kSgO1X = '';
	int? gYBKUN = 0;
	int? chip = 0;
	AppInitCircuit? circuit;
	String? power = '';
	String? zxText = '';
	String? computational = '';
	AppInitPractical? practical;

	AppInitEntity();

	factory AppInitEntity.fromJson(Map<String, dynamic> json) => $AppInitEntityFromJson(json);

	@override
	Map<String, dynamic> toJson() => $AppInitEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AppInitCircuit extends BaseModel {
	String? integrated = '';
	String? transistors = '';

	AppInitCircuit();

	factory AppInitCircuit.fromJson(Map<String, dynamic> json) => $AppInitCircuitFromJson(json);

	@override
	Map<String, dynamic> toJson() => $AppInitCircuitToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AppInitPractical extends BaseModel {
	String? crucial = '';
	String? semiconductor = '';
	String? advances = '';
	String? built = '';

	AppInitPractical();

	factory AppInitPractical.fromJson(Map<String, dynamic> json) => $AppInitPracticalFromJson(json);

	@override
	Map<String, dynamic> toJson() => $AppInitPracticalToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}