
class DetailTickes {
  late String idDetailTickes;
  final String startTime;
  final String endTime;
  final String date;
  final String startAddress;
  final String endAddress;
  final int quantityStatus;
  final String phone;
  final String name;
  final int price;
  DetailTickes({
    required this.idDetailTickes,
    required this.startTime,
    required this.endTime,
    required this.name,
    required this.phone,
    required this.date,
    required this.endAddress,
    required this.startAddress,
    required this.price,
    required this.quantityStatus,
  });
  static DetailTickes fromJson(Map<String, dynamic> json) => DetailTickes(
    idDetailTickes: json['idTrip'],
    startAddress: json['startAddress'],
    endAddress: json['endAddress'],
    date: json['date'],
    startTime: json['startTime'],
    endTime: json['endTime'],
    price: json['price'],
    quantityStatus: json['quantityStatus'],
    name: json['name'],
    phone: json['phone'],
  );
  Map<String, dynamic> toJson() => {
    'idTrip': idDetailTickes,
    'startAddress': startAddress,
    'endAddress': endAddress,
    'date': date,
    'startTime': startTime,
    'endTime': endTime,
    'price': price,
    'phone': phone,
    'name': name,
    'quantityStatus': quantityStatus,
  };
  void setIdDetail(String id) {
    idDetailTickes = id;
  }
}
