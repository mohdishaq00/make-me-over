// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

    if (selectedDate != null && selectedDate != DateTime.now()) {
      setState(() {
        _dateController.text =
            DateFormat('EEEE, dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  final TextEditingController _timeController = TextEditingController();
  Future<void> _selectTime(BuildContext context) async {
    // Show TimePicker dialog
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    // If a time is selected, update the TextField with the formatted time
    if (selectedTime != null) {
      setState(() {
        // Format the time as HH:mm (24-hour format) or hh:mm a (12-hour format)
        _timeController.text = selectedTime.format(
            context); // Automatically formats as hh:mm a (12-hour format)
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[350],
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
                    child: TextField(
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
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      controller: _timeController,
                      decoration: InputDecoration(
                        labelText: 'Time',
                        hintText: 'hh:mm,',
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
                      onTap: () {
                        _selectTime(context);
                      },
                    ),
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
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your action here
                  print("Button pressed");
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child:  Text('Click Me'),
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
