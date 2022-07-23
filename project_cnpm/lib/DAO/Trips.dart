
class Trips {
  late String idTrip;
  final String startTime;
  final String endTime;
  final String date;
  final String startAddress;
  final String endAddress;
  final int quantityStatus;
  final int price;
  Trips({
    required this.idTrip,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.endAddress,
    required this.startAddress,
    required this.price,
    required this.quantityStatus,
  });
  static Trips fromJson(Map<String, dynamic> json) => Trips(
      idTrip: json['idTrip'],
      startAddress: json['startAddress'],
      endAddress: json['endAddress'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      price: json['price'],
      quantityStatus: json['quantityStatus'],
  );
  Map<String, dynamic> toJson() => {
        'idTrip': idTrip,
        'startAddress': startAddress,
        'endAddress': endAddress,
        'date': date,
        'startTime': startTime,
        'endTime': endTime,
        'price': price,
        'quantityStatus': quantityStatus,
      };
  void setIdTrip(String id) {
    idTrip = id;
  }
}
