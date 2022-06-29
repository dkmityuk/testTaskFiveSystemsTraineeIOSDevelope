
import UIKit

class MainTableViewController: UITableViewController {
    
    
    var defaultCitiesList = [
        City(name: "Florence", country: "Italy🇮🇹", population: 382347, squere: 102, founded: 1998),
        City(name: "Portree", country: "Scotland🏴󠁧󠁢󠁳󠁣󠁴󠁿", population: 2491, squere: 60, founded: 1998),
        City(name: "Dubai", country: "UAE🇦🇪", population: 2137377, squere: 3885, founded: 1998),
        City(name: "Oia", country: "Greece🇬🇷", population: 665, squere: 12, founded: 1998),
        City(name: "Budapest", country: "Hungary🇭🇺", population: 3000000, squere: 525, founded: 1998),
        City(name: "Rainy",  country: "Norway🇳🇴",population: 24, squere: 34, founded: 1998),
        City(name: "Hong Cong", country: "China🇨🇳", population: 24, squere: 34, founded: 1998),
        City(name: "Istambul", country: "Tyrkey🇹🇷", population: 24, squere: 34, founded: 1998),
        City(name: "Perast",  country: "Montenegro🇲🇪",population: 24, squere: 34, founded: 1998),
        City(name: "Amsterdam",  country: "Netherlands🇳🇱",population: 24, squere: 34, founded: 1998),
        City(name: "Chefchaouen",  country: "Morocco🇲🇦",population: 24, squere: 34, founded: 1998),
        City(name: "Sydney",  country: "Australia🇦🇺",population: 24, squere: 34, founded: 1998),
        City(name: "Bergamo", country: "Italy🇮🇹", population: 24, squere: 34, founded: 1998),
        City(name: "Munich",  country: "Germany🇩🇪",population: 24, squere: 34, founded: 1998),
        City(name: "Capetown", country: "SAR🇿🇦", population: 24, squere: 34, founded: 1998),
        City(name: "Huatape",  country: "Colombia🇨🇴",population: 24, squere: 34, founded: 1998),
        City(name: "Osaka",  country: "Japan🇯🇵 ",population: 24, squere: 34, founded: 1998),
        City(name: "Mostar",  country: "Bosnia & Herzegovina🇧🇦",population: 34, squere: 34, founded: 1998),
        City(name: "Rio-de-Janeiro", country: "Brazil🇧🇷",population: 24, squere: 34, founded: 1998),
        City(name: "Prague", country: "Check🇨🇿", population: 24, squere: 34, founded: 1998)
    ]
    
    
    var cities: [City]{
        get{
            if let array =  UserDefaults.standard.value([City].self, for: "cities"){
                return array
            }else{
                return defaultCitiesList
            }
        }
        set{
            UserDefaults.standard.set(encodable: newValue, forKey: "cities")
            UserDefaults.standard.synchronize()
        }
    }
    
    
    
    
    
    
    private var filteredCitites = [City]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Cities"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
        

    
    @IBAction func resetButton(_ sender: UIButton) {
        print(123)
        cities = defaultCitiesList
        print(cities)
        let alert = UIAlertController(title: "To execute this function ,please, restart your application", message: "The developer is not a magician, he is only learning", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in
            print("tapped Dismiss")
        }))

        present(alert, animated: true)
        
    }
    
    
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredCitites.count
        }
        
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var city: City
        
        if isFiltering {
            city = filteredCitites[indexPath.row]
        } else {
            city = cities[indexPath.row]
        }
        
        cell.textLabel?.text = city.name
        
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let city: City
                if isFiltering {
                    city = filteredCitites[indexPath.row]
                } else {
                    city = cities[indexPath.row]
                }
                let detailVC = segue.destination as! DetailViewController
                detailVC.city = city
            }
        }
    }
    
}

// MARK: - UISearchResultsUpdating Delegate
extension MainTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        filteredCitites = cities.filter({ (city: City) -> Bool in
            return city.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == .delete{
            
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        }
        
        
    }
    
    
   
}



