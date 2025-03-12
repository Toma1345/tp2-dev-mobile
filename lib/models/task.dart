class Task {
  int id;
  String title;
  List<String> tags;
  int nbhours;
  int difficulty;
  String description;

  static int nb = -1;

  Task({required this.id,required this.title,required this.tags,required this.nbhours,required this.difficulty,required this.description});

  factory Task.fromJson(Map<String,dynamic> json){
    final tags = <String>[];
    if (json['tags']!=null){
      json['tags'].forEach((t){
        tags.add(t);
      });
    }

    return Task(id: json['id'], title: json['title']??'not found', tags: tags, nbhours: json['nbhours']??-1, difficulty: json['difficulty']??-1, description: json['description']??"");
  }

  factory Task.newTask() {
    nb++;
    return Task(id:nb, title:'title $nb', tags:['tags $nb'], nbhours:nb, difficulty: nb%5, description: 'description $nb');
  }

  static List<Task> generateTask(int i){
    List<Task> tasks=[];
    for(int n=0;n<i;n++){
      tasks.add(Task.newTask());
    }
    return tasks;
  }


}
