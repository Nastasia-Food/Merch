class RefreshToken {
  RefreshToken({
    bool? success,
    String? token,
    String? tokenType,
    double? expiresIn,}){
    _success = success;
    _token = token;
    _tokenType = tokenType;
    _expiresIn = expiresIn;
  }

  RefreshToken.fromJson(dynamic json) {
    _success = json['success'];
    _token = json['token'];
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
  }
  bool? _success;
  String? _token;
  String? _tokenType;
  double? _expiresIn;

  bool? get success => _success;
  String? get token => _token;
  String? get tokenType => _tokenType;
  double? get expiresIn => _expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['token'] = _token;
    map['token_type'] = _tokenType;
    map['expires_in'] = _expiresIn;
    return map;
  }

}