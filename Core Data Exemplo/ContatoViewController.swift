//
//  ContatoViewController.swift
//  Core Data Exemplo
//
//  Created by Gabriela Lima de Araujo on 02/08/24.
//

import UIKit
import CoreData

class ContatoViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(_ sender: Any) {
        self.save(name: txtName.text!, phone: txtPhone.text!, email: txtEmail.text!)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func save(name:String, phone:String, email:String) {
        
        buildPerson(name:name, phone:phone, email:email)
      
        do {
            try getManagedContext()?.save()
        } catch let error as NSError {
            print("Fail to save. \(error), \(error.userInfo)")
        }
    }
    
    func buildPerson(name:String, phone:String, email:String) {
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: getManagedContext()!)!
        let person = NSManagedObject(entity: entity, insertInto: getManagedContext())
        
        person.setValue(email, forKey: "email")
        person.setValue(name, forKey: "name")
        person.setValue(phone, forKey: "phone")
        
    }
    
    func getManagedContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return appDelegate.persistentContainer.viewContext
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
