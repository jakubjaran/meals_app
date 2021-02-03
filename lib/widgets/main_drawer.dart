import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawerLink extends StatelessWidget {
  final IconData icon;
  final String title;
  final String routeName;

  MainDrawerLink(this.icon, this.title, this.routeName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
            leading: Icon(icon, color: Colors.black),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(routeName);
            },
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.only(top: 60),
            child: Text(
              'MealsApp',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(color: Colors.black),
            ),
          ),
          MainDrawerLink(
            Icons.restaurant,
            'Meals',
            '/',
          ),
          MainDrawerLink(
            Icons.settings,
            'Filters',
            FiltersScreen.routeName,
          ),
        ],
      ),
    );
  }
}
