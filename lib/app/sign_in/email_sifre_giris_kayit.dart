import 'package:cevsev01/common_widget/social_log_in_button.dart';
import 'package:flutter/material.dart';

enum FormType {Register, Login}

class EmailveSifreLoginPage extends StatefulWidget {
  @override
  _EmailveSifreLoginPageState createState() => _EmailveSifreLoginPageState();
}

class _EmailveSifreLoginPageState extends State<EmailveSifreLoginPage> {

  String _email, _sifre;
  String _butonText, _linkText;
  var _formType = FormType.Login;

  final _formKey = GlobalKey<FormState>();

  void _formSubmit() {
    _formKey.currentState.save();
    debugPrint("email: " + _email + "sifre: " + _sifre);

  }

  void _degistir() {
    setState(() {
      _formType = _formType == FormType.Login ? FormType.Register : FormType.Login;
    });

  }

  @override
  Widget build(BuildContext context) {

    _butonText = FormType ==FormType.Login ? "Giriş Yap " : "Kayıt Ol";
    _linkText = _formType == FormType.Login ? "Hesabınız Yok Mu? Kayıt Olun" : "Hesabınız Var Mı? Giriş Yapın ";

    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş / Kayıt"),
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
              child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  hintText: 'Email',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onSaved: (String girilenEmail){
                  _email = girilenEmail;
                },
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                obscureText: true, //sifre alanı gizli
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  hintText: 'Password',
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                onSaved: (String girilenSifre){
                  _sifre = girilenSifre;
                },
              ),

              SizedBox(
                height: 8,
              ),

              SocialLoginButton(
                butonText: _butonText,
                butonColor: Theme.of(context).primaryColor,
                radius: 10,
                onPressed: () => _formSubmit(),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                onPressed: () => _degistir(),
                child: Text(_linkText),
              )
            ],
          )),
      ),
      ),
    );
  }




}

