import 'base_model.dart';

class RequestConfig<T extends BaseModel> {
  final T Function(Map<String, dynamic>) fromJson;
  final T? data;

  const RequestConfig({
    required this.fromJson,
    this.data,
  });

  Map<String, dynamic>? get requestData => data?.toJson();
} 