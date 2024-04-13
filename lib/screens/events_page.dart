// ignore_for_file: unused_import, prefer_const_constructors, unused_field, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_element, unnecessary_import, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_city/eventDetails/event1.dart';
import 'package:event_city/eventDetails/event2.dart';
import 'package:event_city/eventDetails/event3.dart';
import 'package:event_city/eventDetails/event4.dart';
import 'package:event_city/eventDetails/event5.dart';
import 'package:event_city/models/events.dart';
import 'package:event_city/screens/event_detials.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({Key? key}) : super(key: key);

  @override
  State<EventListPage> createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  int _selectedIndex = 0;
  late Stream<List<EventModel>> _eventsStream;

  Stream<List<EventModel>> _readData() {
    final eventsCollection = FirebaseFirestore.instance.collection("events");

    return eventsCollection
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map(
              (e) => EventModel.fromSnapshot(e),
            )
            .toList());
  }

  @override
  void initState() {
    super.initState();
    _eventsStream = _readData();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 99, 90, 0.999),
        title: Text(
          'Our Events',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
      ),
      body: StreamBuilder<List<EventModel>>(
        stream: _eventsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No Events Yet"));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final event = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      if (index == 0) {
                        return Event1DetailsPage();
                      } else if (index == 1) {
                        return Event2DetailsPage();
                      } else if (index == 2) {
                        return Event5DetailsPage();
                      } else if (index == 3) {
                        return Event3DetailsPage();
                      } else if (index == 4) {
                        return Event4DetailsPage();
                      } else {
                        return Container();
                      }
                    }),
                  );
                },
                child: EventCard(event: snapshot.data![index]),
              );
            },
          );
        },
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final EventModel event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.fromLTRB(15, 5, 15, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            event.imageUrl ?? '',
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title ?? '',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  event.description ?? '',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       // Navigator.pushReplacement(
                //       //     context,
                //       //     MaterialPageRoute(
                //       //         builder: (context) => EventDetails()));
                //     },
                //     child: Text('Join'),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
