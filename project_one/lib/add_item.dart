//-------------------------------------------------------------------Import Section-------------------------------------------------------------------
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_one/product_display.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _addItemAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _keyOfForm,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              _productNameTextField(context),
              const Divider(),
              _productCodeTextField(context),
              const Divider(),
              _productPriceTextField(context),
              const Divider(),
              _productQuantityTextField(context),
              const Divider(),
              _productTotalPriceTextField(context),
              const Divider(),
              _productImageLocationTextField(context),
              _addButton(context),
            ],
          ),
        ),
      ),
    );
  }

  //-------------------------------------------------------------------Variables-------------------------------------------------------------------
  final GlobalKey<FormState> _keyOfForm = GlobalKey<FormState>();

  bool _loading = false;

  final TextEditingController _tECProductName = TextEditingController();

  final TextEditingController _tECProductCode = TextEditingController();

  final TextEditingController _tECUnitPrice = TextEditingController();

  final TextEditingController _tECQuantity = TextEditingController();

  final TextEditingController _tECTotalPrice = TextEditingController();

  final TextEditingController _tECProductImageLocation =
      TextEditingController(text: 'https:');

  //-------------------------------------------------------------------Functions-------------------------------------------------------------------
  Future<void> _apiCallAddItem() async {
    setState(() {
      _loading = true;
    });
    final Map<String, dynamic> productInfo = {
      "ProductName": _tECProductName.text,
      "ProductCode": _tECProductCode.text,
      "UnitPrice": _tECUnitPrice.text,
      "Qty": _tECQuantity.text,
      "TotalPrice": _tECTotalPrice.text,
      "Img": _tECProductImageLocation.text.trim(),
    };
    const String server = 'https://crud.teamrabbil.com/api/v1/CreateProduct';
    Uri uri = Uri.parse(server);
    Response getResponseFromServer = await post(
      uri,
      headers: {'content-type': 'application/json'},
      body: jsonEncode(productInfo),
    );
    setState(() {
      _loading = false;
    });
    if (getResponseFromServer.statusCode == 200) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const ProductDisplay();
      }), (route) => false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Added!',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Failed!',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  //-------------------------------------------------------------------Widgets-------------------------------------------------------------------
  SizedBox _productTotalPriceTextField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.1,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _tECTotalPrice,
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return 'Total price:';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            hintText: 'Total price', labelText: 'Total price:'),
      ),
    );
  }

  SizedBox _productQuantityTextField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.1,
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (v) {
          _tECTotalPrice.text = ((double.tryParse(_tECUnitPrice.text) ?? 0) *
                  (double.tryParse(_tECQuantity.text) ?? 0))
              .toStringAsFixed(2);
        },
        controller: _tECQuantity,
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please set a quantity:';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            hintText: 'set a quantity', labelText: 'set a quantity:'),
      ),
    );
  }

  SizedBox _productPriceTextField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.1,
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (v) {
          _tECTotalPrice.text = ((double.tryParse(_tECUnitPrice.text) ?? 0) *
                  (double.tryParse(_tECQuantity.text) ?? 0))
              .toStringAsFixed(2);
        },
        controller: _tECUnitPrice,
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please Write a product price:';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            hintText: 'Product price', labelText: 'Product price:'),
      ),
    );
  }

  Widget _addButton(BuildContext context) {
    return Visibility(
      visible: _loading == false,
      replacement: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(
              backgroundColor: Colors.black,
              color: Colors.red,
            ),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: ElevatedButton(
          onPressed: () {
            if (_keyOfForm.currentState!.validate()) {
              _apiCallAddItem();
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width / 3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const Text(
            'Add',
          ),
        ),
      ),
    );
  }

  SizedBox _productImageLocationTextField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.1,
      child: TextFormField(
        controller: _tECProductImageLocation,
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please Write a product Image Location:';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            hintText: 'Product Image Location',
            labelText: 'Product Image Location:'),
      ),
    );
  }

  SizedBox _productCodeTextField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.1,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _tECProductCode,
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please Write a product Code:';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            hintText: 'Product Code', labelText: 'Product Code:'),
      ),
    );
  }

  SizedBox _productNameTextField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.1,
      child: TextFormField(
        controller: _tECProductName,
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please Write a product name:';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            hintText: 'Product Name', labelText: 'Product Name:'),
      ),
    );
  }

  AppBar _addItemAppBar() {
    return AppBar(
      leading: const Icon(Icons.add_shopping_cart),
      title: const Text('Add Product'),
    );
  }

  @override
  void dispose() {
    _tECUnitPrice.dispose();
    _tECQuantity.dispose();
    _tECTotalPrice.dispose();
    _tECProductName.dispose();
    _tECProductCode.dispose();
    _tECProductImageLocation.dispose();
    super.dispose();
  }
}