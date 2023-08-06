import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_mobile_v2/feature/note/_note_exports.dart';
import 'package:note_mobile_v2/feature/note/view/_view_exports.dart';
import '../../../../core/_core_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final NoteController noteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Obx(() { // Güncellemeye yarar
                return ListView.builder(
                  itemCount: noteController.notes.length,
                  itemBuilder: (context, index) {
                    final tersIndex =
                        noteController.notes.length - 1 - index; // tersine index yaparak sırayı tersine cevirmiş oluruz
                    final note = noteController.notes[tersIndex];
                    return Card(
                      color: const Color.fromARGB(255, 190, 156, 250),
                      child: ListTile(
                        leading: Text('Category : ${note.category}'),
                        title: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(note.text),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Time : ${note.creationDate}'),
                        ),
                        onTap: () {
                          Get.to(const UpdateNotePage(), arguments: index);
                        },
                        trailing: IconButton(
                            onPressed: () {
                              deleteNote(index);
                            },
                            icon: const Icon(Icons.remove_circle_outline)),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(const CreateNotePage());
        },
        label: const Text('Add note'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  void deleteNote(int index) {
    noteController.notes.removeAt(index);
  }
}
