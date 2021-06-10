import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/products.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  static const routeName = '/add-product';

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  //final _priceFocusNode = FocusNode();
  var isRan = false;
  final imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var isLoading = false;
  var _currentProduct = Product(
    id: 'null',
    title: '',
    description: '',
    price: 0.0,
    imageUrl: '',
  );

  var initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };

  @override
  void didChangeDependencies() {
    if (!isRan) {
      final id = ModalRoute.of(context)?.settings.arguments as String;
      if (id != 'add') {
        _currentProduct = Provider.of<Products>(context).getProductById(id);
        initValues = {
          'id': id,
          'title': _currentProduct.title,
          'description': _currentProduct.description,
          'price': _currentProduct.price.toString(),
        };
        imageUrlController.text = _currentProduct.imageUrl;
      }
    }
    isRan = true;
    super.didChangeDependencies();
  }

  Future<void> _saveForm() async {
    final valid = _form.currentState!.validate();
    _form.currentState!.save();
    print(_currentProduct.id);
    setState(() {
      isLoading = true;
    });
    if (!valid) return;
    try {
      if (_currentProduct.id == 'null') {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_currentProduct);
        print('hello');
      } else {
        setState(() {
          isLoading = false;
        });
        Provider.of<Products>(context, listen: false)
            .updateProduct(_currentProduct.id, _currentProduct);
        Navigator.of(context).pop();
      }
    } catch (error) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Error occur!"),
          content: Text("Something went wrong!"),
          actions: [
            FlatButton(
              child: Text("Okay"),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      );
    } finally {
      print(isLoading);
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add product"),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: initValues['title'],
                      decoration: InputDecoration(
                        labelText: 'Enter title:',
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        //FocusScope.of(context).requestFocus(_priceFocusNode);
                        //_saveForm();
                      },
                      validator: (value) {
                        if (value!.isEmpty)
                          return "The field must not be empty!";
                        else
                          return null;
                      },
                      onSaved: (value) {
                        _currentProduct = Product(
                          id: _currentProduct.id,
                          isFavourite: _currentProduct.isFavourite,
                          title: value!,
                          description: _currentProduct.description,
                          price: _currentProduct.price,
                          imageUrl: _currentProduct.imageUrl,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: initValues['price'],
                      decoration: InputDecoration(labelText: 'Enter price:'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        _currentProduct = Product(
                          id: _currentProduct.id,
                          isFavourite: _currentProduct.isFavourite,
                          title: _currentProduct.title,
                          description: _currentProduct.description,
                          price: double.parse(value!),
                          imageUrl: _currentProduct.imageUrl,
                        );
                      },
                      onFieldSubmitted: (_) {
                        //_saveForm();
                      },
                      validator: (value) {
                        if (value!.isEmpty)
                          return "The field must not be empty!";
                        if (double.tryParse(value) == null)
                          return "Please enter number!";
                        if (double.parse(value) <= 0)
                          return "Please enter valid number!";
                        return null;
                      },
                      //focusNode: _priceFocusNode,
                    ),
                    TextFormField(
                      initialValue: initValues['description'],
                      decoration:
                          InputDecoration(labelText: 'Enter description:'),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      onSaved: (value) {
                        _currentProduct = Product(
                          id: _currentProduct.id,
                          isFavourite: _currentProduct.isFavourite,
                          title: _currentProduct.title,
                          description: value!,
                          price: _currentProduct.price,
                          imageUrl: _currentProduct.imageUrl,
                        );
                      },
                      onFieldSubmitted: (_) {
                        //FocusScope.of(context).requestFocus(_priceFocusNode);
                        //_saveForm();
                      },
                      validator: (value) {
                        if (value!.isEmpty)
                          return "The field must not be empty!";
                        if (value.length <= 10)
                          return "The description must be more than 10 characters!";
                        return null;
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          padding: const EdgeInsets.only(top: 5, right: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: FittedBox(
                            child: imageUrlController.text.isEmpty
                                ? Text("Enter URL:")
                                : Image.network(
                                    imageUrlController.text,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: imageUrlController,
                            textInputAction: TextInputAction.done,
                            decoration:
                                InputDecoration(labelText: 'Enter image url:'),
                            keyboardType: TextInputType.url,
                            onFieldSubmitted: (value) {
                              //_saveForm();
                              if ((value.startsWith('http') &&
                                      value.startsWith('https')) ||
                                  (value.endsWith('.jpeg') &&
                                      value.endsWith('.png') &&
                                      value.endsWith('.jpg'))) setState(() {});
                            },
                            onSaved: (value) {
                              _currentProduct = Product(
                                id: _currentProduct.id,
                                isFavourite: _currentProduct.isFavourite,
                                title: _currentProduct.title,
                                description: _currentProduct.description,
                                price: _currentProduct.price,
                                imageUrl: value!,
                              );
                            },
                            validator: (value) {
                              if (value!.isEmpty)
                                return "The field must not be empty!";
                              if (!(value.startsWith('http') &&
                                      value.startsWith('https') ||
                                  !(value.endsWith('.jpeg') &&
                                      value.endsWith('.png') &&
                                      value.endsWith('.jpg'))))
                                return "Please enter valid image url!";
                              return null;
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
