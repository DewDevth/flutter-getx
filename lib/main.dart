import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_counter/models/cart.dart';
import 'package:getx_counter/pages/cart.dart';
import 'package:getx_counter/pages/home.dart';
import 'package:getx_counter/pages/product_detail.dart';

import 'controller/app_controller.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

//เอาcontroller มาใช้
//ex
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/', // Set the initial route here
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/productdetailpage',
          page: () => ProductDetailPage(),
        ),
        GetPage(
          name: '/cart',
          transition: Transition.leftToRight,
          // transitionDuration: const Duration(seconds: 5),
          page: () => const CartPage(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
      ),
      // home: HomePage(),
    );
  }
}
