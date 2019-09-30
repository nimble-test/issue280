# Package

version       = "0.1.0"
author        = "Dominik Picheta"
description   = "Issue 280/524 repro"
license       = "MIT"
srcDir        = "src"

# Dependencies

requires "nim >= 0.18.0"

task setup, "Download and generate":
  let
    dirSep = when defined(windows): "\\" else: "/"
    nimble = selfExe().rsplit(dirSep, maxsplit = 1)[0] & dirSep & "nimble"
  exec nimble & " install https://github.com/nimble-test/issue280and524.git?subdir=generator -y"
  withDir thisDir():
    let cmd = when defined(windows): "cmd /c " else: ""
    exec cmd & "generator"
    doAssert staticRead(thisDir() & "/hello.txt") == "hello!"

before install:
  setupTask()
