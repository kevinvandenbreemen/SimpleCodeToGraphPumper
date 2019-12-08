import ShellOut

do {
    let output = try shellOut(to: "echo", arguments: ["Hello World"])
    print("Shell Output was \(output)")
}