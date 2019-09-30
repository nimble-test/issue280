# Package

version       = "0.1.0"
author        = "Dominik Picheta"
description   = "Issue 280/524 repro"
license       = "MIT"
srcDir        = "src"

# Dependencies

requires "nim >= 0.18.0"

import strutils

task setup, "Download and generate":
  let
    dirSep = when defined(windows): "\\" else: "/"
    path =
      if selfExe().len == 0: ""
      else: selfExe().rsplit(dirSep, maxsplit = 1)[0] & dirSep
  exec path & "nimble install https://github.com/nimble-test/issue280and524.git?subdir=generator -y"
  withDir thisDir():
    let cmd = when defined(windows): "cmd /c " else: ""
    exec cmd & "generator"
    doAssert staticRead(thisDir() & "/hello.txt") == "hello!"

before install:
  setupTask()
