import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<String?> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Return null if sign-up is successful
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          return 'A senha é muito fraca.';
        case 'email-already-in-use':
          return 'Já existe uma conta com esse e-mail.';
        case 'invalid-email':
          return 'E-mail inválido.';
        default:
          return 'Não foi possível criar a conta. Tente novamente.';
      }
    } catch (e) {
      return 'Erro inesperado. Tente novamente.';
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'Nenhum usuário encontrado com esse e-mail.';
        case 'wrong-password':
          return 'Senha incorreta.';
        case 'invalid-email':
          return 'E-mail inválido.';
        case 'user-disabled':
          return 'Esta conta foi desativada.';
        default:
          return 'Não foi possível fazer login. Tente novamente.';
      }
    } catch (e) {
      return 'Erro inesperado. Tente novamente.';
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    await GoogleSignIn().signOut();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null; // The user canceled the sign-in

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      print('User signed out successfully');
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
