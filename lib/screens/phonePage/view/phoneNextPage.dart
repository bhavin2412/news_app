import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../provider/phoneProvider.dart';

class PhoneNextPage extends StatefulWidget {
  @override
  State<PhoneNextPage> createState() => _PhoneNextPageState();
}

class _PhoneNextPageState extends State<PhoneNextPage> {
  PhoneProvider? providerTrue;
  PhoneProvider? providerFalse;
  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<PhoneProvider>(context, listen: true);
    providerFalse = Provider.of<PhoneProvider>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                "${providerTrue!.artical!.urlToImage}",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              // color: Colors.white,
              child: (Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text("TItle"),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            "${providerTrue!.artical!.title}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(color: Colors.black)
                      ],
                    ),
                  )
                ],
              )),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text("${providerTrue!.artical!.description}"),
            ),
            Divider(color: Colors.black),
            TextButton(
                onPressed: () async {
                  final url = Uri.parse('${providerTrue!.artical!.url}');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(
                      url,
                    ); //forceWebView is true now
                  } else {
                    throw 'Could not launch $url';
                  }
                  // Future<void> _launchUrl() async {
                  //   if (!await launchUrl()) {
                  //     throw Exception(
                  //         'Could not launch providerTrue!.artical?.url as Uri');
                  //   }
                  // }
                },
                child: Text("READ MORE.."))
          ],
        ),
      ),
    );
  }
}
