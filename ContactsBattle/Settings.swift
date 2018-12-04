import UIKit

class Settings {
    
    var battleMusic:Bool = false;
    var randomBattle:Bool = false;

    init() {
        
    }
    
    func getBattleMusic() -> Bool{
        return battleMusic;
    }
    
    func setBattleMusic(battleMusic:Bool){
        self.battleMusic = battleMusic;
    }
    
    func getRandomBattle() -> Bool{
        return randomBattle;
    }
    
    func setRandomBattle(randomBattle:Bool){
        self.randomBattle = randomBattle;
    }
}

let sharedSettings = Settings();