# LINE-Source

Project of Reverse Engineering LINE Messaging App (for education purpose)

# INFO
This project was carried out in order to obtain and rewrite the thrift file of LINE Thrift Protocol (client-side). And for the education purpose only!

# Prerequisites
Before doing this, you need to have this on your computer (i'm using windows):
  - Java 1.8 or greater ([Get it here](https://www.java.com/en/))
  - Thrift types understanding on a compiled thrift ([Read this](https://github.com/BroNils/LINE-Source/blob/master/thrift-desc.txt))
  - Some apk decompiler (I'm using [jadx](https://github.com/skylot/jadx))
  - A ~~little~~ good understanding of java

# How to

This is how i obtain the thrift file and make it human-readable form:
  - Download LINE App from playstore using downloader like [Evozi](https://apps.evozi.com/apk-downloader/)
    - If you're downloading a new version of LINE (maybe version 8 or greater), you'll get zip file instead of apk file. Don't worry, just extract the file and you'll find the apk (jp.naver.line.android.apk)
  - Decompile apk using your decompiler (you have to decompile it into a java file)
  - Now search for the `new TStruct("thisIsStruct")` code in a *.java file
    - But that's not an easy thing to do, the `new TStruct("thisIsStruct")` is definitely obfuscated by the developer and it can be something like this `new A340v("thisIsStruct")`. You have to figure it out by yourself
  - And the result must be like this (if you're using jadx)
    - ![struct search](https://i.ibb.co/fn8dsb3/Screenshot-276.png "Struct search result")
    - The `blabla_args` is a request struct, and the `blabla_result` is a response struct
    - In a request you could get field thrift data
    - In a response you could get responsetype and throws/exception data
  - Now just click one of the result with `_args` in it, and you'll be redirected to the package source
    - ![struct class](https://i.ibb.co/KqYVPfQ/Screenshot-277.png "Struct class")
    - `verifyEapLogin` is the struct name
    - `new C6282b(arg1,arg2,arg3)` is a struct field builder, but you see that it have 3 arguments. So here is the explanation :
        -  `OAuthWebLoginServiceActivity.f1422071` is a field name (should be string), but we got something like that. Because of the name is not a string, you have to explore the `OAuthWebLoginServiceActivity.f1422071` to get the name.
        -  `(byte) 12` is a type of a field. (12 = struct)
        -  `1` is the id of a field.
  - After that, you have to scroll down a little bit and you'll get like this
    - ![struct class](https://i.ibb.co/XC5F9sg/Screenshot-278.png "Struct static")
    - As you can see, it's similar to the struct builder before. But this one is more useful for gathering more information.
    - So, if you found a field with `struct`,`enum`,`map<byte,byte>`,`set<byte>`,`list<byte>` type. You should gather information on `static {.....}` scope (like image above).
  - And now you can make it into human-readable form, the result must be like this
    - `RESPONSETYPE_STRUCT verifyEapLogin(1: OAUTHACTIVITY_STRUCT field_name) throws(1: EXCEPTION_STRUCT e)`
  - So, that's how to obtain and build LINE Thrift Protocol (client-side)
