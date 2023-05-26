import 'package:flutter/material.dart';
import 'package:plan_go/create_new_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchcontoller = TextEditingController();
  final List<String> items = [
    'Task1',
    'Task2',
    'Task3',
    'Task4',
    'Task5',
    'Task6',
    'Task7',
    'Task8',
    'Task9',
    'Task10',
  ];
  final GlobalKey<AnimatedListState> key = GlobalKey();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color.fromRGBO(245, 245, 245, 1.0),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: Colors.grey,
                ),
                Text(
                  'Lists',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
            borderSide: BorderSide(
              width: 5,
              color: Colors.blueGrey,
            ),
          ),
          splashColor: Colors.blueGrey,
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add_rounded,
            size: 55,
            color: Colors.blueGrey,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateNewTask()),
            );
          },
        ),
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1.0),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'HOME',
                style: TextStyle(fontSize: 35, color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                cursorColor: Colors.grey,
                cursorHeight: 30,
                controller: searchcontoller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    size: 45,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    borderSide: BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: AnimatedList(
                  key: key,
                  controller: scrollController,
                  initialItemCount: items.length,
                  itemBuilder: (context, index, animation) {
                    return SizeTransition(
                      sizeFactor: animation,
                      child: AnimatedListItem(
                        cardcolor: Colors.white,
                        onPressed: () {
                          deleteItem(index);
                        },
                        text: items[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void insertItem() {
    var index = items.length;
    items.add('item ${index + 1}');
    key.currentState!
        .insertItem(index, duration: const Duration(milliseconds: 1800));
    Future.delayed(const Duration(milliseconds: 300), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  void deleteItem(int index) {
    key.currentState!.removeItem(index,
        duration: const Duration(milliseconds: 200), (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: AnimatedListItem(
          cardcolor: const Color.fromARGB(255, 249, 132, 123),
          text: 'Deleting',
          onPressed: () {},
        ),
      );
    });
  }
}

class AnimatedListItem extends StatefulWidget {
  const AnimatedListItem(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.cardcolor})
      : super(key: key);
  final Color cardcolor;
  final String text;
  final VoidCallback onPressed;

  @override
  State<AnimatedListItem> createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      color: widget.cardcolor,
      child: ListTile(
        leading: Checkbox(
            activeColor: Colors.blueGrey,
            value: isChecked,
            onChanged: (newval) {
              setState(() {
                isChecked = newval;
              });
            }),
        title: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: IconButton(
          onPressed: widget.onPressed,
          icon: const Icon(
            Icons.delete_rounded,
          ),
        ),
      ),
    );
  }
}
