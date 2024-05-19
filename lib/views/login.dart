import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/logincontroller.dart';
import '../models/utilisateur.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //final LoginController ctrl = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Ri9abe",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.greenAccent),
        )),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            alignment: Alignment.center,
            child: ListView(children: <Widget>[
              // image
              /*Image.asset(
                'images/AREGB.ico',
                width: 90.0,
                height: 90.0,
                //   color: Colors.lightGreen,
              ),*/
              // form
              const SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _userController,
                          decoration: const InputDecoration(
                              hintText: "Login", icon: Icon(Icons.person)),
                        ),
                        TextField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              hintText: "Mot de passe", icon: Icon(Icons.lock)),
                          obscureText: true,
                        ),
                        // boutons
                        const Padding(padding: EdgeInsets.all(10.5)),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Login
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(left: 38.0),
                              child: MaterialButton(
                                onPressed: () {
                                  Get.find<LoginController>()
                                      .isExist(_userController.text,
                                          _passwordController.text)
                                      .then((value) {
                                    if (value == true) {
                                      Get.find<LoginController>()
                                          .getUtilisateurByLogin(
                                              _userController.text)
                                          .then((valuen) {
                                        Utilisateur curUser = valuen!;
                                        if (curUser.codeGroupe == "admin") {
                                          Get.toNamed("/homev");
                                        }
                                      });
                                      // return;
                                    } else {
                                      Get.find<LoginController>().welcomeUser();
                                    }
                                  });
                                },
                                color: Colors.blueAccent,
                                child: const Text("Login",
                                    style: TextStyle(fontSize: 16.9)),
                              ),
                            ),
                            // Liste
                            const Padding(padding: EdgeInsets.all(10.5)),
                            /*Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // Login
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(left: 38.0),
                                    child: GetBuilder<LoginController>(
                                      builder: (value) => Text(
                                        Get.find<LoginController>()
                                            .welcomeString!,
                                        style: const TextStyle(fontSize: 16.9),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )*/
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
