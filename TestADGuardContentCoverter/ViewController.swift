//
//  ViewController.swift
//  TestADGuardContentCoverter
//
//  Created by Yu Yang on 6/19/23.
//

import UIKit
import ContentBlockerConverter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "shield_zh", ofType: "txt")!
        let filtersContents = try! String(contentsOf: URL(fileURLWithPath: path))
        let rules = filtersContents.components(separatedBy: "\n")
//        print(rules)

        //        for rule in rules {
//            print(rule)
//        }
        
        
        let converter = ContentBlockerConverter.init()
        let result = converter.convertArray(rules: rules, safariVersion: .safari14, optimize: true, advancedBlocking: false, advancedBlockingFormat: .json)

        print("\n\n\n")
        print(result.message)
        print("\n\n\n")
        
        let documentFolder = NSHomeDirectory() + "/tmp"
        let documentFolderURL = URL(fileURLWithPath: documentFolder)
        let jsonURL = documentFolderURL.appendingPathComponent("blockerList.json")

        print(documentFolder)

        do {
            try result.converted.data(using: .utf8)?.write(to: jsonURL)
        } catch {
            print(error.localizedDescription)
        }


        
//        ContentBlockerConverter.convertArray(
//
//        )
        
//        let result: ConversionResult? = ContentBlockerConverter.convertArray(
//            rules: [String],
//            safariVersion: SafariVersions = .DEFAULT,
//            optimize: Bool = false,
//            advancedBlocking: Bool = false
//            advancedBlockingFormat: AdvancedBlockingFormat = .json
//        );
        
        
    }


}

