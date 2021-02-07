import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String hintText;
  final String errortext;
  final int satir;
  final  TextEditingController controller;
  final  FocusNode focusNode;
  final Widget icon;
  final FormFieldValidator<String> validate;
  final FormFieldSetter<String>  onSaved;
  final ValueChanged<String> onchange;

  const Input(
      {Key key,
        @required this.hintText,
        @required this.errortext,
        @required this.satir,
        @required this.controller,
        @required this.validate,
        @required this.icon,
        @required this.onSaved,
        @required this.focusNode,
        @required this.onchange
      })
      : assert(hintText != null, onSaved != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                offset: const Offset(4, 4),
                blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 60,
            child: TextFormField(

              focusNode:focusNode ,
              controller: controller,
              onChanged: onchange,
              maxLines: satir,
              validator: validate,
              onSaved: onSaved,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(
                fontFamily: 'WorkSans',
                fontSize: 16,
                color: Color(0xFF313A44),
              ),
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                  helperText: "   ",
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 20,left: 10),
                    child: icon,
                  ),
                  border: InputBorder.none,
                  contentPadding:  const EdgeInsets.only(top: 10),
                  hintText: hintText,hintStyle: TextStyle(color: Colors.black87)),
            ),
          ),
        ),
      ),
    );
  }
}
