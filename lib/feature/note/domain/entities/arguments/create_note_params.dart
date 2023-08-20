class CreateNoteParams {
  final String id;
  final String category;
  final String text;
  final DateTime? time;

  const CreateNoteParams({
    required this.id,
    required this.category,
    required this.text,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "category": category,
      "text": text,
      "time": time ?? DateTime.now(),
    };
  }
}
