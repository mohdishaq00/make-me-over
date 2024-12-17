import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makemeover/view/home.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  void initState() {
    print('LOGIN PAGE');
    super.initState();
  }

  final TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // ignore: non_constant_identifier_names

  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                  height: 500,
                  width: 400,
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
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: _obsecureText,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      _obsecureText = !_obsecureText;
                                    },
                                  );
                                },
                                child: Icon(
                                  _obsecureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(0, 255, 255, 255),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              hintText: 'Enter the password',
                              labelStyle: TextStyle(
                                color: Colors.brown[800],
                              ),
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
                                builder: (context) => const HomePage(),
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
                                  onPressed: () async {
                                    await signInWithGoogle();
                                  },
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

Future<void> signInWithGoogle({BuildContext? context}) async {
  try {
    // Trigger Google Sign-In flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      // User canceled the login
      return;
    }

    // Obtain the auth details from the Google Sign-In
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a credential for Firebase Authentication
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with the credential
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Get the signed-in user
    final User? user = userCredential.user;

    // Navigate to HomePage or handle as needed
    if (user != null) {
      Navigator.push(
        context!,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  } catch (e) {
    print("Error during Google Sign-In: $e");
    ScaffoldMessenger.of(context!).showSnackBar(
      const SnackBar(content: Text("Google Sign-In failed")),
    );
  }
}
