import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_cnpm/DAO/Users.dart';
import 'package:project_cnpm/page/manager_users/add_user_admin.dart';
import 'package:project_cnpm/page/manager_users/edit_user_admin.dart';
import 'package:project_cnpm/widget/navigation_manage_drawer.dart';

class ManageUser extends StatefulWidget {
  @override
  State<ManageUser> createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationManageDrawerWidget(),
      appBar: AppBar(
        title: Text('Quản lý tài khoản'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 248, 178, 29),
      ),
      // icon thêm ở góc phải màn hình => chuyển đến trang AddUserPage()
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.white,
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUserPage()))
        },
      ),

      // Hiển thị danh sách người dùng có trên firebase
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          StreamBuilder<Iterable<Users>>(
            stream: readUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final user = snapshot.data!;
                return Column(
                  children: user.map(buildUsers).toList(),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
// Giao diện hiển thị từng người dùng
  Widget buildUsers(Users user) => ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.amberAccent,
      child: Icon(
        Icons.perm_identity_outlined,
        color: Colors.white,
      ),
    ),
    title: Text(
      '${user.name}',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Text('Email: ${user.email}', style: TextStyle(color: Colors.black)),
        SizedBox(
          height: 5,
        ),
        Text('Số điện thoại: ${user.phone}',
            style: TextStyle(color: Colors.black)),
        SizedBox(height: 5),
        Text('Địa chỉ: ${user.address}',
            style: TextStyle(color: Colors.black)),
      ],
    ),
    trailing: Column(
      children: [

        // Icon edit
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                padding: EdgeInsets.all(5.0),
                minimumSize: Size(5.0, 4.0)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>EditUserPage(idUser: user.email,)));
            },
            child: Icon(
              Icons.edit,
              color: Colors.green,
              size: 18,
            )),
        SizedBox(
          height: 2,
        ),


        // Icon Delete
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              padding: EdgeInsets.all(5.0),
              minimumSize: Size(5.0, 4.0),
            ),
            onPressed: () {

              signInUser(user.email, user.password);

              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Xác nhận xóa tài khoản?"),
                    content: const Text(
                        "Thao tác này sẽ xóa tài khoản đã chọn."),
                    actions: [
                      TextButton(
                        child: const Text("Hủy"),
                        onPressed: () {
                          signInUser('projectticketbook@gmail.com','123456');
                          Navigator.of(context).pop();

                        },
                      ),
                      TextButton(
                        child: const Text("Xác nhận"),
                        onPressed: () {
                          deleteUser(user.email, user.password);
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ));
            },
            child: Icon(
              Icons.delete,
              color: Colors.redAccent,
              size: 18,
            )),
      ],
    ),
    onTap: () {},
    hoverColor: Colors.black12,
    dense: true,
  );

  Future signInUser(String idUser, String password) async {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: idUser, password: password);
    } on FirebaseException catch (e) {
      // print(e);
      //  Utils.showSnackBar(e.message);
    }
  }

  Future deleteUser(String idUser, String password) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(idUser);
    try {
      final docUser2 = FirebaseAuth.instance.currentUser;
      await docUser.delete();
      await docUser2!.delete();
    } on FirebaseException catch (e) {
      //print(e);
      // Utils.showSnackBar(e.message);
    }
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'projectticketbook@gmail.com', password: '123456');
  }

  Stream<Iterable<Users>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((event) => event.docs.map((doc) => Users.fromJson(doc.data())));
}
