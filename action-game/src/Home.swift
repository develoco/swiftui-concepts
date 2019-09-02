import SwiftUI

struct Home: View {

  @EnvironmentObject var game: GameModel
  @State var lastShot: CGPoint = CGPoint(x: 0, y: 0)

  var body: some View {
    GeometryReader { p in
      ZStack {
        SpaceShip()
        Enemy()
        .offset(x: -100, y: -100)
        Enemy(alive: false)
        .offset(x: 100, y: 100)
        Projectile()
          .position(self.lastShot)
      }
    }
    .background(Background())
    .edgesIgnoringSafeArea(.all)
    .gesture(
      DragGesture()
      .onChanged {
        self.game.shot.send($0.location)
      }
    )
    .onReceive(game.shotFired) {
      self.lastShot = $0
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
