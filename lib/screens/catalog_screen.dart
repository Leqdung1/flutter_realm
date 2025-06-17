import 'package:flutter/material.dart';
import 'package:flutter_realm/models/cart_models.dart';
import 'package:flutter_realm/models/catalog_model.dart';
import 'package:flutter_realm/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    final itemsData = CatalogModel().realm.all<Item>();
    final listExpand =
        List.generate(20, (_) => itemsData).expand((x) => x).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Catalog',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            child: Stack(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen()),
                    );
                  },
                ),
                Positioned(
                  right: 8,
                  top: -0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      Provider.of<CartModel>(context).items.length.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item count row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: listExpand.length.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: ' items',
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Catalog List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: listExpand.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = listExpand[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(item.color),
                        radius: 18,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Subtitle',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton.icon(
                        onPressed: () {
                          Provider.of<CartModel>(
                            context,
                            listen: false,
                          ).addItem(item);
                        },
                        icon: const Icon(Icons.add, color: Color(0xFF4F5DFF)),
                        label: const Text(
                          'ADD',
                          style: TextStyle(
                            color: Color(0xFF4F5DFF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          minimumSize: Size(0, 0),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF7F8FA),
    );
  }
}
