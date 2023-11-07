import 'package:flutter/material.dart';

class HeaderChoix extends StatelessWidget {
  const HeaderChoix({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: [
        Positioned(
        child: Container(
              margin: const EdgeInsets.only(left: 40, top: 50),
              child: Image.asset("assets/images/SHOPPING-removebg-preview 9.png")
            ),
        ),
        const SizedBox(height: 20,),
        Positioned(
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            child: Image.asset("assets/images/Demarrer.png",
            ),
          )
        ),
        const SizedBox(height: 25,),
        const SizedBox(
  width: 289,
  height: 160,
  child: Text(
    'Voulez-vous inscrire en tant que fournisseur ou client!',
    style: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontStyle: FontStyle.italic,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      height: 0,
    ),
  ),
)
      ],   
      ),
      
    );
  }
}