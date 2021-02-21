// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import UIKit

class FlickrSearchViewController: UIViewController {
  @IBOutlet weak var flickrCollectionView: UICollectionView!
  @IBOutlet weak var flickrSearchBar: UISearchBar!
  
  var viewModel: FlickrSearchViewModel? = nil
  private var photoItems : [FlickrPhotoModel] = []
  private var searchText = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    flickrSearchBar.delegate = self
    flickrSearchBar.showsCancelButton = true
    
    flickrCollectionView.dataSource = self
    
    if let viewModel = viewModel {
      viewModel.photos.bind {[weak self] (photos) in
        guard let self = self, photos.count > 0 else { return }
        self.photoItems = photos
        self.viewModel?.isLoading = false
        DispatchQueue.main.async {
          self.flickrCollectionView.reloadData()
        }
      }
    }
    
  }
  
}

extension FlickrSearchViewController: UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard
      let text = searchBar.text,
      let viewModel = viewModel,
      !text.isEmpty
    else { return  }

    self.searchText = text
    viewModel.fetchPhotos(for: text, page: 0)
    self.flickrSearchBar.endEditing(true)
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    self.flickrSearchBar.endEditing(true)
  }
  
}


extension FlickrSearchViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photoItems.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.photoCellIdentifier, for: indexPath) as! FlickrPhotoCell
    cell.configure(cellViewModel: FlickrPhotoCellViewModel(imageUrl: photoItems[indexPath.row].imageUrl,
                                                           service: viewModel?.flickrService ?? FlickrSearchService()))
    
    return cell
  }
}
