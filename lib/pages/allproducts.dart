import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vendo/models/productmodel.dart';
import 'package:vendo/pages/productpreview.dart';

import '../utils/productcard.dart';

class Allproducts extends StatefulWidget {
  const Allproducts({super.key});

  @override
  State<Allproducts> createState() => _AllproductsState();
}

class _AllproductsState extends State<Allproducts> {
  final border = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black),
    borderRadius: BorderRadius.circular(20),
  );

  Map<Icon, String> filters = {
    const Icon(
      Icons.holiday_village_rounded,
      size: 15,
      color: Colors.white,
    ): "All",
    const Icon(
      Icons.chair,
      size: 15,
      color: Colors.white,
    ): "Sofas",
    const Icon(
      FontAwesomeIcons.chair,
      size: 15,
      color: Colors.white,
    ): "Chairs",
    const Icon(
      Icons.table_bar,
      size: 15,
      color: Colors.white,
    ): "Tables",
    const Icon(
      Icons.bed,
      size: 15,
      color: Colors.white,
    ): "Beds",
  };

  String selectedFilter = "All";

  Widget filterContainer(
      {required Icon filterIcon, required String filterName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: selectedFilter == filterName
            ? Colors.brown.shade900
            : Colors.brown.shade900.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              filterIcon,
              const SizedBox(
                width: 5,
              ),
              Text(
                filterName,
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "$selectedFilter\nCollection",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                          hintText: "search",
                          prefixIcon: const Icon(Icons.search)),
                    ),
                  ))
                ],
              ),
              //filters
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...filters.entries.map((aFilter) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFilter = aFilter.value;
                              });
                              // print(selectedFilter);
                            },
                            child: filterContainer(
                                filterIcon: aFilter.key,
                                filterName: aFilter.value),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              //products
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...products.map((aProduct) {
                        final productTitle = aProduct["Title"];
                        final productPrice = aProduct["Price"];
                        final productImageUrl = aProduct["ImageUrl"];
                        final productColors = aProduct["Colors"];
                        final productRating = aProduct["Rating"];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return Productpreview(product: aProduct,);
                            }));
                          },
                          child: Productcard(
                              imgUrl: productImageUrl,
                              title: productTitle,
                              price: productPrice,
                              rating: productRating),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
