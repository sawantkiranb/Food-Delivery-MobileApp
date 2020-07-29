import 'package:flutter/material.dart';
import '../widgets/menu_item_tile.dart';
import '../models/menu_item.dart';

class PopularItemsScreen extends StatefulWidget {
  @override
  _PopularItemsScreenState createState() => _PopularItemsScreenState();
}

class _PopularItemsScreenState extends State<PopularItemsScreen> {
  final List<MenuItem> menuList = [
    MenuItem(
      id: '1',
      title: 'Chicken Lettuce Wrap',
      amount: 20,
      imageUrl: 'assets/images/wrap.jpg',
    ),
    MenuItem(
      id: '2',
      title: 'Mini burger',
      amount: 20,
      imageUrl: 'assets/images/mini.jpg',
    ),
    MenuItem(
      id: '3',
      title: 'Freki Burger',
      amount: 30,
      imageUrl: 'assets/images/freki.jpg',
    ),
    MenuItem(
      id: '4',
      title: 'Chicken Showrma',
      amount: 25,
      imageUrl: 'assets/images/shawarma.jpg',
    ),
    MenuItem(
      id: '5',
      title: 'Chicken Meat Dish',
      amount: 15,
      imageUrl: 'assets/images/meat.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: menuList.length,
        itemBuilder: (ctx, i) {
          return MenuItemTile(
            title: menuList[i].title,
            amount: menuList[i].amount,
            imageUrl: menuList[i].imageUrl,
          );
        },
      ),
    );
  }
}
