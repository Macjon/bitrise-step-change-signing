require 'xcodeproj';

# Get command-line arguments
project_path = ARGV[0]
target_name = ARGV[1]
build_configuration = ARGV[2]
code_sign_identity = ARGV[3]
provisioning_profile = ARGV[4]
code_sign_style = ARGV[5]

# Open Xcode project
project = Xcodeproj::Project.open(project_path);

# Find target
target = project.targets.find { |t| t.name == target_name };

# Find build configuration
config = target.build_configurations.find { |c| c.name == build_configuration };

# Apply new settings
config.build_settings['CODE_SIGN_IDENTITY'] = code_sign_identity;
config.build_settings['PROVISIONING_PROFILE_SPECIFIER'] = provisioning_profile;
config.build_settings['CODE_SIGN_STYLE'] = code_sign_style;

project.save;