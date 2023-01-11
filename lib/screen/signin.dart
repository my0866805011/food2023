import 'package:flutter/material.dart';

import '../utility/my_style.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignIn'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MyStyle().showLogo(),
            MyStyle().showTitle('app food2023'),
            useForm()
          ],
        ),
      ),
    );
  }

Widget useForm() => Container(width: 250.0,
   child: TextField(),
);
}
