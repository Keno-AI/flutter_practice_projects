import 'package:flutter/material.dart';
import '../providers/product.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = "/editProduct";

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final imageUrlController = TextEditingController();
  final imageUrlFocusNode = FocusNode();
  final form = GlobalKey<FormState>();

  var editedProduct = Product(
    id: null,
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
  );

  var initValues = {
    'title': '',
    'price': '',
    'description': '',
    'imageUrl': ''
  };

  var isInit = true;
  var isLoading = false;

  @override
  void initState() {
    imageUrlFocusNode.addListener(updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    imageUrlFocusNode.removeListener(updateImageUrl);
    // TODO: implement dispose
    imageUrlController.dispose();
    super.dispose();
  }

  void updateImageUrl() {
    if (!imageUrlFocusNode.hasFocus) {
      if (!imageUrlController.text.isEmpty ||
          !imageUrlController.text.startsWith('http') &&
              !imageUrlController.text.startsWith('https') ||
          !imageUrlController.text.endsWith('png') &&
              !imageUrlController.text.endsWith('jpg') &&
              !imageUrlController.text.endsWith('jpeg')) {
        return;
      }
      setState(() {});
    }
  }

  void saveFormData() {
    var isValid = form.currentState.validate();
    if (!isValid) {
      return;
    }
    form.currentState.save();
    setState(() {
      isLoading = true;
    });
    if (editedProduct.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(editedProduct.id, editedProduct);
      Navigator.of(context).pop();
      setState(() {
        isLoading = false;
      });
    } else {
      Provider.of<Products>(context, listen: false)
          .addProduct(editedProduct)
          .catchError((error) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: Text("Some error occured"),
              content: Text("Go fix the error or call devoloper who did this"),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      Navigator.of(ctx).pop();
                    },
                    child: Text("Close"))
              ]),
        );
      }).then((_) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).pop();
      });
    }
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      var productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        initValues = {
          'title': editedProduct.title,
          'description': editedProduct.description,
          'price': editedProduct.price.toString(),
          // 'imageUrl': _editedProduct.imageUrl,
          'imageUrl': '',
        };
        isInit = false;
        imageUrlController.text = editedProduct.imageUrl;
      }
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new product"),
        actions: [
          IconButton(
            onPressed: saveFormData,
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: initValues['title'],
                      decoration: InputDecoration(labelText: "Title"),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter the Title";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        editedProduct = Product(
                            title: value,
                            price: editedProduct.price,
                            description: editedProduct.description,
                            imageUrl: editedProduct.imageUrl,
                            id: editedProduct.id,
                            isFavourite: editedProduct.isFavourite);
                      },
                    ),
                    TextFormField(
                      initialValue: initValues['price'],
                      decoration: InputDecoration(labelText: "Price"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter the Price";
                        }
                        if (double.tryParse(value) == null) {
                          return "Be serious. Put a damn number mate.";
                        }
                        if (double.parse(value) <= 0) {
                          return "For that price even cat would not show his ass. Put a normal price";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        editedProduct = Product(
                            title: editedProduct.title,
                            price: double.parse(value),
                            description: editedProduct.description,
                            imageUrl: editedProduct.imageUrl,
                            id: editedProduct.id,
                            isFavourite: editedProduct.isFavourite);
                      },
                    ),
                    TextFormField(
                      initialValue: initValues['description'],
                      decoration: InputDecoration(labelText: "Description"),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter the Description";
                        }
                        if (value.length < 10) {
                          return "What a lame description. Put some effort";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        editedProduct = Product(
                            title: editedProduct.title,
                            price: editedProduct.price,
                            description: value,
                            imageUrl: editedProduct.imageUrl,
                            id: editedProduct.id,
                            isFavourite: editedProduct.isFavourite);
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.only(top: 8, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                            child: imageUrlController.text.isEmpty
                                ? Text("Enter a URL")
                                : FittedBox(
                                    child: Image.network(
                                      imageUrlController.text,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: "Image URL"),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: imageUrlController,
                            focusNode: imageUrlFocusNode,
                            onFieldSubmitted: (_) {
                              saveFormData();
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter the Image URL";
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return "Put valid http or https address";
                              }
                              // if (!value.endsWith('png') &&
                              //     !value.endsWith('jpg') &&
                              //     !value.endsWith('jpeg')) {
                              //   return "I can only accept images with png,jpg,jpeg extencions";
                              // }
                              return null;
                            },
                            onSaved: (value) {
                              editedProduct = Product(
                                  title: editedProduct.title,
                                  price: editedProduct.price,
                                  description: editedProduct.description,
                                  imageUrl: value,
                                  id: editedProduct.id,
                                  isFavourite: editedProduct.isFavourite);
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
