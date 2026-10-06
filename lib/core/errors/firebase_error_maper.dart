class FirebaseErrorMaper {
  static String map(String code) {
    switch (code) {
      case 'invalid-credential':
        return 'Email or password is incorrect';

      case 'user-not-found':
        return 'No account found with this email';

      case 'wrong-password':
        return 'Email or password is incorrect';

      case 'invalid-email':
        return 'Please enter a valid email';

      case 'email-already-in-use':
        return 'This email is already registered';

      case 'weak-password':
        return 'Password is too weak';

      case 'user-disabled':
        return 'This account has been disabled';

      case 'network-request-failed':
        return 'Please check your internet connection';

      default:
        return 'Something went wrong. Please try again';
    }
  }
}
