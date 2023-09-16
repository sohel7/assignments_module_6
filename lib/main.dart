
import 'package:flutter/material.dart';

void main() => runApp(PhotoGalleryApp());

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhotoGalleryHomePage(),
    );
  }
}

class PhotoGalleryHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome to  Photo Gallery!',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Enter your search query',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Handle search text changes here
                },
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Image ${index + 1} clicked!'),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                         // 'https://via.placeholder.com/150',
                          'https://static.vecteezy.com/system/resources/thumbnails/013/182/804/small/little-bird-watercolor-hand-paint-free-png.png',
                          height: 100,
                          width: 100,
                        ),
                        Text('Caption ${index + 1}'),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Sample Photo 1'),
              subtitle: Text('Subtitle 1'),
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Sample Photo 2'),
              subtitle: Text('Subtitle 2'),
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Sample Photo 3'),
              subtitle: Text('Subtitle 3'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Photos Uploaded Successfully!'),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(

                    width: 50, // Set the circle's width
                    height: 50, // Set the circle's height
                    decoration: BoxDecoration(

                      shape: BoxShape.circle,
                      color: Colors.blue, // Circle's background color
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_upward, // Up arrow icon
                        size: 30, // Icon size
                        color: Colors.white, // Icon color
                      ),
                    ),
                  ),
                  SizedBox(height: 15), // Space between circle and text

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
