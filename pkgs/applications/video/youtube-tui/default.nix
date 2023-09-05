{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
, xorg
, stdenv
, python3
, libsixel
, CoreFoundation
, Security
, AppKit
,
}:

rustPlatform.buildRustPackage rec {
  pname = "youtube-tui";
  version = "0.8.0";

  src = fetchFromGitHub {
    owner = "Siriusmart";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-FOiK3yQcQuwdCEjBtRPW4iBd+8uNsvZ6l5tclHVzL+M=";
  };

  cargoHash = "sha256-rrQll5T/8Qoawfj4QadYCV2toxost22qU7sMjMMcUfI=";

  nativeBuildInputs = [
    pkg-config
    python3
  ];

  buildInputs = [
    openssl
    xorg.libxcb
    libsixel
  ] ++ lib.optionals stdenv.isDarwin [
    CoreFoundation
    Security
    AppKit
  ];

  meta = with lib; {
    description = "An aesthetically pleasing YouTube TUI written in Rust";
    homepage = "https://siriusmart.github.io/youtube-tui";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ Ruixi-rebirth ];
  };
}
