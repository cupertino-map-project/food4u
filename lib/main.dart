import 'package:flutter/material.dart';
import 'package:food4u/router.dart';

// import 'screens/task_list/task_list_screen.dart'; //? Later you want to remove this line

void main() => runApp(
      MaterialApp(
        title: 'Food 4U',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue[300]),
        //home: TodoListScreen(),
        initialRoute: '/firstscreen',
        onGenerateRoute: createRoute,
        // home: TaskListScreen(), //? uncomment this out to preview the second screen. Later, you want to remove this line
      ),
    );
