import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    //final cart = Provider.of(context,listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.pushNamed(
              context,
              ProductDetail.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            leading: Consumer<Product>(
              builder: (ctx, currentProduct, _) => IconButton(
                onPressed: () async {
                  currentProduct.toggleFavorite();
                  print(currentProduct.isFavourite);
                  await Provider.of<Products>(ctx,listen: false)
                      .updateFavorite(currentProduct.id, currentProduct.isFavourite);
                },
                icon: Icon(
                  currentProduct.isFavourite ? Icons.favorite : Icons.favorite_border,
                ),
                color: Theme.of(context).accentColor,
              ),
            ),
            trailing: Consumer<Cart>(
              builder: (context, cart, _) => IconButton(
                onPressed: () {
                  cart.addItems(
                      id: product.id,
                      price: product.price,
                      title: product.title);
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Added item to cart!"),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: "Undo",
                        onPressed: () {
                          cart.undoAction(product.id);
                        },
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).accentColor,
                ),
                color: Theme.of(context).accentColor,
              ),
            )),
      ),
    );
  }
}
