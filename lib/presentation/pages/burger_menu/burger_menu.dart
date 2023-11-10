import 'package:flutter/material.dart';

class BurgerMenu extends StatelessWidget {
  const BurgerMenu({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 222,
      backgroundColor: const Color.fromRGBO(189, 214, 255, 1),
      child: Expanded(
        flex: 1,
        child: ListView(
          children: const [
          ListTile(
            leading: Icon(Icons.home_outlined, size: 35,),
            title: Text('Главная', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),),
            trailing: Icon(Icons.chevron_right_sharp, size: 35,),
          ),
          Divider(color: Colors.black, thickness: 2, ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Материалы', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),),
            trailing: Icon(Icons.chevron_right_sharp, size: 35,),
          ),
          Divider(color: Colors.black, thickness: 2, ),
          ListTile(
            leading: Icon(Icons.sports_gymnastics_outlined),
            title: Text('Тренажер', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),),
            trailing: Icon(Icons.chevron_right_sharp, size: 35,),
          ),
          Divider(color: Colors.black, thickness: 2, ),
          ListTile(
            leading: Icon(Icons.note_outlined),
            title: Text('Заметки', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),),
            trailing: Icon(Icons.chevron_right_sharp, size: 35,),
          ),
          Divider(color: Colors.black, thickness: 2, ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Настройки', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),),
            trailing: Icon(Icons.chevron_right_sharp, size: 35,),
          ),
          Divider(color: Colors.black, thickness: 2, ),
          ],
        ),
      ),
    );
  }
  
  
}