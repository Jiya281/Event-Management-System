// // ignore_for_file: prefer_const_constructors, prefer_final_fields, avoid_print

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   String _name = '';
//   String _dob = '';
//   String _gender = '';
//   String _bio = '';
//   File? _image;

//   final picker = ImagePicker();

//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _dobController = TextEditingController();
//   TextEditingController _genderController = TextEditingController();
//   TextEditingController _bioController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _nameController.addListener(() {
//       setState(() {
//         _name = _nameController.text;
//       });
//     });
//     _dobController.addListener(() {
//       setState(() {
//         _dob = _dobController.text;
//       });
//     });
//     _genderController.addListener(() {
//       setState(() {
//         _gender = _genderController.text;
//       });
//     });
//     _bioController.addListener(() {
//       setState(() {
//         _bio = _bioController.text;
//       });
//     });
//   }

//   Future<void> _getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (pickedDate != null) {
//       setState(() {
//         _dob = pickedDate.toString(); // You can format the date as needed
//         _dobController.text = _dob;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(240, 99, 90, 0.999),
//         title: Title(
//             color: Colors.white,
//             child: Center(
//               child: Text(
//                 'Event City',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 28.0,
//                 ),
//               ),
//             )),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   _getImage();
//                 },
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundColor: Colors.grey,
//                   backgroundImage: _image != null ? FileImage(_image!) : null,
//                   child: _image == null
//                       ? Icon(
//                           Icons.camera_alt,
//                           size: 50,
//                           color: Colors.white,
//                         )
//                       : null,
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               TextField(
//                 controller: _dobController,
//                 decoration: InputDecoration(
//                   labelText: 'Date of Birth',
//                   suffixIcon: IconButton(
//                     icon: Icon(Icons.calendar_today),
//                     onPressed: () => _selectDate(context),
//                   ),
//                 ),
//                 readOnly: true,
//               ),
//               SizedBox(height: 20),
//               Row(
//                 children: <Widget>[
//                   Text('Gender:'),
//                   SizedBox(width: 20),
//                   Radio(
//                     value: 'Male',
//                     groupValue: _gender,
//                     onChanged: (value) {
//                       setState(() {
//                         _gender = value as String;
//                       });
//                     },
//                   ),
//                   Text('Male'),
//                   SizedBox(width: 20),
//                   Radio(
//                     value: 'Female',
//                     groupValue: _gender,
//                     onChanged: (value) {
//                       setState(() {
//                         _gender = value as String;
//                       });
//                     },
//                   ),
//                   Text('Female'),
//                 ],
//               ),
//               TextField(
//                 controller: _bioController,
//                 decoration: InputDecoration(labelText: 'Bio'),
//                 maxLines: null,
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // Save profile information
//                   _saveProfile();
//                 },
//                 child: Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _saveProfile() {
//     // Save the profile information, you can store it in a database or wherever needed
//     // For now, just print the information
//     print('Name: $_name');
//     print('Date of Birth: $_dob');
//     print('Gender: $_gender');
//     print('Bio: $_bio');
//     if (_image != null) {
//       print('Profile Picture Path: ${_image!.path}');
//     }
//   }
// }

// ignore_for_file: prefer_final_fields, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _name;
  late String _dob;
  late String _gender;
  late String _bio;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name = '';
    _dob = '';
    _gender = '';
    _bio = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 99, 90, 0.999),
        title: Title(
          color: Colors.white,
          child: Center(
            child: Text(
              'Event City',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Text(
                  _name.isEmpty ? '' : _name[0],
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                key: Key('nameTextField'),
                controller: _nameController..text = _name,
                onChanged: (value) => _name = value,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                key: Key('dobTextField'),
                controller: _dobController..text = _dob,
                onChanged: (value) => _dob = value,
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ),
                readOnly: true,
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Text('Gender:'),
                  SizedBox(width: 20),
                  Radio(
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                  Text('Male'),
                  SizedBox(width: 20),
                  Radio(
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
              TextField(
                key: Key('bioTextField'),
                controller: _bioController..text = _bio,
                onChanged: (value) => _bio = value,
                decoration: InputDecoration(labelText: 'Bio'),
                maxLines: null,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Save profile information
                  _saveProfile();
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _dob = pickedDate.toString(); // You can format the date as needed
        _dobController.text = _dob;
      });
    }
  }

  void _saveProfile() {
    // Save the profile information, you can store it in a database or wherever needed
    // For now, just print the information
    setState(() {
      _name = _nameController.text;
      _dob = _dobController.text;
      _bio = _bioController.text;
    });
  }
}
