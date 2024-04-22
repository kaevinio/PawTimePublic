//
//  Illustration.swift
//  PawTime
//
//  Created by Kaevin on 02.12.23.
//

import SwiftUI

enum Illustration: String, CaseIterable {
    case happyBirthday, balloons, giftBog, birthdayCake, partyDog, afghanHound, airedaleTerrier, bassetHound, beagle, bergamasco, berneseMountain, bichonFrise, borderCollie, chihuahua, cockerSpaniel, corgi, dachshund, dalmatian, doberman, englishBulldog, giftBox, goldenRetriever, greatDane, greyhound, husky, japaneseChin, labradorRetriever, malamute, miniatureSchnauzer, newfoundland, pekingese, pharaohHound, pitbull, policeDog, pomeranian, poodle, pug, redPoodle, saintBernard, saluki, sharPei, shetlandSheepdog, shibaInu, tibetanMastiff, xoloitzcuintle, yorkshireTerrier
    
    var image: Image {
        Image(rawValue).resizable()
    }
}
