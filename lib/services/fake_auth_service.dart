import 'package:cevsev01/model/user_model.dart';
import 'package:cevsev01/services/auth_base.dart';

class FakeAuthenticationService implements AuthBase{
  
  String userID = "121223123243434232323";
  
  @override
  Future<User> currentUser() async{
    return await Future.value(User(userId: userID));
  }

  @override
  Future<User> signInAnonymously() async{
    return await Future.delayed(Duration(seconds: 2), ()=>User(userId: userID));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<User> signInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<User> CreateWithEmailandPassword(String email, String password) {
    // TODO: implement CreateWithEmailandPassword
    throw UnimplementedError();
  }

  @override
  Future<User> signInWithEmailandPassword(String email, String password) {
    // TODO: implement signInWithEmailandPassword
    throw UnimplementedError();
  }

}