//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-05.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image : Image? = nil
    
    func loadFromUrl(urlSring : String) {
        NetworkManager.shared.downloadImageFromURLString(urlString: urlSring) { uiImage in
            guard let uiImage = uiImage else {return}
            
            DispatchQueue.main.async{
                self.image = Image(uiImage: uiImage)
            }
            
        }
    }
}

struct RemoteImage : View {
    var image: Image?
    
    var body : some View {
        image? .resizable() ?? Image("steak") .resizable()
    }
}

struct AppetizerImage : View {
    @StateObject var imageLoader = ImageLoader()
    
    let urlString: String
    
    var body : some View {
        RemoteImage(image: imageLoader.image)
            .task {
                imageLoader.loadFromUrl(urlSring: urlString)
            }
    }
}
