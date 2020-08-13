class AppCard{

int id;
String title;
String content;

    AppCard([this.title,this.content,this.id]);

    AppCard.fromMap(Map<String,dynamic> map){
      id = map['id'];
      title = map['title'] ?? 'Não há tíulo';
      content = map['content'] ?? 'Não há conteúdo' ;
    }  

   
   Map toMap(){ 
    return {'title':title,'content':content};
  }
}


