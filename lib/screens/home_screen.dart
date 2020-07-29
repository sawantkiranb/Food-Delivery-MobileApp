import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/restaurant.dart';
import '../widgets/restaurant_tile.dart';

class MyHomePage extends StatelessWidget {
  final List<Restaurant> restaurants = [
    Restaurant(
      id: '1',
      name: 'Charlie\'s Burger',
      rating: '4.5',
      duration: '25',
      imageUrl: 'assets/images/charlie.jpg',
    ),
    Restaurant(
      id: '2',
      name: 'Pita Pan',
      rating: '4.0',
      duration: '35',
      imageUrl: 'assets/images/pita.jpg',
    ),
    Restaurant(
      id: '3',
      name: 'Grub\'n Stuff',
      rating: '4.2',
      duration: '40',
      imageUrl: 'assets/images/grub.jpg',
    ),
    Restaurant(
      id: '4',
      name: 'Munch Box',
      rating: '3.5',
      duration: '40',
      imageUrl: 'assets/images/munch.jpg',
    ),
  ];

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  Widget _buildMenuIcon(String url, String type) {
    return Column(
      children: <Widget>[
        Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.75),
              ),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset(
            url,
            color: hexToColor('#5A1A0D'),
          ),
        ),
        SizedBox(height: 10),
        Text(
          type,
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.keyboard_arrow_down,
          size: 25,
          color: Colors.grey,
        ),
        title: Text(
          '120 Beech Ave.',
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            wordSpacing: 2,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0.1,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 25,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: 30,
          top: 10,
          right: 30,
        ),
        children: <Widget>[
          Container(
            child: Text(
              'Food Delivery',
              style: GoogleFonts.lato(
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Cuisines',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'View All',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildMenuIcon('assets/icons/noodles.svg', 'Chinese'),
              _buildMenuIcon('assets/icons/pizza.svg', 'Italian'),
              _buildMenuIcon('assets/icons/hamburger.svg', 'American'),
              _buildMenuIcon('assets/icons/taco.svg', 'Mexican'),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Best in Los Angeles',
            style: GoogleFonts.lato(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '2,500 restaurants in Los Angeles',
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.withOpacity(0.75),
              wordSpacing: 2,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: <Widget>[
              ...restaurants.map((rest) {
                return RestaurantTile(rest);
              })
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {},
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: hexToColor('#5A1A0D'),
        unselectedItemColor: Colors.grey.withOpacity(0.75),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 25,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: 25,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25,
            ),
            title: Text(''),
          ),
        ],
      ),
    );
  }
}
