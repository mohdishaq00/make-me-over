import 'package:flutter/material.dart';

class ServiceArtistList extends StatefulWidget {
  final String title;

  const ServiceArtistList({super.key, required this.title});

  @override
  State<ServiceArtistList> createState() => _ServiceArtistListState();
}

class _ServiceArtistListState extends State<ServiceArtistList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: const Text("Facial Artists"),
      ),
      body: const Center(),
    );
  }
}
