import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/widget/navigation_drawer.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  static const appTitle = 'TicketBook';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MainPage(),
    );
  }
}
// class Myapp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'BNNMMMM',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('dagdsjfdjjds'),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => FirebaseFirestore.instance
//               .collection('testing')
//               .add({'timestamp': Timestamp.fromDate(DateTime.now())}),
//           child: Icon(Icons.add),
//         ),
//         body: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection('testing').snapshots(),
//           builder: (
//              BuildContext context,
//              AsyncSnapshot<QuerySnapshot> snapshot,
//           ){
//             if (!snapshot.hasData) return const SizedBox.shrink();
//             return ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder:(BuildContext context, int index){
//                 final docData = snapshot.data!.docs[index].data();
//                 final dateTime = (docData as Timestamp).toDate();
//                 return ListTile(
//                   title: Text(dateTime.toString()),
//                 );
//               },
//             );
//           },
//         ),
//
//       ),
//     );
//   }
// }
class MainPage extends StatefulWidget {
  @override
    _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage>{
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text(MyApp.appTitle),
      backgroundColor: Color.fromARGB(255, 248, 178, 29),
    ),
  );
}
