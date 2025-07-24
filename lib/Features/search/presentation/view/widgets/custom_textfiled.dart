import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: customOutBorder(oppacity: 0.2),
            focusedBorder: customOutBorder(oppacity: 0.8),
            labelText: "search...",
            hintText: "search...",
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
            suffixIconColor: Colors.white.withOpacity(0.8),
            suffixIcon: IconButton(
                onPressed: () {},
                icon: const Opacity(
                  opacity: 0.8,
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 16,
                  ),
                ))),
      ),
    );
  }

  OutlineInputBorder customOutBorder({required double oppacity}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white.withOpacity(oppacity)));
  }
}
