//
//  ViewController.swift
//  TestApp
//
//  Created by Vasil Karashev on 8.02.23.
//

import UIKit

class VacationDetailsViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var models: [DesiredVacation] = []
    var indexOfSelectedVacation: Int {
       get {
         return UserDefaults.standard.integer(forKey: "VacationIndex")
       }
       set {
         UserDefaults.standard.set(newValue, forKey: "VacationIndex")
       }
     }
   
   override func viewDidLoad() {
       super.viewDidLoad()
       
       self.getAllItem()
   }
   
   init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?,_ index: Int) {
     
       super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
       let a = index
       self.indexOfSelectedVacation = a
      
   }
   
   required init?(coder: NSCoder) {
       super.init(coder: coder)
      
       
   }
   
    
    @IBAction func addImageBtn(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.editedImage]
        addImage.image = image as? UIImage
       
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func getAllItem(){
        do{
            models = try context.fetch(DesiredVacation.fetchRequest())
            DispatchQueue.main.async {
                
                self.name.text = self.models[self.indexOfSelectedVacation].name
                self.hotelName.text = "Hotel: \(self.models[self.indexOfSelectedVacation].hotel ?? "")"
                self.location.text = ", \( self.models[self.indexOfSelectedVacation].location ?? "")"
                
            }
        }
        catch {
        
        }
    }
   

}
