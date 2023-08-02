import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const.dart';
import '../controller/app_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shopping Cart"),
        ),
        body: GetBuilder<AppController>(
          init: AppController(),
          builder: (appController) => (appController.listCart.isNotEmpty)
              ? CartListItem(appController: appController)
              : const Center(
                  child: Text("No item in cart"),
                ),
        ));
  }
}

class CartListItem extends StatelessWidget {
  CartListItem({Key? key, required this.appController}) : super(key: key);

  AppController appController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Column(
              children: appController.listCart.map((e) {
                return ListTile(
                  title: Text(listProduct
                      .where((element) => element.id == e.productId)
                      .first
                      .title),
                  subtitle: Text('X ${e.quantity}'),
                  trailing: ElevatedButton(
                    child: const Text("Remove"),
                    onPressed: () {
                      // remove item at index from cart
                      // print(e.productId);
                      appController.listCart.removeAt(
                        appController.listCart.indexOf(e),
                      );
                      appController.update();
                    },
                  ),
                );
              }).toList(),
            ),

            // total price
            const Divider(
              thickness: 2.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // total item
                  Text(
                    'Items: ${appController.listCart.map((e) => e.quantity).reduce((a, b) => a + b)}',
                    style: const TextStyle(fontSize: 18.0),
                  ),

                  // total price
                  Text(
                    'Price: \$${appController.listCart.map((e) => e.quantity * listProduct.where((element) => element.id == e.productId).first.price).reduce((a, b) => a + b)}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2.0,
            ),

            // proceed to checkout button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              width: constraints.maxWidth,
              child: ElevatedButton(
                  onPressed: () {
                    // proceess to checkout
                  },
                  child: const Text("Checkout")),
            ),
          ],
        );
      }),
    );
  }
}
