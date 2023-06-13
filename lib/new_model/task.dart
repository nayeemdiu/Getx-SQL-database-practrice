class Task {
  int? id ;
  String? title;
  String? note;

  Task({
    this.id,
    this.title,
    this.note});

 Task.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    note = json['note'];
 }

 Map<String,dynamic> toJson(){

   final Map<String,dynamic> data = new Map<String,dynamic>();
   data['id'] = this.id;
   data['title'] = this.title;
   data['note'] = this.note;
  return data;
 }

}