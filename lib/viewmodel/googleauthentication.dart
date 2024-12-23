import 'package:firebase_auth/firebase_auth.dart';

class Googleauthentication{
  GoogleAuthProvider googleProvider = GoogleAuthProvider();

// googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
// googleProvider.setCustomParameters({
//   'login_hint': 'user@example.com'
// });

Future<UserCredential> signInWithGoogle() async {
  // Create a new provider
  GoogleAuthProvider googleProvider = GoogleAuthProvider();

  googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  googleProvider.setCustomParameters({
    'login_hint': 'user@example.com'
  });

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithPopup(googleProvider);

  // Or use signInWithRedirect
  // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
}
  
}