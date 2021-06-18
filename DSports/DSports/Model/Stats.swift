

import Foundation
struct Stats : Codable {
	let listing_count : Int?
	let average_price : Int?
	let lowest_price_good_deals : Int?
	let lowest_price : Int?
	let highest_price : Int?
	let visible_listing_count : Int?
	let dq_bucket_counts : [Int]?
	let median_price : Int?
	let lowest_sg_base_price : Int?
	let lowest_sg_base_price_good_deals : Int?

	enum CodingKeys: String, CodingKey {

		case listing_count = "listing_count"
		case average_price = "average_price"
		case lowest_price_good_deals = "lowest_price_good_deals"
		case lowest_price = "lowest_price"
		case highest_price = "highest_price"
		case visible_listing_count = "visible_listing_count"
		case dq_bucket_counts = "dq_bucket_counts"
		case median_price = "median_price"
		case lowest_sg_base_price = "lowest_sg_base_price"
		case lowest_sg_base_price_good_deals = "lowest_sg_base_price_good_deals"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		listing_count = try values.decodeIfPresent(Int.self, forKey: .listing_count)
		average_price = try values.decodeIfPresent(Int.self, forKey: .average_price)
		lowest_price_good_deals = try values.decodeIfPresent(Int.self, forKey: .lowest_price_good_deals)
		lowest_price = try values.decodeIfPresent(Int.self, forKey: .lowest_price)
		highest_price = try values.decodeIfPresent(Int.self, forKey: .highest_price)
		visible_listing_count = try values.decodeIfPresent(Int.self, forKey: .visible_listing_count)
		dq_bucket_counts = try values.decodeIfPresent([Int].self, forKey: .dq_bucket_counts)
		median_price = try values.decodeIfPresent(Int.self, forKey: .median_price)
		lowest_sg_base_price = try values.decodeIfPresent(Int.self, forKey: .lowest_sg_base_price)
		lowest_sg_base_price_good_deals = try values.decodeIfPresent(Int.self, forKey: .lowest_sg_base_price_good_deals)
	}

}
