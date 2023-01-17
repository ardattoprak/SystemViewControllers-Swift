//
//  ViewController.swift
//  System View Controllers
//
//  Created by Arda Toprak on 17.01.2023.
//

import UIKit
import SafariServices

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    //MARK: - UI Elements
    @IBOutlet var imageView: UIImageView!
    
    
    //MARK: - Properties
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Functions
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Bu fonksiyon, UIImagePicker tarafından bir fotoğraf
        // seçildiğinde veya çekildiğinde çalışır.
        
        // info: Bir Dictionary'dir ve seçilen & çekilen medyanın kendisini ve
        // hakkında detaylı bilgi verir.
        
        // Dictionary içerisinden, kullanıcının seçtiği görsele ulaşılır.
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        // Seçilen görseli imageView'a aktarmak
        imageView.image = selectedImage
        
        // Bir ViewController ekrandan gitmesi için kullanılan fonksiyon: dismiss
        dismiss(animated: true, completion: nil)
        
    }
    
    //MARK: - Actions
    @IBAction func shareButtonTapped(_ button: UIButton){
        // image var mı emin oluyoruz.
        guard let image = imageView.image else { return }
        
        // Adım 1 : ActivityController nesnesi oluştur.
        
        // activityItems: paylaşılacak olan nesneler. (String, Image, Int, URL, vs..)
        // applicationActivities: Paylaşılacak olan nesnelerin hangi platformlarda paylaşılmasına izin verileceği. Örn: (Twitter, Messages, Email)
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        
        // Bulunduğunuz Controller'da yeni bir Controller göstermek için kullanılır.
        
        present(activityController, animated: true)
        
    }
    
    @IBAction func safariButtonTapped(_ button: UIButton){
        if let url = URL(string: "https://apple.com.tr"){
            let safariController = SFSafariViewController(url: url)
            present(safariController, animated: true)
            
        }
    }
    
    @IBAction func photosButtonTapped(_ button: UIButton){
        let imagePickerController = UIImagePickerController()
        // ImagePickerController'ın yöneticisi olan sınıfın bu ViewController olduğunu belirtir.
        // Belirtmezseniz Delegate fonksiyonları çalışmayacaktır.
        imagePickerController.delegate = self
        
        
        
        // actionSheet: Ekranın altından gelen sayfa görünümde
        // alert: Ekranın ortasında beliren pop-up.
        
        
        let alertController = UIAlertController(title: "Görsel kaynağı seçin", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let cameraAction = UIAlertAction(title: "Kamera", style: .default) { action in
            // Kamera aksiyonu tetiklendiğinde bu kod bloğu çalışır.
            
            imagePickerController.sourceType = .camera
            
            self.present(imagePickerController, animated: true)
        }
        let photoLibrary = UIAlertAction(title: "Fotoğraf Galerisi", style: .default) { action in
            
            imagePickerController.sourceType = .photoLibrary
            
            self.present(imagePickerController, animated: true)
            
            
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibrary)
        
        present(alertController, animated: true)
        
        
    }
    
    @IBAction func emailButtonTapped(_ button: UIButton){
        
    }




}

