import 'package:flutter/material.dart';
import 'package:flutter_mvc/Login/controller/controller.dart';
import 'package:flutter_mvc/Login/model/model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Controller controller = Controller(
    model: Model(),
  );

  final _formKey = GlobalKey<FormState>();
  TextEditingController? _ctrlMobile;

  @override
  void initState() {
    super.initState();
    controller.locatorFetchUsers;
  }

  @override
  Widget build(BuildContext context) {
    List<Data>? users = controller.users(context);
    bool isLoading = controller.isLoading(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MVC Demo'),
      ),
      body: (isLoading)
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: users!.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5,
              child: ListTile(
                leading: Image.network(users[index].avatar!),
                title: Text(
                  users[index].firstName! + " " + users[index].lastName!,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                subtitle: Text(
                  users[index].email!,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                trailing: Text('ID: ' + users[index].id.toString()),
              ),
            );
          }),
    );
  }


/*
  _form() => Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
    alignment: Alignment.center,
    child: Align(
        alignment: Alignment.center,
        child:Form(
          key: _formKey,
          child: Column(
            children: <Widget>[

              TextFormField(
                decoration: InputDecoration(labelText: 'Enter Email'),
                validator: (val) =>
                (val?.length == 0 ? 'This field is mandatory' : null),
                // onSaved: (val) => setState(() => nameVal = val),
                onChanged: ((value) {
                  setState(() {
                    controller.setEmail(value);
                  });
                }),
              ),
              TextFormField(
                controller: _ctrlMobile,
                decoration: InputDecoration(labelText: 'Enter Password'),
                validator: (val) =>
                val!.length <= 10 ? '10 characters required' : null,
                // onSaved: (val) => setState(() => this.ageVal = val),
                onChanged: ((value) {
                  setState(() {
                    controller.setPassword(value);
                  });
                }),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(

                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      padding:
                      MaterialStateProperty.all(const EdgeInsets.all(20)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 14, color: Colors.white))),

                  onPressed: () => _onSubmit(),
                  child: Text('Submit'),

                ),
              ),
            ],
          ),
        ),
    ),
  );
  _onSubmit() async {
    print("onsubmit button called");

    setState(() {
      controller.getUserDetails();
    });
  }
 */
}
