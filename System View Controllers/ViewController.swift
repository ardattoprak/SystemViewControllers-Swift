//
//  ViewController.swift
//  System View Controllers
//
//  Created by Arda Toprak on 17.01.2023.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    //MARK: - UI Elements
    @IBOutlet var imageView: UIImageView!
    
    
    //MARK: - Properties
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Functions
    
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
        
    }
    
    @IBAction func emailButtonTapped(_ button: UIButton){
        
    }




}

