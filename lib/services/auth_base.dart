import 'package:cevsev01/model/user_model.dart';

abstract class AuthBase{

  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<bool> signOut();
  Future<User> signInWithGoogle();
  Future<User> signInWithEmailandPassword(String email, String password);
  Future<User> CreateWithEmailandPassword(String email, String password);
}