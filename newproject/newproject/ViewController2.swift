//
//  ViewController2.swift
//  newproject
//
//  Created by Shraddha on 20/01/23.
//

import UIKit

struct temp{
    var arr1:String
    var arr2:Int
}

class ViewController2: UIViewController,  MyDataSendingDelegateProtocol{
    func sendDataToFirstViewController(myData: Bool) {
        print("Switch value \(myData)")
        
        if !myData {
//            trueValues.remove(at: trueValues.index(trueValues.startIndex, offsetBy: trueValues.count-1))
            trueValues.remove(lastInd)
        }
    }
    

    @IBOutlet weak var dataRecieved: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var merg=[temp]()
    let arr1s = ["gsdhfjgk","ram","shyam","gsdhfjgk","ram","shyam","gsdhfjgk","ram","shyam","gsdhfjgk","ram","shyam","gsdhfjgk","ram","shyam","gsdhfjgk","ram","shyam"]
    let arr2s = [2,3,4,2,3,4,2,3,4,2,3,4,2,3,4,2,3,4]
    var trueValues=Set<Int>()
    var lastInd: Int = 0
//    var arr:[String] = ["gsdhfjgk","ram","shyam"]
//    var arr2:[String]=["w","y","t","add"]
    
    var name:String?
    override func viewDidLoad() {
        super.viewDidLoad()
//        name = "Ram"
        tableView.delegate = self
        tableView.dataSource = self
        for i in 0..<arr1s.count{
            merg.append(temp(arr1:arr1s[i],arr2:arr2s[i]))
        }
//        arr.append(contentsOf: arr2)
        // Do any additional setup after loading the view.
    }
    
   
    
    func sendDataToFirstViewController(myData: String) {
        self.dataRecieved.text = myData
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ViewController2: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return merg.count//arr2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?  TableViewCell
//        let arrdata = arr[indexPath.row]
//        let arrdata2=arr2[indexPath.row]
//        cell.textLabel?.text = arrdata
//        cell?.label1.text=arrdata
        cell?.label1.text=(merg[indexPath.row].arr1)
        cell?.Label2.text="\(merg[indexPath.row].arr2)"
        indexPath.row%2==0 ? (cell?.backgroundColor = .purple) : (cell?.backgroundColor = .lightGray)
        
        if trueValues.contains(indexPath.row) {
            cell?.ProblemView.backgroundColor = .yellow
        }
        else {
            cell?.ProblemView.backgroundColor = .white
        }
        return cell!

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc=UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController3") as? ViewController3
        vc?.delegate = self
        vc?.incomingName = merg[indexPath.row].arr1
        vc?.incomingMarks="\(merg[indexPath.row].arr2)"
        trueValues.insert(indexPath.row)
        lastInd = indexPath.row
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    //func send
    
}
