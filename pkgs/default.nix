# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
{pkgs, ...}: {
  thorium = pkgs.callPackage ./thorium { };
  feather-font = pkgs.callPackage ./feather-font { };
}
