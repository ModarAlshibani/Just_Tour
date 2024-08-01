import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:terez/core/constant/appColors.dart';

class EditField extends StatefulWidget{
  final String? initialText;
  final Icon? leadingIcon;

  const EditField({super.key, this.initialText, this.leadingIcon, });

  @override
  State<EditField> createState() => _EditFieldState();
}

class _EditFieldState extends State<EditField> {
  bool _isEditing = false;
  late TextEditingController _controller;

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override 
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Row(
                          children: [
                            Container( 
                              height: 70,
                              width: 280, //color: Colors.amber,
                              child: Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Container(child: widget.leadingIcon,),
                                  SizedBox(width: 15,),
                                  Flexible(
                                    child: TextField(
                                      cursorColor: AppColors.midnightGreen, 
                                      controller: _controller,
                                      readOnly: !_isEditing,
                                      decoration: InputDecoration( 
                                        hintText: '${widget.initialText}',
                                        hintStyle: TextStyle(color: Colors.grey),
                                        focusedBorder:OutlineInputBorder(
                                        borderSide: const BorderSide(color: AppColors.midnightGreen,), 
                                        ),
                                      ),
                                    //   '${widget.text}',
                                    // maxLines: 1,
                                    // overflow: TextOverflow.ellipsis,
                                    // style: TextStyle(
                                    //   color: Colors.black,
                                    //   fontSize: 15,
                                    //   fontWeight: FontWeight.w400,
                                    // ),
                                    // softWrap: true,
                                    ),
                                  ),
                                  
                                 
                                ],
                              ),
                            ),
                             IconButton(
                                onPressed: (){
                                  setState(() {
                                    _isEditing = !_isEditing;
                                  });
                                },
                                icon: Icon(Icons.edit,
                                color: AppColors.varidiantGreen,),
                              ),
                          ],
                        ),
                        SizedBox(height: 12,),
      ],
    );
  }
}