
import 'package:hive/hive.dart';
// part 'note.g.dart';


@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;

  Note({
    required this.title,
    required this.subTitle,
  });

  static List<Note> noteList = [
    Note(title: 'یادداشت شماره یک', subTitle: 'توضیحات یادداشت شماره یک'),
    Note(title: 'یادداشت شماره 2', subTitle: 'توضیحات یادداشت شماره 2'),
  ];
}
