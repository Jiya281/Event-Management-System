// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  late List<Map<String, dynamic>> wishlist;

  @override
  void initState() {
    super.initState();
    wishlist = []; // Initialize wishlist as an empty list
    loadWishlist(); // Load wishlist data
  }

  Future<void> loadWishlist() async {
    try {
      CollectionReference wishlistCollection =
          FirebaseFirestore.instance.collection('Wishlist');
      QuerySnapshot querySnapshot = await wishlistCollection.get();
      List<Map<String, dynamic>> loadedWishlist =
          []; // Temporary list to hold the loaded wishlist
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic>? data =
            doc.data() as Map<String, dynamic>?; // Get document data as Map
        if (data != null && data.containsKey('isFree')) {
          // Check if 'price' and 'ratings' fields exist in the document data
          final isFree =
              data['isFree'] as String; // Assuming price is of type num
          // final ratings = data['ratings'] as double? ??
          0.0; // Assuming ratings is of type double
          if (isFree == 'Free') {
            // Add course to wishlist only if ratings are not 0
            loadedWishlist.add({
              'id': doc.id,
              'title': data['title'],
              'description': data['description'],
              'isFree': data['isFree'],
              // 'ratings': ratings,
            });
          }
        }
      });
      setState(() {
        wishlist =
            loadedWishlist; // Update the state variable with the loaded wishlist
      });
    } catch (e) {
      print('Failed to load wishlist: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Failed to load wishlist: $e')), // Display a more descriptive error message
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 99, 90, 0.999),
        title: Text(
          'Wishlist ♡',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          // final double? ratings = wishlist[index]['ratings'] as double?;
          return ListTile(
            // leading: Image.asset('assets/images/course_image.jpg'),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(wishlist[index]['title'],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)),
                SizedBox(height: 5),
                Text('${wishlist[index]['description']}',
                    style:
                        TextStyle(color: Colors.grey.shade700, fontSize: 15.0)),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      wishlist[index]['isFree'],
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    // SizedBox(
                    //     width:
                    //         10), // Add some space between price and star icons
                    // Row(
                    //   children: List.generate(5, (starIndex) {
                    //     // Generate star icons based on ratings
                    //     final bool isFilledStar =
                    //         starIndex < (ratings ?? 0).floor();
                    //     return Icon(
                    //       isFilledStar ? Icons.star : Icons.star_border,
                    //       color: Colors.yellow,
                    //       size: 20.0,
                    //     );
                    //   }),
                    // ),
                    // SizedBox(
                    //     width:
                    //         5), // Add some space between star icons and number of ratings
                    // Text(
                    //   ratings != 0.0
                    //       ? '(${ratings!.toStringAsFixed(1)} ratings)'
                    //       : '', // Display ratings if not 0
                    //   style: TextStyle(color: Colors.white),
                    // ),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.black),
              onPressed: () {
                removeFromWishlist(context, wishlist[index]['id']);
              },
            ),
          );
        },
      ),
    );
  }

  void removeFromWishlist(BuildContext context, String documentID) async {
    try {
      CollectionReference wishlistCollection =
          FirebaseFirestore.instance.collection('Wishlist');
      await wishlistCollection.doc(documentID).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Event removed from wishlist')),
      );
      loadWishlist();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to remove event from wishlist: $e')),
      );
    }
  }
}
