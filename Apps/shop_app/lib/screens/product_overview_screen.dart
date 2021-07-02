import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/badge.dart';
import 'package:shop_app/widgets/products_grid.dart';

enum Filter {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  static const routeName = '/productOverview';
  ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _isFavorite = false;
  var _isInit = false;
  var _isLoading = true;

  @override
  void didChangeDependencies() {
    if(!_isInit){
      Provider.of<Products>(context).fetchProducts().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Shop App"),
        //automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
            onSelected: (Filter selectedValue) {
              setState(() {
                if (Filter.All == selectedValue)
                  _isFavorite = false;
                else
                  _isFavorite = true;
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Only Favorites"),
                value: Filter.Favorites,
              ),
              PopupMenuItem(
                child: Text("All"),
                value: Filter.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (context,cart,_) => Badge(
              child: IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                icon: Icon(Icons.add_shopping_cart,),
              ),
              value: cart.numberOfCarts.toString(),
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator()) : ProductsGrid(_isFavorite),
    );
  }
}
