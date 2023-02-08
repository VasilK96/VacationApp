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
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAllItem()
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
                
                self.name.text = self.models[VacationsTableViewController().vacationIndex ?? 0].name
                self.hotelName.text = self.models[VacationsTableViewController().vacationIndex ?? 0].hotel
                self.location.text = ", \( self.models[(VacationsTableViewController().vacationIndex ?? 0)].location ?? "")"
                
            }
        }
        catch {
        
        }
    }
   

}
