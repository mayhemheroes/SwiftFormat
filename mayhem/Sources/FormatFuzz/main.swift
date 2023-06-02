#if canImport(Darwin)
import Darwin.C
#elseif canImport(Glibc)
import Glibc
#elseif canImport(MSVCRT)
import MSVCRT
#endif

import Foundation
import SwiftFormat

@_cdecl("LLVMFuzzerTestOneInput")
public func FormatFuzz(_ start: UnsafeRawPointer, _ count: Int) -> CInt {
    let fdp = FuzzedDataProvider(start, count)
    let formatter = Formatter(tokenize(fdp.ConsumeRemainingString()))
    return 0;
}