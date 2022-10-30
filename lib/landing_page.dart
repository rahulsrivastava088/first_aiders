import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.google.com/maps/search/hospitals+near+me/');

class LandingPage extends StatelessWidget {
  const LandingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          'First Aiders',
          style: TextStyle(
            fontSize: 40,
            color: Colors.green.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        elevation: 0,
      ),

      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.greenAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 250,
                child: Image.asset('assets/images/hospital.png'),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 350,
                height: 100,
                decoration : BoxDecoration(
                  color: Colors.green.shade900,
                    borderRadius: BorderRadius.circular(50),
                  ),
                child: GestureDetector(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Show Hospitals near me',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),),
                    ),
                  ),
                  onTap : _launchUrl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}