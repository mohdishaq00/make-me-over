// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makemeover/Providers.dart';
import 'package:provider/provider.dart';

class Bookingpage extends StatefulWidget {
  const Bookingpage({super.key});

  @override
  State<Bookingpage> createState() => _BookingpageState();
}

class _BookingpageState extends State<Bookingpage> {
  final TextEditingController _textController = TextEditingController();
  String? _selectedService;
  final List<String> _services = [
    'Bridal Makeup',
    'party Makeup',
    'Facial',
    'Modeling Makeup',
    'Manicure',
    'Others'
  ];
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    // Show DatePicker dialog
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'MAKEUP APPOINMENT FORM',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 20,
                ),
              ),
              const Text(
                '_______________________________________________________________________________________________________________________________________________',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 400,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'First name',
                      // hintText: 'Enter your name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Last name',
                      // hintText: 'Enter your name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ]),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'phone',
                        // hintText: 'Enter your name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 70,
                  left: 40,
                ),
                child: Text(
                  'Appoinment Information',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                  '_______________________________________________________________________________________________________________________________________________'),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    child: Stack(
                      children: [
                        // TextField
                        TextField(
                          controller: _textController,
                          decoration: InputDecoration(
                            labelText: 'what makeup you prefer?',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                          ),
                          cursorColor: Colors.black,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            width: double
                                .infinity, // Make the dropdown full width of the TextField
                            child: PopupMenuButton<String>(
                              icon: Container(),
                              onSelected: (String value) {
                                setState(() {
                                  _selectedService = value;
                                  _textController.text = value;
                                });
                              },
                              itemBuilder: (BuildContext context) {
                                return _services.map((String service) {
                                  return PopupMenuItem<String>(
                                    value: service,
                                    child: Text(service),
                                  );
                                }).toList();
                              },
                              constraints: const BoxConstraints(
                                minWidth:
                                    400.0, // Set the width of the dropdown to match TextField
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Venue',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    child: Consumer<Datepicker>(builder: (
                      context,
                      datePicker,
                      child,
                    ) {
                      return TextField(
                        controller: _dateController,
                        readOnly:
                            true, // Make TextField read-only to prevent manual input
                        decoration: InputDecoration(
                          labelText: 'Select Date',
                          hintText: 'DD-MM-YYYY',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                          ),
                        ),
                        cursorColor: Colors.black,
                        onTap: () {
                          datePicker.selectedDate = datePicker.selectedDate;
                        },
                      );
                    }),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 400,
                    child: Consumer<TimeProvider>(
                        builder: (context, timeProvider, child) {
                      return TextField(
                        controller: timeProvider.timeController,
                        decoration: InputDecoration(
                          labelText: 'Time',
                          hintText: 'hh:mm,',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                          ),
                        ),
                        cursorColor: Colors.black,
                        onTap: () {
                          timeProvider.selectTime(context);
                        },
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 900,
                child: TextFormField(
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    // labelText: 'Requirement',
                    hintText: 'Type your personal requirements here...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black)),
                  ),
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    print("User input: $value");
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 770),
                child: Text(
                  'Payment',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 380),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Border radius
                      ),
                      side: BorderSide(
                          color: Colors.black,
                          width: 1.0), // Border color and width
                      elevation: 2, // Elevation (you can adjust as needed)
                    ),
                    onPressed: () {
                      // Show the dialog when the button is pressed
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Dialog Title'),
                            content: Text('This is the content of the dialog.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center content vertically
                        children: [
                          Icon(
                            Icons.credit_card,
                            color: Colors.blue[400],
                            size: 30,
                          ),
                          SizedBox(
                              height:
                                  5), // Optional, adds spacing between icon and text
                          Text(
                            'Card',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Border radius
                        side: BorderSide(
                            color: Colors.black,
                            width: 1.0), // Border color and width
                      ),
                      fixedSize: Size(120, 70), // Set width and height
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Dialog Title'),
                            content: Text('This is the content of the dialog.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child:
                              Image.asset('assets/googlepay.png'), // Your image
                        ),
                        Text(
                          'Google Pay',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      // foregroundColor: ,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Border radius
                      ),
                      side: BorderSide(
                        color: Colors.black, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Dialog Title'),
                            content: Text('This is the content of the dialog.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center the content
                        children: [
                          Icon(
                            Icons.account_balance_outlined,
                            size: 30,
                            color: Colors.black, // Icon color
                          ),
                          SizedBox(height: 5), // Space between icon and text
                          Text(
                            'Bank transfer',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Text color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Your booking is confirmed!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(400, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.brown,
                ),
                child: Text(
                  'Booking confirmed',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
