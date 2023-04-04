import 'package:flutter/material.dart';
import 'package:login_page/Pages/register_page.dart';

import 'login_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({Key? key}) : super(key: key);

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initially show login page
  bool showLoginPage = true;

  //toggle between pages
  void togglePage(){
    setState(() {
      showLoginPage= !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(
        onTap: togglePage,
      );
    }
    else {
      return RegisterPage(
        onTap: togglePage
      );
    }
  }
}
