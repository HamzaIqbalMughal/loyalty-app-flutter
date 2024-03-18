/// status : 200
/// message : "Login successful"
/// user : {"_id":"65f86c0593895f7775e7ea51","full_name":"Hamza","email":"hamza@gmail.com"}
/// data : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1Zjg2YzA1OTM4OTVmNzc3NWU3ZWE1MSIsInVzZXJuYW1lIjoiaGFtemFAZ21haWwuY29tIiwiaWF0IjoxNzEwNzg2MzU3fQ.fHNogcuVXUcqMGY6ieZ4PfffKujLxNSLBKfFNwdYF_s"

class LoginResponseModel {
  LoginResponseModel({
      num? status, 
      String? message, 
      User? user, 
      String? data,}){
    _status = status;
    _message = message;
    _user = user;
    _data = data;
}

  LoginResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _data = json['data'];
  }
  num? _status;
  String? _message;
  User? _user;
  String? _data;
LoginResponseModel copyWith({  num? status,
  String? message,
  User? user,
  String? data,
}) => LoginResponseModel(  status: status ?? _status,
  message: message ?? _message,
  user: user ?? _user,
  data: data ?? _data,
);
  num? get status => _status;
  String? get message => _message;
  User? get user => _user;
  String? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['data'] = _data;
    return map;
  }

}

/// _id : "65f86c0593895f7775e7ea51"
/// full_name : "Hamza"
/// email : "hamza@gmail.com"

class User {
  User({
      String? id, 
      String? fullName, 
      String? email,}){
    _id = id;
    _fullName = fullName;
    _email = email;
}

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _fullName = json['full_name'];
    _email = json['email'];
  }
  String? _id;
  String? _fullName;
  String? _email;
User copyWith({  String? id,
  String? fullName,
  String? email,
}) => User(  id: id ?? _id,
  fullName: fullName ?? _fullName,
  email: email ?? _email,
);
  String? get id => _id;
  String? get fullName => _fullName;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['full_name'] = _fullName;
    map['email'] = _email;
    return map;
  }

}