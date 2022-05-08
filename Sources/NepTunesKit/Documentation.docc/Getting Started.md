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

To distribute binaries outside of the App Store, you will need a ‘Developer ID Application’ certificate. If you have not created it yet, you can do so in Xcode or in the Developer Portal. If you already have the certificate but on a different Mac, you need to export it and re-import it on the new Mac.
