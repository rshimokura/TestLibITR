#!/bin/sh

rm -rf build/*

xcodebuild 'BUILD_LIBRARY_FOR_DISTRIBUTION=YES' 'SKIP_INSTALL=NO' archive -workspace 'TestLibITR.xcworkspace' -scheme 'TestLibITR' -destination 'generic/platform=iOS' -configuration 'Release' -sdk iphoneos -archivePath 'build/TestLibITR-iOS.xcarchive'

xcodebuild 'BUILD_LIBRARY_FOR_DISTRIBUTION=YES' 'SKIP_INSTALL=NO' archive -workspace 'TestLibITR.xcworkspace' -scheme 'TestLibITR' -destination 'generic/platform=iOS Simulator' -configuration 'Release' -sdk iphonesimulator CODE_SIGN_IDENTITY="Apple Development: masanori onoe (2F6859EQ6M)" -archivePath 'build/TestLibITR-iOS-Simulator.xcarchive'

xcodebuild -create-xcframework -framework 'build/TestLibITR-iOS.xcarchive/Products/Library/Frameworks/TestLibITR.framework' -framework 'build/TestLibITR-iOS-Simulator.xcarchive/Products/Library/Frameworks/TestLibITR.framework' -output 'build/TestLibITR.xcframework'


