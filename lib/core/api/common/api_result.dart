sealed class ApiResult<T>{}
class Success<T> extends ApiResult<T>{
  final T  date;
  Success({required this.date});
}
class Failures<T> extends ApiResult<T>{
  final Exception exception;
  Failures({required this.exception});
}