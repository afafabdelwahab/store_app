import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      this.inputType,
      required this.hint,
      this.onChanged,
      this.obscureText = false})
      : super(key: key);
  String? hint;
  TextInputType? inputType;
  bool obscureText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 7,
      ),
      child: TextField(
        keyboardType: inputType,
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 31, 247, 142),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 31, 247, 142),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 31, 247, 142),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
