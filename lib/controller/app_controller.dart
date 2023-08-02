import 'package:get/get.dart';
import 'package:getx_counter/models/cart.dart';

class AppController extends GetxController {
  // สร้าง List Cart  มารับค่า สินค้าที่เลือก.
  // ex.1
  RxList<Cart> listCart = <Cart>[].obs;

  //function เพิ่มข้อมูลสินค้า ไปเก็บใน cart
  addItemToCart(Cart cart) {
    //เอา listCart มาเช็คว่า  มีของไหม isNotEmpty / อันที่ productId เหมือนกันไหม ถ้ามีจะให้จำนวน quatity เพิ่มขึ้น
    if (listCart.where((e) => e.productId == cart.productId).isNotEmpty) {
      listCart.value
          .firstWhere((e) => e.productId == cart.productId)
          //quatity +1
          .quantity++;
    } else {
      //ถ้าไม่มีจะเพิ่มสินค้าเข้าไปใน list cart ได้เลย
      listCart.add(cart);
    }
    update(); // เมื่อค่า listCart เปลี่ยนแปลงให้อัปเดตหน้าจอ

    // log(listCart.length.toString());
    listCart.forEach((cart) {
      print("Product ID: ${cart.productId}, Quantity: ${cart.quantity}");
    });
  }
}

// สร้าง controller
// class AppController extends GetxController {
//   // สร้างตัวแปร
//   RxInt counter = 0.obs;

//   // สร้าง function
//   void increment() {
//     counter.value++;
//     print(counter);
//   }
// }
