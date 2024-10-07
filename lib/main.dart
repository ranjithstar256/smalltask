import 'package:flutter/material.dart';

void main() {
  runApp( MyTask());
}

class MyTask extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: MyTaskOpr(),
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => MyTaskOpr(),
        '/profile': (context) => Profile(),

      },

    );
  }
}

class MyTaskOpr extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyTaskOpr>{

  TextEditingController nameController = TextEditingController();
  TextEditingController locController = TextEditingController();
  TextEditingController mobController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: nameController,
          ),
          TextField(controller: locController,
          ),
          TextField(controller: mobController,
          ),
          ElevatedButton(onPressed:() {
            Employee emp = Employee(nameController.text,
                locController.text,
                mobController.text);

            Navigator.pushNamed(context,
                '/profile',
                arguments: emp);

          }, child: Text('submit'))
        ],
      ),
    );
  }
}


class Employee {
  final String name;
  final String loc;
  final String mob;

  Employee(this.name, this.loc,this.mob);
}

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Employee abcd = ModalRoute.of(context)?.settings.arguments as Employee;
  return MaterialApp(
    home: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(abcd.name),
          Text(abcd.loc),
          Text(abcd.mob),
        ],
      )
    ),
  );
  }

}