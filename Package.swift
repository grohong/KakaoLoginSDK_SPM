// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KakaoLoginSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "KakaoSDKAuth",
                 targets: ["KakaoSDKAuth"]),

        .library(name: "KakaoSDKCommon",
                 targets: ["KakaoSDKCommon"]),

        .library(name: "KakaoSDKUser",
                 targets: ["KakaoSDKUser"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git",
                 .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
        .target(name: "KakaoSDKAuth",
                dependencies: ["KakaoSDKCommon", "Alamofire"],
                path: "sources/KakaoSDKAuth"),

        .target(name: "KakaoSDKCommon",
                dependencies: ["Alamofire"],
                path: "sources/KakaoSDKCommon"),

        .target(name: "KakaoSDKUser",
                dependencies: ["KakaoSDKCommon", "KakaoSDKAuth", "Alamofire"],
                path: "sources/KakaoSDKUser")
    ]
)
