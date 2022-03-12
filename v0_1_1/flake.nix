{
  description = ''libxslxwriter wrapper for Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nimlibxlsxwriter-v0_1_1.flake = false;
  inputs.src-nimlibxlsxwriter-v0_1_1.owner = "ThomasTJdev";
  inputs.src-nimlibxlsxwriter-v0_1_1.ref   = "refs/tags/v0.1.1";
  inputs.src-nimlibxlsxwriter-v0_1_1.repo  = "nimlibxlsxwriter";
  inputs.src-nimlibxlsxwriter-v0_1_1.type  = "github";
  
  inputs."nimgen".dir   = "nimpkgs/n/nimgen";
  inputs."nimgen".owner = "riinr";
  inputs."nimgen".ref   = "flake-pinning";
  inputs."nimgen".repo  = "flake-nimble";
  inputs."nimgen".type  = "github";
  inputs."nimgen".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimgen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nimlibxlsxwriter-v0_1_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-nimlibxlsxwriter-v0_1_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}