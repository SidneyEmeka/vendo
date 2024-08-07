import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Productcard extends StatefulWidget {
  final String imgUrl;
  final String title;
  final int price;
  final double rating;

  const Productcard(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.price,
      required this.rating});

  @override
  State<Productcard> createState() => _ProductcardState();
}

class _ProductcardState extends State<Productcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.brown.shade900.withOpacity(0.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            widget.imgUrl,
            // width: 250,
            fit: BoxFit.contain,
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //Left Side - Product details
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.brown.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  //Price and Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //Pricing
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$${widget.price}.00",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade900,
                                fontSize: 10),
                          ),
                          Text(
                            widget.title + " Price",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.brown.shade900,
                                fontSize: 11),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      //Rating
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              widget.rating == 5.0
                                  ? FontAwesomeIcons.solidStar
                                  : FontAwesomeIcons.starHalfStroke,
                              color: Colors.green.shade900,
                              size: 14,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "(${widget.rating})",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green.shade900),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              //Right Side - Add to cart
              Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.brown.shade900,
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.cartPlus,
                        color: Colors.white,
                        size: 15,
                      )))
            ],
          ),
        ],
      ),
    );
  }
}
