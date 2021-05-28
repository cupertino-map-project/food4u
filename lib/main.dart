import 'package:flutter/material.dart';
import 'package:food4u/router.dart';
import 'package:food4u/screen/HomePage/home_screen.dart';

void main() => runApp(
      MaterialApp(
        title: 'Food 4U',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue[300]),
        //home: TodoListScreen(),
        initialRoute: '/',
        onGenerateRoute: createRoute,
        home: HomePage(),
      ),
    );
