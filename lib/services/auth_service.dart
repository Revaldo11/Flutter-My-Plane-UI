import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_plane/handlers/log_utility.dart';
import 'package:my_plane/models/users.dart';
import 'package:my_plane/services/user_services.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user = await UserService().getUser(userCredential.user!.uid);

      return user;
    } catch (e) {
      LogUtility.logError('Error signing in: $e');
      rethrow;
    }
  }

  Future<UserModel> signUp(
      String email, String password, String name, String hobby) async {
    try {
      if (email.isEmpty || password.isEmpty || name.isEmpty) {
        throw 'Please fill all fields';
      } else if (password.length < 6) {
        throw 'Password must be at least 6 characters';
      } else {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        UserModel user = UserModel(
          id: userCredential.user!.uid,
          email: email,
          name: name,
          hobby: hobby,
        );
        await UserService().setUser(user);
        return user;
      }
    } catch (e) {
      LogUtility.logError('Error signing up: $e');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      LogUtility.logError('Error signing out: $e');
      rethrow;
    }
  }

  Future<UserModel> getCurrentUser(String id) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        UserModel currentUser = await UserService().getUser(user.uid);
        return currentUser;
      } else {
        throw 'User not found';
      }
    } catch (e) {
      LogUtility.logError('Error getting current user: $e');
      rethrow;
    }
  }
}
