import 'package:loan_flutter/generated/json/base/json_convert_content.dart';
import 'package:loan_flutter/Entity/app_init_entity.dart';

AppInitEntity $AppInitEntityFromJson(Map<String, dynamic> json) {
  final AppInitEntity appInitEntity = AppInitEntity();
  final String? dDyzm4T = jsonConvert.convert<String>(json['dDyzm4T']);
  if (dDyzm4T != null) {
    appInitEntity.dDyzm4T = dDyzm4T;
  }
  final String? ve6CV = jsonConvert.convert<String>(json['ve6CV']);
  if (ve6CV != null) {
    appInitEntity.ve6CV = ve6CV;
  }
  final String? j8GBJn5 = jsonConvert.convert<String>(json['j8GBJn5']);
  if (j8GBJn5 != null) {
    appInitEntity.j8GBJn5 = j8GBJn5;
  }
  final dynamic aIiwgXcd = json['AIiwgXcd'];
  if (aIiwgXcd != null) {
    appInitEntity.aIiwgXcd = aIiwgXcd;
  }
  final String? a0es = jsonConvert.convert<String>(json['a0es']);
  if (a0es != null) {
    appInitEntity.a0es = a0es;
  }
  final String? kSgO1X = jsonConvert.convert<String>(json['kSgO1X']);
  if (kSgO1X != null) {
    appInitEntity.kSgO1X = kSgO1X;
  }
  final int? gYBKUN = jsonConvert.convert<int>(json['gYBKUN']);
  if (gYBKUN != null) {
    appInitEntity.gYBKUN = gYBKUN;
  }
  final int? chip = jsonConvert.convert<int>(json['chip']);
  if (chip != null) {
    appInitEntity.chip = chip;
  }
  final AppInitCircuit? circuit = jsonConvert.convert<AppInitCircuit>(
      json['circuit']);
  if (circuit != null) {
    appInitEntity.circuit = circuit;
  }
  final String? power = jsonConvert.convert<String>(json['power']);
  if (power != null) {
    appInitEntity.power = power;
  }
  final String? zxText = jsonConvert.convert<String>(json['zxText']);
  if (zxText != null) {
    appInitEntity.zxText = zxText;
  }
  final String? computational = jsonConvert.convert<String>(
      json['computational']);
  if (computational != null) {
    appInitEntity.computational = computational;
  }
  final AppInitPractical? practical = jsonConvert.convert<AppInitPractical>(
      json['practical']);
  if (practical != null) {
    appInitEntity.practical = practical;
  }
  return appInitEntity;
}

Map<String, dynamic> $AppInitEntityToJson(AppInitEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['dDyzm4T'] = entity.dDyzm4T;
  data['ve6CV'] = entity.ve6CV;
  data['j8GBJn5'] = entity.j8GBJn5;
  data['AIiwgXcd'] = entity.aIiwgXcd;
  data['a0es'] = entity.a0es;
  data['kSgO1X'] = entity.kSgO1X;
  data['gYBKUN'] = entity.gYBKUN;
  data['chip'] = entity.chip;
  data['circuit'] = entity.circuit?.toJson();
  data['power'] = entity.power;
  data['zxText'] = entity.zxText;
  data['computational'] = entity.computational;
  data['practical'] = entity.practical?.toJson();
  return data;
}

extension AppInitEntityExtension on AppInitEntity {
  AppInitEntity copyWith({
    String? dDyzm4T,
    String? ve6CV,
    String? j8GBJn5,
    dynamic aIiwgXcd,
    String? a0es,
    String? kSgO1X,
    int? gYBKUN,
    int? chip,
    AppInitCircuit? circuit,
    String? power,
    String? zxText,
    String? computational,
    AppInitPractical? practical,
  }) {
    return AppInitEntity()
      ..dDyzm4T = dDyzm4T ?? this.dDyzm4T
      ..ve6CV = ve6CV ?? this.ve6CV
      ..j8GBJn5 = j8GBJn5 ?? this.j8GBJn5
      ..aIiwgXcd = aIiwgXcd ?? this.aIiwgXcd
      ..a0es = a0es ?? this.a0es
      ..kSgO1X = kSgO1X ?? this.kSgO1X
      ..gYBKUN = gYBKUN ?? this.gYBKUN
      ..chip = chip ?? this.chip
      ..circuit = circuit ?? this.circuit
      ..power = power ?? this.power
      ..zxText = zxText ?? this.zxText
      ..computational = computational ?? this.computational
      ..practical = practical ?? this.practical;
  }
}

AppInitCircuit $AppInitCircuitFromJson(Map<String, dynamic> json) {
  final AppInitCircuit appInitCircuit = AppInitCircuit();
  final String? integrated = jsonConvert.convert<String>(json['integrated']);
  if (integrated != null) {
    appInitCircuit.integrated = integrated;
  }
  final String? transistors = jsonConvert.convert<String>(json['transistors']);
  if (transistors != null) {
    appInitCircuit.transistors = transistors;
  }
  return appInitCircuit;
}

Map<String, dynamic> $AppInitCircuitToJson(AppInitCircuit entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['integrated'] = entity.integrated;
  data['transistors'] = entity.transistors;
  return data;
}

extension AppInitCircuitExtension on AppInitCircuit {
  AppInitCircuit copyWith({
    String? integrated,
    String? transistors,
  }) {
    return AppInitCircuit()
      ..integrated = integrated ?? this.integrated
      ..transistors = transistors ?? this.transistors;
  }
}

AppInitPractical $AppInitPracticalFromJson(Map<String, dynamic> json) {
  final AppInitPractical appInitPractical = AppInitPractical();
  final String? crucial = jsonConvert.convert<String>(json['crucial']);
  if (crucial != null) {
    appInitPractical.crucial = crucial;
  }
  final String? semiconductor = jsonConvert.convert<String>(
      json['semiconductor']);
  if (semiconductor != null) {
    appInitPractical.semiconductor = semiconductor;
  }
  final String? advances = jsonConvert.convert<String>(json['advances']);
  if (advances != null) {
    appInitPractical.advances = advances;
  }
  final String? built = jsonConvert.convert<String>(json['built']);
  if (built != null) {
    appInitPractical.built = built;
  }
  return appInitPractical;
}

Map<String, dynamic> $AppInitPracticalToJson(AppInitPractical entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['crucial'] = entity.crucial;
  data['semiconductor'] = entity.semiconductor;
  data['advances'] = entity.advances;
  data['built'] = entity.built;
  return data;
}

extension AppInitPracticalExtension on AppInitPractical {
  AppInitPractical copyWith({
    String? crucial,
    String? semiconductor,
    String? advances,
    String? built,
  }) {
    return AppInitPractical()
      ..crucial = crucial ?? this.crucial
      ..semiconductor = semiconductor ?? this.semiconductor
      ..advances = advances ?? this.advances
      ..built = built ?? this.built;
  }
}