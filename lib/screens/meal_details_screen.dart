import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/constant.dart';
import 'package:meal_app/models/meal.dart';

class MealDetailsScreen extends StatefulWidget {
  static const String path = 'MealDetailsScreen';
  final Function addFavourite;
  final Function isMealFavourite;
  const MealDetailsScreen(this.addFavourite, this.isMealFavourite);

  @override
  _MealDetailsScreenState createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //====================
  List<bool> inputs = List<bool>();
  @override
  // ignore: must_call_super
  void initState() {
    setState(() {
      for (int i = 0; i < 20; i++) {
        inputs.add(false);
      }
    });
  }

//===============================
  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.grey,
              size: 30,
            ),
            onPressed: () => delShowDialog(context, meal),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              imgCover(meal.imageUrl),
              txtTitle("ingredients", context),
              listScrollView(
                listName: meal.ingredients,
                scrollController: _scrollController,
              ),
              txtTitle('Steps:', context),
              listScrollView(
                listName: meal.steps,
                scrollController: _scrollController2,
                borderColor: Colors.blueAccent,
                function: (context, index) => stepsChild(index, meal),
                height: 250,
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.addFavourite(meal.id);
        },
        child: widget.isMealFavourite(meal.id)
            ? Icon(
                Icons.favorite,
                size: 30,
                color: K.thColor,
              )
            : Icon(Icons.favorite_border),
      ),
    );
  }

  Future delShowDialog(BuildContext context, Meal meal) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Delete ?',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              'you will delete this meal...',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(meal.id);
                },
                child: Text('ok'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('cancel'),
              )
            ],
          );
        });
  }

  Widget stepsChild(index, Meal meal) {
    return Container(
      decoration: BoxDecoration(
          color: K.SecColor, borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.only(bottom: 5),
      child: ListTile(
        onTap: () {
          setState(() {
            inputs[index] = !inputs[index];
          });
          // ignore: unnecessary_statements
          inputs[index] ? showSnackCompleted(index) : null;
        },
        trailing: inputs[index]
            ? Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 30,
              )
            : Icon(
                Icons.check_circle_outline,
                color: Colors.white,
                size: 30,
              ),
        leading: CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.blueAccent,
          child: Text(
            '#${index + 1}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        title: Text(meal.steps[index]),
      ),
    );
  }

  showSnackCompleted(index) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Container(
            height: 20,
            child: Center(
                child: Text(
              'Step ${index + 1} Completed   ✔',
              style: TextStyle(color: Colors.black),
            ))),
        backgroundColor: Colors.white,
        width: MediaQuery.of(context).size.width * .6,
        behavior: SnackBarBehavior.floating,

        // margin: EdgeInsets.only(bottom: 200),
        shape: StadiumBorder(),
      ),
    );
  }

  Widget imgCover(String url) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: K.PrimaryColor,
        borderRadius: BorderRadius.circular(5.0),
        image: DecorationImage(
            image: NetworkImage(
              url,
            ),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget listScrollView(
      {@required List listName,
      @required ScrollController scrollController,
      Color borderColor = Colors.amber,
      Function function,
      double height}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: height ?? 140,
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black38,
          border: Border.all(
            width: 1.5,
            color: borderColor ?? Colors.amber,
          ),
          borderRadius: BorderRadius.circular(10.0)),
      child: Scrollbar(
        isAlwaysShown: true,
        thickness: 3.0,
        controller: scrollController,
        child: ListView.builder(
          controller: scrollController,
          itemBuilder: function ??
              (context, index) {
                return Container(
                    color: K.SecColor,
                    margin: EdgeInsets.only(bottom: 5),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    // height: 40,
                    child: Text(listName[index]));
              },
          itemCount: listName.length,
        ),
      ),
    );
  }

  Widget txtTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            // ignore: deprecated_member_use
            .title
            .copyWith(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
