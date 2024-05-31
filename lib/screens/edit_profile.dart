// import 'dart:html';
// import 'dart:io' as io;
// import 'package:flutter/foundation.dart'; // Imports the File class from the dart:io library

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../my_widgets/lists.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // XFile? _selectedImage;
  // File? _imgFile;
  // final ImagePicker _picker = ImagePicker();
  // void launchDialPad() async {
  //   const url = 'tel:';
  //   if (await canLaunchUrl(Uri.parse(url))) {
  //     await launch(url, forceSafariVC: false);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  // Future _pickImageFromGallary() async {
  //   void takeSnapshot() async {
  //     final ImagePicker picker = ImagePicker();
  //     final XFile? img = await picker.pickImage(
  //       source: ImageSource.camera, // alternatively, use ImageSource.gallery
  //       maxWidth: 400,
  //     );
  //     if (img == null) return;
  //     setState(() {
  //       _imgFile = File(img.path); // convert it to a Dart:io file
  //     });
  //   }
  // }
  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Image',
          style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      // Circular image
                      // const CircleAvatar(
                      //   radius: 70,
                      //   backgroundImage: NetworkImage(
                      //       'https://scontent.fktm6-1.fna.fbcdn.net/v/t39.30808-6/386350582_278042408394509_2909557155378589543_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_ohc=AQBxcc7poKoQ7kNvgH67_N1&_nc_ht=scontent.fktm6-1.fna&oh=00_AfAW8xCdBH5wWQRoL7VufQIaXjlroS9vQQevT6qc_kRhvw&oe=66424DB4'),
                      // ),
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: (_image == null)
                            ? const NetworkImage(
                                'https://scontent.fktm6-1.fna.fbcdn.net/v/t39.30808-6/386350582_278042408394509_2909557155378589543_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_ohc=AQBxcc7poKoQ7kNvgH67_N1&_nc_ht=scontent.fktm6-1.fna&oh=00_AfAW8xCdBH5wWQRoL7VufQIaXjlroS9vQQevT6qc_kRhvw&oe=66424DB4')
                            : FileImage(File(_image!.path)) as ImageProvider,
                      )
                      // Circular avatar
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    child: const Text('Edit Image',
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                    onPressed: () {
                      getImage();
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              // color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Edit Information',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 18),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: editInformation.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return editInformation[index];
                    },
                  ),

                  // ListTile(
                  //   leading: Text(
                  //     'Personal Information',
                  //     style: TextStyle(fontSize: 18),
                  //   ),
                  //   trailing: Icon(
                  //     Icons.arrow_forward_ios_rounded,
                  //     size: 18,
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              // color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Change Password',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 20,
                        ),
                        hintText: 'Enter Old Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 20,
                        ),
                        hintText: 'Enter New Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.black,
                    padding: const EdgeInsets.only(
                        left: 60, right: 60, top: 20, bottom: 20),
                    onPressed: () => launchUrlString("tel://+977 9761544323"),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 23),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
