import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:collection/collection.dart';
import 'package:counsellor/shortcut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/link.dart';









class ProductDetailsScreen extends StatefulWidget {
  final dynamic proList;
  const ProductDetailsScreen({Key? key,required this.proList })
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  // final Stream<QuerySnapshot> _prodcutsStream = FirebaseFirestore.instance
  //     .collection('Products').snapshots();

  bool  view_more = false;
  bool passwordVisible =false;
  bool question = true;
  bool information= false;

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {



    // late List<dynamic> imagesList = widget.proList['proimages'];
    //
    // var onSale = widget.proList['discount'];
    // var existingItemCart = context.read<Cart>().getItems.firstWhereOrNull(
    //         (element) => element.documentId == widget.proList['proid']);
    return Material(
      child: SafeArea(
        child: ScaffoldMessenger(
          key: _scaffoldKey,
          child: Scaffold(
            drawer: SizedBox(
              width: 250,
              child: Drawer(
                // backgroundColor: AppColors.black,
              ),
            ),

body:

             SingleChildScrollView(
              child: Container(
                color: Color(0xFF0D1F3D),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(2.0),
                    //   child: Icon(Icons.drag_indicator_outlined,size: 30,),
                    // ),



                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 25),
                      child: Center(
                        child: RichText(




                                              // textDirection: TextDirection.ltr,

                                              textScaleFactor: 1.1,
                                              text: TextSpan(
                                                text: "College",
                                                style: TextStyle(
                                                    fontSize: 29,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),


                                                children: const <TextSpan>[


                                                  TextSpan(
                                                      text: " Counselor\n", style: TextStyle(fontWeight: FontWeight.w400,color: Colors.deepOrange,fontSize: 29)),




                                                ],

                                              ),
                                            ),
                      ),
                    ),

                  ],
                ),



                 Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.19,
                            width: 220,
                            child:
                                  Container(
                                    height: 150,
// width: 190.w,

// color: Colors.red,


                                    child:   CachedNetworkImage(

// width: 190.w,
                                      fit: BoxFit.fitWidth,



                                      imageUrl: widget.proList['image'][0],
                                      placeholder: (context, url) => Shimmer.fromColors(
                                        baseColor: Colors.grey[100]!,
                                        highlightColor: Colors.grey[400]!,
                                        period:Duration(seconds: 1),
                                        loop:4, child: Container(
                                        color: Colors.black54,
                                      ),
                                      ),
                                      errorWidget: (context, url, error) => Image.asset("Assests/images/bags/Notfound.jpg"),
// errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),



                            ),
                          ),

                          // Positioned(
                          //     right: 15,
                          //     top: 12,
                          //     child: IconButton(
                          //
                          //       icon:Icon(
                          //           Icons.share,
                          //           color:Colors.black
                          //       ),
                          //       onPressed: ()async{
                          //         await Share.share( " LAPTOP EXPERT \n\nSolve All You  Douth regarding Laptop\n"
                          //             "1.Which Laptop Specification is  Best For You Domain\n"
                          //             "2. How to Get Maximum Discount on Purchasing Laptop\n"
                          //             "3. Learn About Student Offer to Get instant 15 % Discount on Laptop\n"
                          //             "4. Learn About All Pro & Con of Each Laptoop \n"
                          //             "5. ONLINE Vs OFFLINE From where to Purchase & Many More\n\n"
                          //
                          //         // "4. How to Get Maximum Discount while Purchasing Laptop \n"
                          //         // "5. Learn About Student Offer to Get instant 15 % Discount on Laptop\n"
                          //             "Downolads  Our Laptop Helping  App From PlayStore\n\n "
                          //             "  'https://www.mirchi9.com/wp-content/uploads/2018/04/Kiara-Advani-3.jpg\n\n'  ' https://www.youtube.com/'");
                          //       },
                          //
                          //     )),


                          // Positioned(
                          //     right: 12,
                          //     top: 60,
                          //     child: IconButton(
                          //         onPressed: () {
                          //           var existingItemWishlist = context
                          //               .read<Wish>()
                          //               .getWishItems
                          //               .firstWhereOrNull((product) =>
                          //           product.documentId ==
                          //               widget.proList['Proid']);
                          //           existingItemWishlist != null
                          //               ? context
                          //               .read<Wish>()
                          //               .removeThis(widget.proList['Proid'])
                          //               : context.read<Wish>().addWishItem(
                          //             widget.proList['Proname'],
                          //
                          //             widget.proList['Benchmark'],
                          //             widget.proList['BenchmarkScore'],
                          //             widget.proList['Price'],
                          //             widget.proList['Prodesc'],
                          //             1,
                          //
                          //             widget.proList['Amazon'],
                          //             widget.proList['Flipkart'],
                          //             widget.proList['Images'],
                          //             widget.proList['Proid'],
                          //             // widget.product['sid'],
                          //           );
                          //           return print("jjjjjjjjjjj");
                          //         },
                          //         icon: context
                          //             .watch<Wish>()
                          //             .getWishItems
                          //             .firstWhereOrNull((product) =>
                          //         product.documentId ==
                          //             widget.proList['Proid']) !=
                          //             null
                          //             ? const Icon(
                          //           Icons.favorite,
                          //           color: Colors.red,
                          //           size: 26,
                          //         )
                          //             : const Icon(
                          //           Icons.favorite_outline,
                          //           color: Colors.black,
                          //           size: 26,
                          //         ))),



                          //
                          // Positioned(
                          //     right: 12,
                          //     top: 265,
                          //     child:   InkWell(
                          //       onTap: (){
                          //         Navigator.push(context,MaterialPageRoute(builder: (context)=>
                          //           ProductInformation(products: null, )
                          //         ),
                          //         );
                          //       },
                          //       child: Card(
                          //         color: AppColors.Common,
                          //         elevation: 20,
                          //
                          //
                          //
                          //         shape: RoundedRectangleBorder(
                          //
                          //             borderRadius: BorderRadius.circular(5),
                          //
                          //             side: BorderSide( color: AppColors.Common,width: 1,)
                          //
                          //         ),
                          //
                          //         // child: TextButton(
                          //         //
                          //         //   style: TextButton.styleFrom(
                          //         //     textStyle: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w900),
                          //         //   ),
                          //         //   onPressed: null,
                          //          child: Row(
                          //             children: [
                          //            Icon(Icons.info),
                          //
                          //               Text(' Detailed',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w900),),
                          //
                          //             ],
                          //           ),
                          //         ),
                          //     ),
                          //     ),

                        ],
                      ),


                    Padding(
                      padding: const EdgeInsets.fromLTRB(22,22,22,22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: M,
                        children: [
                          // Spacer(flex:1),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 1),
                            child: Text(

                              widget.proList['Proname'][0].replaceAll("\\n","\n",).replaceAll("  ","",),
                              // ' Acer Nitro 5\n Ryzen hexa core 5600H\n 8 GB Ram',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  height: 1.3.h,
                                  fontWeight: FontWeight.w300),


                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 1),
                            child: Text(

                              widget.proList['Proname'][1].replaceAll("\\n","\n",).replaceAll("  ","",),
                              // ' Acer Nitro 5\n Ryzen hexa core 5600H\n 8 GB Ram',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  height: 1.2.h,
                                  fontWeight: FontWeight.w300),


                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                            child: Text(


                              widget.proList['Proname'][0].replaceAll("\\n","\n",).replaceAll("  ","",),
                              // ' Acer Nitro 5\n Ryzen hexa core 5600H\n 8 GB Ram',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                  height: 1.2.h,
                                  fontWeight: FontWeight.w300),


                            ),
                          ),

                          // Row(
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 1),
                          //       child: Text(
                          //
                          //         "${widget.proList['Proname'][1]} &"
                          //             .replaceAll("\\n","\n",).replaceAll("  ","",),
                          //         // ' Acer Nitro 5\n Ryzen hexa core 5600H\n 8 GB Ram',
                          //         style: GoogleFonts.poppins(
                          //             color: Colors.black,
                          //             fontSize: 16,
                          //             height: 1.4,
                          //             fontWeight: FontWeight.w400),
                          //       ),
                          //     ),
                          //
                          //     // Text(
                          //     //
                          //     //   widget.proList['Proname'][2].replaceAll("\\n","\n",).replaceAll("  ","",),
                          //     //   // ' Acer Nitro 5\n Ryzen hexa core 5600H\n 8 GB Ram',
                          //     //   style: GoogleFonts.poppins(
                          //     //       color: Colors.black,
                          //     //       fontSize: 16,
                          //     //       fontWeight: FontWeight.w400),
                          //     // ),
                          //
                          //   ],
                          // ),


                          SizedBox(height: 8.h,),

                       //    SizedBox(
                       //      height: 8.h,
                       //    ),
                       //
                       //    Center(
                       //      child: SizedBox(
                       //        width: 150.w,
                       //       child: Link(
                       //
                       //
                       //          // uri: Uri.parse('/Adv_1'),
                       //          uri: Uri.parse(widget.proList['Amazon']),
                       //          //   uri: Uri.parse("https://www.mirchi9.com/wp-content/uploads/2018/04/Kiara-Advani-3.jpg"),
                       //          // target: LinkTarget.blank,
                       //          builder: (context, followLink) =>
                       //
                       //              GestureDetector(
                       //                onTap: followLink,
                       //
                       //                child:
                       //        Card(
                       //          borderOnForeground: false,
                       //          shadowColor: Colors.white,
                       //          surfaceTintColor:Colors.white ,
                       //          // height: 50,
                       //          // width: 180,
                       //          color: AppColors.Common,
                       //          elevation: 20,
                       //
                       //
                       //
                       //          shape: RoundedRectangleBorder(
                       //
                       //              borderRadius: BorderRadius.circular(5),
                       //
                       //              side: BorderSide( color: AppColors.Common,width: 1,)
                       //
                       //          ),
                       //
                       //          child: Padding(
                       //            padding: const EdgeInsets.all(2.0),
                       //            child: Row(
                       //              children: [
                       //
                       //                Icon(FontAwesomeIcons.amazon,color: Colors.black,),
                       //
                       //                SizedBox(width: 12,),
                       //                CustomText(text: " Amazon ️",fontSize: 14.sp,weight: FontWeight.w500,),
                       //                Icon(FontAwesomeIcons.longArrowAltRight ,color: Colors.black,size: 20.sp,),
                       //              ],
                       //            ),
                       //          ),
                       //        ),
                       //      ),
                       //    ),
                       //      )
                       //    ),
                       //
                       //    SizedBox(
                       //      height: 10.h,
                       //    ),
                       //    Center(
                       //      child: SizedBox(
                       //        width: 150.w,
                       //        child: Link(
                       //
                       //
                       //          // uri: Uri.parse('/Adv_1'),
                       //          uri: Uri.parse(widget.proList['Flipkart']),
                       //          //   uri: Uri.parse("https://www.mirchi9.com/wp-content/uploads/2018/04/Kiara-Advani-3.jpg"),
                       //          // target: LinkTarget.blank,
                       //          builder: (context, followLink) =>
                       //
                       //              GestureDetector(
                       //                  onTap: followLink,
                       //
                       //
                       //          child: Card(
                       //            borderOnForeground: false,
                       //            shadowColor: Colors.white,
                       //            surfaceTintColor:Colors.white ,
                       //            // height: 50,
                       //            // width: 180,
                       //            color: AppColors.Common,
                       //            elevation: 15,
                       //
                       //
                       //
                       //            shape: RoundedRectangleBorder(
                       //
                       //                borderRadius: BorderRadius.circular(5),
                       //
                       //                side: BorderSide( color: AppColors.Common,width: 1,)
                       //
                       //            ),
                       //
                       //            child: Padding(
                       //              padding: const EdgeInsets.all(2.0),
                       //              child: Row(
                       //                children: [
                       //
                       //                  SizedBox(
                       //                      height: 18.h,
                       //                      child: Image.asset("Assests/images/bags/flipkart.png")),
                       //
                       //                  SizedBox(width: 15.w,),
                       //                  CustomText(text: " Flipkart  ️",fontSize: 14.sp,weight: FontWeight.w500,),
                       //                  Icon(FontAwesomeIcons.longArrowAltRight ,color: Colors.black,size: 20,),
                       //                ],
                       //              ),
                       //            ),
                       //          ),
                       //        ),
                       //      ),
                       //    ),
                       //    ),
                       //
                       //    SizedBox(
                       //      height: 13.h,
                       //    ),
                       //    Center(
                       //      child: SizedBox(
                       //        // width: 250.w,
                       //        height: 35.h,
                       //        child:
                       //        GestureDetector(
                       //          // onTap: (){
                       //          //   Navigator.push(context,MaterialPageRoute(builder: (context) => SaveMoney()));
                       //          //   //
                       //          //   //     context,
                       //          //   //
                       //          //
                       //          // },
                       //
                       //
                       //          child:
                       //        Card(
                       //          borderOnForeground: false,
                       //          shadowColor: Colors.white,
                       //          surfaceTintColor:Colors.white ,
                       //          // height: 50,
                       //          // width: 180,
                       //          color: AppColors.Common,
                       //          elevation: 15,
                       //
                       //
                       //
                       //          shape: RoundedRectangleBorder(
                       //
                       //              borderRadius: BorderRadius.circular(5.r),
                       //
                       //              side: BorderSide( color: AppColors.Common,width: 1.w,)
                       //
                       //          ),
                       //
                       //          child: Row(
                       //
                       //            children: [
                       //
                       //              // SizedBox(
                       //              //     height: 20,
                       //              //     child: Image.network("https://comeet-euw-app.s3.amazonaws.com/1195/98accb3617b74fac6ad573a673ef8cca00b6cc3f")),
                       //
                       //              // SizedBox(width: 15,),
                       //              Icon(FontAwesomeIcons.sellcast,color: Colors.black,),
                       //              SizedBox(width: 12,),
                       //
                       //                  Center(child: CustomText(text: " For Student Discount & Deals  ️",fontSize: 13.sp,weight: FontWeight.w500,)),
                       //
                       //
                       //
                       //
                       //              Padding(
                       //                padding: EdgeInsets.all(2.0.h),
                       //                child: Icon(FontAwesomeIcons.longArrowAltRight ,color: Colors.black,size: 20.h,),
                       //              ),
                       //            ],
                       //          ),
                       //        ),
                       //      ),
                       //    ),
                       //
                       //    ),
                       //
                       //    const ProDetailsHeader(
                       //      label: '   Item Highlight  ',
                       //    ),
                       // // information?SizedBox(height: 5,):
                       // Text(
                       //
                       //   widget.proList['Itemdesc'].replaceAll("\\n","\n🔶 ",).replaceAll("  ","",)
                       //   // snapshot.data!.docs[index]['specification'].replaceAll("\\n","\n"),
                       //
                       //      ,textScaleFactor: 1.1,
                       //      style: GoogleFonts.poppins(
                       //        // letterSpacing: 1.2,
                       //
                       //        height: 1.4.h,
                       //          fontSize: 11.2.sp,
                       //          fontWeight: FontWeight.w300,
                       //          color: Colors.black),
                       //    ),
                       //
                       //
                       //
                       //    const ProDetailsHeader(
                       //      label: '  Our Conclusion  ',
                       //    ),
                       //
                       //

            //
            //             Stack(
            //               children: [
            //               Card(
            //                 elevation: 8.0,
            //                 shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(10),
            //                     side: BorderSide( color: Colors.white54,width: 1,)
            //                 ),
            //
            //                 // color: Colors.black,
            //                 child: ExpansionTile(
            //                   // collapsedIconColor: AppColors.Common,
            //                   // iconColor: AppColors.Common,
            //                   children: [
            //                     Container(
            //
            //                       // height: 220,
            //                       // color: Colors.red,
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(18.0),
            //                         child: Text(widget.proList['Benchmark'][0].replaceAll("\\n","\n",).replaceAll("  ","",)  ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10.5.sp),
            //
            //
            //
            //                         ),
            //
            //
            //                       )
            //                     ),
            //
            //                     // CustomText(text: "Some Important Score  ",weight: FontWeight.w500,fontSize: 18,),
            //
            //
            //                    // Text(widget.proList['Benchmark'][1].replaceAll("\\n","\n",).replaceAll("  ","",)),
            //
            //
            //
            //                    //  Text("  ⚽ Exceptional build quality with a full aluminum body.\n"
            //                    //  "  ⚽ Compact and lightweight.\n"
            //                    // "   ⚽ Battery can last through a full 8-hour day for light productivity.\n"
            //                    //  "  ⚽ Keyboard feels good to type on and is easy to adapt to.\n"
            //                    //  "  ⚽ Large and responsive touchpad\n"),
            //                    //
            //                    //  CustomText(text: "Cons ",weight: FontWeight.w700,fontSize: 18,),
            //                    //
            //                    //
            //                    //  Text("  ⚽ Exceptional build quality with a full aluminum body.\n"
            //                    //      "  ⚽ Compact and lightweight.\n"
            //                    //      "   ⚽ Battery can last through a full 8-hour day for light productivity.\n"
            //                    //      "  ⚽ Keyboard feels good to type on and is easy to adapt to.\n"
            //                    //      "  ⚽ Large and responsive touchpad")
            //
            //
            //
            //                   ],
            //
            //                   title:
            //
            //                   Card(
            //
            //                       elevation: 0.0,
            //                       // color: Colors.black,
            //                       child: Row(
            //                         children: [
            //
            //
            //                           SizedBox(
            //                             width: 44.w,
            //                             height: 38.h,
            //                             child: Card(
            //                               color: Colors.yellow,
            //                               child: CustomText(text:widget.proList['BenchmarkScore'][0],weight: FontWeight.w600,fontSize: 17.sp,),
            //                             ),
            //                           ),
            //
            //                           Row(
            //                             children: [
            //                               Text('  Pricing', style: GoogleFonts.poppins(
            //                                   color: Colors.black, fontSize: 13.sp),),
            //
            //                               // IconButton(onPressed: (){
            //                               //   setState(() {
            //                               //     question = !question;
            //                               //   });
            //                               // }, icon:  Icon(Icons.question_mark_rounded))
            //                             ],
            //                           ),
            //
            //                         ],
            //                       )
            //
            //                   ),
            //
            //
            //                 ),
            //               ),
            //
            //         ]
            //
            //             ),
            //
            //
            //             Card(
            //               elevation: 8.0,
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(10),
            //                   side: BorderSide( color: Colors.white54,width: 1,)
            //               ),
            //
            //               // color: Colors.black,
            //               child: ExpansionTile(
            //                 // collapsedIconColor: AppColors.Common,
            //                 // iconColor: AppColors.Common,
            //                 children: [
            //                   Container(
            //
            //                       // height: 220,
            //                       // color: Colors.red,
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(18.0),
            //                         child: Text(widget.proList['Benchmark'][2].replaceAll("\\n","\n",).replaceAll("  ","",)  ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11.sp,height: 1.4.h),
            //
            //
            //
            //                         ),
            //
            //
            //                       )
            //                   ),
            //
            //                   // CustomText(text: "Some Important Score  ",weight: FontWeight.w500,fontSize: 18,),
            //                   //
            //                   //
            //                   // Text(widget.proList['itemhighlighed'].replaceAll("\\n","\n",).replaceAll("  ","",).replaceAll(" '" , " " ),),
            //
            //
            //
            //                   //  Text("  ⚽ Exceptional build quality with a full aluminum body.\n"
            //                   //  "  ⚽ Compact and lightweight.\n"
            //                   // "   ⚽ Battery can last through a full 8-hour day for light productivity.\n"
            //                   //  "  ⚽ Keyboard feels good to type on and is easy to adapt to.\n"
            //                   //  "  ⚽ Large and responsive touchpad\n"),
            //                   //
            //                   //  CustomText(text: "Cons ",weight: FontWeight.w700,fontSize: 18,),
            //                   //
            //                   //
            //                   //  Text("  ⚽ Exceptional build quality with a full aluminum body.\n"
            //                   //      "  ⚽ Compact and lightweight.\n"
            //                   //      "   ⚽ Battery can last through a full 8-hour day for light productivity.\n"
            //                   //      "  ⚽ Keyboard feels good to type on and is easy to adapt to.\n"
            //                   //      "  ⚽ Large and responsive touchpad")
            //
            //
            //
            //                 ],
            //
            //                 title:
            //
            //                 Card(
            //
            //                     elevation: 0.0,
            //                     // color: Colors.black,
            //                     child: Row(
            //                       children: [
            //
            //
            //                         SizedBox(
            //                           width: 44.w,
            //                           height: 38.h,
            //                           child: Card(
            //                             color: Colors.green,
            //                             child: CustomText(text:widget.proList['BenchmarkScore'][1].replaceAll("\\n","\n",).replaceAll("  ","",),weight: FontWeight.w600,fontSize: 17.sp,),
            //                           ),
            //                         ),
            //
            //                         Row(
            //                           children: [
            //                             Text('  Pros ', style: GoogleFonts.poppins(
            //                                 color: Colors.black, fontSize: 13.sp),),
            //
            //                             // IconButton(onPressed: (){
            //                             //   setState(() {
            //                             //     question = !question;
            //                             //   });
            //                             // }, icon:  Icon(Icons.question_mark_rounded))
            //                           ],
            //                         ),
            //
            //                       ],
            //                     )
            //
            //                 ),
            //
            //
            //               ),
            //             ),
            //
            //             Card(
            //               elevation: 8.0,
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(10),
            //                   side: BorderSide( color: Colors.white54,width: 1,)
            //               ),
            //
            //               // color: Colors.black,
            //               child: ExpansionTile(
            //                 // collapsedIconColor: AppColors.Common,
            //                 // iconColor: AppColors.Common,
            //                 children: [
            //                   Container(
            //
            //                       // height: 220,
            //                       // color: Colors.red,
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(18.0),
            //                         child: Align(
            //                         alignment: Alignment.topLeft,
            //                           child: Text(widget.proList['Benchmark'][3].replaceAll("\\n","\n",).replaceAll("  ","",)  ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11.sp,height: 1.4.h),
            //
            //
            //
            //                           ),
            //                         ),
            //
            //
            //                       )
            //                   ),
            //
            //
            //
            //                 ],
            //
            //                 title:
            //
            //                 Card(
            //
            //                     elevation: 0.0,
            //                     // color: Colors.black,
            //                     child: Row(
            //                       children: [
            //
            //
            //                         SizedBox(
            //                           width: 44.w,
            //                           height: 38.h,
            //                           child: Card(
            //                             color: Colors.yellow,
            //                             child: CustomText(text:widget.proList['BenchmarkScore'][2].replaceAll("\\n","\n",).replaceAll("  ","",),weight: FontWeight.w600,fontSize: 17.sp,),
            //                           ),
            //                         ),
            //
            //                         Row(
            //                           children: [
            //                             Text('  Cons', style: TextStyle(
            //                                 color: Colors.black, fontSize: 13.sp),),
            //
            //                             // IconButton(onPressed: (){
            //                             //   setState(() {
            //                             //     question = !question;
            //                             //   });
            //                             // }, icon:  Icon(Icons.question_mark_rounded))
            //                           ],
            //                         ),
            //
            //                       ],
            //                     )
            //
            //                 ),
            //
            //
            //               ),
            //             ),
            //
            //
            //             InkWell(
            //               onTap: () {
            //                 setState(() {
            //                   passwordVisible = !passwordVisible;
            //                   view_more = !view_more;
            //                 });
            //               },
            //
            //               child: Container(
            //
            //                 // color:
            //                 child: Align(
            //                     alignment: Alignment.topRight,
            //                     child:
            //
            //                     view_more?SizedBox(height: 1,):
            //                     CustomText(text: "View More...",weight: FontWeight.w500,fontSize: 13.sp,)),
            //               ),
            //             ),
            //             view_more  ?
            //
            //
            //             Card(
            //               elevation: 8.0,
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(10),
            //                   side: BorderSide( color: Colors.white54,width: 1,)
            //               ),
            //
            //               // color: Colors.black,
            //               child: ExpansionTile(
            //                 // collapsedIconColor: AppColors.Common,
            //                 // iconColor: AppColors.Common,
            //                 children: [
            //                   Container(
            //
            //                       // height: 220,
            //                       // color: Colors.red,
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(18.0),
            //                         child: Text(widget.proList['Benchmark'][4].replaceAll("\\n","\n",).replaceAll("  ","",) ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11.sp,height: 1.4.h),
            //
            //
            //
            //                         ),
            //
            //
            //                       )
            //                   ),
            //
            //
            //
            //                 ],
            //
            //                 title:
            //
            //                 Card(
            //
            //                     elevation: 0.0,
            //                     // color: Colors.black,
            //                     child: Row(
            //                       children: [
            //
            //
            //                         SizedBox(
            //                           width: 44.w,
            //                           height: 38.h,
            //                           child: Card(
            //                             color: Colors.green,
            //                             child: CustomText(text:widget.proList['BenchmarkScore'][3].replaceAll("\\n","\n",).replaceAll("  ","",),weight: FontWeight.w600,fontSize: 17.sp,),
            //                           ),
            //                         ),
            //
            //                         Row(
            //                           children: [
            //                             Text('  For Coder & Dev.', style: GoogleFonts.poppins(
            //                                 color: Colors.black, fontSize: 12.sp),),
            //
            //                             // IconButton(onPressed: (){
            //                             //   setState(() {
            //                             //     question = !question;
            //                             //   });
            //                             // }, icon:  Icon(Icons.question_mark_rounded))
            //                           ],
            //                         ),
            //
            //                       ],
            //                     )
            //
            //                 ),
            //
            //
            //               ),
            //             ): SizedBox(height: 1,),
            //
            //             view_more  ?      Card(
            //               elevation: 8.0,
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(10),
            //                   side: BorderSide( color: Colors.white54,width: 1,)
            //               ),
            //
            //               // color: Colors.black,
            //               child: ExpansionTile(
            //                 // collapsedIconColor: AppColors.Common,
            //                 // iconColor: AppColors.Common,
            //                 children: [
            //                   Container(
            //
            //                       // height: 220,
            //                       // color: Colors.red,
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(18.0),
            //                         child: Text(widget.proList['Benchmark'][5].replaceAll("\\n","\n",).replaceAll("  ","",).replaceAll(" '" , " " )  ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11.sp,height: 1.4.h),
            //
            //
            //
            //                         ),
            //
            //
            //                       )
            //                   ),
            //
            //
            //                 ],
            //
            //                 title:
            //
            //                 Card(
            //
            //                     elevation: 0.0,
            //                     // color: Colors.black,
            //                     child: Row(
            //                       children: [
            //
            //
            //                         SizedBox(
            //                           width: 44.w,
            //                           height: 38.h,
            //                           child: Card(
            //                             color: Colors.yellow,
            //                             child: CustomText(text:widget.proList['BenchmarkScore'][4].replaceAll("\\n","\n",).replaceAll("  ","",).replaceAll(" '" , " " ),weight: FontWeight.w600,fontSize: 17.sp,),
            //                           ),
            //                         ),
            //
            //                         Row(
            //                           children: [
            //                             Text(' For Office / Business', style: GoogleFonts.poppins(
            //                                 color: Colors.black, fontSize: 12.sp),),
            //
            //                             // IconButton(onPressed: (){
            //                             //   setState(() {
            //                             //     question = !question;
            //                             //   });
            //                             // }, icon:  Icon(Icons.question_mark_rounded))
            //                           ],
            //                         ),
            //
            //                       ],
            //                     )
            //
            //                 ),
            //
            //
            //               ),
            //             ): SizedBox(height: 1,),
            //
            //             view_more  ?
            //
            //             Card(
            //               elevation: 8.0,
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(10),
            //                   side: BorderSide( color: Colors.white54,width: 1,)
            //               ),
            //
            //               // color: Colors.black,
            //               child: ExpansionTile(
            //                 // collapsedIconColor: AppColors.Common,
            //                 // iconColor: AppColors.Common,
            //                 children: [
            //                   Container(
            //
            //                       // height: 220,
            //                       // color: Colors.red,
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(18.0),
            //                         child: Text(widget.proList['Benchmark'][6].replaceAll("\\n","\n",).replaceAll("  ","",).replaceAll(" '" , " " )  ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11.sp,height: 1.4.h),
            //
            //
            //
            //                         ),
            //
            //
            //                       )
            //                   ),
            //
            //
            //                 ],
            //
            //                 title:
            //
            //                 Card(
            //
            //                     elevation: 0.0,
            //                     // color: Colors.black,
            //                     child: Row(
            //                       children: [
            //
            //
            //                         SizedBox(
            //                           width: 48.w,
            //                           height: 42.h,
            //                           child: Card(
            //                             color: Colors.green,
            //                             child: CustomText(text:widget.proList['BenchmarkScore'][5].replaceAll("\\n","\n",).replaceAll("  ","",).replaceAll(" '" , " " ),weight: FontWeight.w600,fontSize: 18.sp,),
            //                           ),
            //                         ),
            //
            //                         Row(
            //                           children: [
            //                             Text('  BBA/B.Comm/MBA', style: GoogleFonts.poppins(
            //                                 color: Colors.black, fontSize: 12.sp),),
            //
            //                             // IconButton(onPressed: (){
            //                             //   setState(() {
            //                             //     question = !question;
            //                             //   });
            //                             // }, icon:  Icon(Icons.question_mark_rounded))
            //                           ],
            //                         ),
            //
            //                       ],
            //                     )
            //
            //                 ),
            //
            //
            //               ),
            //             )
            //                 : SizedBox(height: 10.h,),
            //
            //
            //             InkWell(
            //               onTap: () {
            //                 setState(() {
            //                   passwordVisible = !passwordVisible;
            //                   view_more = !view_more;
            //                 });
            //               },
            //
            //               child: Container(
            //
            //                 // color:
            //                 child: Align(
            //                     alignment: Alignment.topRight,
            //                     child:
            //
            //                     view_more?
            //                     CustomText(text: "View Less...",weight: FontWeight.w500,):SizedBox(height: 1,)),
            //               ),
            //             ),
            //             const ProDetailsHeader(
            //               label: '   About Brand  ',
            //             ),
            //
            //             Card(
            //               elevation: 8.0,
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(10),
            //                   side: BorderSide( color: Colors.white54,width: 1,)
            //               ),
            //
            //               // color: Colors.black,
            //               child: ExpansionTile(
            //                 // collapsedIconColor: AppColors.Common,
            //                 // iconColor: AppColors.Common,
            //                 children: [
            //
            //
            //
            //
            //                 ],
            //
            //                 title:
            //
            //                 Card(
            //
            //                     elevation: 0.0,
            //                     // color: Colors.black,
            //                     child: Row(
            //                       children: [
            //
            //
            //
            //
            //                         Text(' About  ${widget.proList["Brand"]} As brand', style: GoogleFonts.poppins(
            //                             color: Colors.black, fontSize: 13.sp),),
            //                       ],
            //                     )
            //
            //                 ),
            //
            //               ),
            //             ),
            //
            //             SizedBox(height: 15.h,)
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            //
            // bottomSheet: Padding(
            //   padding:  EdgeInsets.symmetric(horizontal: 10.w),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Row(
            //         children: [
            //           // IconButton(
            //           //     // onPressed: () {
            //           //     //   Navigator.push(
            //           //     //       context,
            //           //     //       MaterialPageRoute(
            //           //     //           builder: (context) => Alert()));
            //           //     // },
            //           //     icon: const Icon(Icons.store,color: Colors.black87,)),
            //            SizedBox(
            //             width: 20.w,
            //           ),
            //
            //
            //
            //
            //
            //
            //
            //           TextButton(
            //               onPressed: (){
            //
            //                 Navigator.pushNamed(context, '/SaveMoney');
            //
            //               },
            //               child: SizedBox(
            //                 height: 35.h,
            //                 width: 123.w,
            //                 child: Card(
            //                   // height: 35,
            //                     elevation: 8.0,
            //                     shape: RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(10.r),
            //                         side: BorderSide( color: Colors.white54,width: 1.w,)
            //                     ),
            //                   color: Colors.teal.shade500,
            //                   child: Center(
            //                     child: CustomText(
            //                       text: "Deals & Offers",
            //                       color: Colors.white,
            //                       fontSize: 12.sp,
            //                     ),
            //                   )
            //                 ),
            //               )
            //           )


                      ],
                    ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProDetailsHeader extends StatelessWidget {
  final String label;
  const ProDetailsHeader({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 30,
            child: Divider(
              color: Colors.teal,
              thickness: 1,
            ),
          ),
          Text(
            label,
            style: TextStyle(
                color: Colors.teal,
                fontSize: 19,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 40,
            width: 30,
            child: Divider(
              color: Colors.teal,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}



// SizedBox(
//   child: StreamBuilder<QuerySnapshot>(
//     stream: _prodcutsStream,
//     builder: (BuildContext context,
//         AsyncSnapshot<QuerySnapshot> snapshot) {
//       if (snapshot.hasError) {
//         return const Text('Something went wrong');
//       }
//
//       if (snapshot.connectionState ==
//           ConnectionState.waiting) {
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
//
//       return Container(
//         color: AppColors.Common,
//         child: SingleChildScrollView(
//           child: StaggeredGridView.countBuilder(
//               physics:
//               const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: snapshot.data!.docs.length,
//               crossAxisCount: 2,
//               itemBuilder: (context, index) {
//                 return Container();
//                 //   ProductModel(
//                 //   products: snapshot.data!.docs[index],
//                 // );
//               },
//               staggeredTileBuilder: (context) =>
//               const StaggeredTile.fit(1)),
//         ),
//       );
//     },
//   ),
// )

// YellowButton(
//     label: existingItemCart != null
//         ? 'added to cart'
//         : 'ADD TO CART',
//     onPressed: () {
//       if (widget.proList['instock'] == 0) {
//         MyMessageHandler.showSnackBar(
//             _scaffoldKey, 'this item is out of stock');
//       } else if (existingItemCart != null) {
//         MyMessageHandler.showSnackBar(
//             _scaffoldKey, 'this item already in cart');
//       } else {
//         context.read<Cart>().addItem(
//           widget.proList['proname'],
//           onSale != 0
//               ? ((1 -
//               (widget.proList['discount'] /
//                   100)) *
//               widget.proList['price'])
//               : widget.proList['price'],
//           1,
//           widget.proList['instock'],
//           widget.proList['proimages'],
//           widget.proList['proid'],
//           widget.proList['sid'],
//         );
//       }
//     },
//     width: 0.55)