import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'login.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 123, 21, 21),
          primary: Color.fromARGB(255, 24, 35, 74),
          secondary: Color.fromARGB(255, 184, 32, 32)       
        ),
        primarySwatch: Colors.deepOrange, 
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this .title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  List<String> listaImagens = [
    'https://images.unsplash.com/photo-1675663186185-a53733496b74?auto=format&fit=crop&q=80&w=2104&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1679621219668-2649b35d0021?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1pYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1508974239320-0a029497e820?auto.format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  List<Map<String, String>> listaCarros = [
    {
    "carro": "Ferrari",
    "modelo": "F40",
    "ano": "1987",
    "preco": "R\$ 1.679.000,00",
    "image": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages8.alphacoders.com%2F360%2F360535.jpg&f=1&nofb=1&ipt=c99f42fc4c296f0a25ae8a054b0fc9c461e5642ada2f502cbc0900a710bb61ee&ipo=images",
  },
  {
   "carro": "maserati",
    "modelo": "GranTurismo",
    "ano": "2018",
    "preco": "R\$ 1.985.000,00",
    "image": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fthecarguy.com.au%2Fwp-content%2Fuploads%2F2018%2F02%2FLarge-12937-GranTurismoSportMY18a.jpg&f=1&nofb=1&ipt=82a8753483798dc7dd2b39d3538d484e75f31b70133572d4838ad8270c53a0d9&ipo=images",
  },
  {
    "carro": "Lamborghini",
    "modelo": "Aventador",
    "ano": "2018",
    "preco": "R\$ 1.479.000,00",
    "image": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.lamborghini.com%2Fsites%2Fit-en%2Ffiles%2FDAM%2Flamborghini%2Fmodel%2Faventador%2Faventador-sv%2Fslider%2Faventador-sv.jpg&f=1&nofb=1&ipt=5393b9bc7f4af3ac0905b181c5e9b548ce577cfc58c535519104297bb644ad0b&ipo=images",
  }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Carrossel
            CarouselSlider(
              items: listaImagens.map((url) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 20, 
                  height: 230,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary, 
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 200,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
        
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40, 
              color: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.only(left: 10, top: 0, bottom: 0),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Carros mais exclusivos do mundo',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
            
            // cards com imagnes e texto dos carros
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              
              padding: const EdgeInsets.all(10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: listaCarros.map((carro) {
                  return Container(
                    width: 250,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          carro['image'] ?? '', // Use '' (string vazia) se carro['image'] for nulo
                          height: 77,
                          width: 250,
                          fit: BoxFit.cover,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Carro: ${carro["carro"]}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                              Text('Modelo: ${carro["modelo"]}', style: const TextStyle(fontSize: 14, color: Colors.white)),
                              Text('Ano: ${carro["ano"]}', style: const TextStyle(fontSize: 14, color: Colors.white)),
                              Text('Preço: ${carro["preco"]}', style: const TextStyle(fontSize: 14, color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              
              padding: const EdgeInsets.all(10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: listaCarros.map((carro) {
                  return Container(
                    width: 250,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          carro['image'] ?? '', // Use '' (string vazia) se carro['image'] for nulo
                          height: 77,
                          width: 250,
                          fit: BoxFit.cover,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Carro: ${carro["carro"]}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                              Text('Modelo: ${carro["modelo"]}', style: const TextStyle(fontSize: 14, color: Colors.white)),
                              Text('Ano: ${carro["ano"]}', style: const TextStyle(fontSize: 14, color: Colors.white)),
                              Text('Preço: ${carro["preco"]}', style: const TextStyle(fontSize: 14, color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            // footer
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80, 
              color: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.only(left: 10, top: 0, bottom: 0),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



