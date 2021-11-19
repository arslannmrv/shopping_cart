import 'package:flutter/material.dart';
import 'package:shopping_cart/constants/constants.dart';
import 'package:shopping_cart/helper/data_helper.dart';
import 'package:shopping_cart/model/shopping.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key, required this.onDismiss}) : super(key: key);
  final Function onDismiss;

  @override
  Widget build(BuildContext context) {
    List<Shopping> allProduct = DataHelper.allShoppingList;
    return allProduct.length > 0
        ? ListView.builder(
            itemCount: allProduct.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.startToEnd,
                onDismissed: (e) {
                  onDismiss(index);
                },
                key: UniqueKey(),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(allProduct[index].productName),
                      leading: const Icon(Icons.shopping_basket,
                          color: Colors.purple),
                      subtitle: Text((allProduct[index].productNumber *
                              allProduct[index].productPrice)
                          .toString()),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Text(
              'Please add something to cart',
              style: TextConstants.addCartTextStyle,
            ),
          );
  }
}
