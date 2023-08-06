import 'package:note_mobile_v2/feature/note/_note_exports.dart';
import '../../../../core/_core_exports.dart';

 class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: NoteCategoryType.values.length,
                itemBuilder: (context, index) {
                  final kategoriler = NoteCategoryType.values[index];
                  return ListTile(
                    title: Column(
                      children: [
                        /*  Text(
                            '$index',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.deepPurple,
                          ),
                        ),  */
                        /*  Text(
                          kategoriler.toText,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.deepPurple,
                          ),
                        ), */
                        GetBuilder(
                          builder: (NoteController noteController) {
                            return TextButton(
                              onPressed: () {
                                noteController.onChangedNoteCategoryType(kategoriler);
                              },
                              child: Text(
                                kategoriler.toText,
                              ),
                            );
                          },
                        ),
                      ],  
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textAlign: TextAlign.start,
                controller: serviceLocator<NoteController>().changeController,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 



