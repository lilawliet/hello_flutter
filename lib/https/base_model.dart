class BaseModel<T> {
  T? data;
  int? errorCode;
  String? errorMsg;

  BaseModel({this.data, this.errorCode, this.errorMsg});

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(
      data: json['data'],
      errorCode: json['errorCode'],
      errorMsg: json['errorMsg'],
    );
  }

  // factory BaseModel.fromJson(
  //   Map<String, dynamic> json,
  //   Function(dynamic) fromJsonT,
  // ) {
  //   return BaseModel(
  //     data: fromJsonT(json['data']),
  //     errorCode: json['errorCode'],
  //     errorMsg: json['errorMsg'],
  //   );
  // }
}
