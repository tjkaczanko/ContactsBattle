import UIKit

class StatColorDeterminer {
    
    init() {
        
    }
    
    func getHPColorValue(stat:Int) -> UIColor{
        if (stat < 25){
            return UIColor.red;
        }else if (stat >= 25 && stat < 75){
            return UIColor.yellow;
        }else{
            return UIColor.green;
        }
    }
    
    func getStatColorValue(stat:Int) -> UIColor{
        if (stat < 12){
            return UIColor.red;
        }else if (stat >= 12 && stat < 24){
            return UIColor.yellow;
        }else{
            return UIColor.green;
        }
    }
    
}

let sharedStatColorDeterminer = StatColorDeterminer();
