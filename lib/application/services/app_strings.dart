// Login page strings
import 'package:octagon_africa/domain/value_objects/constants.dart';

const String loginTitleString = 'Hi, Welcome Back! 👋';
const String loginDescString = "Hello again, you've been missed!";
const String loginString = 'Login';
const String emailString = 'Email';
const String passwordString = 'Password';
const String forgotPasswordString = 'Forgot Password';
const String doNotHaveAnAccountString = "Don't have an account?";
const String rememberMeString = 'Remember Me';
const String signUpString = 'Sign Up';
const String passwordHintString = 'Please Enter Your Password';
const String emailHintString = 'Please Enter Your Email';

//Register page strings
const String registerTitleString = 'Create an account';
const String registerDescString = 'Connect with your friends today!';
const String firstNameString = 'First Name';
const String lastNameString = 'Last Name';
const String emailAddressString = 'Email Address';
const String firstNameHintString = 'Enter your first name';
const String lastNameHintString = 'Enter your last name';
const String phoneNumberString = 'Phone Number';
const String phoneNumberHintString = 'Enter your phone number';
const String phoneNumberRequiredText = 'Phone number is required';
const String validPhoneNumberText = 'Please enter a valid phone number';
const String alreadyHaveAnAccountString = 'Already have an account?';

const String defaultUserFriendlyMessage =
    'Sorry, an unknown error occurred, please try again or get help from our '
    'help center.';
String getErrorMessage([String message = '']) {
  if (message.isEmpty) {
    return defaultUserFriendlyMessage;
  } else {
    return 'Sorry, an error occurred while $message.'
        ' Please try again later, or contact support center';
  }
}

String greeting(String name) {
  final int hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning${name.isNotEmpty && name != UNKNOWN ? ',\n$name' : ''}';
  }
  if (hour < 17) {
    return 'Good Afternoon${name.isNotEmpty && name != UNKNOWN ? ',\n$name' : ''}';
  }
  return 'Good Evening${name.isNotEmpty && name != UNKNOWN ? ',\n$name' : ''}';
}
