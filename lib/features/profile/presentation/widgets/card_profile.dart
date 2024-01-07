import 'package:flutter/material.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({
    super.key,
    required this.nama,
    required this.umur,
    required this.nrp,
    required this.imgUrl,
  });

  final String nama;
  final String umur;
  final String nrp;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          border: Border.all(color: Colors.purple, width: 0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(105, 255, 130, 240),
              blurRadius: 8,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Row(
        children: [
          Container(
            width: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: AssetImage(imgUrl), fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '$umur Years old',
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  nrp,
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
