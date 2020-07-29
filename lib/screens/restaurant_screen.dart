import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/choice.dart';
import '../models/restaurant.dart';
import '../widgets/restaurant_tile.dart';
import './popular_items_screen.dart';

class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantPage(this.restaurant);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with SingleTickerProviderStateMixin {
  List<Choice> choices = [
    Choice(id: '1', title: 'Popular Items'),
    Choice(id: '2', title: 'Kids Meal'),
    Choice(id: '3', title: 'Family Meal'),
  ];

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
              size: 18,
            ),
            Text(
              '120 Beech Ave.',
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                wordSpacing: 2,
                color: Colors.black,
              ),
            ),
          ],
        )),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              size: 25,
              color: Colors.black,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
      
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('Go to cart'),
        backgroundColor: hexToColor('#5A1A0D'),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 15,
            ),
            child: RestaurantTile(widget.restaurant),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 20,
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: hexToColor('#5A1A0D'),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: hexToColor('#5A1A0D'),
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs: [
                ...choices.map(
                  (choice) => Tab(
                    child: Text(
                      choice.title,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height / 2,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                PopularItemsScreen(),
                PopularItemsScreen(),
                PopularItemsScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
