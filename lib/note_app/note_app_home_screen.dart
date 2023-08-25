import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './models/note.dart';

class NoteAppHomePage extends StatefulWidget {
  const NoteAppHomePage({super.key});

  @override
  State<NoteAppHomePage> createState() => _NoteAppHomePageState();
}

class _NoteAppHomePageState extends State<NoteAppHomePage> {
  Box<Note>? noteBox = Hive.box('noteBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddNoteDialog(
                onAdd: (note) {
                  noteBox!.add(note);
                  setState(() {});
                },
              );
            },
          );
        },
        child: Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue.shade800,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.plus,
                color: Colors.white,
                size: 15,
              ),
              SizedBox(width: 5),
              Text(
                'افزودن',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'یادداشت ها',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: noteBox?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          noteBox?.getAt(index)?.title ?? '',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(noteBox?.getAt(index)?.subTitle ?? ''),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AddNoteDialog(
                                      onAdd: (note) {
                                        noteBox?.putAt(index, note);
                                        setState(() {});
                                      },
                                      note: noteBox?.getAt(index),
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                CupertinoIcons.pencil,
                                size: 25,
                              ),
                              color: Colors.black,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  noteBox?.deleteAt(index);
                                });
                              },
                              icon: Icon(
                                CupertinoIcons.delete,
                                size: 25,
                              ),
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AddNoteDialog extends StatelessWidget {
  AddNoteDialog({required this.onAdd, this.note});
  final Function(Note note) onAdd;
  final Note? note;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerTitle =
        TextEditingController(text: note?.title);
    TextEditingController _controllerSubTitle =
        TextEditingController(text: note?.subTitle);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          height: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note != null ? 'ویرایش یادداشت' : 'افزودن یادداشت',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controllerTitle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.blue.shade900,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controllerSubTitle,
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.blue.shade900,
                      width: 2,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () {
                    onAdd(
                      Note(
                          title: _controllerTitle.text,
                          subTitle: _controllerSubTitle.text),
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade800,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.plus,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          note != null ? 'ویرایش' : 'افزودن',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
