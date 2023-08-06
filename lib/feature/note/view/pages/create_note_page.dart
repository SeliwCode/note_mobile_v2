import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_mobile_v2/feature/note/view/pages/note_class.dart';

import '../../../../core/_core_exports.dart';
import '../../../_feature_exports.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  String dates = DateTime.now().toString();

  // Input fields //Giriş alanları
  List<Widget> get _inputs {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    'Kategori :',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: GetBuilder(
                      init: serviceLocator<NoteController>(),
                      id: "noteCategoryType",
                      builder: (NoteController noteController) {
                        return DropdownButton(
                          value: noteController.noteCategoryType,
                          onChanged: (final NoteCategoryType? type) {
                            noteController.onChangedNoteCategoryType(type);
                          },
                          isExpanded: true,
                          items: List.generate(
                            NoteCategoryType.values.length,
                            (final int index) {
                              return DropdownMenuItem(
                                value: NoteCategoryType.values[index],
                                child: Text(
                                  NoteCategoryType.values[index].toText,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Notunu Gir",
              ),
              controller: serviceLocator<NoteController>().categoriesController,
              keyboardType: TextInputType.text,
              validator: (final String? value) {
                if (value != null && value.length < 201 && value.length > 9) {
                  // Doğru
                  return null;
                } else {
                  return "Hatalı not yazdın";
                }
              },
            ),
            Text(
              'Created on : $dates',
              style: const TextStyle(height: 5, fontSize: 10),
            ),
          ],
        ),
      ),
    ];
  }

  // Tapped create button
  VoidCallback get _onPressedCreateButton {
    return () async {
      await serviceLocator<NoteController>().create();
    };
  }

  // Buttons
  List<Widget> get _buttons {
    return [
      ElevatedButton(
        onPressed: () async {
          await FirebaseFirestore.instance.collection('notes').add({
            'notunKategorileri': serviceLocator<NoteController>().noteCategoryType.toText,
            'notunMetni': serviceLocator<NoteController>().categoriesController.text,
            'creation_date': DateTime.now(),
          }).then((value) {
            serviceLocator<NoteController>().addNote(Note(
              category: serviceLocator<NoteController>().noteCategoryType.toText,
              text: serviceLocator<NoteController>().categoriesController.text,
              creationDate: DateTime.now(),
            ));
            Get.back();
          });
        },
        child:  const Text(
          "Notu Oluştur",
            style: TextStyle(color: Colors.deepPurple),
        ),
      )

      /*  TextButton(
        onPressed: _onPressedCreateButton,
        /* onPressed: () {
          Get.to( const ListPage(
          ));
        }, */
        child: const Text(
          "Notu Oluştur",
        ),
      ), */
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Create Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: serviceLocator<CredentialController>().createNoteKey,
          child: Column(
            children: [
              ..._inputs,
              const SizedBox(
                height: 24,
              ),
              ..._buttons,
              const SizedBox(
                height: 20,
              ),
              /*  TextFormField(
                /* inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1),
                ], */ // just rakam girebilmeni sağlar, karakter sınırlaması
                controller: serviceLocator<NoteController>().sameController,
                autofocus: true,
                //obscureText: true, // rakamları gizlemeni saglar
                keyboardType: TextInputType.number,
               /*  onChanged: (String value) {
                  int intValue = int.tryParse(value) ?? 0;
                  NoteCategoryType selectedType;
                  switch (intValue) {
                    case 1:
                      selectedType = NoteCategoryType.job;
                      break;
                    case 2:
                      selectedType = NoteCategoryType.home;
                      break;
                    case 3:
                      selectedType = NoteCategoryType.sport;
                      break;
                    case 4:
                      selectedType = NoteCategoryType.trip;
                      break;
                    default:
                      selectedType = NoteCategoryType.trip;
                      break;
                  }
                  serviceLocator<NoteController>().onChangedNoteCategoryType(selectedType);
                }, */
              ),   */
            ],
          ),
        ),
      ),
    );
  }
}
