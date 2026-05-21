import 'Data.dart';
import 'Meta.dart';

class FilmsResponse {
  FilmsResponse({
      this.status, 
      this.statusMessage,
      this.error,
      this.data, 
      this.meta,});

  FilmsResponse.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    error=json['error'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  String? status;
  String? statusMessage;
  String? error;
  Data? data;
  Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['error'] = error;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }

}