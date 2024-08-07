import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendo/pages/homepage.dart';
import 'package:vendo/pages/cart.dart';
import 'package:vendo/utils/cartprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> Cartprovider(),
      child: MaterialApp(
        title: 'Vendo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
          useMaterial3: true,
          fontFamily: "Poppins",
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black),
              prefixIconColor: Colors.black),
        ),
        home: const Home(),
        //home: Cart(),
      ),
    );
  }
}
