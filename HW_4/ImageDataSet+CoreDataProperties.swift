//
//  ImageDataSet+CoreDataProperties.swift
//  HW_4
//
//  Created by Sungur Gasanov on 19.12.2021.
//
//

import Foundation
import CoreData


extension ImageDataSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageDataSet> {
        return NSFetchRequest<ImageDataSet>(entityName: "ImageDataSet")
    }

    @NSManaged public var label: String?

}

extension ImageDataSet : Identifiable {

}
