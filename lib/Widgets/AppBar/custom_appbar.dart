import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_web/theme/theme.dart';

class CustomAppBarHome extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Icon? icon;
  Widget? leading;


  CustomAppBarHome({
    Key? key,
    this.title,
    this.icon,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Container(
        child: AppBar(
          flexibleSpace: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: icon ?? Container(),
                  ),
                  Text(
                    title ?? "",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 240, 240, 240),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          leading: leading ?? null,
          /*actions: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
              child: Image.asset(
                'assets/images/logo-escrita.png',
              ),
            ),
          ],*/
          automaticallyImplyLeading: false,
          centerTitle: true,
          shadowColor: const Color.fromARGB(0, 255, 255, 255),
        ),
        decoration: const BoxDecoration(
          color: primaryColor,
          /*borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(500, 40),
            bottomRight: Radius.elliptical(500, 40),
          ),*/
        ),
      ),
      preferredSize: const Size.fromHeight(80),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
