class UserNameFieldValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return "User name can't be empty";
    } else {
      bool isValid = value.contains("@");
      return isValid ? null : "Please enter a valid email addres";
    }
  }
}

class PasswordFieldValidator {
  static String? validate(String value) {
    return value.isEmpty ? "Password cannot be empty" : null;
  }
}
