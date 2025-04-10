//
//  PhotoViewModel.swift
//  SOLIDPrinciplesSwiftUI
//
//  Created by Rafiul Hasan on 4/10/25.
//

import Foundation

final class PhotoViewModel: ObservableObject {
    
    @Published var photoList: [PhotoModel] = []
}
