{ lib, self, inputs, ... }:
{
  flake.overlays.default = lib.composeManyExtensions [
    (final: prev: {
      libvterm = final.callPackage ./package.nix {
        inherit (final)
          glibtool;
        src = inputs.libvterm;
      };
    })
  ];
}
