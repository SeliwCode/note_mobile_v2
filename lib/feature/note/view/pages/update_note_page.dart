import 'dart:developer';
import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_mobile_v2/feature/credential/view/_view_exports.dart';
import 'package:note_mobile_v2/feature/note/view/pages/note_class.dart';
import '../../../../core/_core_exports.dart';
import '../../data/model/note_model.dart';

class UpdateNotePage extends StatefulWidget {
  const UpdateNotePage({Key? key}) : super(key: key);

  @override
  State<UpdateNotePage> createState() => _UpdateNotePageState();
}

class _UpdateNotePageState extends State<UpdateNotePage> {
  /// Dependencies
  late NoteModel note;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    note = Get.arguments;
    textEditingController.text = note.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Update Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: textEditingController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance.collection('notes').doc(note.id).update({
                  'text': textEditingController.text.trim(),
                }).then((value) => {
                      Get.offAll(() => const HomePage()),
                      debugPrint("Data Update"),
                    });
              },
              child: const Text(
                'Güncelle',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
