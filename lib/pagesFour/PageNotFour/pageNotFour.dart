import 'package:easyshoppingapp/pagesFour/DetailNotFour/detailNotFour.dart';
import 'package:flutter/material.dart';

class PageNotFournisseur extends StatefulWidget {
  const PageNotFournisseur({super.key});

  @override
  State<PageNotFournisseur> createState() => _PageNotFournisseurState();
}

class _PageNotFournisseurState extends State<PageNotFournisseur> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: 
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/SHOPPING-removebg-preview 9.png"),
                  IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.purple,
                        size: 30,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.purple),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      'Les notifications',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 150,
                height: 150,
                child: Row(
                  children: [Image.asset('assets/images/not.png')],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailNotFour()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: Color.fromARGB(255, 133, 131, 128))),
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(12),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                        radius: 20,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Issouf Doucoure',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                                'Lore Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],)),
      ),
    );
  }
}