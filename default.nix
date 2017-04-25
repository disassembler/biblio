{ pkgs ? import <nixpkgs> {}
, system ? builtins.currentSystem
}:

let
  python = import ./requirements.nix { inherit pkgs; };
  nodePackages = import biblio-client/default.nix {
    inherit pkgs system;
  };
in python.mkDerivation {
  name = "flask_node.0.0";
  src = ./.;
  propagatedBuildInputs = [
    python.packages."Flask-Restless"
    python.packages."Flask-JWT"
    python.packages."Flask-Security"
    python.packages."Flask-Admin"
    python.packages."Flask-SQLAlchemy"
    pkgs.nodejs
    pkgs.nodePackages.node2nix
  ];
}
