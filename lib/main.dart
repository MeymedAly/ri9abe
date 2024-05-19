import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ri9abe/appbinding.dart';
import 'package:ri9abe/views/home.dart';
import 'package:ri9abe/views/list_etudiants.dart';
import 'package:ri9abe/views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ri9abe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: Login(),
      initialRoute: "/",
      initialBinding: AppBinding(),
      getPages: [
        GetPage(name: "/", page: () => Login()),
        GetPage(name: "/homev", page: () => Home()),
        GetPage(name: "/etudiants", page: () => const EtudiantView()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
