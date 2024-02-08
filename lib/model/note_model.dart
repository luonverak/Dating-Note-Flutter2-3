class NoteModel {
  final int id;
  final String title;
  final String description;
  final String time;

  NoteModel({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
  });
  // using for add & update data
  Map<String, dynamic> fromJson() {
    return ({
      'id': id,
      'title': title,
      'description': description,
      'time': time
    });
  }

  // fetch data
  NoteModel.toJson(Map<String, dynamic> res)
      : id = res['id'],
        title = res['title'],
        description = res['description'],
        time = res['time'];
}
