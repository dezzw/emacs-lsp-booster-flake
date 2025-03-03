{ pkgs, fetchFromGitHub, rustPlatform, lib, ... }:

rustPlatform.buildRustPackage rec {
  pname = "emacs-lsp-booster";
  version = "0.2.0";

  cargoSha256 = "sha256-2wXsPkBl4InjbdYUiiQ+5fZFanLA88t5ApGZ4psfDqk=";

  src = fetchFromGitHub {
    owner = "blahgeek";
    repo = pname;
    rev = "f814dace4c7a544d66c58fb5907e8c0b3f7257fa";
    hash = "sha256-DmEnuAR/OtTdKApEWCdOPAJplT29kuM6ZSHeOnQVo/c=";
  };

  nativeBuildInputs = with pkgs; [
    emacs  # For tests
  ];

  meta = with lib; {
    description = "Improve performance of Emacs LSP servers by converting JSON to bytecode";
    homepage = "https://github.com/${src.owner}/${pname}";
    changelog = "https://github.com/${src.owner}/${pname}/releases/tag/${version}";
    license = [ licenses.mit ];
    maintainers = [];
    mainProgram = "emacs-lsp-booster";
  };
}
