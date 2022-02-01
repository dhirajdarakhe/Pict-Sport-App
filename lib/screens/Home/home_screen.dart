import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/250?image=9',
                  ),
                ),
              ),
            ],
            leading: const Tab(
              icon: Icon(Icons.menu),
            ),
            pinned: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.35,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Hello: User_name'),
              background: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  gradient: RadialGradient(
                      colors: [Colors.red, Colors.blue],
                      radius: 1.65,
                      center: Alignment.topRight),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 10,
                  right: 10,
                  bottom: 7,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 170,
                      height: 170,
                      color: Colors.red,
                      margin: const EdgeInsets.only(right: 10),
                    ),
                    Container(
                      width: 170,
                      height: 170,
                      color: Colors.red,
                      margin: const EdgeInsets.only(right: 10),
                    ),
                    Container(
                      width: 170,
                      height: 170,
                      color: Colors.red,
                      margin: const EdgeInsets.only(right: 10),
                    ),
                    Container(
                      width: 170,
                      height: 170,
                      color: Colors.red,
                      margin: const EdgeInsets.only(right: 10),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(7),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 1.2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 8,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return SizedBox(
                    // margin: const EdgeInsets.symmetric(
                    //   vertical: 7,
                    //   horizontal: 9,
                    // ),
                    child: InkWell(
                      onTap: () {},
                      splashColor: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        // margin: const EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              child: Image.network(
                                'https://images.pexels.com/photos/112460/pexels-photo-112460.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: 190,
                                padding: const EdgeInsets.all(7),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'title',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: 8,
              ),
            ),
          )
        ],
      ),
    );

  }
}
