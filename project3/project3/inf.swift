//
//  inf.swift
//  project3
//
//  Created by Nico on 2020/11/20.
//

import Foundation
import UIKit

class inf: NSObject, NSCoding{

    // 获取本应用的文件存储路径并增加子文件路径
    static let userPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first! + "/students.data"
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: "nameKey")
        coder.encode(self.tel, forKey: "telKey")
        coder.encode(self.avatar, forKey: "avatarKey")
    }
    
    // 从磁盘读取内容重构对象
    required init?(coder: NSCoder) {
        name = (coder.decodeObject(forKey: "nameKey") as? String)
        tel = (coder.decodeObject(forKey:  "telKey") as? String)
        avatar = (coder.decodeObject(forKey: "avatarKey") as? UIImage)
    }
    
    // Data
    // '?'表示该属性可以为空
    var name: String?;
    var tel: String?;
    var avatar: UIImage?;
    
    // 正常创建对象
    init(name: String, tel: String, avatar: UIImage? ) {
        self.name  = name;
        self.tel = tel;
        self.avatar = avatar;
    }
    
}
