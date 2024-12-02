import 'package:flutter/material.dart';
import 'package:makemeover/artistCard.dart';
import 'package:makemeover/serviceCard.dart';

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
    final List<Map<String, dynamic>> buttonData = [
      {'title': 'Facial', 'image': const AssetImage('assets/facial.png')},
      {'title': 'Beard', 'image': const AssetImage('assets/beard.png')},
      {'title': 'Waxing', 'image': const AssetImage('assets/wax.png')},
      {'title': 'Threading', 'image': const AssetImage('assets/threading.png')},
      {'title': 'Pedicure', 'image': const AssetImage('assets/pedicure.png')},
      {'title': 'Manicure', 'image': const AssetImage('assets/manicure.png')},
      {'title': 'Haircut', 'image': const AssetImage('assets/hair.png')},
      {'title': 'Haircut', 'image': const AssetImage('assets/hair.png')},
      {'title': 'Haircut', 'image': const AssetImage('assets/hair.png')},
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
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    'assets/me.jpeg',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
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
                    child: const TextField(
                      decoration: InputDecoration(
                        icon: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                        labelText: 'Find your best artist..',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
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
                    'assets/settings.png', height: 45, width: 20,
                    // height: MediaQuery.of(context).size.height * .06,
                    // width: MediaQuery.of(context).size.width * .02,
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
              const SizedBox(
                height: 15,
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
              const SizedBox(
                height: 15,
              ),

              // ServiceCards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: IntrinsicWidth(
                  child: Row(
                    children: buttonData.map((data) {
                      return Servicecard(
                        title: data['title'],
                        image: data['image'],
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const SizedBox(
                height: 15,
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
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: IntrinsicWidth(
                  child: Row(
                    children: [
                      Artistcard(
                          img: 'assets/beauty_1.jpg',
                          title: 'Anna Teresa',
                          subtitle: 'Beauty Artist',
                          price: '27\$'),
                      SizedBox(width: 10),
                      Artistcard(
                          img: 'assets/beauty_1.jpg',
                          title: 'Stephy',
                          subtitle: 'Beauty Artist',
                          price: '27\$'),

                      SizedBox(width: 10), // Add spacing between cards
                      Artistcard(
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
