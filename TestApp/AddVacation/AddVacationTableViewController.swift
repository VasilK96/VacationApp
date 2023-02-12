//
//  AddVacationTableViewController.swift
//  TestApp
//
//  Created by Vasil Karashev on 7.02.23.
//

import UIKit

class AddVacationTableViewController: UITableViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate, UITextFieldDelegate{

    
    @IBOutlet weak var vacationName: UITextField!
    @IBOutlet weak var hotel: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var money: UITextField!
    @IBOutlet weak var about: UITextField!
    @IBOutlet weak var addImage: UIImageView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    public var models: [DesiredVacation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getAllItem()
    }

    @IBAction func addVacationBtn(_ sender: Any) {
        createItem(name: vacationName.text!, hotel: hotel.text!, location: location.text!, about: about.text!, money: Int64(money.text!) ?? 0, imageName: "")
        
    }
    
    @IBAction func clearBtn(_ sender: Any) {
        vacationName.text = ""
        hotel.text = ""
        location.text = ""
        about.text = ""
        money.text = ""
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
        self.tableView.reloadData()
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    //MARK: - Core Data
    
    
    func getAllItem(){
        do{
            models = try context.fetch(DesiredVacation.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            //error
        }
    }
    
    func createItem(name: String, hotel: String, location: String, about: String, money: Int64, imageName: String){
        let newItem = DesiredVacation(context: context)
        newItem.name = name
        newItem.hotel = hotel
        newItem.location = location
        newItem.about = about
        newItem.money = money
        newItem.imageName = imageName
        
        do{
            try context.save()
            getAllItem()
        }
        catch {
            //error
        }
    }
    
    func deleteItem(item: DesiredVacation){
        context.delete(item)
        
        do{
            try context.save()
            getAllItem()
        }
        catch {
            //error
        }
    }
    func updateItem(item: DesiredVacation, newName:String){
        item.name = newName
        
        do{
            try context.save()
        }
        catch {
            //error
        }
        
    }
}
