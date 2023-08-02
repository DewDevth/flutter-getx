import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_counter/const.dart';
import 'package:getx_counter/controller/app_controller.dart';
import 'package:getx_counter/pages/product_detail.dart';

import '../widgets/shoppingcart_button.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

//เอาcontroller มาใช้
  AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Commerce"),
        actions: [
          //ใส่icon cart
          ShoppingCartButton(appController: appController)
        ],
      ),

      //ส่วนของ รายการสินค้า
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: listProduct.length,
        itemBuilder: (BuildContext context, int index) {
          return LayoutBuilder(builder: (context, constraints) {
            return InkWell(
              onTap: () {
                //   navigate to product detail page เเละ ส่งค่า product ไป

                Get.to(
                  () => ProductDetailPage(
                    product: listProduct[index],
                  ),
                );

               
              },
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // image
                    SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.75,
                      child:
                          // Placeholder(
                          //   color: Colors.grey.shade300,
                          // ),
                          Image.network(
                              "https://images.pexels.com/photos/699953/pexels-photo-699953.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    ),
                    // product name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        listProduct[index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),
                    // product price
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('\$${listProduct[index].price}'),
                    ),
                    // space
                    const SizedBox(height: 8.0)
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
