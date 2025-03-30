class Validation {

// ايميل

  static String? validateEmailTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
// رقم التليفون
  static String? validateNumberTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Number';
    }
    final phoneRegex = RegExp(r'^01\d{9}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid Number';
    }
    return null;
  }

// 

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

// باسورد

  static String? validatePasswordTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\w\s])[A-Za-z\d[^\W]{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must contain at least one small letter, one capital letter, one number and one special character';
    }
    return null;
  }

// USER NAME

  static String? validateUsernameTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters long';
    }
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!usernameRegex.hasMatch(value)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    return null;
  }
}
