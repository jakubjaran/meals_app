import 'package:flutter/material.dart';

class MainDrawerLink extends StatelessWidget {
  final IconData icon;
  final String title;

  MainDrawerLink({this.icon, this.title});

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
            icon: Icons.restaurant,
            title: 'Meals',
          ),
          MainDrawerLink(
            icon: Icons.settings,
            title: 'Filters',
          ),
        ],
      ),
    );
  }
}
