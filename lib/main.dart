



// import 'package:collagecounsellor/Major_screen/Home_page.dart';
// import 'package:collagecounsellor/Major_screen/bottom_navigation.dart';
// import 'package:collagecounsellor/Shortcut.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:counsellor/Home_page.dart';
import 'package:counsellor/Uploadecontact.dart';
import 'package:counsellor/collage_category_page.dart';
import 'package:counsellor/shortcut.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: const FirebaseOptions(
    //   apiKey: "AIzaSyAJaxaVNnqOJt4NUn3c4mWPKvSLOaGbIlI",
    //   appId: "XXX",
    //   messagingSenderId: "XXX",
    //   projectId: "meme-see",
    // ),

  );

  runApp(
      // MultiProvider(providers: [
      //   // ChangeNotifierProvider(create: (_) => Cart()),
      //   // ChangeNotifierProvider(create: (_) => Wish()),
      // ],
          const MyApp()
  );

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override



  Widget build(BuildContext context) {
    // addToFirebase();
    return ScreenUtilInit(
        designSize: const Size(284.97,613.417),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {
          return MaterialApp(
              builder: (context , child) {
                return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child:child!);
              },

              title: "njj",
              debugShowCheckedModeBanner: false,
              theme: ThemeData(

                // scaffoldBackgroundColor:Color(0xFFF5F1EC),
                //   scaffoldBackgroundColor:Color(0xfff4eefa),
                // backgroundColor: Color(0xFFF5F1EC),
                // backgroundColor: Colors.green,
                // primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: GoogleFonts.nunitoSansTextTheme()
                      .apply(bodyColor: Colors.black)),
              // initialRoute: '/Navigation bar',
              home: NavigationBardown(
                index: 0,
              ),
              // AnimatedSplashScreen(
              //   backgroundColor: Colors.teal,
              //   splash: 'Assests/images/bags/1024.png',
              //   nextScreen:
              // NavigationBardown(
              //   index: 0,
              // ),
              //   splashTransition: SplashTransition.rotationTransition,
              //   // pageTransitionType: PageTransitionType.scale,
              // ),

              // Register(),




              // builder: (context, child) => ResponsiveWrapper.builder(
              // child,
              // maxWidth: 1200,
              // minWidth: 1001,
              // defaultScale: true,
              // breakpoints: [
              //   ResponsiveBreakpoint.resize(1001, name: MOBILE),
              //   ResponsiveBreakpoint.autoScale(800, name: TABLET),
              //   ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              // ],
              // ),
              // // home:Scaffold(
              // // initialRoute: '/welcom',
              // //   backgroundColor: Colors.grey,
              // //   body: (),
              //
              //


              // routes: {
              //   "/Navigation bar": (context) =>
              //       NavigationBardown(
              //         index: 0,
              //       ),
              //
              //   // "/video": (context) => mydynamic(),
              //
              // }
          );
        }
    );


  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,

    );
  }
}


class NavigationBardown extends StatefulWidget {

  late int index=0  ;



  NavigationBardown({Key? key,required this.index}) : super(key: key);

  @override



  State<NavigationBardown> createState() => _NavigationBardownState();


}



class _NavigationBardownState extends State<NavigationBardown> {

  // initState() {         // this is called when the class is initialized or called for the first time
  //   super.initState();  //  this is the material super constructor for init state to link your instance initState to the global initState context
  // }


// int index=0;

  final screens =[
    Home_page(),
    collegetier(),
    UploadProductScreen(),
    // Homepage(),
    // Profile(),


  ];




  final items = <Widget>[

    // bottomItem(title:"ghhjh",icon:Icons.favorite)
    Icon(Icons.home,size: 30,color: Colors.black87,),
    Icon(Icons.emoji_people_outlined,size: 30,color: Colors.black87),
    Icon(Icons.people_alt_outlined,size: 30,color: Colors.black87),
    //   Badge(
    // showBadge:  context.read<Wish>().getWishItems.isEmpty ? false : true,
    // padding: const EdgeInsets.all(2),
    // badgeColor: Colors.yellow,
    // badgeContent: Text(
    // context.watch<Wish>().getWishItems.length.toString(),
    // style: const TextStyle(
    // fontSize: 16, fontWeight: FontWeight.w600),
    // ),
    // child: const
    // Icon(Icons.shopping_cart,size: 30,color: Colors.black87),
    // ),
    // Icon(Icons.person,size: 30,color: Colors.black87),
  ];




  @override




  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 15,
        width: 100,
        child: WillPopScope(
            onWillPop: () async {
              final shouldPop = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return SizedBox(
                    // height: 40,
                    // width: 100,
                    child: AlertDialog(

                      // backgroundColor: Colors.black87,
                      title: CustomText(text:'Do you want to go back?',fontSize: 13.sp,weight: FontWeight.w400,),
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: const Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: const Text('No'),
                        ),
                      ],
                    ),
                  );
                },
              );
              return shouldPop!;
            },


            child: SafeArea(

              child: Scaffold(




                body:   screens[widget.index],
                bottomNavigationBar: CurvedNavigationBar(
                  index :widget.index,
                  backgroundColor: Colors.black12,
                  color: Colors.white,
                  height:50,
                  items: items,

                  onTap: (index)=>setState(() =>
                  this.widget.index=index
                  ),
                ),
              ),
            )
        ),
      );
  }
}





