import 'package:flutter_test/flutter_test.dart';
import 'package:online_exam_app/core/utils/functions/validators/validations.dart';

void main() {
  group(
    "Test  Validation ",
    () {
      group(
        "Test  Validation Name  ",
        () {
          test(
            "should return Name is Required when call method  validateName  is name Empty ",
            () {
              String massage = "🔴Name is required!";
              String fakeName = "";
              var actual = Validations.validateName(fakeName);
              expect(actual, massage);
            },
          );
          test(
            "should return The Name is Required when call validateName is check Name ",
            () {
              String massage = 'This Name is not valid';
              String fakeName = "12313";
              var actual = Validations.validateName(fakeName);
              expect(actual, massage);
            },
          );
          test(
            "should return null  when call validateName is Success",
            () {
              String fakeName = "OmarHamedMakram";
              var actual = Validations.validateName(fakeName);
              expect(actual, null);
            },
          );
        },
      );
      group(
        "Test Validate Email ",
        () {
          test(
            "should return 🔴Email is required! when call validateEmail is Email Empty",
            () {
              String massage = '🔴Email is required!';
              String fakeEmail = "";
              var actual = Validations.validateEmail(fakeEmail);
              expect(actual, massage);
            },
          );
          test(
            "should return This Email is not valid! when call validateEmail is Email is not Required",
            () {
              String massage = 'This Email is not valid';
              String fakeEmail = "omarMakram421";
              var actual = Validations.validateEmail(fakeEmail);
              expect(actual, massage);
            },
          );
          test(
            "should return null  when call validateEmail is Email required",
            () {
              String fakeEmail = "omarmakram421@gmail.com";
              var actual = Validations.validateEmail(fakeEmail);
              expect(actual, null);
            },
          );
        },
      );
      group(
        "Test Validate Phone Number ",
        () {
          test(
            "should return 🔴Phone number is required! when call validatePhoneNumber is phone  Empty",
            () {
              String massage = '🔴Phone number is required!';
              String fakePhone = "";
              var actual = Validations.validatePhoneNumber(fakePhone);
              expect(actual, massage);
            },
          );
          test(
            "should return This Phone number is not valid'! when call validatePhoneNumber is phone is not Required",
            () {
              String massage = 'This Phone number is not valid';
              String fakePhone = "13113131";
              var actual = Validations.validatePhoneNumber(fakePhone);
              expect(actual, massage);
            },
          );
          test(
            "should return null  when call validatePhoneNumber is Email required",
            () {
              String fakePhone = "01154544334";
              var actual = Validations.validatePhoneNumber(fakePhone);
              expect(actual, null);
            },
          );
        },
      );
      group(
        "Test Validate Password ",
        () {
          test(
            "should return '🔴Password is required!' when call validatePassword is password  Empty",
            () {
              String massage = '🔴Password is required!';
              String fakePhone = "";
              var actual = Validations.validatePassword(fakePhone);
              expect(actual, massage);
            },
          );
          test(
            "should return 'This Password is not valid'; when call validatePassword  is password is not Required",
            () {
              String massage = 'This Password is not valid';
              String fakePhone = "13113131";
              var actual = Validations.validatePassword(fakePhone);
              expect(actual, massage);
            },
          );
          test(
            "should return null  when call validatePassword is password required",
            () {
              String fakePhone = "Omar@123";
              var actual = Validations.validatePassword(fakePhone);
              expect(actual, null);
            },
          );
        },
      );
      group(
        "Test Validate Password ",
        () {
          test(
            "should return '🔴Password is required!' when call validatePassword is password  Empty",
            () {
              String massage = '🔴Password is required!';
              String fakePhone = "";
              var actual = Validations.validatePassword(fakePhone);
              expect(actual, massage);
            },
          );
          test(
            "should return 'This Password is not valid'; when call validatePassword  is password is not Required",
            () {
              String massage = 'This Password is not valid';
              String fakePhone = "13113131";
              var actual = Validations.validatePassword(fakePhone);
              expect(actual, massage);
            },
          );
          test(
            "should return null  when call validatePassword is password required",
            () {
              String fakePhone = "01154544334";
              var actual = Validations.validatePhoneNumber(fakePhone);
              expect(actual, null);
            },
          );
        },
      );
      group(
        "Test Validate Confirm Password ",
        () {
          test(
            "should return'🔴Confirm Password is required!'; when call validateConfirmPassword is confirmPassword  Empty",
            () {
              String massage = '🔴Confirm Password is required!';
              String fakePassword = "";
              var actual = Validations.validateConfirmPassword(
                  fakePassword, fakePassword);
              expect(actual, massage);
            },
          );
          test(
            "should return 'This Confirm Password is not valid''; when call validatePassword  is confirmPassword is not Required",
            () {
              String massage = 'This Confirm Password is not valid';
              String fakePassword = "12345";
              var actual = Validations.validateConfirmPassword(
                  fakePassword, fakePassword);
              expect(actual, massage);
            },
          );
          test(
            "should return '🔴Password and Confirm Password must be same!';"
            " when call validatePassword  is confirmPassword is not Required",
            () {
              String massage = '🔴Password and Confirm Password must be same!';
              String fakePassword = "Omar@1234141213";
              String confirmPassword = "Omar@123414";
              var actual = Validations.validateConfirmPassword(
                  fakePassword, confirmPassword);
              expect(actual, massage);
            },
          );

          test(
            "should return null  when call validatePassword is password required",
            () {
              String fakePassword = "Omar@123";
              var actual = Validations.validateConfirmPassword(
                  fakePassword, fakePassword);
              expect(actual, null);
            },
          );
        },
      );
    },
  );
}
