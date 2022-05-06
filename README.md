# NepTunes Theme Tutorial (BETA)


## Preparation
You'll need macOS 12 Monterey and Xcode 13, as well Apple Developer account to [notarize](https://developer.apple.com/documentation/security/notarizing_macos_software_before_distribution) you extension. The exact step-by-step instruction about notarization is below.  
Themes can be written in Swift programming language nad they rely heavily on SwiftUI framework. Anyone knowing basics of SwiftUI can write it, but

## Abstract

NepTunes Themes API consits from two main parts:  
- `Theme`, which is an abstract class that you have to subclass and override it methods
- `NepTunes`, which is a class representing app's current state and provides an interface to control the app

Your job is to create a SwiftUI view that will observe `NepTunes` object and update the UI, whenever the object will change. 

## Project

Open Xcode, create a new project, select the macOS segment and choose the Bundle target. For a bundle extension type `nepext`. Bundle identifier is up to you but please provide something unique (reversed DNS notation is recommended, like on all Apple platforms)

<img width="602" alt="Screenshot 2022-05-06 at 22 30 44-min" src="https://user-images.githubusercontent.com/2467137/167212625-acc710e9-c74f-4d8b-89cd-24f300ce8526.png">

If you never made a project for a bundle target you can be surprised that it's... empty. But that's okay.  
Before we'll start coding, let's fix some problems.

## Project settings and additional target for testing

### Signing
To distribute binaries outside of the App Store, you need a ‘Developer ID Application’ certificate. If you have not created it yet, you can do so in Xcode or in the Developer Portal. If you already have the certificate but on a different Mac, you need to export it and re-import it on the new Mac.  
Go to the Signing & Capabilities section in the bundle target and deselect the "Automatically manage signing" checkbox.  
Choose your theme and for the "Signing Certificate" choose the "Developer ID Application".

### Build Settings
Go to the Build Settings section and search for the "Skip Install" (it's in the Deployment group). Change it false.
