

import Foundation
struct Messages : Codable {
	let text : String?

	enum CodingKeys: String, CodingKey {

		case text = "text"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		text = try values.decodeIfPresent(String.self, forKey: .text)
	}

}
