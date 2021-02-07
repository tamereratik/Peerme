import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String butonText;
  final Color butonColor;
  final Color textColor;
  final VoidCallback onPressed;

  const LoginButton(
      {Key key,
        @required this.butonText,
        this.butonColor: Colors.blue,
        this.textColor:Colors.white,
        @required this.onPressed})
      : assert(butonText != null, onPressed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
          color: butonColor,
          child: Text(butonText),
          onPressed: onPressed,
        )
        :    Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Center(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width - 140,
          height: 50,
          decoration: BoxDecoration(
            color: butonColor,
            borderRadius:
            const BorderRadius.all(Radius.circular(20.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: const Offset(4, 4),
                  blurRadius: 8.0),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    butonText,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: textColor
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
