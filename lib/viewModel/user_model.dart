import 'package:cevsev01/model/user_model.dart';
import 'package:cevsev01/repository/user_repo.dart';
import 'package:cevsev01/services/auth_base.dart';
import 'package:flutter/material.dart';

enum ViewState {Idle, Busy}

class UserModel with ChangeNotifier implements AuthBase{

  ViewState _state = ViewState.Idle;
  UserRepo _userRepo = UserRepo();
  User _user;

  ViewState get state => _state;

  set state(ViewState value)
  {
    _state = value;
    notifyListeners();
  }

  @override
  Future<User> currentUser() async{
    try{
      state = ViewState.Busy;
      _user = await _userRepo.currentUser();
      return _user;
    }catch(e){
      debugPrint("viewmodeldeki current user hata: " + e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async{
    try{
      state = ViewState.Busy;
      return await _userRepo.signOut();
    }catch(e){
      debugPrint("viewmodeldeki current user hata: " + e.toString());
      return false;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> signInAnonymously() async{
    try{
      state = ViewState.Busy;
      _user =  await _userRepo.signInAnonymously();
      return _user;
    }catch(e){
      debugPrint("viewmodeldeki current user hata: " + e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> signInWithGoogle() async{
    try{
      state = ViewState.Busy;
      _user =  await _userRepo.signInWithGoogle();
      return _user;
    }catch(e){
      debugPrint("viewmodeldeki current user hata: " + e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> CreateWithEmailandPassword(String email, String password) {
    return null;
  }

  @override
  Future<User> signInWithEmailandPassword(String email, String password) {
    return null;
  }



}