import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth_service.dart';

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
          throw ('Geçersiz e-posta adresi.');
        case 'email-already-in-use':
          throw ('Bu e-posta zaten kullanımda.');
        case 'weak-password':
          throw ('Şifre çok zayıf.');
        case 'operation-not-allowed':
          throw ('E-posta ile kayıt şu an desteklenmiyor.');
        case 'too-many-requests':
          throw ('Çok fazla istek yapıldı, lütfen daha sonra tekrar deneyin.');
        default:
          throw ('Kayıt hatası: ${e.message}');
      }
    } catch (e) {
      throw ('${e.toString()}');
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
          throw ('Geçersiz e-posta adresi.');
        case 'user-disabled':
          throw ('Bu kullanıcı hesabı devre dışı bırakılmış.');
        case 'user-not-found':
          throw ('Kullanıcı bulunamadı.');
        case 'wrong-password':
          throw ('Yanlış şifre.');
        case 'too-many-requests':
          throw ('Çok fazla başarısız giriş denemesi yapıldı');
        case 'operation-not-allowed':
          throw ('E-posta ile giriş yöntemi etkin değil.');
        default:
          throw ('Giriş hatası: ${e.message}');
      }
    } catch (e) {
      throw ('Bilinmeyen bir hata oluştu: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}
