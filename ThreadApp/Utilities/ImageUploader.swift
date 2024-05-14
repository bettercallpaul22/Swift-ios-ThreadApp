//
//  ImageUploader.swift
//  ThreadApp
//
//  Created by Obaro Paul on 10/05/2024.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader{
    
     static func uploadImage(_ image: UIImage) async throws -> String? {
        // Convert UIImage to JPEG data with compression quality 0.25
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        
        // Generate a unique filename using UUID
        let filename = NSUUID().uuidString
        
        // Create a reference to Firebase Storage with the specified path
        let storageReference = Storage.storage().reference(withPath: "/profile_image\(filename)")
        
        do {
            // Upload image data to the specified storage reference asynchronously
            let _ = try await storageReference.putDataAsync(imageData)
            
            // Get the download URL for the uploaded image asynchronously
            let url = try await storageReference.downloadURL()
            
            // Return the absolute string of the download URL
            // with this url string you can download the image to device
            return url.absoluteString
            
        } catch {
            // Print error message if uploading or getting download URL fails
            print("DEBUG: failed to upload image with \(error.localizedDescription)")
            return nil
        }
    }

    
}
