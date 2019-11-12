
/// MARK: - JSON, 고차함수 활용 연습 

import Foundation

/*
 [
    {
        "key": "266",
        "name": "Aatrox",
    ...
    },
    ...
 ]
 */
//let champsFilePath = Bundle.main.path(forResource: "champs", ofType: "json")

/*
 [
    1,
    33,
    ...
 ]
 */

let champsFilePath = Bundle.main.path(forResource: "champs", ofType: "json")
let selectedIndexesFilePath = Bundle.main.path(forResource: "selectedIndexes", ofType: "json")

let champsData = FileManager.default.contents(atPath: champsFilePath!)
let selectedIndexesData = FileManager.default.contents(atPath: selectedIndexesFilePath!)

let champs = try JSONSerialization.jsonObject(with: champsData!, options: [])
let selectedIndexes = try JSONSerialization.jsonObject(with: selectedIndexesData!, options: [])

var names = [String]()
var indexes = [Int]()

let champsArray = champs as! [[String:Any]]
let indexesArray = selectedIndexes as! [Int]

indexesArray.forEach { (index) in
    champsArray.forEach { (champ) in
        if String(index) == champ["key"] as! String {
            print(champ["id"]!)
        }
    }
}
