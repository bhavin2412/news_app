import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/screens/phonePage/provider/phoneProvider.dart';
import 'package:provider/provider.dart';
import '../../../utility/apis/apiCall.dart';
import '../../phonePage/modal/phoneModal.dart';
import '../../phonePage/view/phoneNextPage.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  PhoneProvider? providerTrue;
  PhoneProvider? providerFalse;
  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<PhoneProvider>(context, listen: true);
    providerFalse = Provider.of<PhoneProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 6, right: 6, bottom: 6),
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: providerFalse!.countryList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          providerTrue!.countryCountFunction(index);
                        },
                        child: Text(
                          "${providerTrue!.countryList[index]}",
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        onPageChanged: (index, _) {
                          providerFalse!.countryChange(index);
                        },
                        autoPlay: true,
                        aspectRatio: 12 / 5,
                        autoPlayInterval: Duration(seconds: 3),
                      ),
                      itemCount: providerTrue!.countryImages.length,
                      itemBuilder: (context, index, realIndex) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "${providerTrue!.countryImages[index]}",
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: providerTrue!.countryImages
                        .asMap()
                        .entries
                        .map(
                          (e) => Container(
                            height: 10,
                            width: 10,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: providerFalse!.countryCount == e.key
                                    ? Colors.greenAccent
                                    : Colors.black),
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "News",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              FutureBuilder<PhoneModal?>(
                future:
                    ApiCall().callApi("${providerTrue!.changeCountryString}"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Not Fount"),
                    );
                  } else if (snapshot.hasData) {
                    List<Articles>? l1 = snapshot.data!.articles;
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: l1!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              providerFalse!.nextPage(l1[index]);
                              // providerTrue!.counter(index);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhoneNextPage(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: ListTile(
                                  leading: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    child: Image.network(
                                      "${l1[index].urlToImage}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Text("${l1[index].title}"),
                                  subtitle:
                                      Text("Author : ${l1[index].author}")),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },

                //  {
                //   if (snapshot.hasError) {
                //     return Text("${snapshot.hasError}");
                //   }
                //   else if(snapshot.hasData)
                //   {

                //   }
                //   else
                //   {

                //   }
                // }
              ),

              // InkWell(
              //   onTap: () {

              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => PhoneNextPage(),
              //       ),
              //     );
              //   },
              //   child: Container(
              //     child: Text("${providerTrue!.changeString}"),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
