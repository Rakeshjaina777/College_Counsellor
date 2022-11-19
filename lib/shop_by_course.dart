
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counsellor/shortcut.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/link.dart';




class shopByBrand extends StatefulWidget {


  final String  course;

  const shopByBrand({Key? key,required this.course}) : super(key: key);

  @override
  State<shopByBrand> createState() => _shopByBrandState();
}

class _shopByBrandState extends State<shopByBrand> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _prodcutsStream = FirebaseFirestore.instance
        .collection(widget.course).snapshots();
    // final product = snapshot.data!.docs[index];



    return

      //   DefaultTabController(
      //     length: 10,
      Material(
        child: Scaffold(
          backgroundColor: Colors.blueGrey.shade100.withOpacity(0.2),
          // drawer: Drawer(),
          appBar:
          PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: SafeArea(
                  child: AppBar(
                    automaticallyImplyLeading: true,
                    iconTheme: IconThemeData(color: AppColors.black),
                    elevation: 0.1,
                    backgroundColor: AppColors.white,
                    title:Text(widget.course, style: TextStyle(fontSize: 22, color: AppColors.black,fontWeight: FontWeight.w900),),
                  )
              )
          ),
          body:
          Material(
            // color: Colors.red,
            child: StreamBuilder<QuerySnapshot>(
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
                return Material(
                  child: SingleChildScrollView(
                      child: SizedBox(
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
                      )
                  ),
                );
              },
            ),
          ),
        ),
      );

  }


}



class ProductModel extends StatefulWidget {
  final dynamic product;


  const ProductModel({Key? key,required this.product}) : super(key: key);


  @override
  State<ProductModel> createState() => _ProductModelState();
}

class _ProductModelState extends State<ProductModel> {
  @override

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;





    return

      Material(
        child: Padding(
          padding:  EdgeInsets.all(6.0.h),
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
                          Link(
                              uri: Uri.parse(widget.product['link']),
                              // target: LinkTarget.blank,
                              builder: (context, followLink) =>


                                  Card(

                                    borderOnForeground: false,
                                    shadowColor: Colors.white,
                                    surfaceTintColor: Colors.white,
                                    elevation: 14,


                                    shape: RoundedRectangleBorder(

                                        borderRadius: BorderRadius.circular(
                                            10.r),

                                        side: BorderSide(
                                          color: AppColors.Common, width: 1.w,)

                                    ),

                                    color: Colors.white,


                                    child:
                                    Container(

                                      // color: Colors.red,
                                      height: 300.h,

                                      // width: size.width * 0.30,

                                      margin: EdgeInsets.all(5.r),


                                      decoration: BoxDecoration(

                                        // color: Colors.green,

                                        // border: Border.all(color:Colors.black54,width: 2.55),

                                        borderRadius: BorderRadius.circular(
                                            1),

                                        // image: DecorationImage(

                                        // image: NetworkImage(
                                        //     widget.product['Images'][0]),
                                        // "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mbp-spacegray-select-202206?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1653493200207"),
                                        // fit: BoxFit.fitWidth,
                                      ),
                                      child: CachedNetworkImage(
//

                                        fit: BoxFit.fitWidth,


                                        imageUrl: widget.product['Images'][0],
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                              baseColor: Colors.grey[100]!,
                                              highlightColor: Colors.grey[400]!,
                                              period: Duration(seconds: 1),
                                              loop: 5,
                                              child: Container(
                                                height: 6,
                                                width: 6,
                                                color: Colors.black54,
                                              ),
                                            ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                                "Assests/images/bags/Notfound.jpg"),
// errorWidget: (context, url, error) => Icon(Icons.error),
                                      ),
                                    ),
                                  )
                          )
                      ),

                    );
                  }

                    ),
                    )
    ]



                    )
                    )
      );





  }
}
