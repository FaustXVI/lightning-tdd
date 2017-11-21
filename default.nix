let
  _pkgs = import <nixpkgs> {};
  nixpkgs = _pkgs.fetchFromGitHub { owner = "NixOS";
                                         repo = "nixpkgs-channels";
                                         rev = "39cd40f7bea40116ecb756d46a687bfd0d2e550e";
                                         sha256 = "0kpx4h9p1lhjbn1gsil111swa62hmjs9g93xmsavfiki910s73sh";
                                       };
in
with import nixpkgs {};
let
    pgf = import ./nix/pgf.nix nixpkgs;
in
stdenv.mkDerivation {
        name = "latex-sandbox";
        TEXMFHOME="${pgf}/${pgf.TEXMFHOME}"; 
        buildInputs = [
            tetex
        ];
    }
