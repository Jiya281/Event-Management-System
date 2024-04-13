// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, sort_child_properties_last, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:video_player/video_player.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Event4DetailsPage extends StatefulWidget {
  @override
  _Event4DetailsPageState createState() => _Event4DetailsPageState();
}

class _Event4DetailsPageState extends State<Event4DetailsPage> {
  final CollectionReference wishlistCollection =
      FirebaseFirestore.instance.collection('Wishlist');

  bool _isJoinButtonDisabled = false;
  // late VideoPlayerController _controller;
  // late YoutubePlayerController _youtubeController;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.networkUrl(
  //     Uri.parse('https://youtu.be/yEHCfRWz-EI?si=gpoEN2MAhqrzbZCT'),
  //   )..initialize().then((_) {
  //       setState(() {}); // Update the state once the video is initialized
  //     });

  //   _youtubeController = YoutubePlayerController(
  //     initialVideoId: 'yEHCfRWz-EI',
  //     flags: YoutubePlayerFlags(
  //       autoPlay: false,
  //     ),
  //   );
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   _youtubeController.dispose();
  //   super.dispose();
  // }

  void addToWishlist(BuildContext context) async {
    try {
      // Check if the course already exists in the wishlist
      QuerySnapshot querySnapshot = await wishlistCollection
          .where('title', isEqualTo: 'Career Seminar')
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        // Course already exists in the wishlist
        showErrorMessage(context, 'Event already exists in the wishlist');
        return;
      }

      // If the course does not exist, add it to the wishlist
      await wishlistCollection.add({
        'title': 'Career Seminar',
        'description': 'A Seminar for Success',
        'isFree': 'Free',
      });

      // Show success message using ScaffoldMessenger
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Event added to wishlist')),
      );
    } catch (e) {
      // Show error message using ScaffoldMessenger
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add course to wishlist: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Career Seminar',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromRGBO(240, 99, 90, 0.999),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image of the course
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/career.jpeg',
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           content: Container(
                    //             width: double.infinity,
                    //             child: YoutubePlayer(
                    //               controller: _youtubeController,
                    //               showVideoProgressIndicator: true,
                    //               progressIndicatorColor: Colors.red,
                    //               progressColors: ProgressBarColors(
                    //                 playedColor: Colors.red,
                    //                 handleColor: Colors.redAccent,
                    //               ),
                    //               onReady: () {
                    //                 _youtubeController.play();
                    //               },
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   },
                    //   child: Icon(
                    //     Icons.play_circle_outline,
                    //     size: 50,
                    //     color: Colors.black,
                    //   ),
                    // ),
                    // Positioned(
                    //   bottom: 8,
                    //   child: Text(
                    //     'Preview this course',
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 17,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 20),
                // Title of the course
                Text(
                  'Career Seminar',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                // Description of the course
                Text(
                  'A Seminar for Success',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(240, 99, 90, 0.999)),
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      'Start Date: 13/04/24 1:00PM ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    // Text(
                    //   'End Date: 15/04/24 6:30PM',
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     color: Colors.black,
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      'End Date: 15/04/24 4:00PM ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                // Bestseller box
                // Container(
                //   padding: EdgeInsets.all(8),
                //   decoration: BoxDecoration(
                //     color: Color(0xFFFFF9C4), // Customize the color as needed
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child: Text(
                //     'Bestseller',
                //     style: TextStyle(
                //       fontSize: 15,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      'Venue: At your place', // Rating value
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Text(
                  '100 joined ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 7),
                Column(
                  children: [
                    Text(
                      'Career seminar where we will delve into the strategies and insights necessary for navigating your career path with confidence and purpose. Whether your a recent graduate, a seasoned professional, or someone considering a career change, this seminar aims to equip you with the tools and knowledge to unlock your full potential and achieve your career goals. ', // Rating value
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                // Price of the course
                Text(
                  'Free',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isJoinButtonDisabled
                        ? null
                        : () {
                            setState(() {
                              _isJoinButtonDisabled =
                                  true; // Disable the button
                            });
                          },
                    child: Text(
                      'Join Now',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      backgroundColor: Color.fromRGBO(240, 99, 90, 0.999),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Add to Cart button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add the course to the cart
                      addToWishlist(context);

                      // Show success message
                      showSuccessMessage(context, 'Event added to wishlist');
                    },
                    child: Text(
                      'Add to Wishlist',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                        side: BorderSide(
                          color: Colors.black, // Border color
                          width: 2, // Border width
                        ),
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSuccessMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
