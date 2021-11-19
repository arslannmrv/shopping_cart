import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import 'package:shopping_cart/model/shopping.dart';
import 'package:shopping_cart/widgets/show_money.dart';
import 'package:shopping_cart/widgets/product_list.dart';

import 'constants/constants.dart';
import 'helper/data_helper.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  var nameFormKey = GlobalKey<FormState>();
  var totalPriceKey = GlobalKey<FormState>();
  String inputProductName = '';
  String inputPrice = '';
  TextEditingController inputNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
            child: Text(
          TextConstants.mainText,
          style: TextConstants.mainTextStyle,
        )),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ShowPrice(
                    TotalPrice: DataHelper.Total(),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      child: _buildProductNameForm(),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildProductPriceNumber(),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(Icons.add_shopping_cart),
                          color: ColorConstants.mainColor,
                          iconSize: 70,
                          onPressed: _totalCalculate,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: ProductList(
              onDismiss: (index) {
                DataHelper.allShoppingList.removeAt(index);
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProductNameForm() {
    return Form(
      key: nameFormKey,
      child: _buildNameTextFormField(),
    );
  }

  _buildNameTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          inputProductName = deger!;
        });
      },
      controller: TextEditingController(),
      decoration: InputDecoration(
          hintText: 'Product',
          border: OutlineInputBorder(
              borderRadius: DecorationConstants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: ColorConstants.textFormColor),
    );
  }

  Widget _buildProductPriceNumber() {
    return Form(
        key: totalPriceKey,
        child: Column(
          children: [
            _buildPriceFormField(),
            _buildProductNumber(),
          ],
        ));
  }

  _buildPriceFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          inputPrice = deger!;
        });
      },
      decoration: InputDecoration(
          hintText: 'Price',
          border: OutlineInputBorder(
              borderRadius: DecorationConstants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: ColorConstants.textFormColor),
    );
  }

  _buildProductNumber() {
    return Container(
        padding: const EdgeInsets.all(3),
        child: NumberInputWithIncrementDecrement(
          numberFieldDecoration: InputDecoration(
              hintText: 'Total',
              border: OutlineInputBorder(
                  borderRadius: DecorationConstants.borderRadius,
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: ColorConstants.textFormColor),
          widgetContainerDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          controller: inputNumberController,
        ));
  }

  void _totalCalculate() {
    if (nameFormKey.currentState!.validate()) {
      nameFormKey.currentState!.save();
      totalPriceKey.currentState!.save();
      var addShopping = Shopping(
          productName: inputProductName,
          productPrice: double.parse(inputPrice),
          productNumber: int.parse(inputNumberController.text));

      DataHelper.addShopping(addShopping);
    }
  }
}
