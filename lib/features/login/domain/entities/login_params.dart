class LoginParams {
  String? email;
  String? password;

  LoginParams({this.email, this.password});

  Map<String,dynamic>toMap(){
    return {
      'email' :email,
      'password' :password
    };
  }
}