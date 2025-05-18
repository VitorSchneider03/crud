import 'package:crud_flutter/routes/app_routes.dart';
import 'package:crud_flutter/views/user_form.dart';
import 'package:flutter/material.dart';
import 'package:crud_flutter/views/user_list.dart';
import 'package:provider/provider.dart';
import 'package:crud_flutter/provider/users.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //remove debug banner
        title: 'CRUD Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),
    ); 
  }
}
