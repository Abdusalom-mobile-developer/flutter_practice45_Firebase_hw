import 'package:flutter/material.dart';

mixin CustomWidgets {
  Widget customTextField(
      BuildContext context, String hint, TextEditingController controller,
      {FocusNode? focusNode, bool isObscure = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black45, width: 2))),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 16,
      child: TextField(
        obscureText: isObscure,
        cursorColor: Colors.black54,
        style: const TextStyle(
            decorationColor: Colors.transparent,
            decoration: TextDecoration.none,
            decorationThickness: 0,
            color: Colors.black54,
            fontSize: 21,
            fontWeight: FontWeight.bold),
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
            border: const UnderlineInputBorder(borderSide: BorderSide.none),
            hintText: hint,
            hintStyle: const TextStyle(
                color: Colors.black54,
                fontSize: 21,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget customButton(
      BuildContext context, String text, void Function() function) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
          color: Colors.red[800], borderRadius: BorderRadius.circular(4)),
      child: TextButton(
          autofocus: true,
          onPressed: function,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget customText(String content, {Color color = Colors.black54}) {
    return Text(
      content,
      style: TextStyle(
          color: color, fontSize: 19, fontWeight: FontWeight.bold),
    );
  }
}
