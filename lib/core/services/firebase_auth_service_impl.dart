import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';
import '../constants/text_constants.dart';

class FirebaseAuthServiceImpl implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<String> register(
    String name,
    String surname,
    String phoneNumber,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw TextConstants.invalidEmail;
        case 'email-already-in-use':
          throw TextConstants.emailAlreadyInUse;
        case 'weak-password':
          throw TextConstants.weakPassword;
        case 'operation-not-allowed':
          throw TextConstants.operationNotAllowed;
        case 'too-many-requests':
          throw TextConstants.tooManyRequests;
        default:
          throw '${TextConstants.registrationError}: ${e.message}';
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<String> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw TextConstants.invalidEmail;
        case 'user-disabled':
          throw TextConstants.userDisabled;
        case 'user-not-found':
          throw TextConstants.userNotFound;
        case 'wrong-password':
          throw TextConstants.wrongPassword;
        case 'too-many-requests':
          throw TextConstants.tooManyRequests;
        case 'operation-not-allowed':
          throw TextConstants.operationNotAllowed;
        default:
          throw '${TextConstants.loginError}: ${e.message}';
      }
    } catch (e) {
      throw '${TextConstants.unknownError}: ${e.toString()}';
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}
