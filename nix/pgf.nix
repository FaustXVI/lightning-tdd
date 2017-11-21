nixpkgs : with import nixpkgs {};
stdenv.mkDerivation {
        name = "pgf";
        buildInputs = [
            unzip
            tetex
            stdenv
        ];
        TEXMFHOME="texmf";
        src = fetchurl {
            url = "http://mirrors.ctan.org/graphics/pgf/base.zip";
            sha256 = "0dsc6ybl2b7n1w8zgr0bcwdmzvmm86qpy7vla88lh2zrcgyii913";
        };
        buildPhase = ''
            mkdir -p $TEXMFHOME
            mv tex $TEXMFHOME
            texhash
        '';
        installPhase = ''
            mkdir $out
            cp -r $TEXMFHOME $out
        '';
}
