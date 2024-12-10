import 'package:online_exam_app/core/api/common/api_result.dart';
Future<ApiResult<T>> executeApi<T>(
    {required Future<T> Function() apiCall}) async {
  try {
    var result = await apiCall.call();
    return Success(date: result);
  } catch (e) {
    return Failures(
      exception: e is Exception ? e : Exception("Unknown error occurred: $e"),
    );
  }
}
