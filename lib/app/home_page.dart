import 'package:cevsev01/model/user_model.dart';
import 'package:cevsev01/services/auth_base.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final AuthBase authService;
  final VoidCallback onSignOut;
  //VoidCallback = Herhangi bir değer döndürmez / Function da kullanılabilir

  final User user;

  HomePage({Key key,@required this.user,@required this.authService,@required this.onSignOut}) : super(key: key);


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: _cikisYap,
            child: Text(
                "Çıkış yap",
                style: TextStyle(color: Colors.white)
          ),
          )
        ],
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Text("Hosgeldiniz${user.userId}"),
      ),
    );
  }
  Future<bool> _cikisYap() async
  {
    bool sonuc = await authService.signOut();
    onSignOut();
    return sonuc;
  }
}




