# Package

version       = "0.1.0"
author        = "Dominik Picheta"
description   = "Simple generator that acts like nimgen for #280 repro."
license       = "MIT"
srcDir        = "src"
bin           = @["generator"]
skipExt       = @["nim"]

# Dependencies

requires "nim >= 0.18.0"
