
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final void Function()? onPressednotifcation;
  final void Function()? onPressedSearsh;
  const CustomAppBar({super.key, required this.title,required this.onPressednotifcation,required this.onPressedSearsh});
  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.only(top: 10),
           
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(
                      hintText: title,
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon:  IconButton(onPressed:onPressedSearsh, icon:const Icon(Icons.search_outlined),
                    
                      
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.grey[200]),
                )),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(2),
                  child: IconButton(
                      onPressed: onPressednotifcation,
                      icon: Icon(
                        Icons.notifications_outlined,
                        size: 35,
                        color: Colors.grey[700],
                      )),
                )
              ],
            ),
          );
  }
}
