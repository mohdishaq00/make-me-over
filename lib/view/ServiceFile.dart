import 'package:flutter/material.dart';

class ServiceArtistList extends StatefulWidget {
  final String title;
  final String description;
  final String txt;
  const ServiceArtistList(
      {super.key,
      required this.title,
      required this.description,
      required this.txt});

  @override
  State<ServiceArtistList> createState() => _ServiceArtistListState();
}

class _ServiceArtistListState extends State<ServiceArtistList> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text(widget.txt),
      ),
      body: const Center(),
    );
  }
}
