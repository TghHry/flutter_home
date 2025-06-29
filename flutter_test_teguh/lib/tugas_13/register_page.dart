import 'package:flutter/material.dart';
// import 'package:absensi_sederhana/database/db_helper.dart';
import 'package:flutter_test_teguh/tugas_13/database/db_helper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const String id = "/RegisterPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureTextA = true;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF819A91), // Navy blue

      appBar: AppBar(
        backgroundColor: const Color(0xFF819A91),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {},
        ),
        title: Text("Registrasi", style: TextStyle(color: Colors.white)),
      ),
      body: Form(
        key: _formkey,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header Text
                Text(
                  "Registrasi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Welcome back please\nsign in again",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),

                const SizedBox(height: 40),

                // Full Name
                TextFormField(
                  validator:
                      (value) =>
                          value == null || value.isEmpty ? "Wajib diisi" : null,
                  style: TextStyle(color: Colors.white),
                  controller: namecontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    labelStyle: TextStyle(color: Colors.white),
                    errorStyle: TextStyle(color: Colors.white),
                    hintText: "Enter your full name",
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(
                      Icons.person_2_outlined,
                      color: Colors.white70,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                //PHONE
                TextFormField(
                  validator:
                      (value) =>
                          value == null || value.isEmpty ? "Wajib diisi" : null,
                  // style: GoogleFonts.roboto(color: Colors.white),
                  controller: phonecontroller,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Number Phone",
                    labelStyle: TextStyle(color: Colors.white),
                    errorStyle: TextStyle(color: Colors.white),
                    hintText: "Enter your number",
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.phone, color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                // Email Field
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Wajib diisi";
                    if (!value.contains("@")) return "Email tidak Valid";
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white),
                    errorStyle: TextStyle(color: Colors.white),
                    hintText: "Enter your email",
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.email, color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                // Password Field
                TextFormField(
                  validator:
                      (value) =>
                          value == null || value.isEmpty ? "Wajib diisi" : null,
                  controller: passwordcontroller,
                  obscureText: _obscureTextA,
                  style: TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.white),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Enter your password",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.lock, color: Colors.white70),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureTextA ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureTextA = !_obscureTextA;
                        });
                      },
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Register Button
                SizedBox(
                  width: 300,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        print("Email : ${emailcontroller.text}");
                        print("Name : ${namecontroller.text}");
                        print("Number : ${phonecontroller.text}");
                        print("password : ${passwordcontroller.text}");
                        DbHelper.registerUser(
                          email: emailcontroller.text,
                          phone: phonecontroller.text,
                          name: namecontroller.text,
                          password: passwordcontroller.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Registration Successfull",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: const Color(0xFF819A91),
                          ),
                        );
                      }
                      // TODO: Handle login
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Color(0xFF001F54),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Divider with "or"
                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.white54)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "or",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.white54)),
                  ],
                ),

                const SizedBox(height: 16),

                // Sign up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        // TODO : HAndle sign up
                      },
                      child: Text(
                        "   Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}