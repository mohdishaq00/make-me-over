import 'package:flutter/material.dart';
import 'package:makemeover/artistCard.dart';
import 'package:makemeover/serviceCard.dart';
// import 'package:makemeover/new.dart';
// import 'package:makemeover/widgets/artistCard.dart';
// import './widgets/serviceCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        toolbarHeight: 170,
        backgroundColor: const Color.fromARGB(160, 228, 198, 188),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => NewTask()));
                  },
                  icon: const Icon(
                    Icons.menu,
                  ),
                  iconSize: 45,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Hi There...',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
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
                    backgroundColor: Colors.brown[900],
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
                ),
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
                ),
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
                      SizedBox(width: 10), // Add spacing between cards
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
