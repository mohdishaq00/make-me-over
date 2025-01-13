// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:makemeover/view/home.dart';
import 'package:makemeover/view/profile.dart';
import 'package:makemeover/view/updateShop.dart';
import 'package:provider/provider.dart';
import 'package:makemeover/view/addShop.dart';

class Artistcard extends StatefulWidget {
  final String img;

  final String title;
  final String subtitle;

  final VoidCallback? onAddToWishlist;
  final Map<String, String>? product; // Product data
  final bool? isInWishlist;
  const Artistcard({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
    this.onAddToWishlist,
    this.product,
    this.isInWishlist,
  });
  @override
  State<Artistcard> createState() => _ArtistcardState();
}

class _ArtistcardState extends State<Artistcard> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final shopsnap = Provider.of<Shopsnap>(context).shopsnap;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => profilepage(
                shopId: 'errer',
              ),
            ),
          );
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 2,
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
                      width: 450,
                      height: 220,
                      color: Colors.blueAccent,
                      child: Image.asset(
                        widget.img,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 403,
                      top: 5,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Consumer<IconProvider>(
                          builder: (context, IconProvider, child) {
                            final id = widget.title; // Define the id variable

                            return FloatingActionButton.small(
                              shape: const CircleBorder(),
                              child: Icon(
                                IconProvider.isAddicon(id)
                                    ? Icons.bookmark_add_outlined
                                    : Icons.bookmark_added,
                              ),
                              onPressed: () {
                                IconProvider.toggleIcon(id);
                                final snackBar = SnackBar(
                                  content: Text(
                                    textAlign: TextAlign.center,
                                    IconProvider.isAddicon(id)
                                        ? 'This item is removed from wishlist'
                                        : 'This item is added to wishlist',
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 220, 190, 190),
                                    ),
                                  ),
                                  backgroundColor: IconProvider.isAddicon(id)
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
                  width: 450,
                  height: 80,
                  color: const Color.fromARGB(255, 193, 208, 210),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3, right: 3),
                            child: Image.asset(
                              'assets/Star.png',
                              height: 18,
                              width: 18,
                            ),
                          ),
                          const Text('4.2'),
                        ],
                      ),
                      PopupMenuButton<dynamic>(
                        style: ButtonStyle(),
                        itemBuilder: (
                          BuildContext context,
                        ) {
                          final int index = 0; // Define the index variable
                          final shopData =
                              shopsnap[index].data() as Map<String, dynamic>;
                          return [
                            PopupMenuItem(
                              onTap: () => Navigator.pushNamed(
                                context,
                                'updateShop',
                                arguments: <String, dynamic>{
                                  'Name': shopData['Name'],
                                  // shopData.containsKey('Name')
                                  //     ? shopData['Name']
                                  //     : 'Unknown Artist',
                                  'subtitle': shopData['phone'],
                                  'id': shopData['id'],
                                },
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                      Text(
                        widget.subtitle,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class IconProvider with ChangeNotifier {
//   final Map<String, bool> Addicon = {};
//   bool isAddicon(String id) {
//     return Addicon[id] ?? true;
//   }

//   void toggleIcon(id) {
//     Addicon[id] = !(Addicon[id] ?? true);
//     notifyListeners();
//   }
// }
