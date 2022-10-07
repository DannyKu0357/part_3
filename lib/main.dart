import 'package:flutter/material.dart';

const Color darkBlue = Colors.lightBlue;

//Модель данных
class Cars {
  int year = 0;
  String marka = '';
  String country = '';
  String engine = '';
  String avatar = '';
  Cars(
      {this.year = 0,
      this.marka = '',
      this.country = '',
      this.engine = '',
      this.avatar = ''});
}

//объявление переменной списка с типом данных User
List<Cars> carList = [
  Cars(
    year: 1991,
    marka: 'ВАЗ 2115',
    country: 'Россия',
    engine: '1.5',
    avatar:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/VAZ-2115.jpg/305px-VAZ-2115.jpg',
  ),
  Cars(
      year: 1999,
      marka: 'Toyota Camry',
      country: 'Япония',
      engine: '3.5',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/1998_Toyota_Camry_%28SXV20R%29_CSX_sedan_%282015-07-09%29_01.jpg/220px-1998_Toyota_Camry_%28SXV20R%29_CSX_sedan_%282015-07-09%29_01.jpg'),
  Cars(
      year: 1998,
      marka: 'Toyota Corolla',
      country: 'Япония',
      engine: '3.5',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/2000_Toyota_Corolla_%28AE112R%29_Conquest_sedan_%282015-07-03%29_01.jpg/305px-2000_Toyota_Corolla_%28AE112R%29_Conquest_sedan_%282015-07-03%29_01.jpg'),
  Cars(
      year: 1997,
      marka: 'Toyota Corolla Fielder',
      country: 'Япония',
      engine: '3.5'),
  Cars(
      year: 1996,
      marka: 'Toyota Carina',
      country: 'Япония',
      engine: '3.5',
      avatar:
          'https://commons.wikimedia.org/wiki/File:1998_Toyota_Camry_(SXV20R)_CSX_sedan_(2015-07-09)_01.jpg#/media/Файл:1998_Toyota_Camry_(SXV20R)_CSX_sedan_(2015-07-09)_01.jpg'),
  Cars(year: 1995, marka: 'Toyota Carina ED', country: 'Япония', engine: '3.5'),
  Cars(year: 1994, marka: 'Toyota RAV4', country: 'Япония', engine: '3.5'),
  Cars(year: 1993, marka: 'Toyota Town Ace', country: 'Япония', engine: '3.5'),
  Cars(year: 1993, marka: 'Toyota Supra', country: 'Япония', engine: '3.5'),
  Cars(year: 1993, marka: 'Toyota 4Runner', country: 'Япония', engine: '3.5'),
  Cars(year: 1993, marka: 'Toyota Hiace', country: 'Япония', engine: '3.5'),
  Cars(year: 1991, marka: 'Toyota Raum', country: 'Япония', engine: '3.5'),
  Cars(year: 2000, marka: 'Toyota Sprinter', country: 'Япония', engine: '3.5'),
  Cars(year: 2000, marka: 'Toyota Mark 2', country: 'Япония', engine: '3.5'),
  Cars(year: 2000, marka: 'Toyota Mark X', country: 'Япония', engine: '3.5'),
  Cars(year: 2009, marka: 'Toyota Wish', country: 'Япония', engine: '3.5'),
  Cars(year: 2003, marka: 'Toyota Han', country: 'Япония', engine: '3.5'),
  Cars(year: 2003, marka: 'Toyota Solo', country: 'Япония', engine: '3.5'),
  Cars(year: 2004, marka: 'Toyota Den', country: 'Япония', engine: '3.5'),
  Cars(year: 2004, marka: 'Toyota Mine', country: 'Япония', engine: '3.5'),
  Cars(year: 2004, marka: 'Toyota Amaterasu', country: 'Япония', engine: '3.5'),
  Cars(year: 2004, marka: 'Toyota Gasai', country: 'Япония', engine: '3.5'),
  Cars(year: 2004, marka: 'Toyota Grey', country: 'Япония', engine: '3.5'),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  //Основной виджет экрана
  @override
  Widget build(BuildContext context) {
    //формирование списка студентов
    return ListView.builder(
      itemCount: carList.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(index.toString() +
                ' ' +
                carList[index].marka +
                ' ' +
                carList[index].country), // ФИ студента
            subtitle: Text('Год выпуска: ' +
                carList[index].year.toString()), //Возраст студента
            onTap: () {
              //Переход на экран просмотра инфлрмации о студенте
              //Переход на экран просмотра инфлрмации о студенте
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetailScreen(
                    year: carList[index].year,
                    marka: carList[index].marka,
                    country: carList[index].country,
                    engine: carList[index].engine,
                    avatar: carList[index].avatar,
                  ),
                ),
              );
            });
      },
    );
  }
}

//Виджет детального просмотра студента
class StudentDetailScreen extends StatelessWidget {
  final int year;
  final String marka;
  final String country;
  final String engine;
  final String avatar;

  const StudentDetailScreen(
      {Key? key,
      required this.year,
      this.marka = '',
      this.country = '',
      this.engine = '',
      this.avatar = ''})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Text('$marka $country'),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            )),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0), //add border radius
                child: Image.network(
                  "$avatar",
                  height: 250.0,
                  width: 400.0,
                  fit: BoxFit.cover,
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$marka',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Год выпуска: ', style: TextStyle(fontSize: 16)),
                        Text('$year', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Страна: ', style: TextStyle(fontSize: 16)),
                        Text('$country', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Двигатель: ', style: TextStyle(fontSize: 16)),
                        Text('$engine', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
