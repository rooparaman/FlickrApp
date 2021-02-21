# Flickr Search App
An app to search and display the photos from Flickr

## Technicalities
- **MVVM** with coordinator is used as the architectural design pattern
- Boxing technique in swift has been used for data binding between the view and the view models
- The app has been designed to give a consistent user view across all orientations and all devices

## Project Structure
### Core
- **Helpers** - Common functionality that is used across the project
- **Services** - Contains the core logic for all Api calls in the project
- **Extensions** - Contains the extension UIViewController to link with the story board. This has been used in the coordinator
- **Coordinators** - Contains the protocol for coordinator and the main app coordinator
### Modules 
- Contains the modules in a folder structure. Here the only module we have is Flickr Search
- **View Models** - Contains classes that acts as VM in the MVVM
- **Coordinators** - Contains the module specific coordinator
- **Views** - The UI presentation logic sits here
- **Data Mappers** - Maps the api data to Model
- **Data Models** - Contains classes that conforms to codable that represent the api data
- **Models** - Contains the actual business models
- **Services** - Contains the module specific logic for invoking the api service

## What else can we do?
- The UI can be implemented fully through code instead of the storyboard as well. It depends on the preference and the complexity of the UI module
- Boxing technique has been used and this can as well be replaced with RxSwift. I know the concepts of RxSwift but I have not used it in a production app, and given the simplicity of this app, I decided to stick with the Boxing technique
- If there is a memory hit, then we could certainly look at holding only a couple of pages data in memory
- If the images as such increase the memory footprint, we can look at downsampling the image, but we need to watchout for the CPU usage
