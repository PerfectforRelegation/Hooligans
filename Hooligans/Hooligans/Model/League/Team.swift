
import Foundation

struct Team: Codable {
    let rnk: Int
    let Tid: String
    let win: Int
    let winn: String
    let wreg: Int
    let wap: Int
    let pf: Int
    let pa: Int
    let wot: Int
    let Tnm: String
    let lst: Int
    let lstn: String
    let lreg: Int
    let lot: Int
    let lap: Int
    let drw: Int
    let drwn: String
    let gf: Int
    let ga: Int
    let gd: Int
    let ptsn: String
    let phr: [Int]
    let Ipr: Int
    let Img: String
    let pts: Int
    let pld: Int

    enum CodingKeys: String, CodingKey {
        case rnk
        case Tid
        case win
        case winn
        case wreg
        case wap
        case pf
        case pa
        case wot
        case Tnm
        case lst
        case lstn
        case lreg
        case lot
        case lap
        case drw
        case drwn
        case gf
        case ga
        case gd
        case ptsn
        case phr
        case Ipr
        case Img
        case pts
        case pld
    }
}
