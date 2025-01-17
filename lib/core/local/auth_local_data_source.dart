import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/errors/exceptions.dart';

const userCacheConst = "user_cache";
const cacheTokenConst = "cache_token";
const verifyInfoConst = "verify_info";
const registerBodyConst = "register_body_const";
const userInfoConst = 'user_info_const';


abstract class AuthLocalDataSource {
  Future<void> clearCachedUser();

  Future<void> cacheUserAccessToken({required String token});
  Future<String> getCachedUserAccessToken();
 // User getCachedProfileUserData();

 // Future<void>cacheUserLoginInfo({required User params});
}
class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheUserAccessToken({required String token}) async{
    try{
      await sharedPreferences.setString(cacheTokenConst, token);
    }catch(e){
      throw CacheException();
    }
  }

  /* @override
  Future<void> cacheUserVerificationInfo({required params}) {
    // TODO: implement cacheUserVerificationInfo
    throw UnimplementedError();
  }*/

  @override
  Future<void> clearCachedUser() async{
    try{
      await sharedPreferences.clear();
    }catch(e){
      throw CacheException();
    }
  }

  @override
  Future<String> getCachedUserAccessToken() async{
    try{
      final userShared = sharedPreferences.getString(cacheTokenConst)?? 'noAuth';
      if(userShared != 'noAuth'){
        return userShared;
      }else{
        throw NoCachedUserException();
      }
    }on NoCachedUserException {
      throw NoCachedUserException();
    }catch(e){
      throw CacheException();
    }
  }


  /*@override
  Future<void> cacheUserLoginInfo({required User params}) async {
    try {
      await sharedPreferences.setString(userInfoConst, json.encode(params.toJson()));
    } catch (e) {
      throw CacheException();
    }
  }*/

  /*@override
  User getCachedProfileUserData() {
    // TODO: implement getCachedProfileUserData
    throw UnimplementedError();
  }*/


}