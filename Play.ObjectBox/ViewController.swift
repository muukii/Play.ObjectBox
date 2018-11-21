//
//  ViewController.swift
//  Play.ObjectBox
//
//  Created by muukii on 2018/11/22.
//  Copyright © 2018 muukii. All rights reserved.
//

import UIKit

import ObjectBox

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let basepath: NSString = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first! as NSString

    let path = basepath.appending("sample")

    let store = try! Store.init(directoryPath: path)

    store.register(entity: ExampleEntity.self)

    let box = store.box(for: ExampleEntity.self)

    print(box.all())

    try! store.runInTransaction {
      try box.put([ExampleEntity()])
    }

    // Do any additional setup after loading the view, typically from a nib.
  }

}

enum Hoge : Int {
  case a, b, c
}

// sourcery: Entity
class ExampleEntity {
  var id: Id<ExampleEntity> = 0

  required init() {
    // nothing to do here, ObjectBox calls this
  }
}

// sourcery:Entity
class Person {

  var id: Id<Person> = 0
  var firstName: String?
  var lastName: String?
  var age: Int?

  required init() {
    
  }

  init(firstName: String, lastName: String, age: Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }

  // ...
}
