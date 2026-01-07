Title:   My Document
Summary: A brief description of my document.

# Android Pentesting

## Android Reconnaissance

### AR-001 Dump package information from apk

`aapt` - Get package name, target sdk, main (launchable) activity, etc.

```bash
aapt dump badging .\UnCrackable-Level1.apk
---
	package: name='owasp.mstg.uncrackable1' versionCode='1' versionName='1.0'
	sdkVersion:'19'
	targetSdkVersion:'28'
	application-label:'Uncrackable1'
	application-icon-160:'res/mipmap-mdpi-v4/ic_launcher.png'
	application-icon-240:'res/mipmap-hdpi-v4/ic_launcher.png'
	application-icon-320:'res/mipmap-xhdpi-v4/ic_launcher.png'
	application-icon-480:'res/mipmap-xxhdpi-v4/ic_launcher.png'
	application-icon-640:'res/mipmap-xxxhdpi-v4/ic_launcher.png'
	application: label='Uncrackable1' icon='res/mipmap-mdpi-v4/ic_launcher.png'
	launchable-activity: name='sg.vantagepoint.uncrackable1.MainActivity'  label='Uncrackable1' icon=''
	feature-group: label=''
	  uses-feature: name='android.hardware.faketouch'
	  uses-implied-feature: name='android.hardware.faketouch' reason='default feature for all apps'
	main
	supports-screens: 'small' 'normal' 'large' 'xlarge'
	supports-any-density: 'true'
	locales: '--_--'
	densities: '160' '240' '320' '480' '640'
```

### AR-002 Dump package information from runtime

```bash
adb shell pm list packages
adb shell pm list packages -f | grep -i foodies
adb shell dumpsys package com.example.foodies
---
	Activity Resolver Table:
	  Non-Data Actions:
	      android.intent.action.MAIN:
	        797c103 com.example.foodies/.MainActivity filter 3be4880
	          Action: "android.intent.action.MAIN"
	          Category: "android.intent.category.LAUNCHER"
	
	Receiver Resolver Table:
	  Non-Data Actions:
	      androidx.profileinstaller.action.SAVE_PROFILE:
	        51c0eb9 com.example.foodies/androidx.profileinstaller.ProfileInstallReceiver filter eff6cac
	          Action: "androidx.profileinstaller.action.SAVE_PROFILE"
	      androidx.profileinstaller.action.INSTALL_PROFILE:
	        51c0eb9 com.example.foodies/androidx.profileinstaller.ProfileInstallReceiver filter 584d2fe
	          Action: "androidx.profileinstaller.action.INSTALL_PROFILE"
	      androidx.profileinstaller.action.SKIP_FILE:
	        51c0eb9 com.example.foodies/androidx.profileinstaller.ProfileInstallReceiver filter 4b6a5f
	          Action: "androidx.profileinstaller.action.SKIP_FILE"
	      androidx.profileinstaller.action.BENCHMARK_OPERATION:
	        51c0eb9 com.example.foodies/androidx.profileinstaller.ProfileInstallReceiver filter ee5dd75
	          Action: "androidx.profileinstaller.action.BENCHMARK_OPERATION"

	Domain verification status:
	
	Permissions:
	  Permission [com.example.foodies.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION] (fefb99b):
	    sourcePackage=com.example.foodies
	    uid=10197 gids=[] type=0 prot=signature
	    perm=PermissionInfo{c817138 com.example.foodies.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION}
	    flags=0x0
	
	Registered ContentProviders:
	  com.example.foodies/androidx.startup.InitializationProvider:
	    Provider{cec7511 com.example.foodies/androidx.startup.InitializationProvider}
	
	ContentProvider Authorities:
	  [com.example.foodies.androidx-startup]:
	    Provider{cec7511 com.example.foodies/androidx.startup.InitializationProvider}
	      applicationInfo=ApplicationInfo{87f3676 com.example.foodies}
	
	Key Set Manager:
	  [com.example.foodies]
	      Signing KeySets: 59
	
	Packages:
	  Package [com.example.foodies] (292ed35):
	    appId=10197
	    pkg=Package{6065477 com.example.foodies}
	    codePath=/data/app/~~oZ0lNhDdkIp2NaWMhGczgw==/com.example.foodies-ttByxQb49HI7GiOb62XhPQ==
	    resourcePath=/data/app/~~oZ0lNhDdkIp2NaWMhGczgw==/com.example.foodies-ttByxQb49HI7GiOb62XhPQ==
	    legacyNativeLibraryDir=/data/app/~~oZ0lNhDdkIp2NaWMhGczgw==/com.example.foodies-ttByxQb49HI7GiOb62XhPQ==/lib
	    extractNativeLibs=false
	    primaryCpuAbi=null
	    secondaryCpuAbi=null
	    cpuAbiOverride=null
	    versionCode=1 minSdk=31 targetSdk=34
	    minExtensionVersions=[]
	    versionName=1.0
	    usesNonSdkApi=false
	    splits=[base]
	    apkSigningVersion=2
	    flags=[ DEBUGGABLE HAS_CODE ALLOW_CLEAR_USER_DATA ALLOW_BACKUP ]
	    privateFlags=[ PRIVATE_FLAG_ACTIVITIES_RESIZE_MODE_RESIZEABLE_VIA_SDK_VERSION ALLOW_AUDIO_PLAYBACK_CAPTURE PRIVATE_FLAG_ALLOW_NATIVE_HEAP_POINTER_TAGGING ]
	    forceQueryable=false
	    dataDir=/data/user/0/com.example.foodies
	    supportsScreens=[small, medium, large, xlarge, resizeable, anyDensity]
	    timeStamp=2025-05-22 04:17:19
	    lastUpdateTime=2025-05-22 04:17:19
	    installerPackageName=null
	    installerPackageUid=-1
	    initiatingPackageName=com.android.shell
	    originatingPackageName=null
	    packageSource=1
	    appMetadataFilePath=null
	    signatures=PackageSignatures{97868e4 version:2, signatures:[522e4361], past signatures:[]}
	    installPermissionsFixed=true
	    pkgFlags=[ DEBUGGABLE HAS_CODE ALLOW_CLEAR_USER_DATA ALLOW_BACKUP ]
	    privatePkgFlags=[ PRIVATE_FLAG_ACTIVITIES_RESIZE_MODE_RESIZEABLE_VIA_SDK_VERSION ALLOW_AUDIO_PLAYBACK_CAPTURE PRIVATE_FLAG_ALLOW_NATIVE_HEAP_POINTER_TAGGING ]
	    apexModuleName=null
	    declared permissions:
	      com.example.foodies.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION: prot=signature
	    requested permissions:
	      android.permission.ACCESS_COARSE_LOCATION
	      android.permission.ACCESS_FINE_LOCATION
	      android.permission.READ_CONTACTS
	      android.permission.RECORD_AUDIO
	      android.permission.CALL_PHONE
	      android.permission.CAMERA
	      android.permission.SEND_SMS
	      android.permission.READ_SMS
	      android.permission.BLUETOOTH
	      android.permission.READ_CALENDAR
	      com.example.foodies.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION
	    install permissions:
	      com.example.foodies.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION: granted=true
	      android.permission.BLUETOOTH: granted=true
	    User 0: ceDataInode=344151 installed=true hidden=false suspended=false distractionFlags=0 stopped=false notLaunched=false enabled=0 instant=false virtual=false
	      installReason=0
	      firstInstallTime=2025-05-22 04:17:19
	      uninstallReason=0
	      overlay paths:
	        /product/overlay/EmulationPixel3a/EmulationPixel3aOverlay.apk
	        /product/overlay/NavigationBarModeGestural/NavigationBarModeGesturalOverlay.apk
	      legacy overlay paths:
	        /product/overlay/EmulationPixel3a/EmulationPixel3aOverlay.apk
	        /product/overlay/NavigationBarModeGestural/NavigationBarModeGesturalOverlay.apk
	      gids=[3002]
	      runtime permissions:
	        android.permission.READ_SMS: granted=false, flags=[ USER_SENSITIVE_WHEN_GRANTED|USER_SENSITIVE_WHEN_DENIED|RESTRICTION_INSTALLER_EXEMPT]
	        android.permission.READ_CALENDAR: granted=false, flags=[ USER_SENSITIVE_WHEN_GRANTED|USER_SENSITIVE_WHEN_DENIED]
	        android.permission.ACCESS_FINE_LOCATION: granted=false, flags=[ USER_SENSITIVE_WHEN_GRANTED|USER_SENSITIVE_WHEN_DENIED]
	        android.permission.ACCESS_COARSE_LOCATION: granted=false, flags=[ USER_SENSITIVE_WHEN_GRANTED|USER_SENSITIVE_WHEN_DENIED]
	        android.permission.SEND_SMS: granted=false, flags=[ USER_SENSITIVE_WHEN_GRANTED|USER_SENSITIVE_WHEN_DENIED|RESTRICTION_INSTALLER_EXEMPT]
	        android.permission.CALL_PHONE: granted=false, flags=[ USER_SENSITIVE_WHEN_GRANTED|USER_SENSITIVE_WHEN_DENIED]
	        android.permission.CAMERA: granted=false, flags=[ USER_SENSITIVE_WHEN_GRANTED|USER_SENSITIVE_WHEN_DENIED]
	        android.permission.RECORD_AUDIO: granted=false, flags=[ USER_SENSITIVE_WHEN_GRANTED|USER_SENSITIVE_WHEN_DENIED]
	        android.permission.READ_CONTACTS: granted=false, flags=[ USER_SENSITIVE_WHEN_GRANTED|USER_SENSITIVE_WHEN_DENIED]

	Queries:
	  system apps queryable: false
	  queries via forceQueryable:
	  queries via package name:
	  queries via component:
	    com.google.android.settings.intelligence:
	      com.example.foodies
	  queryable via interaction:
	    User 0:
	      [com.android.wallpaperbackup,com.android.localtransport,android,com.android.providers.settings,com.android.server.telecom,com.android.inputdevices,com.android.location.fused,com.android.dynsystem,com.android.emulator.multidisplay,com.android.settings,com.android.keychain]:
	        com.example.foodies
	      [com.google.android.gsf,com.google.android.gms]:
	        com.example.foodies
	      com.google.android.permissioncontroller:
	        com.example.foodies
	  queryable via uses-library:
	
	Dexopt state:
	  [com.example.foodies]
	    path: /data/app/~~oZ0lNhDdkIp2NaWMhGczgw==/com.example.foodies-ttByxQb49HI7GiOb62XhPQ==/base.apk
	      x86_64: [status=run-from-apk] [reason=unknown] [primary-abi]
	        [location is error]
	
	Compiler stats:
	  [com.example.foodies]
	    (No recorded stats)

```

### AR-003 Acquire APK from the device

Locate an apk on a device by a package name, and pull it to the host using adb.

```bash
adb shell pm list packages -f | grep -i crackme
adb shell pm list packages -f | grep -V android
---
	package:/data/app/~~oZ0lNhDdkIp2NaWMhGczgw==/com.example.foodies-ttByxQb49HI7GiOb62XhPQ==/base.apk=com.example.foodies
	package:/data/app/~~_im0vbmG2BJ4FJQEdVCz3g==/com.example.frenzy-viauWKyuiqJescyI2uFSpA==/base.apk=com.example.frenzy
	package:/product/app/PrebuiltGoogleTelemetryTvp/PrebuiltGoogleTelemetryTvp.apk=com.google.mainline.telemetry
	package:/product/app/PrebuiltGoogleAdservicesTvp/PrebuiltGoogleAdservicesTvp.apk=com.google.mainline.adservices
---
adb pull /data/app/~~oZ0lNhDdkIp2NaWMhGczgw==/com.example.foodies-ttByxQb49HI7GiOb62XhPQ==/base.apk .
```

## Android Static Analysis

### AS-001 AndroidManifest.xml analysis

Open an APK in `jadx-gui`.

Go to *Resources* -> *AndroidManifest.xml*.

Look for:

- **manifest:**
    - **minSdk / targetSdk (security model)**
    - package
- **application:**
    - debuggable=true
    - allowBackup=true
- **uses-permissions**
    - excessive / high-risk permissions
- **exported components:**
    - activities
    - services
    - receivers
    - providers
- **intent-filters on exported components**
- **custom permissions (protectionLevel)**

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    android:versionCode="1"
    android:versionName="1.0"
    android:compileSdkVersion="34"
    android:compileSdkVersionCodename="14"
    package="com.example.foodies"
    platformBuildVersionCode="34"
    platformBuildVersionName="14">
    <uses-sdk
        android:minSdkVersion="31"
        android:targetSdkVersion="34"/>
    <uses-feature
        android:name="android.hardware.telephony"
        android:required="false"/>
    <uses-feature
        android:name="android.hardware.camera"
        android:required="false"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    <uses-permission android:name="android.permission.READ_CONTACTS"/>
    <uses-permission android:name="android.permission.RECORD_AUDIO"/>
    <uses-permission android:name="android.permission.CALL_PHONE"/>
    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-permission android:name="android.permission.SEND_SMS"/>
    <uses-permission android:name="android.permission.READ_SMS"/>
    <uses-permission android:name="android.permission.BLUETOOTH"/>
    <uses-permission android:name="android.permission.READ_CALENDAR"/>
    <permission
        android:name="com.example.foodies.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"
        android:protectionLevel="signature"/>
    <uses-permission android:name="com.example.foodies.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"/>
    <application
        android:theme="@style/Theme.Foodies"
        android:label="@string/app_name"
        android:icon="@drawable/ic_foodies_logo"
        android:debuggable="true"
        android:allowBackup="true"
        android:supportsRtl="true"
        android:extractNativeLibs="false"
        android:fullBackupContent="@xml/backup_rules"
        android:roundIcon="@drawable/ic_foodies_logo"
        android:appComponentFactory="androidx.core.app.CoreComponentFactory"
        android:dataExtractionRules="@xml/data_extraction_rules">
        <activity
            android:theme="@style/Theme.Foodies"
            android:label="@string/app_name"
            android:name="com.example.foodies.MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <activity
            android:name="androidx.compose.ui.tooling.PreviewActivity"
            android:exported="true"/>
        <activity
            android:name="androidx.activity.ComponentActivity"
            android:exported="true"/>
        <provider
            android:name="androidx.startup.InitializationProvider"
            android:exported="false"
            android:authorities="com.example.foodies.androidx-startup">
            <meta-data
                android:name="androidx.emoji2.text.EmojiCompatInitializer"
                android:value="androidx.startup"/>
            <meta-data
                android:name="androidx.lifecycle.ProcessLifecycleInitializer"
                android:value="androidx.startup"/>
            <meta-data
                android:name="androidx.profileinstaller.ProfileInstallerInitializer"
                android:value="androidx.startup"/>
        </provider>
        <receiver
            android:name="androidx.profileinstaller.ProfileInstallReceiver"
            android:permission="android.permission.DUMP"
            android:enabled="true"
            android:exported="true"
            android:directBootAware="false">
            <intent-filter>
                <action android:name="androidx.profileinstaller.action.INSTALL_PROFILE"/>
            </intent-filter>
            <intent-filter>
                <action android:name="androidx.profileinstaller.action.SKIP_FILE"/>
            </intent-filter>
            <intent-filter>
                <action android:name="androidx.profileinstaller.action.SAVE_PROFILE"/>
            </intent-filter>
            <intent-filter>
                <action android:name="androidx.profileinstaller.action.BENCHMARK_OPERATION"/>
            </intent-filter>
        </receiver>
    </application>
</manifest>
```

### AS-002 Analyze app permissions

Poprawić, bo nie ma wszystkich, np BIND_DEVICE_ADMIN, nie ma nic o full screen access w bind+accessibility_service

[Android App Permissions](Android%20App%20Permissions%202d7daf47848980b9a797c9826be2656a.csv)

## Android Dynamic Analysis

### AD-001 Screenshot protection

Pamiętać, że w emulatorze screenshot zawsze zostanie zrobiony, bo jest robiony przez hosta.

Przejdź do app switchera i sprawdź na dole zabezpieczenie przed screenshotem.

Aby się upewnić, można przez adb zrobić dumpa okien, zlokalizować okno aplikacji, a następnie przyjrzeć się flagom w sekcji ***fl=***

Jeżeli znajduje się tam flaga SECURE, to aplikacja zabezpiecza się przed robieniem screenów i nagrywaniem. 

```bash
adb shell dumpsys window | grep -A 6 "Window #"
```

### AD-002 Testing Debuggability

When evaluating an Android application, it's important to determine whether the app is built with debuggability enabled, as this affects how easily developers (or others) can attach a debugger and inspect its runtime behavior. 

While this feature is useful during development, it should be disabled in production to prevent potential misuse.

You can also check if an application is debuggable by connecting `jdb` to its running process; if the connection is successful, it indicates that debugging is enabled.

Let's start a new process by running the "Allsafe" app.

![image.png](f21fc779-6e13-40d5-a756-b015a15880af.png)

Now, using adb and jdwp, we can identify the PID of the active application that we want to debug:

```bash
adb jdwp
--
14827
```

The last launched PID corresponds to our application.

Now we will create a communication channel by using adb between the application process (with the PID) and our host machine by using a specific local port.

```bash
adb forward tcp:55555 jdwp:<PID>
adb forward tcp:55555 jdwp:14827
```

```bash
jdb -connect com.sun.jdi.SocketAttach:hostname=localhost,port=55555
--
Set uncaught java.lang.Throwable
Set deferred uncaught java.lang.Throwable
Initializing jdb ...
> help
** command list **
connectors                -- list available connectors and transports in this VM

run [class [args]]        -- start execution of application's main class

threads [threadgroup]     -- list threads
thread <thread id>        -- set default thread
suspend [thread id(s)]    -- suspend threads (default: all)
resume [thread id(s)]     -- resume threads (default: all)
where [<thread id> | all] -- dump a thread's stack
wherei [<thread id> | all]-- dump a thread's stack, with pc info
up [n frames]             -- move up a thread's stack
down [n frames]           -- move down a thread's stack
kill <thread id> <expr>   -- kill a thread with the given exception object
interrupt <thread id>     -- interrupt a thread

print <expr>              -- print value of expression
dump <expr>               -- print all object information
eval <expr>               -- evaluate expression (same as print)
set <lvalue> = <expr>     -- assign new value to field/variable/array element
locals                    -- print all local variables in current stack frame

classes                   -- list currently known classes
class <class id>          -- show details of named class
methods <class id>        -- list a class's methods
fields <class id>         -- list a class's fields

threadgroups              -- list threadgroups
threadgroup <name>        -- set current threadgroup

stop [go|thread] [<thread_id>] <at|in> <location>
                          -- set a breakpoint
                          -- if no options are given, the current list of breakpoints is printed
                          -- if "go" is specified, immediately resume after stopping
                          -- if "thread" is specified, only suspend the thread we stop in
                          -- if neither "go" nor "thread" are specified, suspend all threads
                          -- if an integer <thread_id> is specified, only stop in the specified thread
                          -- "at" and "in" have the same meaning
                          -- <location> can either be a line number or a method:
                          --   <class_id>:<line_number>
                          --   <class_id>.<method>[(argument_type,...)]
clear <class id>.<method>[(argument_type,...)]
                          -- clear a breakpoint in a method
clear <class id>:<line>   -- clear a breakpoint at a line
clear                     -- list breakpoints
catch [uncaught|caught|all] <class id>|<class pattern>
                          -- break when specified exception occurs
ignore [uncaught|caught|all] <class id>|<class pattern>
                          -- cancel 'catch' for the specified exception
watch [access|all] <class id>.<field name>
                          -- watch access/modifications to a field
unwatch [access|all] <class id>.<field name>
                          -- discontinue watching access/modifications to a field
trace [go] methods [thread]
                          -- trace method entries and exits.
                          -- All threads are suspended unless 'go' is specified
trace [go] method exit | exits [thread]
                          -- trace the current method's exit, or all methods' exits
                          -- All threads are suspended unless 'go' is specified
untrace [methods]         -- stop tracing method entrys and/or exits
step                      -- execute current line
step up                   -- execute until the current method returns to its caller
stepi                     -- execute current instruction
next                      -- step one line (step OVER calls)
cont                      -- continue execution from breakpoint

list [line number|method] -- print source code
use (or sourcepath) [source file path]
                          -- display or change the source path
exclude [<class pattern>, ... | "none"]
                          -- do not report step or method events for specified classes
classpath                 -- print classpath info from target VM

monitor <command>         -- execute command each time the program stops
monitor                   -- list monitors
unmonitor <monitor#>      -- delete a monitor
read <filename>           -- read and execute a command file

lock <expr>               -- print lock info for an object
threadlocks [thread id]   -- print lock info for a thread

pop                       -- pop the stack through and including the current frame
reenter                   -- same as pop, but current frame is reentered
redefine <class id> <class file name>
                          -- redefine the code for a class

disablegc <expr>          -- prevent garbage collection of an object
enablegc <expr>           -- permit garbage collection of an object

!!                        -- repeat last command
<n> <command>             -- repeat command n times
# <command>               -- discard (no-op)
help (or ?)               -- list commands
dbgtrace [flag]           -- same as dbgtrace command line option
version                   -- print version information
exit (or quit)            -- exit debugger

<class id>: a full class name with package qualifiers
<class pattern>: a class name with a leading or trailing wildcard ('*')
<thread id>: thread number as reported in the 'threads' command
<expr>: a Java(TM) Programming Language expression.
Most common syntax is supported.

Startup commands can be placed in either "jdb.ini" or ".jdbrc"
in user.home or user.dir
```

We successfully attached jdb to the running process. Hence, debugging is activated.

### AD-003 Testing Verbose Logging

Run the following command to find the process ID (PID) of the target app.

```bash
adb shell ps | grep bank
--
u0_a97 12543 1775 1447660 1274940 0 0 S com.android.insecurebankv2
```

Next, run the following command to monitor the device log related to the **InsecureBank** app:

```bash
adb logcat | grep 12543
```

![image.png](image.png)

![image.png](image%201.png)

![image.png](image%202.png)

### AD-004 Setting global HTTP proxy using adb

```bash
ip addr

adb shell settings put global http_proxy 10.10.10.57:8080
```

## Android Exploitation/Validation
