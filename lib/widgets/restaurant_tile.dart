import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/restaurant_screen.dart';

class RestaurantTile extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantTile(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RestaurantPage(restaurant);
          }),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(restaurant.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                restaurant.name,
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                '\$\$',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              Icon(
                Icons.star_border,
                size: 16,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                restaurant.rating,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.access_time,
                size: 16,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${restaurant.duration}mins',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
