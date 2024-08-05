import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Productpreview extends StatefulWidget {
  final product;

  const Productpreview({super.key, required this.product});

  @override
  State<Productpreview> createState() => _ProductpreviewState();
}

class _ProductpreviewState extends State<Productpreview> {
  Widget previewCard(String imgUrl) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.brown.shade900.withOpacity(0.1)),
      child: Image.asset(
        imgUrl,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget previewVariants(String imgUrl) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.brown.shade900.withOpacity(0.1),
      ),
      child: Image.asset(
        imgUrl,
        fit: BoxFit.contain,
        height: 120,
        width: 150,
      ),
    );
  }

  Widget selectColor(String color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.brown.shade900),
          borderRadius: BorderRadius.circular(10)),
      child: Text(color),
    );
  }

  List<String> colors = [];

  @override
  void initState() {
    colors = widget.product["Colors"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.brown.shade900),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.heart,
                size: 20,
                color: Colors.brown.shade900,
              ))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            previewCard(widget.product["ImageUrl"]),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: previewVariants(widget.product["ImageUrl"])),
                SizedBox(width: 10),
                Expanded(child: previewVariants(widget.product["ImageUrl"])),
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.product["Title"],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade900),
                )),
            //Price row
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "\$" + (widget.product["Price"]).toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade900),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Chair price",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.brown.shade900),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        widget.product["Rating"] == 5.0
                            ? FontAwesomeIcons.solidStar
                            : FontAwesomeIcons.starHalfStroke,
                        color: Colors.green.shade900,
                        size: 14,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "(${widget.product["Rating"]})",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.green.shade900),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "Fantastic designed Mahagony armed chair, with\nexotic touch of leather",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.brown.shade900),
            ),
            SizedBox(height: 5),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...colors.map((aColor) {
                      return selectColor(aColor);
                    })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown.shade900,
              foregroundColor: Colors.white),
          child: Text("Add to cart"),
        ),
      ),
    );
  }
}
