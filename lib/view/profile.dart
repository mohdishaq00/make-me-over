// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
// import 'package:makemeover/aboutus.dart';
import 'package:makemeover/bookingpage.dart';
import 'package:makemeover/view/aboutus.dart';
import 'package:makemeover/view/overview.dart';
// import 'package:makemeover/artistCard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

// ignore: camel_case_types
class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _MyWidgetState();
}

// ignore: unused_element
Color _buttonColor = const Color(0xFFFFF8F0);

class _MyWidgetState extends State<profilepage> {
  final String artistPhoneNumber = "+918590408846";
  Future<void> _launchMaps() async {
    double latitude = 10.9786;
    double longitude = 76.2197;

    final url =
        'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude&travelmode=driving';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void redirectToWhatsApp(String phoneNumber) async {
    final String url = "https://wa.me/$phoneNumber";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

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
                          const Padding(
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
                                    'By Anna teressa',
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

              const SizedBox(
                height: 40,
              ),

              SizedBox(
                width: 1000,
                height: 150,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'An artist is a creator, a visionary who transforms emotions, ideas, and experiences into captivating forms of expression. Through their medium—be it painting, sculpture, music, dance, or digital design—an artist connects with the world in profound ways, offering a glimpse into the depths of human creativity. They possess a unique ability to observe beauty in the ordinary and find inspiration in the mundane, turning it into something extraordinary. Artists challenge perceptions, evoke emotions, and spark conversations, leaving an indelible impact on culture and society. Their work transcends boundaries, uniting people through a shared appreciation of imagination and innovation',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _makePhoneCall('9778743278');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange[50],
                      minimumSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
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
                    width: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange[50],
                      minimumSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                    ),
                    onPressed: () => redirectToWhatsApp(artistPhoneNumber),
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
                    width: 40,
                  ),
                  ElevatedButton(
                    onPressed: _launchMaps,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange[50],
                      minimumSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
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
                    width: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Share.share('Check out this cool app!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange[50],
                      minimumSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
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
                            fontWeight: FontWeight.bold,
                          ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutUs()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(78, 52, 46, 1),
                          minimumSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 4,
                        ),
                        child: const Center(
                          child: Text(
                            "About",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(78, 52, 46, 1),
                          minimumSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 4,
                        ),
                        child: const Center(
                          child: Text(
                            "Services",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                       SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () { Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Overview()),
                          );},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(78, 52, 46, 1),
                          minimumSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 4,
                        ),
                        child: const Center(
                          child: Text(
                            "Overview",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: 600,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Bookingpage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(78, 52, 46, 1),
                    minimumSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 3,
                  ),
                  child: const Center(
                    child: Text(
                      "Book now",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
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
