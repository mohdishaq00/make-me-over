import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.oswaldTextTheme(),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 40,
              ),
            ),
            const Text(
              'Let U know Us',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                ),
                Container(
                    width: 295,
                    height: 295,
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: Image.asset(
                      'assets/facial123.png',
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    width: 320,
                    height: 330,
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: Image.asset(
                      'assets/makeup123.png',
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    width: 295,
                    height: 295,
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: Image.asset(
                      'assets/hair123.png',
                      fit: BoxFit.cover,
                    )),
              ],
            ),
            // const Padding(
            //   padding: EdgeInsets.only(
            //     top: 20,
            //   ),
            // child:
            //  Text(
            //   'Let U know Us',
            //   style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 23,
            //       fontWeight: FontWeight.bold),
            // ),
            // ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 960,
              height: 150,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      'Allow users to search for makeup artists based on location, style Showcase top-rated or popular makeup artists with their photos,A quick view of how to book a session, including availability, pricing, and any special packages offered by the makeup artists.'),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      'Welcome to [Your Platform Name], the ultimate destination for bridging the gap between talented makeup artists and clients seeking exceptional beauty services.Our platform is designed to empower makeup artists by showcasing their skills while providing clients with a seamless way to find the perfect artist for their needs.'),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
