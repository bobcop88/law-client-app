import 'package:flutter/material.dart';

Widget newsScrolling() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          width: 250,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Title of First News',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(15, 48, 65, 1)),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porta et diam sit amet ullamcorper. Aenean maximus vulputate pharetra. Aliquam tincidunt dolor id sollicitudin efficitur. Sed faucibus id lorem pharetra consectetur. Nunc pulvinar commodo metus sed suscipit. Nulla bibendum non velit ut elementum',
                        style: TextStyle(fontSize: 11.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Read More',
                        style: TextStyle(
                            fontSize: 12.0,
                            decoration: TextDecoration.underline,
                            color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color.fromRGBO(15, 48, 65, 1)),
              borderRadius: BorderRadius.circular(10)),
          width: 200,
          height: 130,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Title of First News',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(15, 48, 65, 1)),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porta et diam sit amet ullamcorper. Aenean maximus vulputate pharetra. Aliquam tincidunt dolor id sollicitudin efficitur. Sed faucibus id lorem pharetra consectetur. Nunc pulvinar commodo metus sed suscipit. Nulla bibendum non velit ut elementum',
                        style: TextStyle(fontSize: 11.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Read More',
                        style: TextStyle(
                            fontSize: 12.0,
                            decoration: TextDecoration.underline,
                            color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
