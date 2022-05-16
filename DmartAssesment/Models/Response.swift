
import Foundation
struct Response : Codable {
	let status : Int?
	let mesage : String?
	let data : [ResponseData]?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case mesage = "mesage"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		mesage = try values.decodeIfPresent(String.self, forKey: .mesage)
		data = try values.decodeIfPresent([ResponseData].self, forKey: .data)
	}

}
