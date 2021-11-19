import 'package:shopping_cart/model/shopping.dart';

class DataHelper {
  static List<Shopping> allShoppingList = [];

  static addShopping(Shopping shopping) {
    allShoppingList.add(shopping);
  }

  static Total() {
    double totalMoney = 0;
    allShoppingList.forEach((element) {
      totalMoney =
          totalMoney + (element.productNumber) * (element.productPrice);
    });
    return totalMoney;
  }
}
