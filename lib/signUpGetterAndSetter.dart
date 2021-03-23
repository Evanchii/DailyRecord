class signInGetterAndSetter{
  String email;
  String studentNo;
  String password;


  String get Email{
    return email;
  }

  String get StudentNumber{
    return studentNo;
  }

  String get Password{
    return password;
  }

  void set setEmail(String setEmail){
    this.email = setEmail;
  }
  void set setStudentNumber(String setStudentNumber){
    this.studentNo = setStudentNumber;
  }
  void set setPass(String setPassword){
    this.password = setPassword;
  }
}


class logInGetterAndSetter{
  String logEmail;
  String logPassword;

  String get logInEmail{
    return logEmail;
  }
  String get logInPassword{
    return logPassword;
  }
  void set setLogEmail(String setEmail){
    this.logEmail = setEmail;
  }
  void set setLogPassword(String setPassword){
    this.logPassword = setPassword;
  }
}