{ inputs, ... }:
{
  flake.overlays.default = 
    final: prev: {
      libvterm = if final.stdenv.isDarwin then
        final.callPackage ./package.nix {
          inherit (final)
            glibtool;
          src = inputs.libvterm;
        }
      else prev.libvterm;
    };
}
