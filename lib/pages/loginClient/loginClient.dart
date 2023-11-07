import 'package:easyshoppingapp/pages/loginClient/widgets/HeaderLogin.dart';
import 'package:easyshoppingapp/pages/loginClient/widgets/boutonLogin.dart';
import 'package:flutter/material.dart';

class LoginClient extends StatelessWidget {
  const LoginClient({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                HeaderLogin(),
                SizedBox(height: 20,),
                BoutonLogin()
              ],
            )
        ]),
      ),
    );
  }
}