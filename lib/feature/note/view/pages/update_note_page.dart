import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_mobile_v2/feature/note/view/pages/note_class.dart';
import '../../../../core/_core_exports.dart';
import '../../../credential/controller/credential_controller.dart';
import '../../controller/note_controller.dart';
import '../../domain/entities/note_category_type.dart';
import '_pages_exports.dart';

class UpdateNotePage extends StatelessWidget {
  const UpdateNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int noteIndex = Get.arguments as int;  // sayfa arasaında veri iletmek için kullanılır
    final NoteController noteController = Get.find();
    final Note nowNote = noteController.notes[noteIndex];
    final TextEditingController updatedNoteController = TextEditingController(text: nowNote.text);

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
              controller: updatedNoteController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedNote = Note(
                  category: nowNote.category,
                  text: updatedNoteController.text,
                  creationDate: nowNote.creationDate,
                );
                noteController.updateNote(noteIndex, updatedNote);
                Get.back();
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
