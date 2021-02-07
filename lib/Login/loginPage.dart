import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexacore/Common/CustomButton.dart';
import 'package:hexacore/Common/CustomInput.dart';
import 'package:hexacore/loginScreenIndicator.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  bool _validate = false;
  bool _loadingVisible = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoadingScreen(
          backcolor: Colors.green,
          inAsyncCall: _loadingVisible,
          child: Form(
            key: _formKey1,
            autovalidate: _validate,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(flex:2,child: Center(child: Text("Welcome",style: TextStyle(fontSize: 45,color: Colors.black),))),
                  Input(hintText: "E-mail",icon: Icon(Icons.email,color: Colors.green,),controller: _emailController,satir: 1,),
                  Input(hintText: "Password",icon: Icon(Icons.lock,color: Colors.green,),controller: _passwordController,satir: 1,),
                  Center(child: LoginButton(butonText: "Login",butonColor: Colors.green,onPressed: loginpress,)),
                  Expanded(flex: 2,child: Center(
                    child: FlatButton(child: Text("Forgot Password",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),),
                  ),),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _changeLoadingVisible() async {
    setState(() {
      _loadingVisible = !_loadingVisible;
    });
    Future.delayed(Duration(seconds: 5)).then((value) {
      setState(() {
        _loadingVisible = !_loadingVisible;
      });
    });
  }


  Future<void> loginpress() async {
    if (_formKey1.currentState.validate()) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      await _changeLoadingVisible();
    }
  }
}

