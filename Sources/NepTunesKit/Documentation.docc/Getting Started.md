# Getting Started

Create project, add NepTunesKit package, set correct settings and prepare for codesigning 

## Project

Open Xcode, create a new project, select the macOS segment and choose the Bundle target. 

![Xcode's target selection](project)

For a bundle extension set **nepext**. Bundle identifier is up to you but please provide something unique (reversed DNS notation is recommended, like on all Apple platforms)

![Xcode with a new bundle project options](project-options)

If you never made a project for a bundle target you can be surprised that it's... empty. But that's okay.  
Before we'll start coding, let's fix some problems.

## Project Settings

Most of them won't be needed for now. On the other hand they're of type "set up and forget" so let's do them now, so we can focus on coding later:

### Certificate
To distribute binaries outside of the App Store, you will need a ‘Developer ID Application’ certificate to sign and notarize them. If you have not created it yet, you can do so in the Xcode or in the Developer Portal. If you already have the certificate but on a different Mac, you need to export it and re-import it on the new Mac.

### Archiving
Go to target's build settings, find the Deployment section and the "Skip Install" flag. Set it to "No".

### NepTunesKit
You'll need the NepTunesKit. Select project, "Package Dependencies" and click the add button.

![How to add a dependency](add-dependency)

Provide the url [https://github.com/rurza/NepTunesKit/](https://github.com/rurza/NepTunesKit/) and select the main branch. Keep in mind that as of day of writing (May 15h 2022) the library is in beta and the API can change. Add the framework to theme's target.

![NepTunesKit dependency](choose-package)

Now select theme's target, go to the General tab, find the *"Framework and Libraries"* section and set the *"Embed"* to the *"Do Not Embed"* option. The release version of your theme will link the NepTunesKit that is distributed with the app during runtime.

### App target
Because our theme will be written in SwiftUI, we can utilize the SwiftUI Preview which allows us to preview our view without the need of creating a theme, codesigning it and installing it in NepTunes. Unfortunately we can't use the SwiftUI Preview in the bundle target. We can mitigate it by adding a Mac app to our project.
In your project, click the add button and select the Mac app.

![App target](app-target)

You'll need to provide the name and bundle identifier but they don't matter. Select SwiftUI for the interface.

![App target settings](app-target-name)

In the app's target General settings, find "Framework and Libraries" section and add the NepTunesKit framework.  
Every new file that you'll add to your theme, will have to be added to the app target as well. The new target added a new group with some files in it, i.a. `ContentView.swift` and a xcassets group. You can use the former to create your theme view in it and the latter for storing some images that will simulate arwork cover image.
In the app's target General settings, find "Framework and Libraries" section and add the NepTunesKit framework. Basically every new file that you'll add to your theme, will have to be added to the app target as well.

### Info.plist

A bundle requires the __Principal class__ to be provided in the *Info.plist*. You will need to provide your ``Theme`` subclass name with the module name (aka Bundle name) and a dot between them. So for example, if you named your Bundle *Test* and your ``Theme`` subclass *TestTheme* you should set *Test.TestTheme*.

![Prinicipal class in the Info.plist](principal-class)

### Creating a Theme

Add a new subclass of the ``Theme``. You'll need override variables/methods:
- `info: ThemeInfo`
- `themePreview() -> AnyView `
- `func themeWindow() -> ThemeWindow`

Check out the documentation of the ``Theme`` for more details.

### Codesigning and notarization

We'll use the new __notarytool__ from Xcode 13.

#### Setup
1. Generate a new App specific password for your developer account. Check out [Apple Support](https://support.apple.com/en-us/HT204397) page.
2. Save credentials for your Apple ID and team id with the notarytool:\
`xcrun notarytool store-credentials --apple-id "yourappleid@example.com --team-id "ABCD123456"`
3. It'll ask you to name your profile. Remember it.

#### Notarizing the app
1. Archive the bundle
2. Xcode will automatically open the organizer window with the list of archives. Select the latest and click the *Distribute Content* button and with *Built Products* selected click the *Next* button and save the results.
![Building the app](build)
3. Find the *.nepext* file you just saved and zip it with Finder
4. Open the `Terminal.app` and run the command:

`xcrun notarytool submit path-to-your.zip --keychain-profile the-name-of-profile-from-the-setup --wait`

The result should look more or less like this:
![Result of notarization from terminal](notary-result)

Check out this [great article](https://scriptingosx.com/2021/07/notarize-a-command-line-tool-with-notarytool/) if you want to know more.

### Publishing you theme
If you want to be featured on the NepTunes' website with your theme, [contact me](mailto:adam@micropixels.pl).
