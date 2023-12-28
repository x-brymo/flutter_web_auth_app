// bool isValidEmail(
//   String? inputString, {
//   bool isRequired = false,
// }) {
//   bool isInputStringValid = false;

//   if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
//     isInputStringValid = true;
//   }

//   if (inputString != null && inputString.isNotEmpty) {
//     const pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

//     final regExp = RegExp(pattern);

//     isInputStringValid = regExp.hasMatch(inputString);
//   }

//   return isInputStringValid;
// }
// bool isValidName(
//   String? inputString, {
//   bool isRequired = false,
// }) {
//   bool isInputStringValid = false;

//   if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
//     isInputStringValid = true;
//   }

//   if (inputString != null && inputString.isNotEmpty) {
//     // Modify the pattern as needed for valid names
//     const pattern = r'^[a-zA-Z]+$';

//     final regExp = RegExp(pattern);

//     isInputStringValid = regExp.hasMatch(inputString);
//   }

//   return isInputStringValid;
// }
// bool isValidPassword(
//   String? inputString, {
//   bool isRequired = false,
// }) {
//   bool isInputStringValid = false;

//   if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
//     isInputStringValid = true;
//   }

//   if (inputString != null && inputString.isNotEmpty) {
//     // Modify the pattern as needed for valid passwords
//     const pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';

//     final regExp = RegExp(pattern);

//     isInputStringValid = regExp.hasMatch(inputString);
//   }

//   return isInputStringValid;
// }
// bool isValidUsername(
//   String? inputString, {
//   bool isRequired = false,
// }) {
//   bool isInputStringValid = false;

//   if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
//     isInputStringValid = true;
//   }

//   if (inputString != null && inputString.isNotEmpty) {
//     // Modify the pattern as needed for valid usernames
//     const pattern = r'^[a-zA-Z0-9_]+$';

//     final regExp = RegExp(pattern);

//     isInputStringValid = regExp.hasMatch(inputString);
//   }

//   return isInputStringValid;
// }


extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName{
    final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword{
final passwordRegExp = 
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull{
    return this!=null;
}

  bool get isValidPhone{
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

}