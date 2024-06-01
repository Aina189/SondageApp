class ResponseUser{
  int id;
  String mail;
  String text;
  int avis;

  ResponseUser(this.id,this.mail,this.text,this.avis);

  ResponseUser.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    mail=json['mail'],
    text=json['text'],
    avis=json['avis'];


  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'mail':mail,
      'text':text,
      'avis':avis
    };
  }

}