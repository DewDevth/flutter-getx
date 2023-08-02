import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/app_controller.dart';
import '../pages/cart.dart';

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({
    Key? key,
    required this.appController,
  }) : super(key: key);

  final AppController appController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            // navigate to cart page
            // Get.to(
            //   () => CartPage(),
            // );
            Get.toNamed('/cart');
          },
        ),
        Positioned(
          right: 1,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(32),
            ),
            // update item count in cart from app controller
            child: Obx(
              () => Text(
                appController.listCart.length.toString(),
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
