//
//  WidgetViewController+CoreData.swift
//  BackgroundMaker
//
//  Created by HeonJin Ha on 2022/10/14.
//

import UIKit
import CoreData

//MARK: - CoreData Methods

extension WidgetViewController: AddWidgetViewControllerDelegate {

    
    /// AddWidgetVC로 받은 Delegate 프로토콜 메소드입니다.
    func addDeepLinkWidget(widget: DeepLink) {
        self.deepLinkWidgets.append(widget)
        saveData()
        loadData()

    }
    
    func saveData() {
        do {
            try coredataContext.save()
        } catch {
            print("context 저장중 에러 발생 : \(error)")
            fatalError("context 저장중 에러 발생")

        }
    }
    
    //원하는 entity 타입의 데이터 불러오기(Read)
    func loadData() {
        // entity명이 Item 일 때
        let request: NSFetchRequest<DeepLink> = DeepLink.fetchRequest()
        do {
            self.deepLinkWidgets = try coredataContext.fetch(request) // 데이터 가져오기
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
            print("DEBUG: fetch result : \(deepLinkWidgets)")
            
        } catch {
            print("데이터 가져오기 에러 발생 : \(error)")
            fatalError("데이터 가져오기 에러 발생")

        }
    }
    
    
    // //해당하는 데이터 삭제하기 (Delete)
    // func deleteData(data: DeepLink) {
    //     coredataContext.delete(data)
    //     saveData()
    //     loadData()
    //
    // }
    

    
}
