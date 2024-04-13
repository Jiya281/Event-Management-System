// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventModel {
  String? title;
  String? description;
  String? imageUrl;
  // String? endDate;
  // String? startDate;
  // String? startTime;
  // String? endTime;
  // String? venue;
  // String? isFree;
  // String? detailsofEvent;

  EventModel({
    required this.imageUrl,
    required this.title,
    required this.description,
    // required this.startDate,
    // required this.startTime,
    // required this.endDate,
    // required this.endTime,
    // required this.venue,
    // required this.isFree,
    // required this.detailsofEvent,
  });

  // factory EventModel.fromMap(map) {
  //   return EventModel(
  //     title: map['title'],
  //     imageUrl: map['imageUrl'],
  //     description: map['description'],
  //   );
  // }

  static EventModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return EventModel(
      title: snapshot['title'],
      description: snapshot['description'],
      imageUrl: snapshot['imageUrl'],
      // startDate: snapshot['startDate'],
      // endDate: snapshot['endDate'],
      // startTime: snapshot['startTime'],
      // endTime: snapshot['endTime'],
      // venue: snapshot['venue'],
      // isFree: snapshot['isFree'],
      // detailsofEvent: snapshot['detailsofEvent'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      // 'startDate': startDate,
      // 'endDate': endDate,
      // 'startTime': startTime,
      // 'endTime': endTime,
      // 'venue': venue,
      // 'isFree': isFree,
      // 'detailsofEvents': detailsofEvent
    };
  }
}

class EventDetailsModel {
  String? title;
  String? imageUrl;
  String? endDate;
  String? startDate;
  String? startTime;
  String? endTime;
  String? venue;
  String? isFree;
  String? detailsofEvent;

  EventDetailsModel({
    required this.imageUrl,
    required this.title,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.venue,
    required this.isFree,
    required this.detailsofEvent,
  });

  static EventDetailsModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return EventDetailsModel(
      title: snapshot['title'],
      imageUrl: snapshot['imageUrl'],
      startDate: snapshot['startDate'],
      endDate: snapshot['endDate'],
      startTime: snapshot['startTime'],
      endTime: snapshot['endTime'],
      venue: snapshot['venue'],
      isFree: snapshot['isFree'],
      detailsofEvent: snapshot['detailsofEvent'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'startDate': startDate,
      'endDate': endDate,
      'startTime': startTime,
      'endTime': endTime,
      'venue': venue,
      'isFree': isFree,
      'detailsofEvents': detailsofEvent
    };
  }
}
