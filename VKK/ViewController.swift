

//import UIKit
//import SDWebImage
//
//class ViewController: UIViewController {
//
//   var items = [Item]()
//    let service = Service()
//    let session = Session.shared
//    var collectionView : UICollectionView! // создаю коллекшн вью кодом
//
//    override func viewDidLoad() {
//            super.viewDidLoad()
//        config()
//
//        service.getPhoto(token:session.token ) { items in
//            self.items = items
//            self.collectionView.reloadData()
//        }
//
//        }
    
//    func config(){
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        // layout.minimumLineSpacing = 0
//
//        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout) // чтобы изображение было на весь экран
//        collectionView.isPagingEnabled = true  // чтобы открывалось по одной фотке, а не бесконечный скролл
//
//        self.view.addSubview(collectionView) // добавляем его на экран верхним слоем
//
//        // регистрирую ячейку
//        collectionView.register(UINib(nibName: CellCollectionViewCell.reuseID, bundle: nil), forCellWithReuseIdentifier: CellCollectionViewCell.reuseID)
//
////         collectionView.delegate = self
////       collectionView.dataSource = self
//    }
//}

//extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return items.count
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellCollectionViewCell.reuseID, for: indexPath) as? CellCollectionViewCell
//
//        let imageUrl = self.items[indexPath.row].url
//
//        cell?.configCell(imageUrl: imageUrl)
//
//        return cell ?? UICollectionViewCell()
//    }
//}


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//
//    @IBOutlet weak var passwordInput: UITextField!
//    @IBOutlet weak var loginInput: UITextField!
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//
//    }
//
//
//    @IBAction func buttonInput(_ sender: Any) {
//        guard let login = loginInput.text,
//              let password = passwordInput.text,
//              login == "",
//              password == ""
//        else {
//            show(message: "Error login/password")
//            return}
//        performSegue(withIdentifier: "login", sender: nil)
//
//    }
//

    

