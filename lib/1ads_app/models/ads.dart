class Ads {
  final String title;
  final String abilities;
  final String salary;
  final bool inPerson;

  Ads({
    required this.title,
    required this.abilities,
    required this.salary,
    required this.inPerson,
  });

  static List<Ads> adsList = [
    Ads(
      title: 'فلاتر',
      abilities: 'تسلط به زبان دارت و فریمورک فلاتر',
      salary: '۲۰ تا ۳۰ میلیون',
      inPerson: true,
    ),
    Ads(
      title: 'پایتون',
      abilities: 'تسلط به زبان پایتون و فریمورک جنگو',
      salary: '۲۰ تا 50 میلیون',
      inPerson: false,
    ),
    Ads(
      title: 'جاوا اسکریپت',
      abilities: 'تسلط به زبان جاوااسکریپت و فریمورک انگولار',
      salary: '۴۰ تا ۲۰ میلیون',
      inPerson: true,
    ),
    Ads(
      title: 'سی شارپ',
      abilities: 'تسلط به زبان سی شارپ و فریمورک دات نت',
      salary: '۴۰ تا ۳۰ میلیون',
      inPerson: false,
    ),
  ];
}
