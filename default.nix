let
  sources = import ./nix/sources.nix;

  hello = pkgs.writeShellScriptBin "hello" ''echo "Hello from the Nix channel overlay!"
    echo "New version"
  '';

  pkgs = import sources.nixpkgs {
    overlays = [
      (self: super: {
        inherit hello;
      })
    ];
  };
in pkgs