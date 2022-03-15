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

  /// Sends a password reset email to the given email address.
  ///
  /// To complete the password reset, call [confirmPasswordReset] with the code supplied
  /// in the email sent to the user, along with the new password specified by the user.
  ///
  /// May throw a [FirebaseAuthException] with the following error codes:
  ///
  /// - **auth/invalid-email**\
  ///   Thrown if the email address is not valid.
  /// - **auth/missing-android-pkg-name**\
  ///   An Android package name must be provided if the Android app is required to be installed.
  /// - **auth/missing-continue-uri**\
  ///   A continue URL must be provided in the request.
  /// - **auth/missing-ios-bundle-id**\
  ///   An iOS Bundle ID must be provided if an App Store ID is provided.
  /// - **auth/invalid-continue-uri**\
  ///   The continue URL provided in the request is invalid.
  /// - **auth/unauthorized-continue-uri**\
  ///   The domain of the continue URL is not whitelisted. Whitelist the domain in the Firebase console.
  /// - **auth/user-not-found**\
  ///   Thrown if there is no user corresponding to the email address.
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (err) {
      rethrow;
    }
  }

  bool get isLogin => _auth.currentUser != null;

  bool? get isEmailVerified => _auth.currentUser?.emailVerified;
  User? get currentUser => _auth.currentUser;

  /// Refreshes the current user, if signed in.
  Future<void> reload() async {
    if (currentUser != null) {
      await currentUser!.reload();
    }
  }

  Future<void> signOut() async {
    if (isLogin) {
      try {
        await _auth.signOut();
      } catch (_) {}
    }
  }
}
