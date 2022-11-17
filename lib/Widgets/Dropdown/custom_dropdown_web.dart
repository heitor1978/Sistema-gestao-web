import 'package:flutter/material.dart';
import 'package:gestao_web/Theme/theme.dart';

class CustomDropdownRegister extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? value;
  final void Function(Object?) onChanged;
  final List<DropdownMenuItem<Object>>? items;


  const CustomDropdownRegister({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.value,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 3, 0, 3),
      width: 1000, //MediaQuery.of(context).size.width,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(
            color: Color.fromARGB(255, 6, 26, 29),
          ),
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 6, 26, 29),
          ),
          labelText: labelText,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromARGB(255, 6, 26, 29),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromARGB(255, 240, 0, 0),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromARGB(255, 6, 26, 29),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromARGB(255, 1224, 227, 231),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        itemHeight: 70,
        style: const TextStyle(
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(20),
        value: value,
        isExpanded: false,
        elevation: 16,
        validator: (value) {
          if (value == null) return "Selecione um";
          return null;
        },
        onChanged: onChanged,
        items: items,
      ),
    );
  }
}
