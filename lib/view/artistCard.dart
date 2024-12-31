import 'package:flutter/material.dart';
import 'package:makemeover/view/profile.dart';
import 'package:provider/provider.dart';

class Artistcard extends StatefulWidget {
  final String img;
  final String title;
  final String subtitle;
  final String price;
  const Artistcard({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.price,
  });
  @override
  State<Artistcard> createState() => _ArtistcardState();
}

class _ArtistcardState extends State<Artistcard> {
  Added add = Added();
  bool isAddicon = false;
  // var iconState = isAddicon;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const profilepage(),
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
                        child: FloatingActionButton.small(
                          onPressed: () => context.read<Added>().addProduct(),
                          shape: const CircleBorder(),
                          child: Icon(
                            isAddicon
                                ? Icons.bookmark_add_outlined
                                : Icons.bookmark_added,
                          ),
                        ),
                      ),
                    )
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
                      // const SizedBox(
                      //   width: 300,
                      // ),
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

                      Text(
                        widget.subtitle,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38),
                      ),
                      Text(
                        widget.price,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
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

class Added with ChangeNotifier {
  void addProduct() {
    List<String> wishlist = []; // Wishlist to store product names
    var product = Artistcard(
        img: '', title: '', subtitle: '', price: ''); // Example product name
    bool isAddIcon = wishlist.contains(product);

    if (!isAddIcon) {
      wishlist.add(product.toString());
    } else {
      wishlist.remove(product);
    }
    print("Wishlist: $wishlist");
    notifyListeners(); // For debugging purposes
  }
}
