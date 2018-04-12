//
//  LeerNoticias.swift
//  VideoNoticia
//
//  Created by alicharlie on 12/05/16.
//  Copyright © 2016 codepix. All rights reserved.
//

import Foundation


class LeerNoticias{


    func getNoticias(termino:@escaping (_ datos:[String])->()){
      let liga = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/arts/30.json?api-key=dace90955e1744b19fea0d05faa4db18"
      let url = URL(string: liga)!
        let session = URLSession.shared
        _ = session.dataTask(with: url) { (dato:Data?, respuesta:URLResponse?, error:Error?) in
var titulos:[String] = []
            do{
                let resultado = try JSONSerialization.jsonObject(with: dato!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
                
                for valor in resultado["results"] as! [NSDictionary]{
                    titulos.append(valor["title"] as! String)
                }
                DispatchQueue.main.async {
                    termino(titulos)
                }
            }catch{
                print("Error en lectura")
            }
        }.resume()

        
        }
    }




