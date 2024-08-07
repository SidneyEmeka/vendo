import 'package:flutter/cupertino.dart';

class Cartprovider extends ChangeNotifier{
  final List<Map<String, dynamic>> cartItems = [];

  addToCart(Map<String, dynamic> theProducttoAdd){
    cartItems.add(theProducttoAdd);
    notifyListeners();
  }

  removeProduct(Map<String, dynamic> theProducttoRemove){
    cartItems.remove(theProducttoRemove);
    notifyListeners();
  }

  calcTotal(){
    num total = 0;
    for(int i = 0; i < cartItems.length; i++){
      print(cartItems[i]["Price"]);
      total += cartItems[i]["Price"];
    }
    return total;
  }
}