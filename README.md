# CatSampleMVVM
CAT API Sample 

On launch the app fetches data from thecatapi.com and populates the list of available cat breeds with image and breed name. 
SearchBar for searching the cat breed.

Selecting a particular breed lends us on a screen where we can get see the images of selected breed as well the details about the selected breed.
Detail view consist of a tab view. (image view & info view).

Implemeneted pagination in detail view (image search api by breed id) after getting the pagination count from response header.

Using CachedAsyncImage for caching the server images so they will download once and reuse themselves whenever needed.


Architecture Details used in project: MVVM

MODEL:
Breed -  breed details
BreedImage - breed image details

VIEWMODEL:
FetchBreed for breed details/list view
FetchImages for selected breed images

NetworkLayer - 
APIError - Contains various error cases example: badResponse, badURL, etc
APISevice - Contails core logic for fetching api and getting response
APIServiceProtocol - used for injecting service entity into the viewmodel initilizer

CachedAsyncImage - To cache network images

VIEW:
BreedListView
ErrorView
LoadingView
BreedView
BreedDetailView
BreedImages
