// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
// import 'package:makemeover/artistCard.dart';

// ignore: camel_case_types
class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _MyWidgetState();
}

Color _buttonColor = const Color(0xFFFFF8F0);

class _MyWidgetState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 3,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 247, 235, 233),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 100, left: 20),
                            ),
                            Container(
                              height: 400,
                              width: 330,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 247, 235, 233),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/image.png',
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(
                                      top: 180,
                                    )),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber[600],
                                        ),
                                        const Text('4.5')
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      'Facial Artist',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      'By Amber Heard',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      '\$67/hour',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 250,
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10, left: 10),
                                    child: Text(
                                      'My Works',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Row(children: [
                                    pictureCard(
                                        img: 'assets/mkeup.png',
                                        Height: 200,
                                        Width: 200),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    pictureCard(
                                        img: 'assets/mkeup.png',
                                        Height: 200,
                                        Width: 200),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    pictureCard(
                                        img: 'assets/mkeup.png',
                                        Height: 200,
                                        Width: 200),
                                  ]),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      top: 10,
                                    ),
                                  ),
                                  Row(children: [
                                    pictureCard(
                                        img: 'assets/mkeup.png',
                                        Height: 200,
                                        Width: 200),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    pictureCard(
                                        img: 'assets/mkeup.png',
                                        Height: 200,
                                        Width: 200),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    pictureCard(
                                        img: 'assets/mkeup.png',
                                        Height: 200,
                                        Width: 200),
                                  ]),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      top: 10,
                                    ),
                                  ),
                                  Row(children: [
                                    pictureCard(
                                        img: 'assets/mkeup.png',
                                        Height: 200,
                                        Width: 200),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    pictureCard(
                                        img: 'assets/mkeup.png',
                                        Height: 200,
                                        Width: 200),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    pictureCard(
                                        img: 'assets/mkeup.png',
                                        Height: 200,
                                        Width: 200),
                                  ]),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      top: 10,
                                    ),
                                  ),
                                  Row(children: [
                                    pictureCard(
                                        img: 'assets/mkeup.png',
                                        Height: 200,
                                        Width: 200),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    pictureCard(
                                        img: 'assets/mkeup.png',
                                        Height: 200,
                                        Width: 200),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    pictureCard(
                                        img: 'assets/mkeup.png',
                                        Height: 200,
                                        Width: 200),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     top: 30,
                //   ),
                // child:
                const SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // print("Button Pressed");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange[50], // Background color
                        minimumSize: const Size(100, 100), // Width and Height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Optional: rounded corners
                        ),
                        elevation: 4, // Shadow effect
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.call,
                            size: 30,
                            color: Color.fromRGBO(78, 52, 46, 1),
                          ),
                          Text(
                            "Call",
                            style: TextStyle(
                                color: Color.fromRGBO(78, 52, 46, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // print("Button Pressed");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange[50], // Background color
                        minimumSize: const Size(100, 100), // Width and Height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Optional: rounded corners
                        ),
                        elevation: 4, // Shadow effect
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.message,
                            size: 30,
                            color: Color.fromRGBO(78, 52, 46, 1),
                          ),
                          Text(
                            "Message",
                            style: TextStyle(
                                color: Color.fromRGBO(78, 52, 46, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // print("Button Pressed");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange[50], // Background color
                        minimumSize: const Size(100, 100), // Width and Height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Optional: rounded corners
                        ),
                        elevation: 4, // Shadow effect
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_sharp,
                            size: 30,
                            color: Color.fromRGBO(78, 52, 46, 1),
                          ),
                          Text(
                            "Direction",
                            style: TextStyle(
                                color: Color.fromRGBO(78, 52, 46, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // print("Button Pressed");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange[50],// Background color
                        minimumSize: const Size(100, 100), // Width and Height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Optional: rounded corners
                        ),
                        elevation: 4, // Shadow effect
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share,
                            size: 30,
                            color: Color.fromRGBO(78, 52, 46, 1),
                          ),
                          Text(
                            "Share",
                            style: TextStyle(
                                color: Color.fromRGBO(78, 52, 46, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // print("Button Pressed");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Background color
                            minimumSize:
                                const Size(200, 50), // Width and Height
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Optional: rounded corners
                            ),
                            elevation: 4, // Shadow effect
                          ),
                          child: const Center(
                            child: Text(
                              "About",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18), // Text style
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // print("Button Pressed");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Background color
                            minimumSize:
                                const Size(200, 50), // Width and Height
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Optional: rounded corners
                            ),
                            elevation: 4, // Shadow effect
                          ),
                          child: const Center(
                            child: Text(
                              "Services",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18), // Text style
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // print("Button Pressed");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Background color
                            minimumSize:
                                const Size(200, 50), // Width and Height
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Optional: rounded corners
                            ),
                            elevation: 4, // Shadow effect
                          ),
                          child: const Center(
                            child: Text(
                              "Overview",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18), // Text style
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget pictureCard({
  required String img,
  required double Height,
  required double Width,
}) {
  return Container(
    width: Width,
    height: Height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.amber,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    ),
  );
}
