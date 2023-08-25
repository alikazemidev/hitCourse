import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/note.dart';

class NoteAppHomePage extends StatefulWidget {
  const NoteAppHomePage({super.key});

  @override
  State<NoteAppHomePage> createState() => _NoteAppHomePageState();
}

class _NoteAppHomePageState extends State<NoteAppHomePage> {
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
                  Note.noteList.add(note);
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
                  itemCount: Note.noteList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          Note.noteList[index].title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(Note.noteList[index].subTitle),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.pencil,
                                size: 25,
                              ),
                              color: Colors.black,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  Note.noteList.removeAt(index);
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

// class NoteItem extends StatefulWidget {
//   final Note note;
//   final int indexNote;
//   const NoteItem({
//     super.key,
//     required this.note,
//     required this.indexNote,
//   });

//   @override
//   State<NoteItem> createState() => _NoteItemState();
// }

// class _NoteItemState extends State<NoteItem> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class AddNoteDialog extends StatelessWidget {
  final Function(Note note) onAdd;
  AddNoteDialog({required this.onAdd});

  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerSubTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                'افزودن یادداشت',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
