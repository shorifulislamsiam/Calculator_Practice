import 'package:calculator/Helper/AlertDialog.dart';
import 'package:calculator/expence_tracker/modal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Expencetracker extends StatefulWidget {
  const Expencetracker({super.key});

  @override
  State<Expencetracker> createState() => _ExpencetrackerState();
}

class _ExpencetrackerState extends State<Expencetracker> {
  final List <Expence> _expence=[];
  final List<String> _catagory =[
    "Education",
    "Food",
    "Transport",
    "Entertainment",
    "Bills",
    "Shopping",
    "Others"
  ];
  double _total=0 ;

  void _addExpence(String title,double amount,DateTime date,String category){
    setState(() {
      _expence.add(Expence(title: title, amount: amount, date: date, category: category));
      _total +=amount;
    });
  }
  void _deleteExpence(int index){
    setState(() {
      _total -=_expence[index].amount!;
      _expence.removeAt(index);
    });
  }
  void _editExpence(int index){
    showForm(context,index);
  }

  void _updateExpence(int index, String title, double amount, DateTime date, String category) {
    setState(() {
      _total -= _expence[index].amount!;
      _expence[index] = Expence(title: title, amount: amount, date: date, category: category);
      _total += amount;
    });
  }


  void showForm(BuildContext context, [int? index]){
    TextEditingController _titleController = TextEditingController(text: index != null ? _expence[index].title : '');
    TextEditingController _amountController = TextEditingController(text: index != null ? _expence[index].amount.toString() : '');
    String selectedCatagory = index != null ? _expence[index].category! : _catagory.first;
    DateTime selectedDate = index != null ? _expence[index].date : DateTime.now();
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context){
          return SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(
                left: 16,
                top: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: "Title",
                        labelStyle: TextStyle(fontSize: 18)
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                    decoration: const InputDecoration(
                      labelText: "Amount",
                      labelStyle: TextStyle(fontSize: 18)
                    ),
                  ),
                  const SizedBox(height: 10,),
                  DropdownButtonFormField(
                      items: _catagory.map((catagory)=>DropdownMenuItem(value: catagory,child: Text(catagory))).toList(),
                      onChanged: (value)=>selectedCatagory = value!,
                      decoration: const InputDecoration(
                        labelText: "Catagory",
                      ),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green
                    ),
                      onPressed: (){
                        if(_titleController.text.isEmpty || double.tryParse(_amountController.text)==null){
                          return ;
                        }
                        if(index == null){
                          _addExpence(_titleController.text, double.parse(_amountController.text), selectedDate, selectedCatagory);
                        }
                        else{
                          _updateExpence(index, _titleController.text, double.parse(_amountController.text), selectedDate, selectedCatagory);
                        }
                        _titleController.clear();
                        _amountController.clear();
                        Navigator.pop(context);
                        print("perform added button");
                      },
                      child: Text(
                        index == null?"Add Expense":"Update Expense",
                        style: const TextStyle(color: Colors.white),
                      ),
                  ),
                ],
              ),
            ),
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)
          )
        ),
        title: const Text(
            "Expense Tracker",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25,
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
          actions: [
            IconButton(
                onPressed: (){
                  showForm(context);
                },
                icon: const Icon(
                    Icons.add,
                  size: 30,
                ),
            )
          ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Center(
            child: Card(
              color: Colors.green,
              shadowColor: Colors.grey.shade800,
              elevation: 4,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(18)
                )
              ),
              child:  Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    const Text(
                      "Total Expense",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black
                    ),
                    ),
                    Text(
                      "\$$_total",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.red
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: _expence.length,
                itemBuilder: (context, index){
                  return Dismissible(
                    key: Key(_expence[index].hashCode.toString()),
                    background: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.blue,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 35),
                        child: Icon(Icons.edit),
                      ),
                    ),
                    secondaryBackground: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 300),
                        child: Icon(Icons.delete),
                      ),
                    ),
                    confirmDismiss: (direction)async {   //onDismissed
                      if (direction == DismissDirection.endToStart){
                        MyAlertDialog(context, ()=>_deleteExpence(index));
                        //_deleteExpence(index);
                        return false;
                      }
                      else if(direction == DismissDirection.startToEnd){
                        _editExpence(index);
                        return false;
                      }
                      return false;
                    },
                    child: GestureDetector(
                      onLongPress: (){
                        //_deleteExpence(index);
                        MyAlertDialog(context, ()=>_deleteExpence(index));
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                        elevation: 4,
                        color: Colors.grey.shade50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  _expence[index].category!,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                                _expence[index].title!,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                            ),
                          ),
                          subtitle:  Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                                //_expence[index].date.toString(),
                              DateFormat("dd MMMM yyyy").format(_expence[index].date),//[this is for this format(15-02-2025)'dd-MM-yyyy']
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          trailing:  Padding(
                            padding: const EdgeInsets.only(
                              right: 10
                            ),
                            child: Text(
                                "\$${_expence[index].amount.toString()}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 15,
        backgroundColor: Colors.green,
        onPressed: (){
          showForm(context);
        },
        child: const Icon(
            Icons.add,
            weight: 50,
          color: Colors.black,
        ),
      ),
    );
  }
}
