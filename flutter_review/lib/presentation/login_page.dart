

import 'package:flutter/material.dart';

import '../domain/entities/user.dart';
import '../domain/use_cases/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'username'
            ),
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'password'
            ),
          ),
          OutlinedButton(
              onPressed: () async{
                var user = User(username: _usernameController.text, token: '');
                user.password = _passwordController.text;
                user = await Login().execute(user);
                print(user.token);
              },
              child: Text('Login')
          )
        ],
      ),
    );
  }
}
