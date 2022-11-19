

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counsellor/Home_page.dart';
import 'package:counsellor/Product_detail_screen.dart';
import 'package:counsellor/shop_by_course.dart';
import 'package:counsellor/shortcut.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/link.dart';


class RepeatedText extends StatelessWidget {
  final String label;
  const RepeatedText({Key? key,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(label, style: TextStyle(color: Colors.grey.shade600,fontSize: 11.sp),);
  }
}


class collegetier extends StatefulWidget {
  const collegetier({Key? key}) : super(key: key);

  @override
  State<collegetier> createState() => _collegetierState();
}

class _collegetierState extends State<collegetier> {




  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade100.withOpacity(0.2),
        // drawer: DRAWER(),
        appBar:
        PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: SafeArea(
            child: AppBar(
                automaticallyImplyLeading: true,
                iconTheme: IconThemeData(color: Colors.black),
                elevation: 0.1,
                backgroundColor: Colors.white,
                title:Column(
                  // alignment: WrapAlignment.spaceAround,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    //       SizedBox(
                    //         height: 25,
                    //       ),
                    //       InkWell(
                    //       onTap: () {
                    // // Navigator.push(context,
                    // // MaterialPageRoute(builder: (context) => const SearchScreen()));
                    // },
                    //       child:
                    //       Container(
                    //
                    //         height: 20,
                    //         decoration: BoxDecoration(
                    //         border: Border.all(color: Colors.black, width: 1.4),
                    //         borderRadius: BorderRadius.circular(25)),
                    //         child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Row(
                    //           children: const [
                    //             Padding(
                    //               padding: EdgeInsets.symmetric(horizontal: 5),
                    //               child: Icon(
                    //                 Icons.search,
                    //                 color: Colors.grey,
                    //               ),
                    //             ),
                    //             Text(
                    //               'What are you looking for?  ',
                    //               style: TextStyle(fontSize: 12, color: Colors.grey),
                    //             ),
                    //           ],
                    //         ),
                    // Container(
                    //   height: 32,
                    //   // width: 75,
                    //   decoration: BoxDecoration(
                    //       color: Colors.yellow,
                    //       borderRadius: BorderRadius.circular(25)),
                    //   child: const Center(
                    //     child: Text(
                    //       'Search',
                    //       style: TextStyle(fontSize: 16, color: Colors.grey),
                    //     ),
                    //   ),
                    // )
                    //       ],
                    //         ),
                    //       ),
                    // ),


                    Text("Engineering College List", style: GoogleFonts.poppins(fontSize: 13.sp, color: Colors.black,fontWeight: FontWeight.w400),)
                  ],
                ),


                bottom:  TabBar(
                  isScrollable:  true,
                  indicatorColor: Colors.teal,
                  indicatorWeight: 6,
                  indicatorSize:TabBarIndicatorSize.label,


                  labelPadding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),

                  tabs: [

                    RepeatedText(label:'Tier-I Colleges'),

                    RepeatedText(label:'Tier-II Colleges'),
                    RepeatedText(label:'Tier-III Colleges'),
                    RepeatedText(label:'Tier-IV Colleges'),

                  ],




                ),
                actions:<Widget>[

                  // IconButton(
                  //     icon:Icon(
                  //         Icons.search,
                  //         color:Colors.black,
                  //       size: 18.sp,
                  //     ),
                  //     onPressed: (){
                  //
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) => const SearchScreen()));
                  //     }
                  // ),

                  // IconButton(
                  //     icon:Icon(
                  //       Icons.favorite_outline_sharp,
                  //       color:Colors.black,
                  //       size: 18.sp,
                  //     ),
                      // onPressed: (){
                      //
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (context) => const WishlistScreen()));
                      // }
                  // ),

                  SizedBox(width: 4.w,)

                  // IconButton(
                  //     icon:Icon(
                  //         Icons.balance_rounded,
                  //         color:Colors.black
                  //     ),
                  //     onPressed: (){}
                  // ),


                ]

            ),
          ),
        ),



        body: Material(
          child: TabBarView(
            children: [
             tier1(),
              tier2(),
              tier3(),
              tier4(),

            ],
          ),
        ),


      ),
    );
  }
}

// class belowthirty extends StatefulWidget {
//   const belowthirty({Key? key}) : super(key: key);
//
//   @override
//   State<belowthirty> createState() => _belowthirtyState();
// }
//
// class _belowthirtyState extends State<belowthirty> {
//   @override
//   Widget build(BuildContext context) {
//     final Stream<QuerySnapshot> _prodcutsStream = FirebaseFirestore.instance
//         .collection('collage').where('level',isEqualTo:'tier1' ).snapshots();
//     return Material(
//
//
//         child:
//
//        StreamBuilder<QuerySnapshot>(
//         stream: _prodcutsStream,
//
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//       if (snapshot.hasError) {
//         return const Text('Something went wrong');
//       }
//
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//
//       if (snapshot.data!.docs.isEmpty) {
//         return const Center(
//             child: Text(
//               'This category \n\n has no items yet !',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 26,
//                   color: Colors.blueGrey,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Acme',
//                   letterSpacing: 1.5),
//             ));
//       }
//       return
//         Padding(
//             padding:  EdgeInsets.all(6.0.h),
//             child:
//             Stack(
//
//                 children: <Widget>[
//
//
//                   SizedBox(
//                     height: 237.h,
//                     // width: 600,
//                     width: MediaQuery.of(context).size.width.w,
//                     child: GestureDetector(
//
//                           onTap: () {
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (context) =>
//                                     ProductDetailsScreen(
//                                         proList: snapshot.data!.docs[index]
//                                     )
//                                 ));
//                           },
//
//
//                       child:    Card(
//
//                                           borderOnForeground: false,
//                                           shadowColor: Colors.white,
//                                           surfaceTintColor: Colors.white,
//                                           elevation: 14,
//
//
//                                           shape: RoundedRectangleBorder(
//
//                                               borderRadius: BorderRadius.circular(
//                                                   10.r),
//
//                                               side: BorderSide(
//                                                 color: AppColors.Common, width: 1.w,)
//
//                                           ),
//
//                                           color: Colors.white,
//
//
//                                           child:
//                                           Container(
//
//                                             // color: Colors.red,
//                                             height: 300.h,
//
//                                             // width: size.width * 0.30,
//
//                                             margin: EdgeInsets.all(5.r),
//
//
//                                             decoration: BoxDecoration(
//
//                                               // color: Colors.green,
//
//                                               // border: Border.all(color:Colors.black54,width: 2.55),
//
//                                               borderRadius: BorderRadius.circular(
//                                                   1),
//
//                                               // image: DecorationImage(
//
//                                               // image: NetworkImage(
//                                               //     widget.product['Images'][0]),
//                                               // "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mbp-spacegray-select-202206?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1653493200207"),
//                                               // fit: BoxFit.fitWidth,
//                                             ),
//                                             child: CachedNetworkImage(
// //
//
//                                               fit: BoxFit.fitWidth,
//
//
//                                               imageUrl: widget.product['Images'][0],
//                                               placeholder: (context, url) =>
//                                                   Shimmer.fromColors(
//                                                     baseColor: Colors.grey[100]!,
//                                                     highlightColor: Colors.grey[400]!,
//                                                     period: Duration(seconds: 1),
//                                                     loop: 5,
//                                                     child: Container(
//                                                       height: 6,
//                                                       width: 6,
//                                                       color: Colors.black54,
//                                                     ),
//                                                   ),
//                                               errorWidget: (context, url, error) =>
//                                                   Image.asset(
//                                                       "Assests/images/bags/Notfound.jpg"),
// // errorWidget: (context, url, error) => Icon(Icons.error),
//                                             ),
//                                           ),
//                                         )
//                                 )
//                             ),
//
//                           );
//                         }
//
//                     ),
//                   )
//                 ]
//
//
//
//             )
//         )
//     );
//
//
//
//   }
// }







class ProductModel extends StatefulWidget {
  final dynamic product;


  const ProductModel({Key? key,
    required this.product
  }) : super(key: key);


  @override
  State<ProductModel> createState() => _ProductModelState();
}

class _ProductModelState extends State<ProductModel> {
  @override

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    late SharedPreferences prefs;




    return



      Material(
        child: Padding(
          padding:  EdgeInsets.all(6.0.w.h),
          child:
          Stack(

            children: <Widget>[


              SizedBox(
                height: 237.h,
                // width: 600,
                width: MediaQuery.of(context).size.width.w,
                child: GestureDetector(

                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            ProductDetailsScreen(
                                proList: widget.product
                            )
                        ));
                  },



                  child: Card(

                    borderOnForeground: false,
                    shadowColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    elevation: 14,


                    shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(10.r),

                        side: BorderSide(
                          color: AppColors.Common, width: 1.w,)

                    ),

                    color: Colors.white,


                    child:
                    Stack(
                      children: [



                         Container(

                            // color: Colors.red,
                         
                            // margin: EdgeInsets.all(5.r),


                            decoration: BoxDecoration(

                              // color: Colors.green,

                              // border: Border.all(color:Colors.black54,width: 2.55),

                              borderRadius: BorderRadius.circular(
                                  1),


                            ),
                            child:  Image.network(widget.product['image'][1])
                          ),



                        GestureDetector(
                          onTap:(){

                          } ,
                          child: Positioned(
                            bottom: 70,
                            right: 1.w,
                            left: 5,
                            child: Center(
                              child: Container(

                                // color: Colors.red,
                                height: 50.h,


                                width: size.width ,

                                margin: EdgeInsets.all(5.r),


                                decoration: BoxDecoration(

                                  // color: Colors.green,

                                  // border: Border.all(color:Colors.black54,width: 2.55),

                                  borderRadius: BorderRadius.circular(
                                      1),


                                ),
                                child:   CachedNetworkImage(
//

                                  fit: BoxFit.fitWidth,




                                  // imageUrl: widget.product['Images'][0],
                                  imageUrl: widget.product['image'][0],
                                  placeholder: (context, url) => Shimmer.fromColors(
                                    baseColor: Colors.grey[100]!,
                                    highlightColor: Colors.grey[400]!,
                                    period:Duration(seconds: 1),
                                    loop:2, child: Container(
                                    // height: 6,
                                    // width: 6,
                                    color: Colors.black54,
                                  ),
                                  ),
                                  errorWidget: (context, url, error) => Image.asset("Assests/images/bags/Notfound.jpg"),
// errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        ),




                        Positioned(
                          bottom: 8,
                            // left: .w,
                            right: 60.w,
                            child: Container(
                              // height: 22,
                              width: size.width * 0.54,
                              // color: Colors.black,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment
                                //     .start,
                                children: [
                                  SizedBox(height: 7.h,),
                                  Align(
                                      alignment: Alignment.center,


                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(vertical: 1.h),
                                        child: CustomText(
                                          text: widget.product['Proname'][0].replaceAll("  ","",),
                                          fontSize: 13.5.h,
                                          textdirection: TextDirection
                                              .ltr,
                                          weight: FontWeight.w500,
                                        ),
                                      )),
                                  // Align(
                                  //     alignment: Alignment.center,
                                  //     child: CustomText(text: "window 11",fontSize:14,)),

                                  Center(child: Text(widget.product['Proname'][1].replaceAll("  ","",),
                                  // Center(child: Text(headingname[0],
                                    style: TextStyle(fontSize: 11.h,fontWeight: FontWeight.w300), overflow: TextOverflow.ellipsis,maxLines: 2, )),
                                  // SizedBox(height: 2,),

                                  // Center(child: Text(widget.product['Proname'][3].replaceAll("  ","",),
                                  //   style: TextStyle(fontSize: 14),)),
                                  SizedBox(height: 4.h,),

                                  // ),
                                ],
                              ),
                            )

                        ),





                      ],
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




class tier1 extends StatefulWidget {
  const tier1({Key? key}) : super(key: key);

  @override
  State<tier1> createState() => _tier1State();
}

class _tier1State extends State<tier1> {
  @override
  Widget build (BuildContext context) {
    // for (var i = 0; i < number.length; ++i) {
    final Stream<QuerySnapshot> _prodcutsStream = FirebaseFirestore.instance
        .collection('college').where("tier", isEqualTo: '1').snapshots();
    // final product = snapshot.data!.docs[index];

    // const q =query(Price,orderBy("Score"));


    return
      StreamBuilder<QuerySnapshot>(
        stream: _prodcutsStream,

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text(
                  'This category \n\n has no items yet !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Acme',
                      letterSpacing: 1.5),
                ));
          }
          return SingleChildScrollView(
            child: Column(
              children: [


                SizedBox(
                  // height:2580,
                  width: 420,
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        ProductModel(product: snapshot.data!.docs[index],),
                  ),
                ),



              ],
            ),
          );
        },
      );

  }


}


class tier2 extends StatefulWidget {
  const tier2({Key? key}) : super(key: key);

  @override
  State<tier2> createState() => _tier2State();
}

class _tier2State extends State<tier2> {
  @override
  Widget build (BuildContext context) {
    // for (var i = 0; i < number.length; ++i) {
    final Stream<QuerySnapshot> _prodcutsStream = FirebaseFirestore.instance
        .collection('college').where("tier", isEqualTo: '2').snapshots();
    // final product = snapshot.data!.docs[index];

    // const q =query(Price,orderBy("Score"));


    return
      StreamBuilder<QuerySnapshot>(
        stream: _prodcutsStream,

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text(
                  'This category \n\n has no items yet !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Acme',
                      letterSpacing: 1.5),
                ));
          }
          return SingleChildScrollView(
            child: Column(
              children: [


                SizedBox(
                  // height:2580,
                  width: 420,
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        ProductModel(product: snapshot.data!.docs[index],),
                  ),
                ),



              ],
            ),
          );
        },
      );

  }


}


class tier3 extends StatefulWidget {
  const tier3({Key? key}) : super(key: key);

  @override
  State<tier3> createState() => _tier3State();
}

class _tier3State extends State<tier3> {
  @override
  Widget build (BuildContext context) {
    // for (var i = 0; i < number.length; ++i) {
    final Stream<QuerySnapshot> _prodcutsStream = FirebaseFirestore.instance
        .collection('college').where("tier", isEqualTo: '3').snapshots();
    // final product = snapshot.data!.docs[index];

    // const q =query(Price,orderBy("Score"));


    return
      StreamBuilder<QuerySnapshot>(
        stream: _prodcutsStream,

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text(
                  'This category \n\n has no items yet !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Acme',
                      letterSpacing: 1.5),
                ));
          }
          return SingleChildScrollView(
            child: Column(
              children: [


                SizedBox(
                  // height:2580,
                  width: 420,
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        ProductModel(product: snapshot.data!.docs[index],),
                  ),
                ),



              ],
            ),
          );
        },
      );

  }


}

class tier4 extends StatefulWidget {
  const tier4({Key? key}) : super(key: key);

  @override
  State<tier4> createState() => _tier4State();
}

class _tier4State extends State<tier4> {
  @override
  Widget build (BuildContext context) {
    // for (var i = 0; i < number.length; ++i) {
    final Stream<QuerySnapshot> _prodcutsStream = FirebaseFirestore.instance
        .collection('college').where("tier", isEqualTo: '4').snapshots();
    // final product = snapshot.data!.docs[index];

    // const q =query(Price,orderBy("Score"));


    return
      StreamBuilder<QuerySnapshot>(
        stream: _prodcutsStream,

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text(
                  'This category \n\n has no items yet !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Acme',
                      letterSpacing: 1.5),
                ));
          }
          return SingleChildScrollView(
            child: Column(
              children: [


                SizedBox(
                  // height:2580,
                  width: 420,
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        ProductModel(product: snapshot.data!.docs[index],),
                  ),
                ),



              ],
            ),
          );
        },
      );

  }


}
