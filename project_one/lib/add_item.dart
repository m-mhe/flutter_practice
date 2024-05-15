import 'package:flutter/material.dart';

class AddItem extends StatelessWidget {
  final GlobalKey<FormState> _keyOfForm = GlobalKey<FormState>();
  final TextEditingController _tECProductName = TextEditingController();
  final TextEditingController _tECProductColor = TextEditingController();
  final TextEditingController _tECProductImageLocation =
      TextEditingController();

  AddItem({super.key});

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
              const Divider(),
              _productNameTextField(context),
              const Divider(),
              __productColorTextField(context),
              const Divider(),
              _productImageLocationTextField(context),
              const Divider(),
              _addButton(context),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _addButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_keyOfForm.currentState!.validate()) {}
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width / 3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: const Text(
        'Add',
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

  SizedBox __productColorTextField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.1,
      child: TextFormField(
        controller: _tECProductColor,
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please Write a product Color:';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            hintText: 'Product Color', labelText: 'Product Color:'),
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
}
