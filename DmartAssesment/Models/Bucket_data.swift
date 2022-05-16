
import Foundation

struct Bucket_data : Codable {
	let name : String?
	let imageURL : String?
    let price : String?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case imageURL = "imageURL"
        case price = "price"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		imageURL = try values.decodeIfPresent(String.self, forKey: .imageURL)
        price = try values.decodeIfPresent(String.self, forKey: .price)

	}

}
