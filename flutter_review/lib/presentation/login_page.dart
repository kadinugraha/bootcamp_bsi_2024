

import 'package:flutter/material.dart';
import 'package:flutter_review/presentation/user_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
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
                Provider.of<UserProvider>(context, listen: false).login(
                    _usernameController.text,
                    _passwordController.text
                );
              },
              child: Text('Login')
          )
        ],
      ),
    );
  }
}