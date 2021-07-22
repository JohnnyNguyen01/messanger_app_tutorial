/// Contains all String validator helper functions
extension StringValidatorsExtension on String {
  /// Email Validator
  ///
  /// If true, returns null. If false returns error message.
  String? validateEmail() {
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(this)
        ? ''
        : 'Pease enter a valid email address';
  }

  /// Password Validator
  ///
  /// If password is longer than 8 chars, returns null.
  /// Else returns error message.
  String? passwordValidator() => length > 8 ? '' : '';
}
