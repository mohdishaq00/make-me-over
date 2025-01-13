import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:makemeover/Providers.dart';
import 'package:makemeover/view/LoginPage.dart';
import 'package:makemeover/view/ServiceFile.dart';
import 'package:makemeover/view/addShop.dart';
import 'package:makemeover/view/artistCard.dart';
import 'WishList.dart';
import 'package:makemeover/view/addShop.dart';
import 'package:makemeover/view/profile.dart';

import 'package:makemeover/view/serviceCard.dart';
import 'package:makemeover/view/whisList.dart';
import 'package:makemeover/viewmodel/authentication.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  var title;
  final String? id;

  HomePage({
    super.key,
    this.title,
    this.id,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late List<DocumentSnapshot> shopsnap;
  HomePage homePage = HomePage();
  final CollectionReference shop =
      FirebaseFirestore.instance.collection('shop');

  String? get id => null;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    var uid = Authentication().CurrentUser?.uid;
    print('yes----------22222-------------$uid');
    final List<Map<String, dynamic>> pageData = [
      {
        "title": "Facial",
        "description": "This is the data for Page 1.",
        "txt": 'Facial Mancers',
        "image": const AssetImage("assets/facial.png"),
      },
      {
        "title": "Bearding",
        "description": "This is the data for Page 2.",
        "txt": 'Bearding Mancers',
        "image": const AssetImage("assets/beard.png"),
      },
      {
        "title": "Waxing",
        "description": "This is the data for Page 3.",
        "txt": 'Waxing Mancers',
        "image": const AssetImage("assets/wax.png"),
      },
      {
        "title": "Threading",
        "description": "This is the data for Page 4.",
        "txt": 'Threading Mancers',
        "image": const AssetImage("assets/threading.png"),
      },
      {
        "title": "Pedicure",
        "description": "This is the data for Page 4.",
        "txt": 'Pedicure Mancers',
        "image": const AssetImage("assets/pedicure.png"),
      },
      {
        "title": "Manicure",
        "description": "This is the data for Page 4.",
        "txt": 'Manicure Mancers',
        "image": const AssetImage("assets/manicure.png"),
      },
      {
        "title": "Haircut",
        "description": "This is the data for Page 4.",
        "txt": 'lHaircut Mancers',
        "image": const AssetImage("assets/hair.png"),
      },
      {
        "title": "Haircut",
        "description": "This is the data for Page 4.",
        "txt": 'Haircut Mancers',
        "image": const AssetImage("assets/hair.png"),
      },
      {
        "title": "Haircut",
        "description": "This is the data for Page 4.",
        "txt": 'Haircut Mancers',
        "image": const AssetImage("assets/hair.png"),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 170,
        backgroundColor: const Color.fromARGB(160, 228, 198, 188),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu,
                          color: Color.fromARGB(255, 107, 73, 61)),
                      iconSize: 30,
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Make Me Over',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'ShortBaby',
                      color: Color.fromARGB(255, 107, 73, 61),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Loginpage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.account_circle_rounded),
                  iconSize: 35,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Whislist(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.bookmark_added),
                  iconSize: 30,
                ),
              ],
            ),
            divider(boxHeight: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .07,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(159, 190, 167, 159),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(Icons.search),
                        ),
                        labelText: 'Find your best artist..',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                divider(boxWidth: 10),
                ElevatedButton(
                  onPressed: () {
                    // Action
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width * .03,
                        MediaQuery.of(context).size.height * .04),
                    backgroundColor: const Color.fromARGB(255, 107, 73, 61),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    'assets/settings.png',
                    height: 45,
                    width: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 107, 73, 61),
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_business_outlined),
              title: const Text('Add your shop'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Addshop(),
                  ),
                ); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Contact us'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      //body starts here
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              divider(
                boxHeight: 15,
              ),
              const Text(
                'Top Services',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Aovel',
                    letterSpacing: 2),
              ),
              divider(
                boxHeight: 15,
              ),

              // ServiceCards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: IntrinsicWidth(
                  child: Row(
                    children: pageData.map((data) {
                      return Servicecard(
                        title: data['title'],
                        // : data['image'],
                        label: '',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ServiceArtistList(
                                title: data['title'],
                                description: data['description'],
                                txt: data['txt'],
                              ),
                            ),
                          );
                        },
                        image: data['image'],
                      );
                    }).toList(),
                  ),
                ),
              ),
              divider(
                boxWidth: 10,
              ),
              divider(
                boxHeight: 15,
              ),
              const Text(
                'Top Artist',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Aovel',
                    letterSpacing: 2),
              ),
              StreamBuilder(
                stream: shop.snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return Center(
                  //     child: CircularProgressIndicator(),
                  //   );
                  // }
                  if (snapshot.hasData) {
                    // final List<DocumentSnapshot> shopsnap = snapshot.data!.docs;
                    // Provider.of<Shopsnap>(context, listen: false)
                    //     .setShopsnap(shopsnap);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          // crossAxisCount: 3,
                          childAspectRatio: 1.553,
                          crossAxisSpacing: 35,
                          mainAxisSpacing: 35,
                        ),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot shopData =
                              snapshot.data.docs[index];
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
                                              builder: (context, iconProvider,
                                                  child) {
                                                // final id = widget.title;
                                                // Define the id variable

                                                return FloatingActionButton
                                                    .small(
                                                  shape: const CircleBorder(),
                                                  child: Icon(
                                                    iconProvider.isAddicon(
                                                            shopData.id)
                                                        ? Icons
                                                            .bookmark_add_outlined
                                                        : Icons.bookmark_added,
                                                  ),
                                                  onPressed: () {
                                                    iconProvider.toggleIcon(
                                                        shopData.id);
                                                    final snackBar = SnackBar(
                                                      content: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        iconProvider.isAddicon(
                                                                shopData.id)
                                                            ? 'This item is removed from wishlist'
                                                            : 'This item is added to wishlist',
                                                        style: TextStyle(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              220, 190, 190),
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                          iconProvider
                                                                  .isAddicon(
                                                                      shopData
                                                                          .id)
                                                              ? Colors.red
                                                              : Colors.green,
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      duration:
                                                          Duration(seconds: 1),
                                                      margin: EdgeInsets.only(
                                                          right: 1250,
                                                          bottom: 20,
                                                          left: 20),
                                                    );
                                                    ScaffoldMessenger.of(
                                                            context)
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
                                      color: const Color.fromARGB(
                                          255, 193, 208, 210),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 3, right: 3),
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
                                              return [
                                                PopupMenuItem(
                                                  onTap: () =>
                                                      Navigator.pushNamed(
                                                    context,
                                                    'updateShop',
                                                    arguments: {
                                                      'Name': shopData['Name'],
                                                      'category':
                                                          shopData['category'],
                                                      'id': shopData.id,
                                                    },
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
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
                        },
                      ),
                    );
                  }

                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget divider({
  double? boxHeight,
  double? boxWidth,
}) {
  return SizedBox(
    height: boxHeight,
    width: boxWidth,
  );
}

class Shopsnap with ChangeNotifier {
  List<DocumentSnapshot> shopsnap = [];
  void setShopsnap(List<DocumentSnapshot> newShopsnap) {
    shopsnap = newShopsnap;
    notifyListeners();
  }
}

class IconProvider with ChangeNotifier {
  final Map<String, bool> addicon = {};
  bool isAddicon(String id) {
    return addicon[id] ?? true;
  }

  void toggleIcon(id) {
    addicon[id] = !(addicon[id] ?? true);
    notifyListeners();
  }
}
