import 'package:flutter/material.dart';
import 'package:project_one/add_item.dart';
import 'package:project_one/update_items.dart';

class ProductDisplay extends StatefulWidget {
  const ProductDisplay({super.key});

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  final Map<String, String> productInfo = {
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
  };

  final List<String> colorOfItems = [
    'lite Silver',
    'blackK',
    'Milky white',
    'purple',
    'Dark Black',
    'Dark White',
    'Dark grey',
    'Dark orange',
    'Dark blue',
    'Dark green',
    'Dark sky',
    'Dark space',
    'Dark lemon',
    'Dark green',
    'Dark red',
    'ultra Black',
    'lite Black',
    'Dark space',
    'Dark lemon',
    'Dark green',
    'Dark red',
    'ultra Black',
    'lite Black',
    'Dark space',
    'Dark lemon',
    'Dark green',
    'Dark red',
    'ultra Black',
    'lite Black',
    'Dark space',
    'Dark lemon',
    'Dark green',
    'Dark red',
    'ultra Black',
    'lite Black',
    'Dark space',
    'Dark lemon',
    'Dark green',
    'Dark red',
    'ultra Black',
    'lite Black',
    'Dark space',
    'Dark lemon',
    'Dark green',
    'Dark red',
    'ultra Black',
    'lite Black',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _productDisplayAppBar(),
      body: _productList(),
      floatingActionButton: _addFloatingActionButton(context),
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
                return AddItem();
              },
            ),
          );
        },
        icon: const Icon(Icons.add),
      ),
    );
  }

  ListView _productList() {
    return ListView.separated(
        itemBuilder: (context, i) {
          return ListTile(
              leading: Image.asset(
                productInfo.values.toList()[i],
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                productInfo.keys.toList()[i],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Price: ${999 * (i + 1) - 100 - 20 * i * i - i * 20 + i}\$ Color: ${colorOfItems[i].toUpperCase()}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Wrap(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete_forever_outlined)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UpdateItem();
                        }));
                      },
                      icon: const Icon(Icons.edit_outlined))
                ],
              ));
        },
        separatorBuilder: (context, i) {
          return const Divider();
        },
        itemCount: productInfo.length);
  }

  AppBar _productDisplayAppBar() {
    return AppBar(
      titleSpacing: 0,
      leading: const Icon(Icons.policy_rounded),
      title: const Text('Product Display'),
    );
  }
}
