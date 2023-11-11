import 'package:flutter/material.dart';
import 'package:study_ready/presentation/pages/main_screen/main_screen.dart';

class NavigatorDrawer extends StatelessWidget {
  const NavigatorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 222,
      backgroundColor: const Color.fromRGBO(189, 214, 255, 1),
      child: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined, size: 35, color: Colors.black,),
              title: const Text('Главная', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900), textAlign: TextAlign.start,),
              trailing: const Icon(Icons.chevron_right_sharp, size: 35, color: Colors.black,),
              onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainScreen())),
            ),
            const Divider(color: Colors.black, indent: 20, endIndent: 30,)
          ],
        ),
      ),
    );
  }
}