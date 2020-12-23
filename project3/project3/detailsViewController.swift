//
//  detailsViewController.swift
//  project3
//
//  Created by Nico on 2020/11/27.
//

import UIKit

class detailsViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var phoneNumText: UITextField!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet var tapForPhoto: UITapGestureRecognizer!
    
    var contactForEdit:inf?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contact = contactForEdit {
            self.nameText.text = contact.name
            self.phoneNumText.text = contact.tel
            self.avatarImage.image = contact.avatar
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func tapForPhoto(_ sender: Any){
        let imagePicker = UIImagePickerController()
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                present(imagePicker, animated: true, completion: nil)
            }
    }
    
    
    func imagePickerController(_ picker:UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage]as? UIImage{
            self.avatarImage.image  = selectedImage
            dismiss(animated: true, completion: nil)
        }
        
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Save"{
            contactForEdit  = inf(name: nameText.text!, tel: phoneNumText.text!, avatar: avatarImage.image)
        }
    }
}
