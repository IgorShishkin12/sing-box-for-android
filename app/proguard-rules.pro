# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

# --- Reticulum BLE (RNode over Bluetooth) ---------------------------------
# btleplug's Rust "droidplug" backend (linked inside libgojni.so) and jni-utils
# reach these classes/members purely over JNI (FindClass / GetMethodID), so R8
# sees no references and would strip or rename them, breaking BLE at runtime.
# Keep the full API of both packages.
-keep class com.nonpolynomial.btleplug.** { *; }
-keep class io.github.gedgygedgy.rust.** { *; }

# The native symbol Java_io_nekohasekai_sfa_ReticulumBle_nativeSetReticulumJVM is
# resolved by name, so the declaring class and its native method must not be
# renamed. (Also preserves any other native-method declarations in the app.)
-keepclasseswithmembernames class io.nekohasekai.sfa.ReticulumBle { native <methods>; }
-keepclasseswithmembernames class * { native <methods>; }
