# ``NepTunesKit``

Create themes for widget used by NepTunes, that users can download and install. This is an early BETA version of this framework.

## Overview

NepTunes Themes API consits from two main parts:  
1. ``Theme``, which is an abstract class that you have to subclass and override it methods.  
This class provides method for theme's info (author, name, icon file url etc.), widget's window initialization, *theme's preview* (used in the app's preferences), background that will used in preview (also used in the app's preferences) and optional *preferences view* that will be displayed in popover.
2. ``NepTunes``, which is a class representing app's current state and provides an interface to control the app

Your job is to create a SwiftUI view that will observe `NepTunes` object and update the UI, whenever the object will change. 

## Topics

### Getting Started

- <doc:Getting-Started>
- ``Theme``
- ``NepTunes``

### Theme's metadata

- ``ThemeInfo``

### Track representation

- ``Track``
- ``AnyTrack``

### NepTunes' state

- ``NepTunesPlayerState``
- ``PlayerPlaybackState``
- ``PlayerType``
- ``RepeatMode``

### Widget's Window

- ``ThemeWindow``
- ``ThemeWindowBehavior``
