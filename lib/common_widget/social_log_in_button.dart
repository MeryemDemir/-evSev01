import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SocialLoginButton extends StatelessWidget {

  final String butonText;
  final Color butonColor;
  final Color textColor;
  final double radius;
  final double yukseklik;
  final Widget butonIcon;
  final VoidCallback onPressed;
  //alt + enter
  const SocialLoginButton(
      {Key key,
      @required this.butonText,
      this.butonColor: Colors.purple,
      this.textColor: Colors.white,
      this.radius: 16,
      this.yukseklik: 40,
      this.butonIcon,
      @required this.onPressed})
      : assert(butonText != null, onPressed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: yukseklik,
        child: RaisedButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(radius)
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              butonIcon != null ? butonIcon: Container(),
              Text(
                butonText,
                style: TextStyle(color: textColor),
              ),
              butonIcon != null ? Opacity(opacity:0 , child: butonIcon)
                  : Container(),

            ],
          ),
          color: butonColor,
        ),
      ),
    );
  }
}
/*
//Eski Yöntem

butonIcon != null ? butonIcon: Container(),
Text(
  butonText,
  style: TextStyle(color: textColor),
),
butonIcon != null ? Opacity(opacity:0 , child: butonIcon)
    : Container(),

 */

