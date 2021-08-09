//
//  ViewController.swift
//  IMBdIOS
//
//  Created by ChethanBhandarkar on 02/08/21.
//

import UIKit



  
class ViewController: UIViewController {
    @IBOutlet weak var movieCollectionView: UICollectionView!
    weak var movieDetailsViewController: MovieDetailsViewController?
    var searchController =  UISearchController(searchResultsController: nil)
    var moviesViewModel = MoviesViewModel()
    
    var finalMovieDataList:[Movie.MoviesHomeData]? = []{
        didSet{
            DispatchQueue.main.async {
                [weak self] in
                self?.movieCollectionView.reloadData()
            }
            
        }
    }

   override func viewDidLoad() {
        super.viewDidLoad()
        
        //INITIAL LOAD DATA
        moviesViewModel.getMoviesDataList()
    
        setUpSearchController()
        setUpCollectionView()
        bindViewControllerToObserver()
          
    }
    
    
    
    
    private func setUpSearchController(){
        //Movie Collection View Setup
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
    }
    private func setUpCollectionView(){
        //Movie Collection View Setup
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        movieCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    private func bindViewControllerToObserver()
    {   
        moviesViewModel.moviesDataList.bindVC {
            [weak self]
            MoviesDataObserver in
            DispatchQueue.main.async {
                self?.finalMovieDataList = []
            //UPDATE COLLECTION VIEW HERE
                self?.finalMovieDataList = MoviesDataObserver.search
            }
            //DOUBT - How to load only once all data is loaded or make all views blank until its loaded
         
        }
    }
    
    deinit {
        print("deinit main")
    }
    
    
}



//collectionview setup

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if finalMovieDataList == nil{
            print("null")
            return 0
        }
        else{
            return finalMovieDataList!.count
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieCell = movieCollectionView.dequeueReusableCell(
            withReuseIdentifier: "MovieCollectionViewCell",
            for: indexPath) as! MovieCollectionViewCell
        
        movieCell.setup(
            movieItem: finalMovieDataList![indexPath.row])
        
        return movieCell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        
        movieDetailsViewController = storyboard.instantiateViewController(
            withIdentifier: "MovieDetailsViewController")  as? MovieDetailsViewController
        
        movieDetailsViewController?.movieData = finalMovieDataList![indexPath.row]
        navigationController?.pushViewController(
            movieDetailsViewController!,
            animated: true)
 
    }
    
   
}
extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       //doubt change size
        return CGSize(
            width: 100,
            height: 200)
    }
}


//SEARCH BAR
extension ViewController :UISearchBarDelegate
{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let textToSearch = searchBar.text
        {
            moviesViewModel.getMoviesDataList(query: textToSearch)
        }
        searchBar.resignFirstResponder()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        moviesViewModel.getMoviesDataList()
    }
    
    
  
}

