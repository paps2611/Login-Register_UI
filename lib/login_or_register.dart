import 'package:flutter/material.dart';
import 'package:login/register_page.dart';

import 'login_page.dart';

class LoginorRegisterPage extends StatefulWidget {
  const LoginorRegisterPage({super.key});

  @override
  State<LoginorRegisterPage> createState() => _LoginorRegisterPageState();
}

class _LoginorRegisterPageState extends State<LoginorRegisterPage> {
  //intiially show login page
  bool showLoginPage =! true;
  // toggle btwn page
  void togglePages(){
    setState(() {
      showLoginPage =!showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return RegisterPage(
        onTap: togglePages,
      );
    }
    else{
      return LoginPage(
          onTap: togglePages);
    }
  }
}
