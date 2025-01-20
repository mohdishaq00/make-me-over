import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:makemeover/Providers.dart';
import 'package:makemeover/Providers.dart';
import 'package:makemeover/Providers.dart';
import 'package:makemeover/view/home.dart';
import 'package:provider/provider.dart';

import '../Providers.dart';

class Whislist extends StatefulWidget {
  const Whislist({
    super.key,
  });

  @override
  State<Whislist> createState() => _WhislistState();
}

class _WhislistState extends State<Whislist> {
  @override
  void initState() {
    super.initState();
    Provider.of<WishlistProvider>(context, listen: false).fetchCards();
  }

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('whislist'),
            divider(boxWidth: 10),
            const Icon(
              Icons.bookmark_added,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          wishlistProvider.wishlist.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: wishlistProvider.wishlist.length,
                    itemBuilder: (context, index) {
                      final card = wishlistProvider.wishlist[index];
                      return ListTile(
                        title: Text(card['Name']),
                        subtitle: Text(card['phone']),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
