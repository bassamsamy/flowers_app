class Validation {
  static String? validateNameTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    return null;
  }

  static String? validatePhoneTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? validateEmailTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validateNumberTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Number';
    }
    final phoneRegex = RegExp(r'^\+2\d{11}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid Number starting with +2';
    }
    return null;
  }

  static String? validateRegularTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill this field';
    }

    return null;
  }

  static String? validatePinTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill this field';
    } else if (value.length != 1) {
      return 'please enter 1 digits';
    }
    return null;
  }

  static String? validatePasswordTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\w\s])[A-Za-z\d[^\W]{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must contain at least one small letter, one capital letter, one number and one special character';
    }
    return null;
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'Please enter your password';
    } else if (val != password) {
      return 'not same password';
    } else {
      return null;
    }
  }
}
