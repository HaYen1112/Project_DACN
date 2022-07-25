
class ViewTicketDetail {

  late String idViewTicket;
  final String startTime;
  final String endTime;
  final String date;
  final String startAddress;
  final String endAddress;
  late String note;
  final String priceTotal;
  final String seatLocation;
  final String nameCus;
  final String phone;
  final String seatTotal;
  ViewTicketDetail({
    required this.idViewTicket,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.startAddress,
    required this.endAddress,
    required this.note,
    required this.priceTotal,
    required this.seatLocation,
    required this.nameCus,
    required this.phone,
    required this.seatTotal,
  });
  static ViewTicketDetail fromJson(Map<String, dynamic> json) => ViewTicketDetail(
      idViewTicket: json['idViewTicket'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      date: json['date'],
      startAddress: json['startAddress'],
      endAddress: json['endAddress'],
      note: json['note'],
      priceTotal: json['priceTotal'],
      seatLocation: json['seatLocation'],
      nameCus: json['nameCus'],
      phone: json['phone'],
      seatTotal: json['seatTotal']
  );
  Map<String, dynamic> toJson() => {
    'idViewTicket': idViewTicket,
    'startTime': startTime,
    'endTime': endTime,
    'date': date,
    'startAddress': startAddress,
    'endAddress': endAddress,
    'note':note,
    'priceTotal': priceTotal,
    'seatLocation': seatLocation,
    'nameCus':nameCus,
    'phone':phone,
    'seatTotal':seatTotal
  };
  void setIdTicket(String id){
    idViewTicket =id;
  }
  }