import 'package:first_flutter_app/Student.dart';
import 'package:flutter/material.dart';

List<student> students=[student(0, "mirza","yuksel", 120),student(0, "mirza","yuksel", 12),student(0, "mirza","yuksel", 50)];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _HomeScreen();

  }



}

class _HomeScreen extends State<HomeScreen>{


  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar:
    AppBar(title:Text("Student Information"),
    ),
      body:buildBody(),
      floatingActionButton : FloatingActionButton(
        onPressed: () {

          Navigator.push(context,MaterialPageRoute(

            // Pass the arguments as part of the RouteSettings. The
            // DetailScreen reads the arguments from these settings.
            builder: (context) => addStudent(),
          ));

        },
        child: Icon(Icons.add, color: Colors.yellow,),
        foregroundColor: Colors.pink,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }

 Widget buildBody() {


    return Column(children:
    [
      Expanded(
        child: ListView.builder(itemCount:students.length,
            itemBuilder: (BuildContext context,int index){

    return ListTile(
      title:Text(students[index].firstName!+" "+students[index].surName!),
      subtitle:Text("grade: "+students[index].grade.toString()),
      leading:CircleAvatar(
        backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/2/24/Crystal_personal.svg/768px-Crystal_personal.svg.png"),
      ),
      trailing: state(students[index].grade!),
      onLongPress: (){students.removeAt(index);setState(() {});}
                    );

                    }
                ),
      ),
      ],


    );
 }



Widget state(int grade){

    if(grade>=50)
      return Icon(Icons.done);
    else
      return Icon(Icons.close);

}


}

class addStudent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _addStudent();

  }



  }

  class _addStudent extends State{

  student addStudent=student(0,"","",0);
  final myNameController = TextEditingController();
  final mySurNameController = TextEditingController();
  final myGradeController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Add Student"),
        ),
      body: Column(children: [

         StudentName(),
         StudentSurName() ,
         StudentGrade(),
         Button(),

      ],),

    );

  }

  Widget StudentName(){

    return Container(
      child: TextFormField(
        controller: myNameController,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(30),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
              labelText: "Student Name",
              hintText: "Mirza"
                   ),
        onSaved: (String? value){
        
        addStudent.firstName=value;
        
        },
      ),
      margin: const EdgeInsets.only(top:10.0),
    );


  }

  Widget StudentSurName(){

    return Container(
        child: TextFormField(
          controller: mySurNameController,
            decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(30),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          labelText: "Student Surname",
          hintText: "Yuksel"
      ),
      onSaved: (String? value){

        addStudent.surName=value;

      },
        ),
      margin: const EdgeInsets.only(top:10.0),
    );
  }


  Widget StudentGrade(){

    return Container(
        child: TextFormField(
          controller: myGradeController,
          decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(30),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          labelText: "Student Grade",
          hintText: "100"
      ),
      onSaved: (String? value){

        addStudent.grade=int.parse(value!);

      },

        ),
      margin: const EdgeInsets.only(top:10.0),
    );


  }

  Widget Button(){

    return Container(
      child: TextButton(onPressed: () {

        addStudent.firstName=myNameController.text;
        addStudent.surName=mySurNameController.text;
        addStudent.grade=int.parse(myGradeController.text);
        students.add(addStudent);
        Navigator.push(context,MaterialPageRoute(

          // Pass the arguments as part of the RouteSettings. The
          // DetailScreen reads the arguments from these settings.
          builder: (context) =>MyApp() ,
        ));


          },

    child: Text('Add Student'),
    style: ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),
    side: BorderSide(color: Colors.red)
    )
    )
      ),

    ),
    margin: const EdgeInsets.only(top:10.0),
    alignment: Alignment.center,
    );


  }


  }






//Center(child: Text("merhaba"),)