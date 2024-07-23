#!/usr/bin/env bash
# -*- conding: utf-8 -*-

# How to make xcframework: https://medium.com/@elmoezamira/build-your-first-xcframework-how-to-create-an-ios-framework-pt-1-d1a889fdb40d

xcframework_cmd="xcodebuild -create-xcframework"

archive_dir="./output"
scheme_name="Neptune"

if [ -d "${archive_dir}" ]; then
    rm -rf "${archive_dir}"
    echo remove dir: ${archive_dir}
fi

for platform in "iOS" "iOS Simulator" "macOS" "watchOS" "watchOS Simulator" "tvOS" "tvOS Simulator"
do
    
    
    platform_framework_output_dir="${archive_dir}/${platform// /_}"

    xcodebuild archive \
    -scheme "${scheme_name}" \
    -destination "generic/platform=${platform}" \
    -archivePath "${platform_framework_output_dir}" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

    platform_framework_path="${platform_framework_output_dir}.xcarchive/Products/Library/Frameworks/${scheme_name}.framework"
    xcframework_cmd="${xcframework_cmd} -framework ${platform_framework_path}"
done

xcframework_name="${scheme_name}.xcframework"
xcframework_output_path="${archive_dir}/${xcframework_name}"
xcframework_cmd="${xcframework_cmd} -output ${xcframework_output_path}"

eval "${xcframework_cmd}"
echo "${xcframework_cmd}"

if [ -d "${xcframework_output_path}" ]; then
    echo ouput xcframework path: ${xcframework_output_path} 
    zip -r "${xcframework_output_path}.zip" "${xcframework_output_path}"
fi
