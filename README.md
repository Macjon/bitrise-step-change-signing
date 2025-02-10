# Change signing variables in .pbxproj file

With this step you can change the following values for a specific target and build configuration:

- CODE_SIGN_IDENTITY
- PROVISIONING_PROFILE_SPECIFIER
- CODE_SIGN_STYLE

## How to use this Step in your bitrise.yml file

Reference it in your `bitrise.yml` with the `git::PUBLIC-GIT-CLONE-URL@BRANCH` step reference style:

```
- git::https://github.com/Macjon/bitrise-step-change-signing.git@main:
   inputs:
        - pbxproj_path: "project.pbxproj"
        - target: "Target-name"
        - build_configuration: "Debug"
        - code_sign_identity: "iPhone Distribution"
        - provisioning_profile_specifier: "My provisioning profile name"
        - code_sign_style: "Manual"
```

## Share your own Step

You can share your Step or step version with the [bitrise CLI](https://github.com/bitrise-io/bitrise). If you use the `bitrise.yml` included in this repository, all you have to do is:

1. In your Terminal / Command Line `cd` into this directory (where the `bitrise.yml` of the step is located)
1. Run: `bitrise run test` to test the step
1. Run: `bitrise run audit-this-step` to audit the `step.yml`
1. Check the `share-this-step` workflow in the `bitrise.yml`, and fill out the
   `envs` if you haven't done so already (don't forget to bump the version number if this is an update
   of your step!)
1. Then run: `bitrise run share-this-step` to share the step (version) you specified in the `envs`
1. Send the Pull Request, as described in the logs of `bitrise run share-this-step`

That's all ;)
