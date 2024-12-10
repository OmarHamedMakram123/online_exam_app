import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:online_exam_app/core/error/error_handler.dart';
import 'package:online_exam_app/core/error/error_massage.dart';

void main() {
  group(
    "Test Error Handler Api ",
    () {
      test(
          'should return connection error message for connectionTimeout or sendTimeOut or restiveTimeOut',
          () {
        DioException dioException = DioException(
            requestOptions: RequestOptions(
              path: "",
            ),
            type: DioExceptionType.connectionTimeout);
        final result = ErrorHandler.formException(dioException);
        expect(result.errorMassage, ErrorMassage.connectionErrorMessage);
      });
      test(
        "should return badCertificateMessage errorMassage  for badCertificate ",
        () {
          DioException exception = DioException(
              requestOptions: RequestOptions(path: ""),
              type: DioExceptionType.badCertificate);
          var actual = ErrorHandler.formException(exception).errorMassage;
          expect(actual, ErrorMassage.badCertificateMessage);
        },
      );
      test(
        "should return connectionError massage for connectionError  ",
        () {
          DioException exception = DioException(
              requestOptions: RequestOptions(path: ""),
              type: DioExceptionType.connectionError);
          var actual = ErrorHandler.formException(exception).errorMassage;
          expect(actual, ErrorMassage.connectionErrorMessage);
        },
      );
      test(
        "should return  unknown massage for default dioExceptions",
        () {
          DioException exception = DioException(
              requestOptions: RequestOptions(
            path: "",
          ));
          var actual = ErrorHandler.formException(exception).errorMassage;
          expect(actual, ErrorMassage.unknownErrorMessage);
        },
      );
      group("Test Dio Exception with BadResponse ", () {
        String fakeErrorMassage = "fakeErrorMassage";
        test(
          "should return default bad request message if API message is missing",
          () {
            DioException exception = DioException(
                requestOptions: RequestOptions(
                  path: "",
                ),
                type: DioExceptionType.badResponse,
                response: Response(
                  statusCode: 400,
                  data: {
                    "message": fakeErrorMassage, //
                  },
                  requestOptions: RequestOptions(),
                ));
            var actual = ErrorHandler.formException(exception).errorMassage;
            expect(actual, fakeErrorMassage);
          },
        );
        test(
          "should return badRequest massage  if Api is not Massage ",
          () {
            DioException exception = DioException(
                requestOptions: RequestOptions(path: ""),
                type: DioExceptionType.badResponse,
                response: Response(
                    statusCode: 400,
                    requestOptions: RequestOptions(),
                    data: {"massage": ""}));
            var actual = ErrorHandler.formException(exception).errorMassage;
            expect(actual, ErrorMassage.badResponseMassage);
          },
        );
        test(
          "should return default unauthorized request massage if Api massage is missing ",
          () {
            DioException exception = DioException(
                requestOptions: RequestOptions(),
                type: DioExceptionType.badResponse,
                response: Response(
                    requestOptions: RequestOptions(),
                    statusCode: 401,
                    data: {"message": fakeErrorMassage}));
            var actual = ErrorHandler.formException(exception).errorMassage;
            expect(actual, fakeErrorMassage);
          },
        );
        test(
          "should return unauthorized massage if Api is not Massage",
          () {
            DioException exception = DioException(
                requestOptions: RequestOptions(
                  data: {"message": ""},
                ),
                type: DioExceptionType.badResponse,
                response: Response(
                    requestOptions: RequestOptions(), statusCode: 401));
            var actual = ErrorHandler.formException(exception).errorMassage;
            expect(actual, ErrorMassage.unauthorizedMessage);
          },
        );
        test(
          "should return default unauthorized request massage if Api massage is missing ",
          () {
            DioException exception = DioException(
                requestOptions: RequestOptions(),
                type: DioExceptionType.badResponse,
                response: Response(
                    requestOptions: RequestOptions(),
                    statusCode: 401,
                    data: {"message": fakeErrorMassage}));
            var actual = ErrorHandler.formException(exception).errorMassage;
            expect(actual, fakeErrorMassage);
          },
        );
        test(
          "should return default conflict request massage if Api massage is missing",
          () {
            DioException exception = DioException(
                type: DioExceptionType.badResponse,
                requestOptions: RequestOptions(),
                response: Response(
                    requestOptions: RequestOptions(),
                    statusCode: 409,
                    data: {"message": fakeErrorMassage}));
            var actual = ErrorHandler.formException(exception).errorMassage;
            expect(actual, fakeErrorMassage);
          },
        );
        test(
          "should return notFount massage  if Api status Code 404",
          () {
            DioException exception = DioException(
                requestOptions: RequestOptions(),
                type: DioExceptionType.badResponse,
                response: Response(
                    requestOptions: RequestOptions(), statusCode: 404));
            var actual = ErrorHandler.formException(exception).errorMassage;
            expect(actual, ErrorMassage.notFoundMessage);
          },
        );
        test(
          "should return internalServerError if Api status Code 500",
          () {
            DioException exception = DioException(
                requestOptions: RequestOptions(),
                type: DioExceptionType.badResponse,
                response: Response(
                    requestOptions: RequestOptions(), statusCode: 500));
            var actual = ErrorHandler.formException(exception).errorMassage;
            expect(actual, ErrorMassage.internalServerErrorMessage);
          },
        );
        test(
          "should return unknownErrorMessage   for default Response",
          () {
            DioException exception = DioException(
                requestOptions: RequestOptions(),
                type: DioExceptionType.badResponse,
                response: Response(
                    requestOptions: RequestOptions(), statusCode: 100));
            var actual = ErrorHandler.formException(exception).errorMassage;
            expect(actual, ErrorMassage.unknownErrorMessage);
          },
        );
        test(
          "should return  unknown ErrorMessage if response null  ",
          () {
            DioException exception = DioException(
                requestOptions: RequestOptions(),
                type: DioExceptionType.badResponse);
            var actual = ErrorHandler.formException(exception).errorMassage;
            expect(actual, ErrorMassage.unknownErrorMessage);
          },
        );
      });
      test(
        "should return unknownError massage  call formException operate Exceptions",
        () {
          Exception exception = Exception();
          var actual = ErrorHandler.formException(exception).errorMassage;
          expect(actual, ErrorMassage.unknownErrorMessage);
        },
      );
    },
  );
}
