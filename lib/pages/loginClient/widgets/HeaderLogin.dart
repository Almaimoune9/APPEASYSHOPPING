import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: [
          Positioned(
            child: Container(
              margin: const EdgeInsets.only(left: 0, right: 150),
              child: Image.asset("assets/images/SHOPPING-removebg-preview 9.png"),
            )
          ),
           const SizedBox(height: 20,),
          Positioned(
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            child: Image.asset("assets/images/Demarrer.png",
            ),
          )
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 40),
        child:
        TextFormField(
  decoration: const InputDecoration(
    suffixIcon: Icon(Icons.email),
    hintText: 'Entrez votre email',
    labelText: 'Email',
  
  ),
  onSaved: (String? value) {
    // This optional block of code can be used to run
    // code when the user saves the form.
  },
  validator: (String? value) {
    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
  },
)),
Padding(padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 0),
        child:
        TextFormField(
  decoration: const InputDecoration(
    suffixIcon: Icon(Icons.password),
    hintText: 'Entrez votre mot de pass',
    labelText: 'Mot de pass',
  
  ),
  onSaved: (String? value) {
    // This optional block of code can be used to run
    // code when the user saves the form.
  },
  validator: (String? value) {
    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
  },
))
        ],
      ),
    );
  }
}