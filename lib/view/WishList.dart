// import 'package:flutter/material.dart';
// import 'package:makemeover/Wishlist_Providers.dart';
// // import 'package:makemeover/providers.dart';
// // import 'package:makemeover/view/wishlist.dart';
// import 'package:provider/provider.dart';

// class WishlistPage extends StatelessWidget {
//   const WishlistPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final wishlistProvider = Provider.of<WishlistProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Wishlist'),
//       ),
//       body: ListView.builder(
//         itemCount: wishlistProvider.Wishlist.length,
//         itemBuilder: (context, index) {
//           final item = wishlistProvider.Wishlist[index];
//           return ListTile(
//             title: Text(item ['title']as String),
//             trailing: IconButton(
//               icon: const Icon(Icons.remove_circle),
//               onPressed: () {
//                 wishlistProvider.removeItem(item as String);
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
