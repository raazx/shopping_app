import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/screens/user_product_screen.dart';

class EditProdutScreen extends StatefulWidget {
  static const routName = '/edit-product';
  const EditProdutScreen({super.key});

  @override
  State<EditProdutScreen> createState() => _EditProdutScreenState();
}

class _EditProdutScreenState extends State<EditProdutScreen> {
  final _priceFoucsNode = FocusNode();
  final _descrioptionFoucsNode = FocusNode();
  final _imageUrlFoucsNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editProduct = Product(
    id: DateTime.now().toString(),
    title: '',
    description: '',
    price: 0.0,
    imageUrl: '',
  );
  Product? existProduct;
  bool _isIniti = true;
  bool _isEdit = false;

  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };

  @override
  void initState() {
    _imageUrlFoucsNode.addListener(_updateImageUrl);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isIniti) {
      Product? existProduct =
          ModalRoute.of(context)!.settings.arguments as Product;
      if (existProduct.title.isNotEmpty) {
        _isEdit = true;
        _editProduct = existProduct;
        _initValues = {
          'title': existProduct.title,
          'description': existProduct.description,
          'price': existProduct.price.toString(),
          'imageUrl': 'existProduct.imageUrl',
        };
        _imageUrlController.text = existProduct.imageUrl;
      }
      _isIniti = false;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _priceFoucsNode.dispose();
    _descrioptionFoucsNode.dispose();
    _imageUrlFoucsNode.dispose();
    _imageUrlController.dispose();

    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFoucsNode.hasPrimaryFocus) {
      setState(() {
        _imageUrlController.text;
      }); // rebuild the widget to show keyboard
    }
  }

  void _saveform() {
    final isValed = _form.currentState!.validate();
    if (!isValed) {
      return;
    }
    _form.currentState!.save();
    if (_isEdit) {
      Provider.of<Prodcuts>(context, listen: false).updateProduct(_editProduct);
    } else {
      Provider.of<Prodcuts>(context, listen: false).addProduct(_editProduct);
    }
    Navigator.popAndPushNamed(context, UserProductScreen.routName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [
          IconButton(
            onPressed: () {
              _saveform();
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Form(
          key: _form,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            children: [
              TextFormField(
                autocorrect: true,
                decoration: const InputDecoration(
                    labelText: 'Title',
                    errorStyle: TextStyle(color: Colors.red)),
                textInputAction: TextInputAction.next,
                initialValue: _initValues['title'],
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFoucsNode);
                },
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return "Please enter a valid Title";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _editProduct = Product(
                      id: _editProduct.id,
                      title: newValue!,
                      description: _editProduct.description,
                      price: _editProduct.price,
                      imageUrl: _editProduct.imageUrl);
                },
              ),
              TextFormField(
                autocorrect: true,
                decoration: const InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFoucsNode,
                initialValue: _initValues['price'],
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descrioptionFoucsNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a valid price";
                  }
                  if (double.tryParse(value) == null) {
                    return "Please enter a valid number";
                  }
                  if (double.parse(value) <= 0) {
                    return "Please enter a number greater than Zero.";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _editProduct = Product(
                      id: _editProduct.id,
                      title: _editProduct.title,
                      description: _editProduct.description,
                      price: double.parse(newValue!),
                      imageUrl: _editProduct.imageUrl);
                },
              ),
              TextFormField(
                autocorrect: true,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descrioptionFoucsNode,
                initialValue: _initValues['description'],
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return "Please enter a valid Description";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _editProduct = Product(
                      id: _editProduct.id,
                      title: _editProduct.title,
                      description: newValue!,
                      price: _editProduct.price,
                      imageUrl: _editProduct.imageUrl);
                },
              ),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Container(
                      alignment: Alignment.center,
                      child: _imageUrlController.text.isEmpty
                          ? const Text('Enter a Url')
                          : FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(_imageUrlController.text),
                            ),
                    ),
                  ),
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(labelText: 'ImageUrl'),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    controller: _imageUrlController,
                    focusNode: _imageUrlFoucsNode,
                    // initialValue: _initValues['imageUrl'],
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 3) {
                        return "Please enter a valid imageUrl";
                      }
                      // if (value.startsWith('http') &&
                      //     value.startsWith('https')) {
                      //   return "Please enter a valid Url";
                      // }
                      if (!value.endsWith('.png') &&
                          !value.endsWith('.jpg') &&
                          !value.endsWith('.jpeg')) {
                        return "Please enter a valid Url";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _editProduct = Product(
                          id: _editProduct.id,
                          title: _editProduct.title,
                          description: _editProduct.description,
                          price: _editProduct.price,
                          imageUrl: newValue!);
                    },
                    onFieldSubmitted: (value) {
                      _saveform();
                    },
                  ))
                ],
              ),
            ],
          )),
    );
  }
}
