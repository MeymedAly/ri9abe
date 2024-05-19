import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  // Generate a dummy list
  final List numbers = List.generate(8, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bienvenue'),
        ),
        // Implement the GridView
        body: GridView(
            padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: [
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                elevation: 4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'images/icons/students.png',
                          width: 70,
                          height: 50,
                        ),
                        const Text(
                          'Les Etudiants',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 1,
                      left: 1,
                      child: Divider(
                        color: Colors.lightBlue,
                        endIndent: 45,
                        indent: 50,
                        thickness: 3,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Get.toNamed("/etudiants");
                      },
                    ),
                  ],
                ),
              ),
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                elevation: 4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'images/icons/add.png',
                          width: 70,
                          height: 50,
                        ),
                        const Text(
                          'Etudiant',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 1,
                      left: 1,
                      child: Divider(
                        color: Colors.green,
                        endIndent: 45,
                        indent: 50,
                        thickness: 3,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/etudiants");
                      },
                    ),
                  ],
                ),
              ),

              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                elevation: 4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Image.asset(
                        //   'images/icons/solde.png',
                        //   width: 100,
                        //   height: 45,
                        // ),
                        const Text(
                          'Solde',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 1,
                      left: 1,
                      child: Divider(
                        color: Color.fromARGB(255, 158, 158, 145),
                        endIndent: 45,
                        indent: 50,
                        thickness: 3,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/soldev");
                      },
                    ),
                  ],
                ),
              ),
              // if (ctrles.codeGroupe == "livreur")
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                elevation: 4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Image.asset(
                        //   'images/icons/facturehors.png',
                        //   width: 100,
                        //   height: 45,
                        // ),
                        const Text(
                          'Prospect',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 1,
                      left: 1,
                      child: Divider(
                        color: Color.fromARGB(255, 9, 9, 9),
                        endIndent: 45,
                        indent: 50,
                        thickness: 3,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/facthorsv");
                      },
                    ),
                  ],
                ),
              ),
            ]));
  }
}
