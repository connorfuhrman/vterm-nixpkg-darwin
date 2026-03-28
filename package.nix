{
  stdenv
, lib
, src
, glibtool
, ...
}:
stdenv.mkDerivation {
  pname = "libvterm";
  version = "0.3.3";

  inherit src;

  nativeBuildInputs = [ glibtool ];

  buildPhase = ''
    make -j
  '';

  installPhase = ''
    make install PREFIX=$out
    install_name_tool -id $out/lib/libvterm.0.dylib $out/lib/libvterm.dylib
  '' ;

  meta = with lib; {
    description = "C99 library which implements a VT220 or xterm terminal emulator";
    homepage = "https://www.leonerd.org.uk/code/libvterm/";
    license = licenses.mit;
    platforms = platforms.darwin;
    maintainers = with maintainers; [ "connorfuhrman" ];
  };
}
