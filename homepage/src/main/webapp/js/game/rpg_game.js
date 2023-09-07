const $startScreen = document.querySelector("#start-screen");
const $gameMenu = document.querySelector("#game-menu");
const $battleMenu = document.querySelector("#battle-menu");
const $heroName = document.querySelector("#hero-name");
const $heroLevel = document.querySelector("#hero-level");
const $heroHp = document.querySelector("#hero-hp");
const $heroXp = document.querySelector("#hero-xp");
const $heroAtt = document.querySelector("#hero-att");
const $monsterName = document.querySelector("#monster-name");
const $monsterHp = document.querySelector("#monster-hp");
const $monsterAtt = document.querySelector("#monster-att");
const $message = document.querySelector("#message");
 
let game = null;
$startScreen.addEventListener("submit", (event) => {
  event.preventDefault();
  const name = event.target["name-input"].value; //주인공 이름
  game = new Game(name); // Game클래스의  constructor(주인공이름) 호출
});
 
class Game {
  constructor(name) {
    this.monster = null; //적 멤버변수
    this.hero = null; //주인공 멤버변수
    this.monsterList = [
      //적목록
      { name: "슬라임", hp: 25, att: 10, xp: 10 },
      { name: "스켈레톤", hp: 50, att: 15, xp: 20 },
      { name: "마왕", hp: 150, att: 35, xp: 50 },
    ];
    this.start(name); //게임 스타트
  }
  start(name) {
    console.log(this);
    $gameMenu.addEventListener("submit", this.onGameMenuInput);
    $battleMenu.addEventListener("submit", this.onBattleMenuInput);
    this.changeScreen("game"); //게임시작 화면
    this.hero = new Hero(this, name);
    this.updateHeroStat(); //화면에 주인공의 상태를 출력한다.
  }
  changeScreen(screen) {
    //주인공이름 입력, 게임메뉴, 모험메뉴 중 하나의 화면을 보여준다.
    if (screen === "start") {
      $startScreen.style.display = "block";
      $gameMenu.style.display = "none";
      $battleMenu.style.display = "none";
    } else if (screen === "game") {
      $startScreen.style.display = "none";
      $gameMenu.style.display = "block";
      $battleMenu.style.display = "none";
    } else if (screen === "battle") {
      $startScreen.style.display = "none";
      $gameMenu.style.display = "none";
      $battleMenu.style.display = "block";
    }
  }
  onGameMenuInput = (event) => {
    //game-menu 폼이 서브밋 되었을경우
    event.preventDefault();
    const input = event.target["menu-input"].value; //game menu 값
    if (input === "1") {
      // 모험
      this.changeScreen("battle"); //모험메뉴 화면이 보여진다.
      const randomIndex = Math.floor(Math.random() * this.monsterList.length); //적목록에서 임의의 적 선택
      const randomMonster = this.monsterList[randomIndex];
      this.monster = new Monster( //선택된 적 객체 생성하여 monster 맴버변수에 할당
        this,
        randomMonster.name,
        randomMonster.hp,
        randomMonster.att,
        randomMonster.xp
      );
      this.updateMonsterStat(); //적의 상태 화면 아래부분에 출력
      this.showMessage(`몬스터와 마주쳤다. ${this.monster.name}인 것 같다!`);
    } else if (input === "2") {
      // 휴식
      this.hero.hp = this.hero.maxHp; //최대체력을 현제체력에 할당
      this.updateHeroStat(); //수정된 주인공 상태를 화면에 보여준다.
      this.showMessage("충분한 휴식을 취했다.");
    } else if (input === "3") {
      // 종료
      this.showMessage(" ");
      this.quit();
    }
  };
  onBattleMenuInput = (event) => {
    //모험메뉴 폼이 서브밋 되었을 경우
    event.preventDefault();
    const input = event.target["battle-input"].value; //모험메뉴값
    if (input === "1") {
      // 공격
      const { hero, monster } = this; //Game 객체의 hero, monster 멤버변수의 값을 구조 분해 할당한다.
      hero.attack(monster); // 주인공이 적 공격
      monster.attack(hero); // 적도 주인공을 공격
      if (hero.hp <= 0) {
        // 주인공 현제 체력 0 이하면  게임 종료
        this.showMessage(`${hero.lev} 레벨에서 전사. 새 주인공을 생성하세요.`);
        this.quit();
      } else if (monster.hp <= 0) {
        // 적의 현제 체력이 0 이하면
        this.showMessage(`몬스터를 잡아 ${monster.xp} 경험치를 얻었다.`);
        hero.getXp(monster.xp); //적 경험치를 주인공 경험치로 할당
        this.monster = null; // 적이 지워진다.
        this.changeScreen("game"); //새로은 게임이 시작된다.
      } else {
        // 전투 진행 중
        this.showMessage(
          `${hero.att}의 데미지를 주고, ${monster.att}의 데미지를 받았다.`
        );
      }
      this.updateHeroStat();
      this.updateMonsterStat();
    } else if (input === "2") {
      // 회복
      const { hero, monster } = this;
      hero.hp = Math.min(hero.maxHp, hero.hp + 20);
      monster.attack(hero);
      this.showMessage("체력을 조금 회복했다!");
      this.updateHeroStat();
    } else if (input === "3") {
      // 도망
      this.changeScreen("game");
      this.showMessage("부리나케 도망쳤다!");
      this.monster = null;
      this.updateMonsterStat();
    }
  };
  updateHeroStat() {
    const { hero } = this;
    if (hero === null) {
      $heroName.textContent = "";
      $heroLevel.textContent = "";
      $heroHp.textContent = "";
      $heroXp.textContent = "";
      $heroAtt.textContent = "";
      return;
    }
    $heroName.textContent = hero.name;
    $heroLevel.textContent = `${hero.lev}Lev`;
    $heroHp.textContent = `HP: ${hero.hp}/${hero.maxHp}`;
    $heroXp.textContent = `XP: ${hero.xp}/${15 * hero.lev}`;
    $heroAtt.textContent = `ATT: ${hero.att}`;
  }
  updateMonsterStat() {
    const { monster } = this;
    if (monster === null) {
      $monsterName.textContent = "";
      $monsterHp.textContent = "";
      $monsterAtt.textContent = "";
      return;
    }
    $monsterName.textContent = monster.name;
    $monsterHp.textContent = `HP: ${monster.hp}/${monster.maxHp}`;
    $monsterAtt.textContent = `ATT: ${monster.att}`;
  }
  showMessage(text) {
    $message.textContent = text;
  }
  quit() {
    // 게임이 종료되어 새로운 주인공 이름 입력하는 화면이 보인다.
    this.hero = null;
    this.monster = null;
    this.updateHeroStat();
    this.updateMonsterStat();
    $gameMenu.removeEventListener("submit", this.onGameMenuInput);
    $battleMenu.removeEventListener("submit", this.onBattleMenuInput);
    this.changeScreen("start");
    game = null;
  }
}
 
class Unit {
  constructor(game, name, hp, att, xp) {
    this.game = game;
    this.name = name;
    this.maxHp = hp;
    this.hp = hp;
    this.xp = xp;
    this.att = att;
  }
  attack(target) {
    target.hp -= this.att; //현제 체력 - 공격력
  }
}
 
class Hero extends Unit {
  constructor(game, name) {
    super(game, name, 100, 10, 0);
    this.lev = 1;
  }
  attack(target) {
    super.attack(target); // 부모 클래스의 attack
    // 부모 클래스 attack 외의 동작
  }
  heal(monster) {
    this.hp += 20;
    this.hp -= monster.att;
  }
  getXp(xp) {
    this.xp += xp;
    if (this.xp >= this.lev * 15) {
      // 경험치를 다 채우면
      this.xp -= this.lev * 15; // xp: 5,  lev: 2, maxXp: 15
      this.lev += 1;
      this.maxHp += 5;
      this.att += 5;
      this.hp = this.maxHp;
      this.game.showMessage(`레벨업! 레벨 ${this.lev}`);
    }
  }
}
class Monster extends Unit {
  constructor(game, name, hp, att, xp) {
    super(game, name, hp, att, xp);
  }
}