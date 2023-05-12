import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected_index = 1;

  final List items = [
    "All",
    "Category",
    "Category",
    "Category",
    "Category",
    "Category",
    "Category",
    "Category"
  ];
  final List<Widget> posts = [
    const Post1(),
    const Updates(),
    ViewPost(
        "https://www.world-grain.com/ext/resources/2023/02/17/wheat_NITR---STOCK.ADOBE.COM_e.jpg?height=667&t=1676647954&width=1080"),
    ViewPost(
        "https://cdn.downtoearth.org.in/library/large/2022-11-29/0.83936300_1669732931_wheat.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.green,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/images/logo.png"),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_active_outlined),
              iconSize: 30,
              color: Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: Colors.redAccent.shade100,
            ),
            const SizedBox(
              width: 10,
            )
          ],
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              height: 30,
              margin: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 20,
                    width: 70,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: selected_index == index
                                ? Colors.white
                                : Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: selected_index == index
                            ? Colors.green
                            : Colors.white),
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected_index = index;
                        });
                      },
                      child: Center(
                        child: Text(
                          items[index],
                          style: TextStyle(
                              color: selected_index == index
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(top: 5),
              child: posts[index],
            );
          },
        ),
      ),
    );
  }
}

class Updates extends StatefulWidget {
  const Updates({super.key});

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  final List<Widget> st = [
    const Story(),
    const Story(),
    const Story(),
    const Story()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: st.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return st[index];
          },
        ));
  }
}

class ViewPost extends StatefulWidget {
  late String? url;
  ViewPost(@required this.url);

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class Story extends StatefulWidget {
  const Story({super.key});

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: 60,
                      child: Image.asset("assets/images/remove.png"),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Know Your corp",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ViewPostState extends State<ViewPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/portrait-handsome-man-with-dark-hairstyle-bristle-toothy-smile-dressed-white-sweatshirt-feels-very-glad-poses-indoor-pleased-european-guy-being-good-mood-smiles-positively-emotions-concept_273609-61405.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Atin Singh",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("@atin")
                  ],
                ),
              ),
              const SizedBox(
                width: 180,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
            ],
          ),
          Image.network("${widget.url}"),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_outlined),
              ),
              const Text("110"),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mode_comment_outlined,
                ),
              ),
              const Text("10"),
              const SizedBox(
                width: 170,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_border_outlined,
                ),
              )
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: const Text(
              "Atin Singh",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, top: 10),
            child: const Text(
              "Agrichikitsa is the best solution for the agricultural Needs",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  fillColor: Colors.grey.shade300,
                  hintText: "Write a comment",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Post1 extends StatefulWidget {
  const Post1({super.key});

  @override
  State<Post1> createState() => _Post1State();
}

class _Post1State extends State<Post1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "     What's Happening ?",
              prefixIcon: Container(
                padding: const EdgeInsets.only(left: 10),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://img.freepik.com/free-photo/portrait-handsome-man-with-dark-hairstyle-bristle-toothy-smile-dressed-white-sweatshirt-feels-very-glad-poses-indoor-pleased-european-guy-being-good-mood-smiles-positively-emotions-concept_273609-61405.jpg"),
                  radius: 10,
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.photo_camera_back_outlined,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.gif_box_outlined,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.tag_faces_sharp,
                ),
              ),
              const SizedBox(
                width: 140,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Post",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
