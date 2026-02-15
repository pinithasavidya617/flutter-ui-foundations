import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/img/wallet.png',
            fit: BoxFit.fitWidth,),
          ),
          Center(
            child: Image.network('https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            loadingBuilder: (context, child, loadingProgress){
              if(loadingProgress == null) return child;
              return Center(child: const CircularProgressIndicator(),);
            },),
          )
        ],
      ),
    );
  }
}
