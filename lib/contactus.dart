import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:foreverfit/resource/resource.dart';

class contact extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Use the old theme but apply the following three changes
          textTheme: Theme.of(context).textTheme.apply(
              fontFamily: "Geometria",
              bodyColor: Colors.black,
              displayColor: Colors.black)),

      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: Colors.teal,
        body: ContactUs(
        email: 'nnpatel4583@gmail.com',
          companyName: 'ForeverFit',

          phoneNumber: '9825985414',
          linkedinURL: 'http://linkedin.com/in/nisarg-patel-3054a217a',
          tagLine: 'Commit To Be Fit',
          twitterHandle: 'the_nisarg_',
        ),
        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'ForeverFit',
          textColor: Colors.white,
          fontSize: 18,
          backgroundColor: Colors.black12,
          email: 'nnpatel4583@gmail.com',
        ),
      ),
    );
  }
}
