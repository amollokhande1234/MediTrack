import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hinttext;
  final TextInputType textInputType;
  final int? maxLength;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.hinttext,
    required this.textInputType,
    this.maxLength,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50, // Increased height for better look
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey),
          color: Colors.white, // Optional: set background color
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: TextField(
            maxLength: widget.maxLength,
            textAlign: TextAlign.center,
            keyboardType: widget.textInputType,
            decoration: InputDecoration(
              hintText: widget.hinttext,

              border: InputBorder.none, // Removes the underline
              contentPadding: EdgeInsets.symmetric(
                  vertical: 15.0), // Center aligns the text vertically
            ),
          ),
        ),
      ),
    );
  }
}
