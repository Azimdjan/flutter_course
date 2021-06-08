import 'package:flutter/material.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/screens/products_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Hello My friend!"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/');
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Orders"),
            onTap: (){
              Navigator.pushReplacementNamed(context, OrdersScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Products"),
            onTap: (){
              Navigator.pushReplacementNamed(context, ProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
