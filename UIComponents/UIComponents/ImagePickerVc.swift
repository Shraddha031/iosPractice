//
//  ImagePickerVc.swift
//  UIComponents
//
//  Created by Shraddha on 03/02/23.
//

import UIKit

class ImagePickerVc: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate{

    @IBOutlet weak var LoadImage: UIButton!
    @IBOutlet weak var ImagePic: UIImageView!
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self
        ImagePic.isUserInteractionEnabled = true
        ImagePic.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_Action(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
            
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            ImagePic.contentMode = .scaleAspectFit
            ImagePic.image = pickedImage
        }

        dismiss(animated: true, completion: nil)
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil){
        
        self.present(imagePicker, animated: true)
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
