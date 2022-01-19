//
//  ViewController.swift
//  HW_4
//
//  Created by Sungur Gasanov on 10.12.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var imageName: [ImageDataSet] = []
    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        container = AppDelegate.persistentContainer
        guard container != nil else {
            fatalError("View needs a persistent container")
        }
        let labelFetch: NSFetchRequest<ImageDataSet> = ImageDataSet.fetchRequest()
        imageName = try! container.viewContext.fetch(labelFetch)
    }
        
    func configureUI() {
        self.title = "Картинки"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(action))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func action(sender: UIBarButtonItem) {
        let url = URL(string: "https://source.unsplash.com/random/600x600")!
        downloadImage(from: url)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() { [weak self] in
                self?.savePng(UIImage(data: data)!)
                self?.tableView.reloadData()
            }
        }
    }
    
    func saveLabel(newLabel: String){
        let label = ImageDataSet(context: container.viewContext)
        label.label = newLabel
        if self.container.viewContext.hasChanges {
            do {
                try self.container.viewContext.save()
            } catch {
                print(error)
            }
        }
        imageName.insert(label, at: 0)
    }
    
    func documentDirectoryPath() -> URL? {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(path)
        return path.first
    }
    
    func savePng(_ image: UIImage) {
        let name = UUID().uuidString
        saveLabel(newLabel: name)
        if let pngData = image.pngData(),
           let path = documentDirectoryPath()?.appendingPathComponent("\(name).png") {
            try? pngData.write(to: path)
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hw4cell") as! HW4TableViewCell
        
        let imageDataset = imageName[indexPath.row].label
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            let image = UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(imageName[indexPath.row].label!).path)
            cell.cellimage.image = image
            cell.cellimage.layer.cornerRadius = 25
        }
        
        cell.resultLabel.text = imageDataset
        return cell
    }
}
