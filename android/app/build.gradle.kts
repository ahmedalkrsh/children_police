import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

// تحميل بيانات keystore من android/app/key.properties
val keystoreProperties = Properties()
val keystorePropertiesFile = file("../key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.fourthpyramid.children_police"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "29.0.13113456"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "fourthpyramid.children_police"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            
            val storePassword = keystoreProperties["storePassword"]?.toString()
                ?: throw GradleException("Missing 'storePassword' in key.properties")
            val storeFilePath = keystoreProperties["storeFile"]?.toString()
                ?: throw GradleException("Missing 'storeFile' in key.properties")    
            val keyAlias = keystoreProperties["keyAlias"]?.toString()
                ?: throw GradleException("Missing 'keyAlias' in key.properties")
            val keyPassword = keystoreProperties["keyPassword"]?.toString()
                ?: throw GradleException("Missing 'keyPassword' in key.properties")

            this.storeFile = file(storeFilePath)
            this.storePassword = storePassword
            this.keyAlias = keyAlias
            this.keyPassword = keyPassword
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

flutter {
    source = "../.."
}
