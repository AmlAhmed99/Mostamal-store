
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:useditem/FirebaseUtiles/FirebaseUtiles.dart';
import 'package:useditem/Models/ProductModel.dart';
import 'package:useditem/Models/UserModel.dart' as MyUser;
import 'package:useditem/Routes/AppRoutes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:useditem/Styles/Colors.dart';


class AuthController extends GetxController  {

  static MyUser.UserModel? currentUser;

  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;

  var isSignedIn = false;
  final GetStorage authBox = GetStorage();
  var googleSignIn = GoogleSignIn();
  //FaceBookModel? faceBookModel;
  void updateUser(MyUser.UserModel? user){
    currentUser  = user;
    update();
  }
  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential=await auth.createUserWithEmailAndPassword(email: email, password: password);
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      // step2
      final usersCollectionRef = getUsersCollectionWithConverter();
      final user =
      MyUser.UserModel(id: userCredential.user!.uid, name:name ,
          email: email,
      );
      usersCollectionRef.doc(user.id)
          .set(user)
          .then((value){
        updateUser(user);
        Get.offNamed(Routes.HomeScreenRoute);
        update();
        // navigate home Screen
      });

    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = ' Provided Password is too weak.. ';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account Already exists for that email.. ';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.primaryColor,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential= await auth
          .signInWithEmailAndPassword(email: email, password: password);
      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      if(userCredential.user==null){
      print('invalid credientials no user exist'' with this email and password');
      }else {
        // navigate to home
        getUsersCollectionWithConverter().doc(userCredential.user!.uid)
            .get()
            .then((retrievedUser){
          updateUser(retrievedUser.data());
          update();
          Get.offNamed(Routes.HomeScreenRoute);
        });
      }


    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
        ' Account does not exists for that $email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = ' Invalid Password... PLease try again! ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor:AppColor.primaryColor,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
        ' Account does not exists for that $email.. Create your account by signing up..';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor:AppColor.primaryColor,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void googleSinUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
      await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(credential);

      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();

      Get.offNamed(Routes.HomeScreenRoute);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  static bool checkLoggedInUser(){
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null){
      // retrieve current user data from fire store notify
      //    listeners
      getUsersCollectionWithConverter()
          .doc(firebaseUser.uid).get()
          .then((retUser) {
        if(retUser.data()!=null)
        {
          currentUser=retUser.data();
        }
      });

    }
    return firebaseUser!=null;
  }

}