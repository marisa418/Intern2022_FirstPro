import 'package:firstproject/Model/StdData.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier {
  List<StdData> transactions = [
    StdData(
      simage:
          '/data/user/0/com.example.firstproject/cache/image_picker735115417187255183.jpg',
      school: "สปายแคท",
      std_id: "13558",
      sgrade: "อนุบาล3",
      teacher: "มานี มีนา",
      sf_name: "สมหญิง",
      sl_name: "มีสมบัติ",
      sn_name: "หญิง",
      sage: 5,
      pf_name: "สมศักดิ์",
      pl_name: "มีสมบัติ",
      prelation: "บิดา",
      ptel: "2122242360",
      point: 200,
    ),
    StdData(
      simage:
          '/data/user/0/com.example.firstproject/cache/image_picker9030118515998590962.jpg',
      school: "สปายแคท",
      std_id: "13559",
      sgrade: "อนุบาล3",
      teacher: "มานี มีนา",
      sf_name: "สมชาย",
      sl_name: "มีสมบัติ",
      sn_name: "ชาย",
      sage: 5,
      pf_name: "สมศักดิ์",
      pl_name: "มีสมบัติ",
      prelation: "บิดา",
      ptel: "2122242360",
      point: 100,
    ),
    StdData(
      simage:
          '/data/user/0/com.example.firstproject/cache/image_picker8349718661198717990.jpg',
      school: "สปายแคท",
      std_id: "13557",
      sgrade: "อนุบาล3",
      teacher: "มานี มีนา",
      sf_name: "สมทรง",
      sl_name: "มีสมบัติ",
      sn_name: "ชาย",
      sage: 5,
      pf_name: "สมศักดิ์",
      pl_name: "มีสมบัติ",
      prelation: "บิดา",
      ptel: "2122242360",
      point: 300,
    )
  ];

  //ดึงข้อมูล
  List<StdData> getTransaction() {
    return transactions;
  }

  void addTransaction(StdData statement) {
    //ข้อมูลที่เพิ่มจะอยู่บนสุด
    transactions.add(statement);
    //แจ้งเตือนconsumer ให้รีหน้าจอ
    notifyListeners();
  }

  double _point = 0;
  double get totalProg => _point;
}
