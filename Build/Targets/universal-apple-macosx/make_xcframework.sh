#!/usr/bin/env bash
# -*- conding: utf-8 -*-

# How to make xcframework: https://medium.com/@elmoezamira/build-your-first-xcframework-how-to-create-an-ios-framework-pt-1-d1a889fdb40d

xcframework_cmd="xcodebuild -create-xcframework"

for platform in "iOS" "iOS Simulator" "macOS"
do
    scheme_name="Neptune"
    archive_dir="./output"
    platform_framework_output_dir="${archive_dir}/${platform}"

    xcodebuild archive \
    -scheme "${scheme_name}" \
    -destination "generic/platform=${platform}" \
    -archivePath "${platform_framework_output_dir}" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

    platform_framework_path="${platform_framework_output_dir}.xcarchive/Products/Library/Frameworks/${scheme_name}.framework"
    xcframework_cmd="${xcframework_cmd} -framework ${platform_framework_path}"
done

xcframework_cmd="${xcframework_cmd} -output ${archive_dir}/${scheme_name}.xcframework"
eval "${xcframework_cmd}"
echo "${xcframework_cmd}"