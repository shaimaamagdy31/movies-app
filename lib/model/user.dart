class User{

  String? id;
  String? name;
  String? phone;
  String? email;
  String? idAvatar;
  List<String>?favorites;




  User({this.id,this.name,this.email,this.favorites,this.phone,this.idAvatar});

  User.fromFirestore(Map<String,dynamic>? data){
    id=data?["id"];
    name=data?["name"];
    email=data?["email"];
    phone=data?["phone"];
    idAvatar=data?["idAvatar"];
    favorites = List<String>.from(data?["favorites"]);


  }

  Map<String,dynamic> toFirestore(){
    return {
      "id":id,
      "name":name,
      "email":email,
      "phone":phone,
      "idAvatar":idAvatar,
      "favorites":favorites
    };



  }











}