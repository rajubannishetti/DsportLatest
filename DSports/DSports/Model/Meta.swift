

import Foundation
struct Meta : Codable {
	let total : Int?
	let took : Int?
	let page : Int?
	let per_page : Int?
	let geolocation : String?

	enum CodingKeys: String, CodingKey {

		case total = "total"
		case took = "took"
		case page = "page"
		case per_page = "per_page"
		case geolocation = "geolocation"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
		took = try values.decodeIfPresent(Int.self, forKey: .took)
		page = try values.decodeIfPresent(Int.self, forKey: .page)
		per_page = try values.decodeIfPresent(Int.self, forKey: .per_page)
		geolocation = try values.decodeIfPresent(String.self, forKey: .geolocation)
	}

}
