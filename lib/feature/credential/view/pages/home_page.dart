import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_mobile_v2/feature/note/_note_exports.dart';
import '../../../../core/_core_exports.dart';
import '../../../note/data/model/note_model.dart';

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
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('notes')
              .orderBy('time', descending: true)
              .snapshots(), //orderBy('creation_date', descending: true) : güncelliğe göre sıralar
          builder: (final BuildContext context, final AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  'No notes available',
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: // obx kaldırıldı burdan
                        // Güncellemeye yarar
                        ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      //noteController.notes.length,
                      itemBuilder: (final BuildContext context, final int index) {
                        final QueryDocumentSnapshot document = snapshot.data!.docs[index];
                        final NoteModel note = NoteModel.fromMap(document);

                        //final tersIndex = noteController.notes.length - 1 - index;
                        // tersine index yaparak sırayı tersine cevirmiş oluruz
                        //  final note = noteController.notes[tersIndex];

                        return Card(
                          color: const Color.fromARGB(255, 190, 156, 250),
                          child: ListTile(
                            leading: //Text('Category : ${note.category}'),
                                Text(note.category),
                            title: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: //Text(note.text),
                                  Text(note.text),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: //Text('Time : ${note.creationDate}'),
                                  Text(note.time.toString()),
                            ),
                            onTap: () {
                              Get.to(
                                const UpdateNotePage(),
                                arguments: note,
                              );
                            },
                            trailing: IconButton(
                              onPressed: () async {
                                await FirebaseFirestore.instance.collection('notes').doc(note.id).delete();
                              },
                              icon: const Icon(
                                Icons.remove_circle_outline,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
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
}
