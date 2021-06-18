

import Foundation
struct DSportsData : Codable {
	let events : [Events]?
	let meta : Meta?
	let in_hand : In_hand?

	enum CodingKeys: String, CodingKey {

		case events = "events"
		case meta = "meta"
		case in_hand = "in_hand"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		events = try values.decodeIfPresent([Events].self, forKey: .events)
		meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
		in_hand = try values.decodeIfPresent(In_hand.self, forKey: .in_hand)
	}

}
