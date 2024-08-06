import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vendo/utils/cartprovider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartprovider>(context, listen: false).cartItems;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
        title: Text(
          "Cart",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.brown.shade900),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...cart.map((aCartItem) {
                Widget cartItems(
                    {required String itemImgUrl,
                    required String itemTitle,
                    required String itemColor,
                    required int itemPrice}) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            itemImgUrl,
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: Text(
                          itemTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.brown.shade900),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Color - ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.brown),
                                ),
                                Text(
                                  itemColor,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.brown.shade900),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Prize - ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.brown),
                                ),
                                Text(
                                  "\$$itemPrice",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.brown.shade900),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.trash,
                            size: 15,
                            color: Colors.red.shade900,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(
                                        "Delete Item",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: Text(
                                          "Are you sure you want to remove this item?"),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Provider.of<Cartprovider>(context,
                                                    listen: false)
                                                .removeProduct(aCartItem);
                                            Navigator.of(context).pop();
                                            setState(() {});
                                          },
                                          child: Text("Yes"),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.red.shade900,
                                              foregroundColor: Colors.white),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("No"),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.brown.shade900,
                                              foregroundColor: Colors.white),
                                        ),
                                      ],
                                    ));
                          },
                        )),
                  );
                }

                final imgUrl = aCartItem["ImageUrl"];
                final title = aCartItem["Title"];
                final price = aCartItem["Price"];
                final color = aCartItem["Colors"];
                return cartItems(
                    itemImgUrl: imgUrl,
                    itemTitle: title,
                    itemColor: color,
                    itemPrice: price);
              })
            ],
          ),
        ),
      ),
    );
  }
}
