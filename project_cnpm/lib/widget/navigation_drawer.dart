import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cnpm/DAO/Users.dart';
import 'package:project_cnpm/page/TicketBook.dart';
import 'package:project_cnpm/page/search_page.dart';
import 'package:project_cnpm/page/ticket_detail.dart';
import 'package:project_cnpm/page/view_ticketbook.dart';
import 'package:project_cnpm/page/promotion.dart';
import 'package:project_cnpm/page/user_page.dart';
import 'package:project_cnpm/main.dart';

import '../page/verify_email_page.dart';

class MainPageCustomer extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPageCustomer>{
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text(NavigationDrawerWidget.appTitle),
      backgroundColor: Color.fromARGB(255, 248, 178, 29),
    ),
 body: SearchScreen(),
  );
}


class NavigationDrawerWidget extends StatelessWidget{
  static const appTitle = 'Ứng dụng đặt vé xe';
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final id = FirebaseAuth.instance.currentUser;
    final email = id?.email;
    final urlImg = './img/hinhnen2.png';
    return Drawer(
      child:Container(
        color: Color.fromARGB(205, 215, 162, 3),
        child: ListView(
          children: <Widget>[
        FutureBuilder<Users?>(
                future: readUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasError){
                    return Text('Something went wrong!');
                  }else if (snapshot.hasData){
                    final user = snapshot.data;
                    final names = user!.name;
                    return user == null
                        ? Center(child: Text('No User'))
                        :buildHeader(
                        urlImage: urlImg,
                        name: names,
                        email: email!);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
        }
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildSearchField(),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Trang chủ',
                    icon: Icons.home,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Xem vé đã đặt',
                    icon: Icons.art_track_outlined,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Khuyến mãi',
                    icon: Icons.list,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.black12),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Đăng xuất',
                    icon: Icons.add_to_home_screen,
                    onClicked: () {FirebaseAuth.instance.signOut();
                    selectedItem(context, 3);},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
  }){
    final color = Colors.white;
    final hoverColer = Colors.black54;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color:  color, fontWeight: FontWeight.bold)),
      hoverColor: hoverColer,
      onTap: onClicked,
    );
  }
  void selectedItem(BuildContext context, int index){
    Navigator.of(context).pop();
    TicketBook.listId=[];
    switch (index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VerifyEmailPage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewTicket(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Promotion(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MainPage(),
        ));
        break;
    }
  }

 Widget buildHeader({
   required String urlImage,
   required String name,
   required String email,
   VoidCallback? onClicked,
 }) => InkWell(
   onTap: onClicked,
   hoverColor: Colors.black54,
   child: Container(
     padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
     child: Row(
       children: [
         CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
         SizedBox(width: 20),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(name, style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
             const SizedBox(height: 4),
             Text(email, style: TextStyle(fontSize: 10, color: Colors.white)),
           ],
         ),
         Spacer(),
         CircleAvatar(
           radius: 24,
           backgroundColor: Color.fromARGB(123, 33, 2, 1),
           child: Icon(Icons.add_comment_outlined),
         )
       ],
     ),
   ),
 );
  Widget buildSearchField() {
    final color = Colors.white;
    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        hintText: 'Tìm kiếm',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: color.withOpacity(0.7)),
        )
      ),
    );
  }

  Future<Users?> readUser() async {
    final id = FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance.collection('users').doc(id!.email);
    final snapshot = await docUser.get();

    if(snapshot.exists){
       return Users.fromJson(snapshot.data()!);
    }
  }
}