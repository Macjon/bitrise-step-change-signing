#!/bin/bash
set -ex

if [ -z "${pbxproj_path}" ] ; then
  echo " [!] Missing required input: pbxproj_path"
  echo " [!] Exiting..."
  exit 1
fi
if [ ! -f "${pbxproj_path}" ] ; then
  echo " [!] File project.pbxproj doesn't exist at specified path: ${pbxproj_path}"
  echo " [!] Exiting..."
  exit 1
fi

if [ -z "${target_name}" ] ; then
  echo " [!] No target specified!"
  exit 1
fi

if [ -z "${build_configuration}" ] ; then
  echo " [!] No build configuration specified!"
  exit 1
fi

if [ -z "${code_sign_identity}" ] ; then
  echo " [!] No code sign identity specified!"
  exit 1
fi

if [ -z "${provisioning_profile_specifier}" ] ; then
  echo " [!] No provisioning profile specified!"
  exit 1
fi

if [ -z "${code_sign_style}" ] ; then
  echo " [!] No code sign style specified!"
  exit 1
fi

echo " (i) 🔧 Provided pbxproj path: ${pbxproj_path}"
echo " (i) 📦 Provided target: ${target_name}"
echo " (i) ⚙️ Provided build configuration : ${build_configuration}"
echo " (i) 🔑 Provided code sign identity: ${code_sign_identity}"
echo " (i) 📜 Provided provisioning profile: ${provisioning_profile_specifier}"
echo " (i) Provided code sign style: ${code_sign_style}"

# Install xcodeproj if not available
gem install xcodeproj

# Run Ruby script with custom step variables
ruby ./update_signing.rb "${pbxproj_path}" "${target_name}" "${build_configuration}" "${code_sign_identity}" "${provisioning_profile_specifier}" "${code_sign_style}"