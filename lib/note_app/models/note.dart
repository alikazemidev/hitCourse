class Note {
  final String title;
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
