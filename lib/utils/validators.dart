/// Holds all String Validators to be used by text-fields
class StringValidators {
  StringValidators._();

  /// email validator
  static String? validateEmail(String? email) {
    if (email != null && email.isNotEmpty) {
      final emailIsValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      if (emailIsValid) {
        return null;
      } else {
        return 'Pleasee enter a valid email address.';
      }
    } else {
      return 'Please enter your email address';
    }
  }

  /// Password Validator
  ///
  /// If password is longer than 8 chars, returns null.
  /// Else returns error message.
  static String? passwordValidator(String? password) {
    if (password != null && password.isNotEmpty) {
      password.length > 8
          ? null
          : 'Please enter a password at least 8 characters long';
    } else {
      return 'Please enter your password';
    }
  }

  /// Confirm password validator
  ///
  /// Used for second password textfield and confirms whether this password
  /// matches the other
  static String? confirmPasswordValidator(
      String? passwordOne, String? passwordTwo) {
    if (passwordOne != null &&
        passwordTwo != null &&
        passwordOne.isNotEmpty &&
        passwordTwo.isNotEmpty) {
      if (passwordOne != passwordTwo) {
        return "Passwords don't match. Please try again";
      }
    } else {
      return 'Please confirm your password';
    }
  }

  /// Validator for a User's first name
  static String? firstNameValidator(String? firstName) {
    if (firstName != null && firstName.isNotEmpty) {
      return null;
    } else {
      return 'Please enter your first name';
    }
  }

  /// Validator for a User's first name
  static String? lastNameValidator(String? lastName) {
    if (lastName != null && lastName.isNotEmpty) {
      return null;
    } else {
      return 'Please enter your first name';
    }
  }

  /// Validator for a User's first name
  static String? messageValidator(String? message) {
    if (message != null && message.isNotEmpty) {
      return null;
    } else {
      return 'Please enter a message';
    }
  }
}
