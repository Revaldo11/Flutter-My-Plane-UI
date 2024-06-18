import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_plane/handlers/log_utility.dart';
import 'package:my_plane/models/users.dart';

class UserService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': 10000000,
      });
    } catch (e) {
      LogUtility.logError('Error set user: $e');
      rethrow;
    }
  }

  Future<UserModel> getUser(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        hobby: snapshot['hobby'],
        balance: snapshot['balance'],
      );
    } catch (e) {
      LogUtility.logError('Error get user: $e');
      rethrow;
    }
  }
}
