import 'dart:convert';

List<Complaint> complaintFromJson(String str) =>
    List<Complaint>.from(json.decode(str).map((x) => Complaint.fromJson(x)));

String complaintToJson(List<Complaint> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Complaint {
  int?id;
  int? orderId;
  int? complaintId;
  int? complaintTypeId;
  int? statusId;
  String? complaint_type_name;
  String? statusName;

  String? message;
  String? sender;

  Complaint(
      {this.id,this.orderId,
      this.complaintId,
      this.complaintTypeId,
      this.statusId,
      this.message,
      this.statusName,
      this.complaint_type_name,
      this.sender});

  Complaint.fromJson(Map<String, dynamic> json) {
        id = json['id'];

    orderId = json['order_id'];
    complaintId = json['complaint_id'];
    complaintTypeId = json['complaint_type_id'];
    statusId = json['status_id'];
    message = json['message'];
    statusName = json['status_name'];
    complaint_type_name = json['complaint_type_name'];
    sender = json['sender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['complaint_id'] = this.complaintId;
    data['complaint_type_id'] = this.complaintTypeId;
    data['status_id'] = this.statusId;
    data['message'] = this.message;
    data['complaint_type_name'] = this.complaint_type_name;
    data['status_name'] = this.statusName;
    data['sender'] = this.sender;
    data['id']=this.id;   

    return data;
  }
}
