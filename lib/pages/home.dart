import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;

    // set background
    String bgImg = data["isDay"] ? 'day.jpg' : 'night.jpg';
    Color bkClr = data["isDay"] ? Colors.blueAccent : Colors.black87;
    return Scaffold(
      backgroundColor: bkClr,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                ElevatedButton.icon(
                    onPressed: () async{
                      dynamic results =  await Navigator.pushNamed(context, '/location') as Map;
                      setState(() {
                          data['time'] = results['time'];
                          data['location'] = results['location'];
                          data['flag'] = results['flag'];
                          data['isDay'] = results['isDay'];
                      });
                    },
                    icon: const Icon(
                      Icons.edit_location,
                      color: Colors.black,
                    ),
                  label: Text(
                      "edit location",
                       style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18.0,
                      ),
                  ),
                  style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                        data['location'],
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 22.0,
                          fontWeight: FontWeight.w900,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
