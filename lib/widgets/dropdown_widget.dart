import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({
    super.key,
    required this.list,
    required this.onChanged,
  });

  final List<String> list;
  final Function(String) onChanged;

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  late String dropdownValue = widget.list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 12,
      borderRadius: BorderRadius.circular(20.0),
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      underline: Container(
        height: 0,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: widget.onChanged != null
          ? (String? value) {
              setState(() {
                dropdownValue = value!;
              });
              widget.onChanged!(value!);
            }
          : null,
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          alignment: Alignment.center,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
