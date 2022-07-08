import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;
  final bool visible;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
    required this.visible
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFFe7edeb),
            border: Border.all(color: Colors.transparent),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: 
          TextField(
            controller: controller,
            decoration: InputDecoration(
              icon: Icon(Icons.search, color: style.color),
              suffixIcon: widget.text.isNotEmpty
                  ? GestureDetector(
                      child: Icon(Icons.close, color: style.color),
                      onTap: () {
                       
                        controller.clear();
                        widget.onChanged('');
                        FocusScope.of(context).requestFocus(FocusNode());
                         
                      },
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: style,
              border: InputBorder.none,
            ),
            style: style,
            onChanged: widget.onChanged,
          ),
          
           
        ),
        SizedBox(
          height: 5.0,
        ),
        Visibility(
          visible: widget.visible,
          child: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
            backgroundColor: FitAppTheme.bgColorSecondary,
            color: FitAppTheme.bgColor,
                 ),
          ),            
        ),
        )
      ],
    );
  }
}
