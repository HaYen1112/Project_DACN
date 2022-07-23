
class Tickets {
  late bool isSelect;
  late String idTicket;
  final String startTime;
  final String endTime;
  final String date;
  final String startAddress;
  final String endAddress;
  late String status;
  final int price;
  final String seatLocation;
  final String amountOfTime;


  Tickets({
    required this.idTicket,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.endAddress,
    required this.startAddress,
    required this.price,
    required this.amountOfTime,
    required this.seatLocation,
    required this.status,
    required this.isSelect,
  });
  static Tickets fromJson(Map<String, dynamic> json) => Tickets(
    idTicket: json['id'],
    startAddress: json['startAddress'],
    endAddress: json['endAddress'],
    date: json['date'],
    startTime: json['startTime'],
    endTime: json['endTime'],
    price: json['price'],
    amountOfTime: json['amountOfTime'],
    status: json['status'],
    seatLocation: json['seatLocation'],
    isSelect: json['isSelect']
  );
  Map<String, dynamic> toJson() => {
    'id': idTicket,
    'startAddress': startAddress,
    'endAddress': endAddress,
    'date': date,
    'startTime': startTime,
    'endTime': endTime,
    'price': price,
    'amountOfTime': amountOfTime,
    'status':status,
    'seatLocation': seatLocation,
    'isSelect': isSelect
  };
   void setIdTicket(String id){
    idTicket =id;
  }
  void setIsSelect(bool isSelect) {
    this.isSelect=isSelect;
  }

  void updateStatus(String status) {
     this.status =status;
  }
}