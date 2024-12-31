import 'package:flutter/material.dart';
import 'package:makemeover/view/LoginPage.dart';
import 'package:makemeover/view/ServiceFile.dart';
import 'package:makemeover/view/artistCard.dart';

import 'package:makemeover/view/serviceCard.dart';
import 'package:makemeover/view/whisList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showPopup();
    });
  }

  void _showPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hi There!'),
          content: const Padding(
            padding: EdgeInsets.only(left: 52, top: 35),
            child: Text(
              'Pick Your Choice',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

 

  @override
  Widget build(BuildContext context) {
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
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Color.fromARGB(255, 107, 73, 61),
                  ),
                  iconSize: 45,
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
                          builder: (context) => const Loginpage()),
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
                )
              ],
            ),
            divider(
              boxHeight: 20,
            ),
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
                          child: IconButton(
                              icon: const Icon(Icons.search), onPressed: () {}
                              //   showSearch(
                              //       context: context,

                              // },
                              ),
                        ),
                        labelText: 'Find your best artist..',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                divider(
                  boxWidth: 10,
                ),
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
                )
              ],
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

              //Artist Card
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: IntrinsicWidth(
                  child: Row(
                    children: [
                      const Artistcard(
                          img: 'assets/beauty_1.jpg',
                          title: 'Anna Teresa',
                          subtitle: 'Beauty Artist',
                          price: '27\$',),
                      divider(boxWidth: 10),
                      const Artistcard(
                          img: 'assets/beauty_1.jpg',
                          title: 'Stephy',
                          subtitle: 'Beauty Artist',
                          price: '27\$'),
                      divider(boxWidth: 10),
                      const Artistcard(
                          img: "assets/beauty 2.jpg",
                          title: "Stella",
                          subtitle: 'Beauty Artist',
                          price: '27\$'),
                    ],
                  ),
                ),
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
