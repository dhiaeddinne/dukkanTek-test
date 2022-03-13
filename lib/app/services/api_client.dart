import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dukkan_tekk_test/app/constants/app_config.dart';
import 'package:dukkan_tekk_test/app/models/exception/false_email_or_password_exception.dart';
import 'package:dukkan_tekk_test/app/models/exception/google_login_failed_exception.dart';
import 'package:dukkan_tekk_test/app/models/exception/lose_connection_exception.dart';
import 'package:dukkan_tekk_test/app/models/social_auth_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  final Connectivity _connectivity = Connectivity();
  Dio? _authDio;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  factory ApiClient() => _instance;

  ApiClient._internal() {
    _authDio = Dio(BaseOptions(
        baseUrl: base_url, connectTimeout: 10000, receiveTimeout: 10000));
    initializeInterceptor();
  }

  void initializeInterceptor() {
    _authDio!.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90),
    );
    _authDio!.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler){
          options.headers["Content-Type"] = "application/json";
          return handler.next(options);
        },
    ));
  }

  ///check if connection is enabled
  Future<void> checkConnection() async {
    if ((await _connectivity.checkConnectivity()) == ConnectivityResult.none) {
      throw LoseConnectionException(message: 'Connection lost');
    }
  }


  /// SignIn Function using mockApi => mockApi.io
  Future<String?> signIn({required String email, required String password}) async {
    /// verifying if the specific user exist or not in the database
    /// 1 is the id of the mocked user
    int userId = email == "user@gmail.com" ? 1: 20;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url = "/api/login/auth/$userId";
    await checkConnection();
    try {
      final Response<String> response = await _authDio!.get(
        url,
      );
      await prefs.setString(userNameKey, "user test");
      await prefs.setString(userEmailKey,"user@gmail.com");
      return response.data;
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        throw FalseEmailOrPasswordException();
      } else {
      throw ("e.response ${e.response}");
      }
    }
  }


  /// Google signIn Function
  Future<SocialAuthModel> signInWithGoogle() async {
    try {
      if ((await Connectivity().checkConnectivity()) == ConnectivityResult.none) {
        throw LoseConnectionException(message: 'Connection Lost');
      }
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      GoogleSignInAuthentication authentication = await account!.authentication;

      String name = "";
      String lastName = "";
      SharedPreferences prefs = await SharedPreferences.getInstance();

      try {
        name = account.displayName!.split(" ")[0];
        lastName = account.displayName!.split(" ")[1];
        await prefs.setString(userNameKey, name + " " +lastName);
        await prefs.setString(userEmailKey,account.email);
        await prefs.setString(userPhotoKey,account.photoUrl!);
      } catch (e) {
        throw("exception $e");
      }
      return SocialAuthModel(
          id: account.id,
          name: account.displayName,
          firstName: name,
          lastName: lastName,
          photoUrl: account.photoUrl,
          authToken: authentication.accessToken,
          idToken: authentication.idToken,
          email: account.email,
          provider: "GOOGLE");
    } catch (e) {
      throw GoogleLoginFailedException(message: "Google Login Failed");
    }
  }
}