import 'base_model.dart';

class CallbackConfig<T extends BaseModel> {
  final void Function(T data)? onSuccess;
  final void Function(dynamic error)? onError;

  const CallbackConfig({
    this.onSuccess,
    this.onError,
  });
} 