

import 'dart:ffi';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:counsellor/main.dart';
import 'package:counsellor/shop_by_course.dart';
import 'package:counsellor/shortcut.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/link.dart';
// import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';









List<String>Homepageview =[


  "usefulwebsite",
  "usefulwebsite"
  // "topcounselor",
  // "developmentcourseapp",
  // "developmentcoursewebsite",
  // "dsacourse",
  // "schloraship",
  // "drivingclassnearu",
  // "recommendeditems",


];



List<String>images=[

  "Assests/images/bags/apple.jpg",
  "Assests/images/bags/apple.jpg"
  // "Assests/images/bags/dell.png",
  // "Assests/images/bags/asus.jpg",
  // "Assests/images/bags/hp.jpg",
  // "Assests/images/bags/acer.png",
  // "Assests/images/bags/lenovo.jpg"


];


List<String>firebasename=[
  'firebasename',
  'firebasename'


];

List<String>headingname=[
  'Major Schloraship',
  'Major Schloraship'


];


List<String>coursename=[

  "usefulwebsite",
  // "usefulwebsite"

  "App Development",
  // "Web Development",
  // "D.S.A",
  // "Grapic Designer",
  // "Data Science",
  // "A.I",



];








class HomePageview extends StatefulWidget {
  final  String name;
  final  double height;
  const HomePageview({Key? key,required this.name,required this.height }) : super(key: key);

  @override
  State<HomePageview> createState() => _HomePageviewState();
}

class _HomePageviewState extends State<HomePageview> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        // height: MediaQuery.of(context).size.height-380,



          width: double.infinity,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(widget.name)

                  .snapshots(),

              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child:
                      SizedBox()

                  );
                }

                if (snapshot.data!.docs.isEmpty) {
                  return Center(
                      child: Text(
                          'You Have not \n\n Active Data !')
                  );
                }
                return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [


                      Container(
                        color: Colors.transparent,
                        //
                        height: widget.height,
                        width: 600.w,
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                            //   Column(
                            // // children: [
                            Link(
                                uri: Uri.parse(snapshot.data!.docs[index]['link']),
                                // target: LinkTarget.blank,
                                builder: (context, followLink) =>


                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child:
                                      SizedBox(
                                        height: 155.h,
                                        width: 205.w,
                                        child: Card(
                                          //
                                          borderOnForeground: false,
                                          // // color:Colors.teal,
                                          shadowColor: Colors.grey,
                                          // surfaceTintColor: Colors.grey,
                                          elevation: 30,


                                          shape: RoundedRectangleBorder(

                                            borderRadius: BorderRadius
                                                .circular(6.r),

                                            // side: BorderSide(
                                            //   // color: AppColors.Common,
                                            //   // color: Colors.blueGrey,
                                            //   width: 1.w,)

                                          ),

                                          // color: Colors.white,


                                          child: Column(

                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child:
                                                GestureDetector(
                                                  onTap:followLink,
                                                  child: Container(
                                                    height: 120.h,


                                                    margin: EdgeInsets.all(5.r),


                                                    decoration: BoxDecoration(
// color: Colors.green,


// border: Border.all(color:Colors.black54,width: 2.55),
                                                      color: Colors.transparent,
                                                      borderRadius: BorderRadius
                                                          .circular(1.r),
                                                    ),

                                                    child:   CachedNetworkImage(

                                                      width: 190.w,
                                                      fit: BoxFit.fitHeight,




                                                      imageUrl:  snapshot.data!.docs[index]['image'],
                                                      placeholder: (context, url) => Shimmer.fromColors(
                                                        baseColor: Colors.grey[100]!,
                                                        highlightColor: Colors.grey[400]!,
                                                        period:Duration(seconds: 1),
                                                        loop:8, child: Container(
                                                        color: Colors.black54,
                                                      ),
                                                      ),
                                                      // errorWidget: (context, url, error) => Icon(Icons.error),
                                                      errorWidget: (context, url, error) => Image.asset("Assests/images/bags/Notfound.jpg"),
                                                    ),

                                                  ),
                                                ),
                                              ),
                                              //
                                              Divider(height: 5.h,
                                                thickness: 1.sp,
                                                color: Colors.black,),

                                              // Spacer(flex:1),

                                              Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: CustomText(
                                                  text: snapshot.data!.docs[index]['Desc'],
                                                  fontSize: 13.sp,
                                                  height: 1.2,

                                                ),
                                              ),


                                              Spacer(flex:1),




                                              SizedBox(
                                                height: 15.h,
                                              )

                                            ],
                                          ),
                                        ),
                                      ),

                                    )
                            ),
                          ),
                        ),
                      ),]

                );

              }
          )
      );
  }
}





class CText extends StatelessWidget {
  final String label;
  final double? fontSize;


  const CText({Key? key,required this.label,this.fontSize,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w, ),
      child: CustomText(text:label,
        color: Colors.black,
        fontSize: 15.sp,
        weight: FontWeight.w400,

      ),
    );

  }
}




class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override



  Widget build(BuildContext context) {




            return
              SafeArea(
                child: Scaffold(


                    appBar:AppBar(
                        elevation: 0.2,
                        // shape: Border(
                        //     bottom: BorderSide(
                        //       width:1,
                        //       color: Colors.transparent,
                        //     )

                        // ),
                        automaticallyImplyLeading: true,
                        iconTheme: IconThemeData(color: Colors.black),
                        backgroundColor: Colors.white,
                        title: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text("Home",
                                    style: GoogleFonts.poppins(color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.5.sp
                                    ),),


                                  // ElevatedButton.icon(onPressed: (){},
                                  //     icon: Icon(Icons.search,color: Colors.black,),
                                  //     label: Text("Search it ")),


                                ]
                            ),


// Divider(height: 1,color: Colors.tealAccent,)


                          ],
                        ),
                        actions: <Widget>[
                          // IconButton(
                          //     icon:Icon(
                          //         Icons.search,
                          //         color:Colors.black
                          //     ),
                          //     onPressed: (){
                          //       Navigator.push(context,
                          //           MaterialPageRoute(builder: (context) => const SearchScreen()));
                          //     }
                          // ),

                          IconButton(
                              icon: Icon(
                                Icons.notifications_active_outlined,
                                color: Colors.black87,
                                size: 18.h,
                              ),
                              onPressed: () {
                                // Navigator.push(context,
                                // MaterialPageRoute(
                                //     // builder: (context) => const
                                //     // Alert()
                                //
                                // ));
// MaterialPageRoute(builder: (context) => c
                              }
                          ),
                          SizedBox(height: 3.h,),

                          IconButton(

                            icon: Icon(
                              Icons.share,
                              color: Colors.black87,
                              size: 18.h,
                            ),
                            onPressed: () async {
                              await Share.share(

                                  // '${snapshot.data!.docs[0]['share'].replaceAll("\\n","\n",).replaceAll("  ","",)}'
                                    " College counselor \n\nSolve All You  Douth regarding College\n"
                                  //       1.Which Laptop Specification is  Best For You Domain\n
                                  //       2. How to Get Maximum Discount on Purchasing Laptop\n
                                  //       3. Learn About Student Offer to Get instant 15 % Discount on Laptop\n
                                  //       4. Learn About All Pro & Con of Each Laptoop \n
                                  //       5. ONLINE Vs OFFLINE From where to Purchase & Many More\n\n
                                  // Downolads  Our Laptop Helping  App From PlayStore\n\n
                                  //     '${snapshot.data!.docs[0]['Review']}'
                                // //
                                //
                                //     "  'https://www.mirchi9.com/wp-content/uploads/2018/04/Kiara-Advani-3.jpg\n\n'  ' https://www.youtube.com/'"

                              );
                            },

                          ),


                        ]

                    ),


                    body: Container(
                        color: Colors.orange[30],
                        child: SingleChildScrollView(

                            child:
                            StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection(firebasename[0])

                                // .where ("Price" ,isEqualTo: "70k")
                                // .where('Price', isEqualTo: "40k"  )
                                // &&
                                //
                                // stream: FirebaseFirestore.instance
                                //     .collection('Products')
                                // // .where('Price', isEqualTo: "70k" )
                                //     .where('Price', isEqualTo: "40k"  )

                                    .snapshots(),

                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    return const Text('Something went wrong');
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Material(child: Center(child: SizedBox(
                                        child: CircularProgressIndicator())));
                                  }

                                  if (snapshot.data!.docs.isEmpty) {
                                    return Center(
                                        child: Text(
                                            'You Have not \n\n Active Data !')
                                    );
                                  }
                                  return
                                    Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [


                                          // SizedBox(
                                          //   height: 5,
                                          // ),


                                          // FakeSearch(),


                                          SizedBox(
                                            height: 10.h,
                                          ),

                                          Container(
                                            height: 185.h,
                                            width: 500.w,

                                            color: Colors.transparent,
                                            child: Swiper(
                                              // itemHeight: 245,
                                              // containerHeight: 155,
                                              // containerWidth: 120,
                                              // layout: SwiperLayout.TINDER,
                                              // itemWidth: 350,
                                              itemCount: snapshot.data!.docs.length,
                                              viewportFraction: 1,
                                              scale: 0.4,
                                              // autoplay: true,
                                              pagination: SwiperPagination(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0.0, 0.0, 0.0, 10.0),
                                                  builder: DotSwiperPaginationBuilder(
                                                      color: Colors.white,
                                                      activeColor: Colors.black,
                                                      size: 4.0.h,
                                                      activeSize: 10.0.h)),
                                              itemBuilder: (context, index) {
                                                return Link(


                                                  // uri: Uri.parse('/Adv_1'),
                                                  uri: Uri.parse(snapshot.data!
                                                      .docs[index]['link']),
                                                  //   uri: Uri.parse("https://www.mirchi9.com/wp-content/uploads/2018/04/Kiara-Advani-3.jpg"),
                                                  // target: LinkTarget.blank,
                                                  builder: (context, followLink) =>

                                                      GestureDetector(
                                                        onTap: followLink,

                                                        child:
                                                        // Container(


                                                        Container(
                                                          width: 190.w,


                                                          child: CachedNetworkImage(

                                                            width: 190.w,
                                                            fit: BoxFit.fill,


                                                            imageUrl: snapshot.data!
                                                                .docs[index]['Images'],
                                                            placeholder: (context,
                                                                url) =>
                                                                Shimmer.fromColors(
                                                                  baseColor: Colors
                                                                      .grey[100]!,
                                                                  highlightColor: Colors
                                                                      .grey[400]!,
                                                                  period: Duration(
                                                                      seconds: 1),
                                                                  loop: 8,
                                                                  child: Container(
                                                                    color: Colors
                                                                        .black54,
                                                                  ),
                                                                ),
                                                            errorWidget: (context,
                                                                url, error) =>
                                                                Icon(Icons.error),
                                                          ),
                                                        ),
                                                      ),


                                                  // CachedNetworkImage(
                                                  //     key:UniqueKey(),
                                                  //     imageUrl:"https://brandlogos.net/wp-content/uploads/2011/05/dell-3d-logo-vector-01.png",
                                                  //     // snapshot.data!
                                                  //     //     .docs[index]['Images'],
                                                  //     placeholder:(context,url)=> Container(color: Colors.black12,)
                                                  //
                                                  //
                                                  // ),
                                                  //   fit: BoxFit.fill,
                                                  // ),

                                                  // ),
                                                  // )
                                                  // )
                                                );
                                              },

                                            ),
                                          ),

                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w, vertical: 6.h),
                                            child: CustomText(text: headingname[1],
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              weight: FontWeight.w400,

                                            ),
                                          ),
                                          // Text("Shop By Brand",style: TextStyle(color: Colors.red),),
                                          //


                                          Container(
                                            height: 75.h,
                                            // width: 50,
                                            // color: Colors.teal,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w, vertical: 1.h),
                                              child: ListView.builder(
                                                  itemCount: images.length,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (context, index) =>

                                                      GestureDetector(
                                                        onTap: () =>
                                                        {

// Navigator.pushNamed(context, "/thi");

                                                          Navigator.push(context,
                                                              MaterialPageRoute(
                                                                  builder: (
                                                                      context) =>
                                                                      shopByBrand(
                                                                          course: coursename[index]
                                                                      )
                                                              )),
// MaterialPageRoute(builder: (context) => const SearchScreen()));
                                                        },
                                                        // Navigator.pushNamed(context, goview[index]) ,

                                                        child:
                                                        Padding(
                                                          padding:  EdgeInsets
                                                              .all(0.5.h.w),
                                                          child:
                                                          Stack(

                                                            children: <Widget>[


                                                              SizedBox(
                                                                  height: 60.h,
                                                                  width: 90.w,
                                                                  child: CircleAvatar(
                                                                      backgroundColor: Colors
                                                                          .grey,
                                                                      foregroundColor: Colors
                                                                          .teal,


                                                                      backgroundImage:
                                                                      AssetImage(
                                                                          images[index])

                                                                  )

                                                              )

                                                            ],
                                                          ),

                                                        ),
                                                      )
                                              ),
                                            ),
                                          ),

                                          // SizedBox(height: 10,),


                                          CText(label: headingname[0]),


                                          HomePageview(
                                            name: Homepageview[0],
                                            height: 295.h,
                                          ),

                                          CText(label: headingname[0]),

                                          HomePageview(
                                            name: Homepageview[0],
                                            height: 295.h,
                                          ),

                                          CText(label: headingname[0]),

                                          HomePageview(
                                            name: Homepageview[0],
                                            height: 275.h,
                                          ),




                                        CText(label: headingname[0]),


                                          HomePageview(
                                            name: Homepageview[0],
                                            height: 275.h,
                                          ),


                                        ]
                                    );
                                }
                            )
                        )
                    )
                ),
              );


  }
}









