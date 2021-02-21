// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import UIKit

class FlickrPhotoCell: UICollectionViewCell {
  @IBOutlet weak var flickrImageView: UIImageView!
  private var viewModel : FlickrPhotoCellViewModel!
  
  func configure(cellViewModel: FlickrPhotoCellViewModel){
    viewModel = cellViewModel
    viewModel.loadImage(urlSting: viewModel.imageUrl)
    viewModel.image.bind {[weak self] (image) in
      DispatchQueue.main.async {
        self?.flickrImageView.image = image
      }
    }
  }
}
