//-------------------------------------------------------------------Import Section-------------------------------------------------------------------
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_one/product_display.dart';

class UpdateItem extends StatefulWidget {
  const UpdateItem(
      {super.key,
      required this.productName,
      required this.productCode,
      required this.productImage,
      required this.productId, required this.productPrice, required this.productQty, required this.productTotalPrice});

  final String productName;
  final String productCode;
  final String productPrice;
  final String productQty;
  final String productTotalPrice;
  final String productImage;
  final String productId;

  @override
  State<UpdateItem> createState() => _UpdateItemState();
}

class _UpdateItemState extends State<UpdateItem> {
  @override
  void initState() {
    _tECProductName.text = widget.productName;
    _tECProductCode.text = widget.productCode;
    _tECUnitPrice.text = widget.productPrice;
    _tECQuantity.text = widget.productQty;
    _tECTotalPrice.text = widget.productTotalPrice;
    _tECProductImageLocation.text = widget.productImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _updateAppBar(),
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
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 1.1,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (v){
                    _tECTotalPrice.text = ((double.tryParse(_tECUnitPrice.text)??0)*(double.tryParse(_tECQuantity.text)??0)).toStringAsFixed(2);
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
              ),
              const Divider(),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 1.1,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (v){
                    _tECTotalPrice.text = ((double.tryParse(_tECUnitPrice.text)??0)*(double.tryParse(_tECQuantity.text)??0)).toStringAsFixed(2);
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
              ),
              const Divider(),
              SizedBox(
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
              ),
              const Divider(),
              _productImageLocationTextField(context),
              _updateButton(context),
            ],
          ),
        ),
      ),
    );
  }

  //-------------------------------------------------------------------Variables-------------------------------------------------------------------
  bool loading = false;

  final GlobalKey<FormState> _keyOfForm = GlobalKey<FormState>();

  final TextEditingController _tECProductName = TextEditingController();

  final TextEditingController _tECProductCode = TextEditingController();

  final TextEditingController _tECUnitPrice = TextEditingController();

  final TextEditingController _tECQuantity = TextEditingController();

  final TextEditingController _tECTotalPrice = TextEditingController();

  final TextEditingController _tECProductImageLocation =
      TextEditingController();

  //-------------------------------------------------------------------Functions-------------------------------------------------------------------
  Future<void> _apiCallForUpdate() async {
    setState(() {
      loading = true;
    });
    Map<String, dynamic> updateThis = {
      "ProductName": _tECProductName.text,
      "ProductCode": _tECProductCode.text,
      "Img": _tECProductImageLocation.text.trim(),
    };
    final String server =
        'https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.productId}';
    final Uri uri = Uri.parse(server);
    Response getResponseFromServer = await post(uri,
        headers: {"content-type": "application/json"},
        body: jsonEncode(updateThis));
    if (getResponseFromServer.statusCode == 200) {
      _tECProductImageLocation.clear();
      _tECProductCode.clear();
      _tECProductName.clear();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const ProductDisplay();
      }), (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Failed!',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
      ));
    }
    setState(() {
      loading = false;
    });
  }

  //-------------------------------------------------------------------Widgets-------------------------------------------------------------------
  Widget _updateButton(BuildContext context) {
    return Visibility(
      visible: loading == false,
      replacement: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
                color: Colors.red,
              )),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: ElevatedButton(
          onPressed: () {
            if (_keyOfForm.currentState!.validate()) {
              _apiCallForUpdate();
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
            'Update',
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

  AppBar _updateAppBar() {
    return AppBar(
      leading: const Icon(Icons.update),
      title: const Text('Update Product'),
    );
  }
}
