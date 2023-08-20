import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String category;
  final String id;
  final String text;
  final DateTime time;

  const NoteModel({
    required this.category,
    required this.id,
    required this.text,
    required this.time,
  });

  factory NoteModel.fromMap(final QueryDocumentSnapshot<Object?> map) {
    return NoteModel(
      category: map["category"],
      id: map["id"],
      text: map["text"],
      // time: DateTime.parse(
      //   map["time"],
      // ),
      time: map["time"].toDate(),
    );
  }
}
