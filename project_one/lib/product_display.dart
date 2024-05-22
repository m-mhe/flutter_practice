//-------------------------------------------------------------------Import Section-------------------------------------------------------------------
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_one/data_model.dart';
import 'package:project_one/add_item.dart';
import 'package:project_one/update_items.dart';

class ProductDisplay extends StatefulWidget {
  const ProductDisplay({super.key});

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiCallShow();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _productDisplayAppBar(),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.red,
        onRefresh: _apiCallShow,
        child: Visibility(
            visible: _loading == false,
            replacement: const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                backgroundColor: Colors.black,
              ),
            ),
            child: _productList()),
      ),
      floatingActionButton: _addFloatingActionButton(context),
    );
  }

//------------------------------------------------------------------------Variables------------------------------------------------------------------------

  bool _loading = true;

  final List<Product> _productListVariable = [];

  //Default images is being used, because of invalid image link (from api).
  final Map<String, String> _productInfo = {
    'Lenovo Laptop': 'image/o.jpg',
    'Apple Watch': 'image/t.jpg',
    'Iphone': 'image/th.jpg',
    'TU-PR Perfume': 'image/f.jpg',
    'SLR Camera': 'image/fi.jpg',
    'Mac Book PRO': 'image/6.jpg',
    'HE Keyboard': 'image/7.jpg',
    'Apple PC': 'image/8.jpg',
    'Apple PC PRO': 'image/9.jpg',
    'RTX 4090': 'image/10.jpg',
    'Audio Soft': 'image/11.jpg',
    'HE Phone': 'image/12.jpg',
    'FS VPN Year plan': 'image/13.jpg',
    'Mercedes-Benz': 'image/14.jpg',
    'Ferrari': 'image/15.jpg',
    'Black Hype': 'image/16.jpg',
    'Power Blast': 'image/17.jpg',
    'Mac Book PRO ': 'image/6.jpg',
    'HE Keyboard ': 'image/7.jpg',
    'Apple PC ': 'image/8.jpg',
    'Lenovo Laptop ': 'image/o.jpg',
    'Apple Watch ': 'image/t.jpg',
    'Iphone ': 'image/th.jpg',
    'TU-PR Perfume ': 'image/f.jpg',
    'SLR Camera ': 'image/fi.jpg',
    'Mac PRO ': 'image/6.jpg',
    'Keyboard ': 'image/7.jpg',
    'Apple Computer': 'image/8.jpg',
    'Apple PC PRO ': 'image/9.jpg',
    'RTX 4090 ': 'image/10.jpg',
    'Audio Soft ': 'image/11.jpg',
    'HE Phone ': 'image/12.jpg',
    'FS VPN Year plan ': 'image/13.jpg',
    'Mercedes-Benz ': 'image/14.jpg',
    'Ferrari ': 'image/15.jpg',
    'Black Hype ': 'image/16.jpg',
    'PC': 'image/9.jpg',
    'Laptop ': 'image/o.jpg',
    'Watch ': 'image/t.jpg',
    'Iphone PRO': 'image/th.jpg',
    '1': 'image/6.jpg',
    '2': 'image/6.jpg',
    '3': 'image/6.jpg',
    '4': 'image/6.jpg',
    '5': 'image/6.jpg',
    '6': 'image/6.jpg',
    '7': 'image/6.jpg',
    '8': 'image/6.jpg',
    '9': 'image/6.jpg',
    '10': 'image/6.jpg',
    '11': 'image/6.jpg',
    '12': 'image/6.jpg',
    '13': 'image/6.jpg',
    '14': 'image/6.jpg',
    '15': 'image/6.jpg',
    '16': 'image/6.jpg',
    '17': 'image/6.jpg',
    '18': 'image/6.jpg',
    '19': 'image/6.jpg',
    '20': 'image/6.jpg',
  };

  //------------------------------------------------------------------------Functions------------------------------------------------------------------------

  Future<void> _apiCallShow() async {
    setState(() {
      _loading = true;
    });
    _productListVariable.clear();
    //step 1: set url
    const productServer = 'https://crud.teamrabbil.com/api/v1/ReadProduct';
    //parse in Uri
    Uri uri = Uri.parse(productServer);
    //step 2: wait for response
    Response getResponseFromServer = await get(uri);
    //step 3: decode data
    final serverData = jsonDecode(getResponseFromServer.body);
    //Step 4: use that data
    final listOfProducts = serverData["data"];
    if (getResponseFromServer.statusCode == 200) {
      for (Map<String, dynamic> i in listOfProducts) {
        Product finalProduct = Product.fromJson(i);
        _productListVariable.add(finalProduct);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'You are connected!',
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error: Check your internet connection!'),
        backgroundColor: Colors.red,
      ));
    }
    setState(() {
      _loading = false;
    });
  }

  void _update(int i) {
    String iD = _productListVariable[i].id.toString();
    String name = _productListVariable[i].productName.toString();
    String code = _productListVariable[i].productCode.toString();
    String price = _productListVariable[i].unitPrice.toString();
    String qty = _productListVariable[i].quantity.toString();
    String totalPrice = _productListVariable[i].totalPrice.toString();
    String img = 'https:';
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return UpdateItem(
        productName: name,
        productCode: code,
        productImage: img,
        productId: iD, productPrice: price, productQty: qty, productTotalPrice: totalPrice,
      );
    }));
  }

  Future<void> _apiCallDelete(String id) async {
    final productServer =
        'https://crud.teamrabbil.com/api/v1/DeleteProduct/$id';
    Uri uri = Uri.parse(productServer);
    Response getResponseFromServer = await get(uri);
    if (getResponseFromServer.statusCode == 200) {
      _apiCallShow();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Success!',
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

  //------------------------------------------------------------------------Widgets------------------------------------------------------------------------

  ListView _productList() {
    return ListView.separated(
        itemBuilder: (context, i) {
          return ListTile(
              leading: Image.asset(
                (_productInfo.values.toList()[i]),
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                (_productListVariable[i].productName) ?? 'Unknown',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Price: ${(_productListVariable[i].unitPrice) ?? 'Unknown'}, Quantity: ${(_productListVariable[i].quantity) ?? "Unknown"}, Total Price: ${(_productListVariable[i].totalPrice) ?? "Unknown"}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Wrap(
                children: [
                  IconButton(
                      onPressed: () {
                        _apiCallDelete((_productListVariable[i].id) ?? '');
                      },
                      icon: const Icon(Icons.delete_forever_outlined)),
                  IconButton(
                      onPressed: () {
                        _update(i);
                      },
                      icon: const Icon(Icons.edit_outlined))
                ],
              ));
        },
        separatorBuilder: (context, i) {
          return const Divider();
        },
        itemCount: _productListVariable.length);
  }

  AppBar _productDisplayAppBar() {
    return AppBar(
      titleSpacing: 0,
      leading: const Icon(Icons.policy_rounded),
      title: const Text('Product Display'),
    );
  }

  FloatingActionButton _addFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddItem();
              },
            ),
          );
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
