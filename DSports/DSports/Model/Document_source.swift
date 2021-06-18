

import Foundation
struct Document_source : Codable {
	let source_type : String?
	let generation_type : String?

	enum CodingKeys: String, CodingKey {

		case source_type = "source_type"
		case generation_type = "generation_type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		source_type = try values.decodeIfPresent(String.self, forKey: .source_type)
		generation_type = try values.decodeIfPresent(String.self, forKey: .generation_type)
	}

}
