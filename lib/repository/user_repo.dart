import 'package:cevsev01/model/user_model.dart';
import 'package:cevsev01/services/auth_base.dart';
import 'package:cevsev01/services/fake_auth_service.dart';
import 'package:cevsev01/services/firebase_auth_service.dart';

enum AppMode {DEBUG, RELEASE}

class UserRepo implements AuthBase
{
  FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  FakeAuthenticationService _fakeAuthenticationService = FakeAuthenticationService();

  AppMode appMode = AppMode.DEBUG;

  @override
  Future<User> currentUser() async {
  if(appMode == AppMode.DEBUG)
  {
    return await _fakeAuthenticationService.currentUser();
  }
  else{
    return await _firebaseAuthService.currentUser();
  }
}

  @override
  Future<bool> signOut() async {
    if(appMode == AppMode.DEBUG)
    {
      return await _fakeAuthenticationService.signOut();
    }
    else{
      return await _firebaseAuthService.signOut();
    }
  }

  @override
  Future<User> signInAnonymously() async{
    if(appMode == AppMode.DEBUG)
    {
      return await _fakeAuthenticationService.signInAnonymously();
    }
    else{
      return await _firebaseAuthService.signInAnonymously();
    }
  }

  @override
  Future<User> signInWithGoogle() async{
    if(appMode == AppMode.DEBUG)
    {
      return await _fakeAuthenticationService.signInWithGoogle();
    }
    else{
      return await _firebaseAuthService.signInWithGoogle();
    }
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