import UIKit

class Analytics {
    var levelones:Float = 0;
    var leveltwos:Float = 0;
    var levelthrees:Float = 0;
    
    var spellCountDictionary:Dictionary<Int, Float> = Dictionary();
    
    init() {
        
    }
    
    func getPercentageOnes() -> Float{
        return levelones / (levelones + leveltwos + levelthrees) * 100;
    }
    
    func getPercentageTwos() -> Float{
        return leveltwos / (levelones + leveltwos + levelthrees) * 100;
    }
    
    func getPercentageThrees() -> Float{
        return levelthrees / (levelones + leveltwos + levelthrees) * 100;
    }
}

let sharedAnalytics = Analytics();