#Flutter-MVC

Repo For MVC Pattern In Flutter.

#Write Project Objective In This Place For Another Developer Knowledge;

#SDK used Flutter 3.19.3 • channel stable Dart 3.3.1 • DevTools 2.31.1

Code Generation This project uses code generation using built_value for generating code related to
json serialization/deserialization. The generated part files are put in .gitignore. So in order to
generate those files run the following command:
#dart run build_runner build --delete-conflicting-outputs

#Api:- maintain these response on each scenario:-
1.) ResponseCode key which is int type like:- 200,201,204;
2.) ResponseMessage key which is String type, this is contain all error and success msg;
3.) Succeeded key which is bool type, this will contain api response is true or false like
success or any error found;
4.) ResponseBody key which is object type, contain all type of data in object when data is not available it can be null;
Example:-
(Api Success):- {
“ResponseCode”:200,
“ResponseMessage”: “logged in Successfully”,
“Succeeded”:true,
“ResponseBody”:{
“id”:id123455,
“name”: “User Name”
“Profile”: “www.profile.xn--com-9o0a
}
}
(Api Error):- {
“ResponseCode”:201,
“ResponseMessage”: “User And Password not matched”,
“Succeeded”:false,
“ResponseBody”:null
}
}


