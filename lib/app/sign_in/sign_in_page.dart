import 'package:cevsev01/app/sign_in/email_sifre_giris_kayit.dart';
import 'package:cevsev01/model/user_model.dart';
import 'package:cevsev01/services/auth_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common_widget/social_log_in_button.dart';

class SignInPage extends StatelessWidget {

  final Function(User) onSignIn;
  final AuthBase authService;

  const SignInPage({Key key,@required this.authService ,@required this.onSignIn}) : super(key: key);

  void _misafirGirisi() async {
    User _user = await authService.signInAnonymously();
    onSignIn(_user);
    print("Oturum açan user id: " + _user.userId.toString());
  }
  void _googleIleGiris(BuildContext context) async{
    User _user = await authService.signInWithGoogle();
    if(_user != null)
    print("Oturum açan user id: " + _user.userId.toString());
  }

  void _emailVeSifreGiris(BuildContext context)
  {
    Navigator.of(context).push(
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context)=>EmailveSifreLoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ÇevSev"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Oturum Açın",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            SizedBox(
              height: 8,
            ),
            SocialLoginButton(
              butonText: "Gmail ile Giriş yapınız",
              textColor: Colors.black87,
              butonColor: Colors.white,
              butonIcon: Image.asset("images/gmail.png"),
              onPressed: () => _googleIleGiris(context),
            ),
        SocialLoginButton(
          onPressed: ()=> _emailVeSifreGiris(context),
          butonColor: Colors.pinkAccent,
          butonIcon: Icon(
              Icons.email,
              color: Colors.white,
              size: 32,
          ),
          butonText: "Email ve Şifre ile Giriş yapınız",
        ),
        SocialLoginButton(
          onPressed: _misafirGirisi,
          butonColor: Colors.teal,
          butonIcon: Icon(Icons.supervised_user_circle,size: 32,),
          butonText: "Misafir Girişi",
        ),
          ],
        ),
      )
    );
  }



}


