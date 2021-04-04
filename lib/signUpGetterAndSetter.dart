//TO BE REMOVED. DECISION PENDING!

class SignInGetterAndSetter{
  String strEmail;
  String studentNo;
  String strPassword;


  String get email{
    return strEmail;
  }

  String get studentNumber{
    return studentNo;
  }

  String get password{
    return strPassword;
  }

  set setEmail(String setEmail){
    this.strEmail = setEmail;
  }
  set setStudentNumber(String setStudentNumber){
    this.studentNo = setStudentNumber;
  }
  set setPass(String setPassword){
    this.strPassword = setPassword;
  }
}


class LogInGetterAndSetter{
  String logEmail;
  String logPassword;

  String get logInEmail{
    return logEmail;
  }
  String get logInPassword{
    return logPassword;
  }
  set setLogEmail(String setEmail){
    this.logEmail = setEmail;
  }
  set setLogPassword(String setPassword){
    this.logPassword = setPassword;
  }
}