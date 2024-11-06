import UIKit

fileprivate func makeRepository() -> BreweriesRepository {
    BreweriesRemoteRepository(
    httpClient: URLSessionHTTPClient(),
    api: .dev
  )
}

fileprivate func makeViewModel(
    repository: BreweriesRepository,
    onSuccess: @escaping (_ factValue: [BreweriesList]) -> Void,
  onError: @escaping (_ errorMessage: String) -> Void
) -> BreweriesViewModel {
    BreweriesViewModel(
    repository: repository,
    onSuccess: onSuccess,
    onError: onError
  )
}

class BreweriesListViewController: UIViewController {
    
    private var breweryList : [BreweriesList]?
  
    private var viewModel: BreweriesViewModel!
    
    private var filteredList : [BreweriesList]?
  
    @IBOutlet weak var breweriesTableView: UITableView!
    
    @IBOutlet weak var breweriesListSearchBar: UISearchBar!
    
    private var searching = false

    
  // MARK: - Initialization
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    self.viewModel = makeViewModel(
      repository: makeRepository(),
      onSuccess: { [weak self] in self?.onSuccess(list: $0) },
      onError: { [weak self] in self?.onError(errorMessage: $0) }
    )
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.fetchBreweriesList()
    print(Self.self, #function)
  }

    func onSuccess(list: [BreweriesList]) {
    print(Self.self, #function, list)
        breweryList = list
        breweriesTableView.reloadData()
  }
  
  func onError(errorMessage: String) {
    print(Self.self, #function, errorMessage)
  }
}

extension BreweriesListViewController : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return filteredList?.count  ?? 0
                } else {
                    return breweryList?.count ?? 0
                }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreweriesTableViewCell") as! BreweriesTableViewCell
        var breweryDetail :BreweriesList?
        if searching {
            breweryDetail = filteredList?[indexPath.row] ?? nil
        }
        else {
             breweryDetail = breweryList?[indexPath.row] ?? nil
        }
        cell.setData(data:breweryDetail)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension BreweriesListViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            filteredList = breweryList
            breweriesTableView.reloadData()
            return 

        }
        filteredList = breweryList?.filter({ (BreweriesList) -> Bool in
            (BreweriesList.name?.lowercased().contains(searchText.lowercased()))!
     })
        searchBar.setShowsCancelButton(true, animated: true)
        searching = true
        breweriesTableView.reloadData()
    }
}

