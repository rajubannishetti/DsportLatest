

import Foundation
struct Taxonomies : Codable {
	let id : Int?
	let name : String?
	let parent_id : Int?
	let rank : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case parent_id = "parent_id"
		case rank = "rank"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		parent_id = try values.decodeIfPresent(Int.self, forKey: .parent_id)
		rank = try values.decodeIfPresent(Int.self, forKey: .rank)
	}

}
