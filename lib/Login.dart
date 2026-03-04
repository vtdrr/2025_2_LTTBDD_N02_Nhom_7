import 'package:flutter/material.dart';
import 'Info.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng ký"),
        backgroundColor: Color.fromRGBO(165, 42, 42, 1),
        elevation: 5,
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "xyz@gmail.com",
                  helperText: "Nhap vao email ca nhan",
                  suffixIcon: Icon(Icons.clear),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                    labelText: "So dien thoai",
                    hintText: "0xxxxxxxx",
                    helperText: "Nhap vao so dien thoai ca nhan",
                    prefixIcon: Icon(Icons.phone),
                    suffixIcon: Icon(Icons.clear),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                    labelText: "Ten dang nhap",
                    hintText: "Ten dang nhap",
                    helperText: "Nhap vao ten dang nhap",
                    prefixIcon: Icon(Icons.login),
                    suffixIcon: Icon(Icons.clear),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Mat khau",
                  hintText: "aaaaaaaa",
                  helperText: "Nhap vao mat khau yeu cau 1A 1!",
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.clear),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
                obscureText: true,
                obscuringCharacter: '*',
              ),

              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Nhap lai mat khau",
                  hintText: "aaaaaaaa",
                  helperText: "Nhap lai mat khau",
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.clear),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
                obscureText: true,
                obscuringCharacter: '*',
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Info()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15,),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(165, 42, 42, 1),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Dang ky"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
