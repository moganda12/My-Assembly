{ pkgs }: {
    deps = [
        pkgs.ghidra-bin
        pkgs.gdb
        pkgs.cowsay
        pkgs.nasm
        pkgs.asm-lsp
        pkgs.wineWow64Packages.full
    ];
}