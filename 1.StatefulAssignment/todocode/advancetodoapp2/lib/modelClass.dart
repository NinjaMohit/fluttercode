class ToDoModelClass {
  int? idNo;
  String title;
  String description;
  String date;

  ToDoModelClass(
      {this.idNo,
      required this.title,
      required this.description,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'idNo': idNo,
      'title': title,
      'description': description,
      'date': date,
    };
  }

  @override
  String toString() {
    return '{idNo:$idNo,title:$title,description:$description,date:$date}';
  }
}
