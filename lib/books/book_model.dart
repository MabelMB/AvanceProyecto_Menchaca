class Book{
  final int? id;
  final int? userId;
  final String title;
  final String sinopsis;
  final String genero;
  final String notas;

  Book({
    this.id,
    this.userId,
    required this.title,
    required this.sinopsis,
    required this.genero,
    required this.notas,
  });

  Map<String, dynamic> toMap(){
    return{
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'title': title,
      'sinopsis': sinopsis,
      'genero': genero,
      'notas': notas
    };
  }

  factory Book.fromMap(Map<String, dynamic> map){
    return Book(
      id: map['id'],
      userId: map['userId'],
      title: map['title'],
      sinopsis: map['sinopsis'],
      genero: map['genero'],
      notas: map['notas']
    );
  }

}