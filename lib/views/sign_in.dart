import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodbank_marchantise_app/controllers/auth-controller.dart';
import 'package:foodbank_marchantise_app/controllers/global-controller.dart';
import 'package:foodbank_marchantise_app/utils/theme_colors.dart';
import 'package:foodbank_marchantise_app/utils/font_size.dart';
import 'package:foodbank_marchantise_app/utils/size_config.dart';
import 'package:foodbank_marchantise_app/views/sign_up.dart';
import 'package:foodbank_marchantise_app/widgets/loader.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  //final globalController=Get.put(()=>GlobalController());

  @override
  void initState() {
    final globalController = Get.put(GlobalController());
    globalController.onInit();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthController authController = AuthController();

  @override
  void didChangeDependencies() {
    // authController = Get.put(AuthController());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (auth) => Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                  child: Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
                child: Stack(children: [
                  Center(
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GetBuilder<GlobalController>(
                              init: GlobalController(),
                              builder: (globalController) => CachedNetworkImage(
                                imageUrl:
                                    globalController.vendorAppLogo.toString(),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  padding: EdgeInsets.all(10.0),
                                  width: SizeConfig.screenWidth! / 3,
                                  height: SizeConfig.screenWidth! / 3,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 5),
                                    // shape: BoxShape.circle,
                                    color: Colors.white,
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: imageProvider,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  child: Container(
                                    height: 60,
                                    width: 120,
                                    color: Colors.grey,
                                  ),
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[400]!,
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            GetBuilder<GlobalController>(
                              init: GlobalController(),
                              builder: (globalController) =>
                                  globalController.vendorAppName == null
                                      ? Text(
                                          'WELCOME'.tr,
                                          style: GoogleFonts.poppins(
                                            color: ThemeColors.baseThemeColor,
                                            fontSize: FontSize.xxLarge,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      : Text(
                                          '${globalController.vendorAppName}',
                                          style: GoogleFonts.poppins(
                                            color: ThemeColors.baseThemeColor,
                                            fontSize: FontSize.xxLarge,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Text(
                                "LOGIN_TO_YOUR_ACCOUNT".tr,
                                style: GoogleFonts.poppins(
                                  color: ThemeColors.greyTextColor,
                                  fontSize: FontSize.medium,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 70),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  ///Email Input Field
                                  Container(
                                    height: 60,
                                    child: TextFormField(
                                      controller: _emailController,
                                      validator: (value) {
                                        if (_emailController.text.isEmpty) {
                                          return "THIS_FIELD_CAN_NOT_BE_EMPTY"
                                              .tr;
                                        }
                                        return null;
                                      },
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      cursorColor: ThemeColors.primaryColor,
                                      decoration: InputDecoration(
                                        labelText: 'EMAIL_ADDRESS'.tr,
                                        labelStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                        hintText: 'ENTER_YOUR_EMAIL_HERE'.tr,
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: ThemeColors.baseThemeColor,
                                        ),
                                        fillColor: Colors.black,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: ThemeColors.baseThemeColor,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            width: 0.2,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16),

                                  ///Password Input Field
                                  Container(
                                    height: 60,
                                    child: TextFormField(
                                      controller: _passwordController,
                                      validator: (value) {
                                        if (_passwordController.text.isEmpty) {
                                          return "THIS_FIELD_CAN_NOT_BE_EMPTY"
                                              .tr;
                                        }
                                        return null;
                                      },
                                      obscureText: true,
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      cursorColor: ThemeColors.primaryColor,
                                      decoration: InputDecoration(
                                        labelText: 'PASSWORD'.tr,
                                        labelStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                        hintText: 'ENTER_YOUR_PASSWORD_HERE'.tr,
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: ThemeColors.baseThemeColor,
                                        ),
                                        fillColor: Colors.black,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: ThemeColors.baseThemeColor,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            width: 0.2,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 70),
                            Container(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ThemeColors.baseThemeColor, // background
                                  foregroundColor: Colors.white, // foreground
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10), // <-- Radius
                                  ),
                                ),
                                onPressed: () async {
                                  authController.loginOnTap(
                                      email: _emailController.text
                                          .toString()
                                          .trim(),
                                      pass: _passwordController.text
                                          .toString()
                                          .trim());
                                },
                                child: Text(
                                  'SIGN_IN'.tr,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "DONT_HAVE_AN_ACCOUNT".tr,
                                    style: GoogleFonts.poppins(
                                      // color: ThemeColors.whiteTextColor,
                                      fontSize: FontSize.medium,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.off(() => SignUpPage());
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: Text(
                                        "SIGN_UP".tr,
                                        style: GoogleFonts.poppins(
                                          color: ThemeColors.baseThemeColor,
                                          fontSize: FontSize.medium,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                  auth.loader
                      ? Positioned(
                          child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white60,
                              child: Center(child: Loader())),
                        )
                      : SizedBox.shrink(),
                ]),
              )),
            ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    authController.onClose();

    super.dispose();
  }
}
