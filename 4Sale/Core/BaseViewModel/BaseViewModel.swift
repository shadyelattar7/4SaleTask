//
//  BaseViewModel.swift
//  4Sale
//
//  Created by Al-attar on 02/06/2023.
//

import Foundation
import RxSwift
import RxCocoa


class BaseViewModel: ViewModel{
    var isLoading: PublishSubject<Bool> = .init()
    var displayError: PublishSubject<String> = .init()
}
