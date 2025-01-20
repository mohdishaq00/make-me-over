import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:makemeover/Providers.dart';
import 'package:makemeover/view/popUp.dart';
import 'package:makemeover/view/profile.dart';
import 'package:makemeover/view/updateShop.dart';
import 'package:provider/provider.dart';

class ShopCard extends StatelessWidget {
  final void Function(String docId) deleteShop;

  final DocumentSnapshot shopData;
  const ShopCard({
    super.key,
    required this.shopData,
    required this.deleteShop,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => profilepage(
              shopId: shopData['Name'],
            ),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 450,
          height: 300,
          color: Colors.white,
          child: Column(
            children: [
              // Top Image Container
              Stack(
                children: [
                  Container(
                    width: 480,
                    height: 220,
                    color: Colors.blueAccent,
                    child: Image.asset(
                      'assets/image.png',
                      // shopData['Img'],
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 430,
                    top: 8,
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Consumer<IconProvider>(
                        builder: (context, iconProvider, child) {
                          // final id = widget.title;
                          // Define the id variable

                          return FloatingActionButton.small(
                            shape: const CircleBorder(),
                            child: Tooltip(
                              message: 'Wishlist',
                              child: Icon(
                                iconProvider.isAddicon(shopData.id)
                                    ? Icons.bookmark_add_outlined
                                    : Icons.bookmark_added,
                              ),
                            ),
                            onPressed: () {
                              iconProvider.toggleIcon(shopData.id);
                              final snackBar = SnackBar(
                                content: Text(
                                  textAlign: TextAlign.center,
                                  iconProvider.isAddicon(shopData.id)
                                      ? 'This item is removed from wishlist'
                                      : 'This item is added to wishlist',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 220, 190, 190),
                                  ),
                                ),
                                backgroundColor:
                                    iconProvider.isAddicon(shopData.id)
                                        ? Colors.red
                                        : Colors.green,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                duration: Duration(seconds: 1),
                                margin: EdgeInsets.only(
                                    right: 1250, bottom: 20, left: 20),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              // Bottom Text Container
              Container(
                width: 480,
                height: 80,
                color: const Color.fromARGB(255, 193, 208, 210),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      shopData['Name'], // title!,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      shopData['category'],
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black38),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       bottom: 3, right: 3),
                        //   child: Image.asset(
                        //     'assets/Star.png',
                        //     height: 18,
                        //     width: 18,
                        //   ),
                        // ),
                        Text(
                          shopData['phone'],
                        ),
                        IconButton(
                          onPressed: () {
                            deleteShop(shopData.id);
                          },
                          icon: Icon(Icons.delete_forever),
                          tooltip: 'Delete',
                        )
                      ],
                    ),
                    PopupMenuButton<dynamic>(
                      style: ButtonStyle(),
                      itemBuilder: (
                        BuildContext context,
                      ) {
                        return [
                          PopupMenuItem(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Updateshop(
                                      name: shopData['Name'],
                                      phone: shopData['phone'],
                                      category: shopData['category'],
                                      id: shopData.id),
                                )
                                // arguments: {
                                //   'Name': shopData['Name'],
                                //   'phone': shopData['phone'],
                                //   'category': shopData['category'],
                                //   'id': shopData.id,
                                // },
                                ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Edit'),
                                Icon(
                                  size: 20,
                                  Icons.edit_outlined,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
