import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(103, 199, 187, 140)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My TODO List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Status {
  todo("To Do", Colors.red),
  ongoing("On Going", Color.fromARGB(255, 206, 206, 27)),
  done("Done", Colors.green);

  const Status(this.text, this.color);
  final String text;
  final Color color;
}

class Task {
  final Status status;
  final String title;
  final String description;

  Task(this.status, this.title, this.description);
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> tasksToDo = <Task>[
    Task(Status.todo, "Minha primeira Task TODO", "Minha primeira descrição"),
    Task(Status.todo, "Minha segunda Task TODO", "Minha segunda descrição"),
    Task(
        Status.todo, "Minha terceira Task TODO", "Minha terceira descrição"),
    Task(Status.todo, "Minha quarta Task TODO", "Minha quarta descrição")
  ];

  final List<Task> tasksOnGoing = <Task>[
    Task(Status.ongoing, "Minha primeira Task Ongoing",
        "Minha primeira descrição"),
    Task(Status.ongoing, "Minha segunda Task Ongoing",
        "Minha segunda descrição"),
    Task(Status.ongoing, "Minha terceira Task Ongoing",
        "Minha terceira descrição")
  ];

  final List<Task> tasksDone = <Task>[
    Task(Status.done, "Minha primeira Task DONE", "Minha primeira descrição"),
    Task(Status.done, "Minha segunda Task DONE", "Minha segunda descrição"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/imgs/background.jpg',
                fit: BoxFit.cover,
              )),
          Center(
            child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        tasksContainer(Status.todo, tasksToDo),
                        tasksContainer(Status.ongoing, tasksOnGoing),
                        tasksContainer(Status.done, tasksDone),
                      ]),
                ]),
          ),
        ],
      ),
    );
  }
}

Widget tasksContainer(Status status, List<Task> tasks) {
  return Container(
      key: ValueKey(status.text),
      height: 500,
      width: 300,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 239, 237, 237),
          ),
          color: const Color.fromARGB(255, 239, 237, 237),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(children: <Widget>[
                Text(status.text),
                const VerticalDivider(
                  color: Color.fromARGB(255, 225, 217, 217),
                ),
                Text(tasks.length.toString()),
              ]),
            ),
            Divider(
              color: status.color,
            ),
            tasksListView(
                tasks, status.color, '${status.text}-number: ${tasks.length}'),
          ],
        ),
      ));
}

Widget tasksListView(List<Task> tasks, themeColor, String key) {
  return Expanded(
    child: ListView.builder(
        key: ValueKey(key),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                border: Border.all(color: themeColor, width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: Text(tasks[index].title),
          );
        }),
  );
}
