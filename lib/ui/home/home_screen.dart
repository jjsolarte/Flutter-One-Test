import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: index);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('App Ventas'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //Swiper
              Expanded(
                flex: 3,
                child: Container(
                  child: new Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new FadeInImage.assetNetwork(
                        placeholder: 'assets/images/foto1.png',
                        image:
                            'https://s.france24.com/media/display/822b933a-cab5-11e9-9245-005056bf87d6/w:1280/p:4x3/uefa_champions_league_0.jpg',
                        fit: BoxFit.cover,
                      );
                    },
                    // indicatorLayout: PageIndicatorLayout.COLOR,
                    layout: SwiperLayout.STACK,
                    itemHeight: size.height * 0.3,
                    itemWidth: size.width * 0.8,
                    // autoplay: true,
                    itemCount: 2,
                    pagination: new SwiperPagination(),
                    // control: new SwiperControl(),
                  ),
                ),
              ),

              //MainInfo
              Expanded(
                flex: 10,
                child: PageView(
                  controller: _pageController,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: VistaOpt(),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text('Home'),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text('Profile'),
                      ),
                    ),
                  ],
                  onPageChanged: (indexPage) {
                    index = indexPage;
                  },
                ),
              ),

              //Menu
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            index = 0;
                            setState(() {});
                            _pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linearToEaseOut);
                          },
                          child: Icon(Icons.calendar_today_outlined)),
                      InkWell(
                          onTap: () {
                            index = 1;
                            setState(() {});
                            _pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linearToEaseOut);
                          },
                          child: Icon(Icons.home)),
                      InkWell(
                          onTap: () {
                            index = 2;
                            setState(() {});
                            _pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linearToEaseOut);
                          },
                          child: Icon(Icons.person)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class VistaOpt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Opciones',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        subtitle: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 15,),
                Text('Favoritos')
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 15,),
                Text('Favoritos')
              ],
            ),SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 15,),
                Text('Favoritos')
              ],
            ),SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 15,),
                Text('Favoritos')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

