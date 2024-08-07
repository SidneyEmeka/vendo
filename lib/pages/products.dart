import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vendo/pages/productpreview.dart';

import '../models/productmodel.dart';
import '../utils/productcard.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.brown.shade900,
          leading: Icon(
            FontAwesomeIcons.bars,
            color: Colors.white,
            size: 15,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                FontAwesomeIcons.search,
                color: Colors.white,
                size: 15,
              ),
            ),
          ],
          expandedHeight: MediaQuery.of(context).size.height / 5.5,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg3.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            centerTitle: true,
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.brown.shade900.withOpacity(0.3),
              ),
              child: Text(
                "$selectedFilter Collection",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
        ),
        //filters
        SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
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
                            filterIcon: aFilter.key, filterName: aFilter.value),
                      ))
                ],
              ),
            ),
          ),
        ),
        //products
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (selectedFilter == "All")
                ...products.map((aProduct) {
                  final productTitle = aProduct["Title"];
                  final productPrice = aProduct["Price"];
                  final productImageUrl = aProduct["ImageUrl"];
                  final productColors = aProduct["Colors"];
                  final productRating = aProduct["Rating"];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return Productpreview(
                          product: aProduct,
                        );
                      }));
                    },
                    child: Productcard(
                        imgUrl: productImageUrl,
                        title: productTitle,
                        price: productPrice,
                        rating: productRating),
                  );
                }),
              if (selectedFilter == "Sofas")
                ...products.map((aSofa) {
                  if (aSofa["Title"] == "Sofa") {
                    final productTitle = aSofa["Title"];
                    final productPrice = aSofa["Price"];
                    final productImageUrl = aSofa["ImageUrl"];
                    final productColors = aSofa["Colors"];
                    final productRating = aSofa["Rating"];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Productpreview(
                            product: aSofa,
                          );
                        }));
                      },
                      child: Productcard(
                          imgUrl: productImageUrl,
                          title: productTitle,
                          price: productPrice,
                          rating: productRating),
                    );
                  }
                  return Container();
                }),
              if (selectedFilter == "Chairs")
                ...products.map((aChair) {
                  if (aChair["Title"] == "Chair") {
                    final productTitle = aChair["Title"];
                    final productPrice = aChair["Price"];
                    final productImageUrl = aChair["ImageUrl"];
                    final productColors = aChair["Colors"];
                    final productRating = aChair["Rating"];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Productpreview(
                            product: aChair,
                          );
                        }));
                      },
                      child: Productcard(
                          imgUrl: productImageUrl,
                          title: productTitle,
                          price: productPrice,
                          rating: productRating),
                    );
                  }
                  return Container();
                }),
              if (selectedFilter == "Tables")
                ...products.map((aTable) {
                  if (aTable["Title"] == "Table") {
                    final productTitle = aTable["Title"];
                    final productPrice = aTable["Price"];
                    final productImageUrl = aTable["ImageUrl"];
                    final productColors = aTable["Colors"];
                    final productRating = aTable["Rating"];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Productpreview(
                            product: aTable,
                          );
                        }));
                      },
                      child: Productcard(
                          imgUrl: productImageUrl,
                          title: productTitle,
                          price: productPrice,
                          rating: productRating),
                    );
                  }
                  return Container();
                }),
              if (selectedFilter == "Beds")
                ...products.map((aBed) {
                  if (aBed["Title"] == "Bed") {
                    final productTitle = aBed["Title"];
                    final productPrice = aBed["Price"];
                    final productImageUrl = aBed["ImageUrl"];
                    final productColors = aBed["Colors"];
                    final productRating = aBed["Rating"];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Productpreview(
                            product: aBed,
                          );
                        }));
                      },
                      child: Productcard(
                          imgUrl: productImageUrl,
                          title: productTitle,
                          price: productPrice,
                          rating: productRating),
                    );
                  }
                  return Container();
                }),
            ],
          ),
        )
      ],
    ));
  }
}
