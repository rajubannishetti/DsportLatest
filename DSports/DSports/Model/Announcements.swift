

import Foundation
struct Announcements : Codable {
	let checkout_disclosures : Checkout_disclosures?

	enum CodingKeys: String, CodingKey {

		case checkout_disclosures = "checkout_disclosures"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		checkout_disclosures = try values.decodeIfPresent(Checkout_disclosures.self, forKey: .checkout_disclosures)
	}

}
