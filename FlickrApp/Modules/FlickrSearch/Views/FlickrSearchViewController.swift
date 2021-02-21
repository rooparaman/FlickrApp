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
  private let itemsPerRow: CGFloat = 3
  private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    flickrSearchBar.delegate = self
    flickrSearchBar.showsCancelButton = true
    
    flickrCollectionView.dataSource = self
    flickrCollectionView.delegate = self
    
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

extension FlickrSearchViewController {
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    self.flickrCollectionView.collectionViewLayout.invalidateLayout()
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    guard let viewModel = viewModel else {
      return
    }
    if !searchText.isEmpty && !viewModel.isLoading {
      let offset = 100
      let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
      if (bottomEdge + CGFloat(offset) >= scrollView.contentSize.height) {
        viewModel.fetchPhotos(for: searchText, page: viewModel.pageNo + 1)
      }
    }
  }
}

// MARK: UISearchBarDelegate methods
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

// MARK: UICollectionViewDataSource methods
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

// MARK: UICollectionViewDelegateFlowLayout methods
extension FlickrSearchViewController: UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    
    let availableWidth = view.safeAreaLayoutGuide.layoutFrame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return sectionInsets
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return sectionInsets.left
  }
  
  
}

