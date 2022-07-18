

class Trips {
  late String _idTrip;
  late String _diemKH;
  late String _diemKT;
  late Date _date;
  late String _tgKH;
  late String _tgKT;
  late String _tongTgChuyenDi;
  late String _bienSo;

  Trips(this._idTrip, this._diemKH, this._diemKT, this._date, this._tgKH,
      this._tgKT, this._tongTgChuyenDi, this._bienSo);

  String get idTrip => _idTrip;

  set idTrip(String value) {
    _idTrip = value;
  }

  String get diemKH => _diemKH;

  String get bienSo => _bienSo;

  set bienSo(String value) {
    _bienSo = value;
  }

  String get tgKT => _tgKT;

  set tgKT(String value) {
    _tgKT = value;
  }

  String get tgKH => _tgKH;

  set tgKH(String value) {
    _tgKH = value;
  }

  Date get date => _date;

  set date(Date value) {
    _date = value;
  }

  String get diemKT => _diemKT;

  set diemKT(String value) {
    _diemKT = value;
  }

  set diemKH(String value) {
    _diemKH = value;
  }

  @override
  String toString() {
    return 'Trips{_idTrip: $_idTrip, _diemKH: $_diemKH, _diemKT: $_diemKT,'
        ' _date: $_date, _tgKH: $_tgKH, _tgKT: $_tgKT, _tongTgChuyenDi: $_tongTgChuyenDi, _bienSo: $_bienSo}';
  }
}

class Date {
  late int _ngay;
  late int _thang;
  late int _nam;

  Date(this._ngay, this._thang, this._nam);

  int get nam => _nam;

  set nam(int value) {
    _nam = value;
  }

  int get thang => _thang;

  set thang(int value) {
    _thang = value;
  }

  int get ngay => _ngay;

  set ngay(int value) {
    _ngay = value;
  }

  @override
  String toString() {
    return 'Date{_ngay: $_ngay, _thang: $_thang, _nam: $_nam}';
  }
}

