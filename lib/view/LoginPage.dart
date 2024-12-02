import 'package:flutter/material.dart';
import 'package:makemeover/view/home.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _passwordController = TextEditingController();
  // ignore: non_constant_identifier_names
  bool bool_obscureText = true;
  @override
  Widget build(BuildContext context) {
    // Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 247, 214, 198),
      body: Stack(
        children: [
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(

          //    const Color.fromARGB(224, 66, 49, 43), // Ends with brownish color
          //   ),
          // ),

          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                color: Colors.brown,
                child: Image.asset(
                  "assets/makeup.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(222, 109, 60, 42),
                        Color.fromARGB(255, 29, 13, 6)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ]),
              ),
            ]),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Let\'s get your Login!',
                  style: TextStyle(
                    fontFamily: 'jaro',
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 500, width: 400,
                  //  height: MediaQuery.of(context).size.height * 0.7,
                  //   width: MediaQuery.of(context).size.width * 0.5,
                  // constraints: BoxConstraints(
                  //     maxHeight: 600, maxWidth: 500, minHeight: 500, minWidth: 300),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    heightFactor: 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            cursorColor: Colors.brown,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Email ID",
                              labelStyle: TextStyle(
                                color: Colors.brown[800],
                              ),
                              hintText: 'Enter here',
                              hintStyle: const TextStyle(
                                color: Colors.brown,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.brown), // Color when enabled
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.brown), // Color when focused
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black), // Color when error
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              cursorColor: Colors.brown,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    color: Colors.brown[800],
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Colors.brown), // Color when enabled
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Colors.brown), // Color when focused
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Colors.black), // Color when error
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      true
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        // _obscureText = !_obscureText; // Toggle the visibility
                                      });
                                    },
                                  ))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: TextButton(
                                  onPressed: () {},
                                  // print('Forgot password button pressed');

                                  child: const Text(
                                    "forgot password?",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 25, 22),
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ],
                        ),
                        // const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(180.0, 45.0),
                              backgroundColor:
                                  const Color.fromRGBO(78, 52, 46, 1),
                              shape: const StadiumBorder()),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        // const SizedBox(height: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'Don\'t have an account?',
                                      style: TextStyle(color: Colors.brown),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Register Now",
                                        style: TextStyle(
                                            color: Colors.brown[900],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ]),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 1.0,
                                    color: Colors.brown,
                                    // endIndent: 10.0,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    " Or login with",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: Colors.brown,
                                  // indent: 20.0,
                                  // endIndent: 20.0,
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 1.0,
                                    color: Colors
                                        .brown, // Adjust the color as needed
                                    // indent: 10.0, // Space after the text
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Image.asset(
                                    'assets/logo g.webp',
                                    height: 27,
                                    width: 30,
                                  ),
                                  onPressed: () {},
                                  color: Colors.white,
                                  // child:  Center(
                                  //   child: Image.asset(''),
                                  // ),
                                ),
                                IconButton(
                                  icon: Image.asset(
                                    'assets/fb logo.webp',
                                    height: 27,
                                    width: 30,
                                  ),
                                  color: Colors.white,
                                  onPressed: () {},
                                  // child:  Center(
                                  //   child: Image.asset('assets/fb logo.webp'),
                                  // ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
