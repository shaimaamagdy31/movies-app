class AppValidations {
  static late String password_1;

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    return null;
  }
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'phone is required';
    }
    final phoneRegex = RegExp(r'^01[0-9]{9}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone ';
    }

    return null;
  }
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    // Email regex pattern

    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
  }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    password_1=value;

    return null;
  }
  static String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if(value != password_1){
      return "passwords don't match";
    }

    return null;
  }

}