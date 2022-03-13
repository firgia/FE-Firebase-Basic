part of service;

class AuthService {
  final _auth = FirebaseAuth.instance;

  /// Attempts to sign in a user with the given email address and password.
  ///
  /// If successful, it also signs the user in into the app and updates
  /// any [authStateChanges], [idTokenChanges] or [userChanges] stream
  /// listeners.
  ///
  /// **Important**: You must enable Email & Password accounts in the Auth
  /// section of the Firebase console before being able to use them.
  ///
  /// A [FirebaseAuthException] maybe thrown with the following error code:
  /// - **invalid-email**:
  ///  - Thrown if the email address is not valid.
  /// - **user-disabled**:
  ///  - Thrown if the user corresponding to the given email has been disabled.
  /// - **user-not-found**:
  ///  - Thrown if there is no user corresponding to the given email.
  /// - **wrong-password**:
  ///  - Thrown if the password is invalid for the given email, or the account
  ///    corresponding to the email does not have a password set.
  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } catch (error) {
      rethrow;
    }
  }

  /// Tries to create a new user account with the given email address and
  /// password.
  ///
  /// A [FirebaseAuthException] maybe thrown with the following error code:
  /// - **email-already-in-use**:
  ///  - Thrown if there already exists an account with the given email address.
  /// - **invalid-email**:
  ///  - Thrown if the email address is not valid.
  /// - **operation-not-allowed**:
  ///  - Thrown if email/password accounts are not enabled. Enable
  ///    email/password accounts in the Firebase Console, under the Auth tab.
  /// - **weak-password**:
  ///  - Thrown if the password is not strong enough.
  Future<UserCredential> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } catch (error) {
      rethrow;
    }
  }

  /// Sends a verification email to a user, if signed in.
  ///
  /// The verification process is completed by calling [applyActionCode].
  Future<void> sendEmailVerification() async {
    try {
      if (currentUser != null) {
        if (!currentUser!.emailVerified) {
          await currentUser!.sendEmailVerification();
        }
      }
    } catch (err) {
      rethrow;
    }
  }

  bool get isLogin => _auth.currentUser != null;

  bool? get isEmailVerified => _auth.currentUser?.emailVerified;
  User? get currentUser => _auth.currentUser;

  /// Refreshes the current user, if signed in.
  Future<void> reload() async {
    if (_auth.currentUser != null) {
      await _auth.currentUser!.reload();
    }
  }

  Future<void> signOut() async {
    if (isLogin) {
      await _auth.signOut();
    }
  }
}
