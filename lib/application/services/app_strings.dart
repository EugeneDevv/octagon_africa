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
