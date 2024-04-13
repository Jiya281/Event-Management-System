// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_import, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:event_city/models/events.dart';
import 'package:get/get.dart';

// class EventDetails extends StatefulWidget {
//   const EventDetails({super.key, required EventModel event});

//   @override
//   State<EventDetails> createState() => _EventDetailsState();
// }

// class _EventDetailsState extends State<EventDetails> {
//   // late Stream<List<EventModel>> _eventStream;
//   late Stream<List<EventDetailsModel>> _detailStream;

//   @override
//   void initState() {
//     super.initState();
//     _detailStream = _readData();
//   }

//   Stream<List<EventDetailsModel>> _readData() {
//     final detailsCollection = FirebaseFirestore.instance.collection("events");

//     return detailsCollection
//         .snapshots()
//         .map((querySnapshot) => querySnapshot.docs
//             .map(
//               (e) => EventDetailsModel.fromSnapshot(e),
//             )
//             .toList());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Event Details'),
//       ),
//       body: StreamBuilder<List<EventDetailsModel>>(
//         stream: _detailStream,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text("No details Yet"));
//           }
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               final event = snapshot.data![index];
//               return EventDetailsPage(detail: event);
//             },
//           );
//         },
//       ),
//     );
//   }
// }

class EventDetailsPage extends StatelessWidget {
  // final EventModel event;
  // final EventDetailsModel detail;

  // EventDetailsPage({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Music",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Image.network(
              "abc",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              "nnjsn",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "dsjnj",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Start Time: njnjsn',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'End Time:fsjfkj',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "nxcnksnd",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Free",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              "dasdkjfk",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 32),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Implement join event functionality
                },
                child: Text('Join Event'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:event_city/models/events.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class EventDetails extends StatefulWidget {
//   const EventDetails({super.key, required EventModel event});

//   @override
//   State<EventDetails> createState() => _EventDetailsState();
// }

// class _EventDetailsState extends State<EventDetails> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Event Details"),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               Get.arguments['title'],
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16),
//             Image.network(
//               Get.arguments['title'],
//               height: 200,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 16),
//             Text(
//               Get.arguments['title'],
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               Get.arguments['title'],
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               // 'Start Time: ${event.startTime ?? ''}',
//               Get.arguments['title'],
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               // 'End Time: ${event.endTime ?? ''}',
//               Get.arguments['title'],
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               Get.arguments['title'],
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               Get.arguments['title'],
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 16),
//             Text(
//               Get.arguments['title'],
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 32),
//             Align(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Implement join event functionality
//                 },
//                 child: Text('Join Event'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
