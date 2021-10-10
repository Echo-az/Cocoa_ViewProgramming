## Actual Combat

**File Hierachy**

- Assets.xcassets

  An asset catalog that you use to organize your app's images, icons, colors, and more.

  iOS SDK can directly deal with the asset's name. App Store can control to only download relevant file to user's iPhone.

  Assets are stored in subfolders and metadata is stored in JSON files.

- Info.plist

  A resource containing key-value pairs that identify and configure a bundle.

  Use an instance of `NSBundle` to access an information property list. Use `objectForInfoDictionaryKey:` to obtain the value.

  About more: https://developer.apple.com/documentation/bundleresources/information_property_list?language=objc

- Project.entitlements

  Key-value pairs that grant an executable permission to use a service or technology

- MainMenu.xib

  - File's Owner
  - First Responder
  - Application
  - App Delegate
  - Font Manager
  - Views

  

