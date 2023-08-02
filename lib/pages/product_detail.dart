import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_counter/controller/app_controller.dart';
import 'package:getx_counter/pages/home.dart';
import '../models/cart.dart';
import '../models/product.dart';
import '../widgets/shoppingcart_button.dart';

// ignore: must_be_immutable
class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key, this.product});

  //รับค่ามาจากหน้า home ตอนกดเข้ามา
  final Product? product;

  AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return product != null
        ? Scaffold(
            appBar: AppBar(
              title: Text('${product!.title}'),
              actions: [
                // shopping cart icon button widget
                ShoppingCartButton(appController: appController)
              ],
            ),
            body: SingleChildScrollView(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // image
                      // Placeholder(
                      //   color: Colors.grey.shade300,
                      // ),
                      Image.network(
                          "https://images.pexels.com/photos/699953/pexels-photo-699953.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"), // title
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product!.title,
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // price
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('\$${product!.price}'),
                      ),

                      // description
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${product!.description}'),
                      ),

                      // add to cart button
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: constraints.maxWidth,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO : add product to cart ใช้งาน addItemToCart ใน controller
                              appController.addItemToCart(
                                Cart(
                                  productId: product!.id,
                                  quantity: 1,
                                ),
                              );
                            },
                            child: Text("Add to cart"),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Product Detail'),
              actions: [
                // shopping cart icon button widget
                ShoppingCartButton(appController: appController)
              ],
            ),
            body: SingleChildScrollView(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // image
                      Placeholder(
                        color: Colors.grey.shade300,
                      ),

                      // title
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Product is Not Found",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // back to home
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: constraints.maxWidth,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(
                                () => HomePage(),
                              );
                            },
                            child: Text("Back to Home"),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          );
  }
}
