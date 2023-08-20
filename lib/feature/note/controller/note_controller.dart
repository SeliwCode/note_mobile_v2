import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/_core_exports.dart';
import '../../_feature_exports.dart';
import '../view/pages/note_class.dart';

class NoteController extends GetxController {
  // Controllers
  final TextEditingController categoriesController = TextEditingController();
  final TextEditingController sameController = TextEditingController();
  final TextEditingController changeController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  RxList<Note> notes = <Note>[].obs; // veriler değiştiğinde otomatik yeniden oluşur

  // Keys
  final GlobalKey<FormState> createKey = GlobalKey<FormState>();

  // create
  Future<void> create() async {
    if (createKey.currentState != null && !createKey.currentState!.validate()) {
      createKey.currentState!.save();
    }
    debugPrint("=== Correct.");
    //Get.to(const HomePage());
  }

  // Category type
  NoteCategoryType noteCategoryType = NoteCategoryType.job;

  // Change category type
  void onChangedNoteCategoryType(final NoteCategoryType? type) {
    noteCategoryType = type ?? NoteCategoryType.job;
    update(["noteCategoryType"]);
    //type?.toText ?? "";
    sameController.text = noteCategoryType.toText;
    //changeController.text = noteCategoryType.toText;
  }

  // note add
  void addNote(Note note) {
    notes.add(note);
  }

  // note update
  void updateNote(int index, Note updatedNote) async {
    //notes.removeAt(index);
    //notes.insert(0, updatedNote);
    //notes[index] = update;

    final String documentId = ['id'].toString();
    FirebaseFirestore.instance.collection('notes').doc(documentId).update({
      'id': documentId,
      'category': serviceLocator<NoteController>().noteCategoryType.toText,
      'text': serviceLocator<NoteController>().categoriesController.text,
      'time': DateTime.now(),
    });
  }
}
