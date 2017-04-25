# generated using pypi2nix tool (version: 1.8.0)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -V 3.5 -r requirements.txt
#

{ pkgs ? import <nixpkgs> {}
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python35;
  };

  commonBuildInputs = [];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreter = pythonPackages.buildPythonPackage {
        name = "python35-interpreter";
        buildInputs = [ makeWrapper ] ++ (builtins.attrValues pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter}               $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "               (builtins.attrValues pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -f $prog ]; then
                  ln -s $prog $out/bin/`basename $prog`
                fi
              done
            fi
          done
          for prog in "$out/bin/"*; do
            wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
          done
          pushd $out/bin
          ln -s ${pythonPackages.python.executable} python
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };
    in {
      __old = pythonPackages;
      inherit interpreter;
      mkDerivation = pythonPackages.buildPythonPackage;
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (drv.drvAttrs // f drv.drvAttrs);
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {

    "Flask" = python.mkDerivation {
      name = "Flask-0.12.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/24/6e/11b9c57e46f276a8a8dfda85a2fa7ada62b0463b68693616c7ab5df356fa/Flask-0.12.1.tar.gz"; sha256 = "9dce4b6bfbb5b062181d3f7da8f727ff70c1156cbb4024351eafd426deb5fb88"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Jinja2"
      self."Werkzeug"
      self."click"
      self."itsdangerous"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/pallets/flask/";
        license = licenses.bsdOriginal;
        description = "A microframework based on Werkzeug, Jinja2 and good intentions";
      };
    };



    "Flask-Admin" = python.mkDerivation {
      name = "Flask-Admin-1.4.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c6/ca/f31d4cc4112624c8af348f7e2b5e539acabbd7db002dcd3f8aa1f611397e/Flask-Admin-1.4.0.tar.gz"; sha256 = "f2d58448985cf25d757be8e4764a46134a6d0a6ec7fcddc584050a6cc8732d6f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Flask"
      self."WTForms"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/flask-admin/flask-admin/";
        license = licenses.bsdOriginal;
        description = "Simple and extensible admin interface framework for Flask";
      };
    };



    "Flask-JWT" = python.mkDerivation {
      name = "Flask-JWT-0.3.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9b/8a/5d3b2e593f1fc5c1b464aa1cbf35023a4400a2b53ce6a52801f68d7a1eeb/Flask-JWT-0.3.2.tar.gz"; sha256 = "49c0672fbde0f1cd3374bd834918d28956e3c521c7e00089cdc5380d323bd0ad"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Flask"
      self."PyJWT"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/mattupstate/flask-jwt";
        license = licenses.mit;
        description = "JWT token authentication for Flask apps";
      };
    };



    "Flask-Login" = python.mkDerivation {
      name = "Flask-Login-0.3.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/06/e6/61ed90ed8ce6752b745ed13fac3ba407dc9db95dfa2906edc8dd55dde454/Flask-Login-0.3.2.tar.gz"; sha256 = "e72eff5c35e5a31db1aeca1db5d2501be702674ea88e8f223b5d2b11644beee6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Flask"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/maxcountryman/flask-login";
        license = licenses.mit;
        description = "User session management for Flask";
      };
    };



    "Flask-Mail" = python.mkDerivation {
      name = "Flask-Mail-0.9.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/05/2f/6a545452040c2556559779db87148d2a85e78a26f90326647b51dc5e81e9/Flask-Mail-0.9.1.tar.gz"; sha256 = "22e5eb9a940bf407bcf30410ecc3708f3c56cc44b29c34e1726fe85006935f41"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Flask"
      self."blinker"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/rduplain/flask-mail";
        license = licenses.bsdOriginal;
        description = "Flask extension for sending email";
      };
    };



    "Flask-Principal" = python.mkDerivation {
      name = "Flask-Principal-0.4.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/14/c7/2531aca6ab7baa3774fde2dfc9c9dd6d5a42576a1013a93701bfdc402fdd/Flask-Principal-0.4.0.tar.gz"; sha256 = "f5d6134b5caebfdbb86f32d56d18ee44b080876a27269560a96ea35f75c99453"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Flask"
      self."blinker"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://packages.python.org/Flask-Principal/";
        license = licenses.mit;
        description = "Identity management for flask";
      };
    };



    "Flask-Restless" = python.mkDerivation {
      name = "Flask-Restless-0.16.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/21/94/b676e2142685fcfaf795dc8a0d0532b1fd42fb1a0c95e9ba3b0a7a9450c7/Flask-Restless-0.16.0.tar.gz"; sha256 = "386ea266b26a4fff304733da00ef3b2214f89f8eed175542df5cf3b5c038b88b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Flask"
      self."SQLAlchemy"
      self."mimerender"
      self."python-dateutil"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/jfinkels/flask-restless";
        license = licenses.bsdOriginal;
        description = "A Flask extension for easy ReSTful API generation";
      };
    };



    "Flask-SQLAlchemy" = python.mkDerivation {
      name = "Flask-SQLAlchemy-2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b3/52/227aaf4e8cebb153e239c518a9e916590b2fe0e4350e6b02d92b546b69b7/Flask-SQLAlchemy-2.1.tar.gz"; sha256 = "c5244de44cc85d2267115624d83faef3f9e8f088756788694f305a5d5ad137c5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Flask"
      self."SQLAlchemy"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/mitsuhiko/flask-sqlalchemy";
        license = licenses.bsdOriginal;
        description = "Adds SQLAlchemy support to your Flask application";
      };
    };



    "Flask-Security" = python.mkDerivation {
      name = "Flask-Security-1.7.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5c/c2/7c2311e599690b6b4a55346900523e33ce61e81be4d01fa231d2fc8ea12a/Flask-Security-1.7.5.tar.gz"; sha256 = "988952dba451896fd7e9dbf838d0e843844f1cbd27a8e15594a9e1d9432f435f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Flask"
      self."Flask-Login"
      self."Flask-Mail"
      self."Flask-Principal"
      self."Flask-WTF"
      self."itsdangerous"
      self."passlib"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/mattupstate/flask-security";
        license = licenses.mit;
        description = "Simple security for Flask apps";
      };
    };



    "Flask-WTF" = python.mkDerivation {
      name = "Flask-WTF-0.14.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ba/15/00a9693180f214225a2c0b1bb9077f3b0b21f2e86522cbba22e8ad6e570c/Flask-WTF-0.14.2.tar.gz"; sha256 = "5d14d55cfd35f613d99ee7cba0fc3fbbe63ba02f544d349158c14ca15561cc36"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Flask"
      self."WTForms"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/lepture/flask-wtf";
        license = licenses.bsdOriginal;
        description = "Simple integration of Flask and WTForms.";
      };
    };



    "Jinja2" = python.mkDerivation {
      name = "Jinja2-2.9.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/90/61/f820ff0076a2599dd39406dcb858ecb239438c02ce706c8e91131ab9c7f1/Jinja2-2.9.6.tar.gz"; sha256 = "ddaa01a212cd6d641401cb01b605f4a4d9f37bfc93043d7f760ec70fb99ff9ff"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."MarkupSafe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://jinja.pocoo.org/";
        license = licenses.bsdOriginal;
        description = "A small but fast and easy to use stand-alone template engine written in pure python.";
      };
    };



    "MarkupSafe" = python.mkDerivation {
      name = "MarkupSafe-1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz"; sha256 = "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/pallets/markupsafe";
        license = licenses.bsdOriginal;
        description = "Implements a XML/HTML/XHTML Markup safe string for Python";
      };
    };



    "PyJWT" = python.mkDerivation {
      name = "PyJWT-1.4.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8f/10/9ce7e91d8ec9d852db6f9f2b076811d9f51ed7b0360602432d95e6ea4feb/PyJWT-1.4.2.tar.gz"; sha256 = "87a831b7a3bfa8351511961469ed0462a769724d4da48a501cb8c96d1e17f570"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/jpadilla/pyjwt";
        license = licenses.mit;
        description = "JSON Web Token implementation in Python";
      };
    };



    "SQLAlchemy" = python.mkDerivation {
      name = "SQLAlchemy-1.1.9";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/02/69/9473d60abef55445f8e967cfae215da5de29ca21b865c99d2bf02a45ee01/SQLAlchemy-1.1.9.tar.gz"; sha256 = "b65cdc73cd348448ef0164f6c77d45a9f27ca575d3c5d71ccc33adf684bc6ef0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.sqlalchemy.org";
        license = licenses.mit;
        description = "Database Abstraction Library";
      };
    };



    "WTForms" = python.mkDerivation {
      name = "WTForms-2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/bf/91/2e553b86c55e9cf2f33265de50e052441fb753af46f5f20477fe9c61280e/WTForms-2.1.zip"; sha256 = "ffdf10bd1fa565b8233380cb77a304cd36fd55c73023e91d4b803c96bc11d46f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://wtforms.simplecodes.com/";
        license = licenses.bsdOriginal;
        description = "A flexible forms validation and rendering library for python web development.";
      };
    };



    "Werkzeug" = python.mkDerivation {
      name = "Werkzeug-0.12.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ab/65/d3f1edd1109cb1beb6b82f4139addad482df5b5ea113bdc98242383bf402/Werkzeug-0.12.1.tar.gz"; sha256 = "6716830febe9808bb7521fd26db3b398450cbed0886b2b4bea678b87340f534e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://werkzeug.pocoo.org/";
        license = licenses.bsdOriginal;
        description = "The Swiss Army knife of Python web development";
      };
    };



    "blinker" = python.mkDerivation {
      name = "blinker-1.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1b/51/e2a9f3b757eb802f61dc1f2b09c8c99f6eb01cf06416c0671253536517b6/blinker-1.4.tar.gz"; sha256 = "471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d606f8b6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonhosted.org/blinker/";
        license = licenses.mit;
        description = "Fast, simple object-to-object and broadcast signaling";
      };
    };



    "click" = python.mkDerivation {
      name = "click-6.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz"; sha256 = "f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/mitsuhiko/click";
        license = licenses.bsdOriginal;
        description = "A simple wrapper around optparse for powerful command line utilities.";
      };
    };



    "itsdangerous" = python.mkDerivation {
      name = "itsdangerous-0.24";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/dc/b4/a60bcdba945c00f6d608d8975131ab3f25b22f2bcfe1dab221165194b2d4/itsdangerous-0.24.tar.gz"; sha256 = "cbb3fcf8d3e33df861709ecaf89d9e6629cff0a217bc2848f1b41cd30d360519"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/mitsuhiko/itsdangerous";
        license = licenses.bsdOriginal;
        description = "Various helpers to pass trusted data to untrusted environments and back.";
      };
    };



    "mimerender" = python.mkDerivation {
      name = "mimerender-0.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/90/93/04da69a3a9adae4aae66cf9884f09d82e318018673ba9193a593db01e0ee/mimerender-0.6.0.tar.gz"; sha256 = "e7f1377efee18c3f562cee54907a3329223c824332889fb74b745ddfd0a9b1c6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."python-mimeparse"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/martinblech/mimerender";
        license = licenses.mit;
        description = "RESTful HTTP Content Negotiation for Flask, Bottle, web.py and webapp2 (Google App Engine)";
      };
    };



    "passlib" = python.mkDerivation {
      name = "passlib-1.7.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/25/4b/6fbfc66aabb3017cd8c3bd97b37f769d7503ead2899bf76e570eb91270de/passlib-1.7.1.tar.gz"; sha256 = "3d948f64138c25633613f303bcc471126eae67c04d5e3f6b7b8ce6242f8653e0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://bitbucket.org/ecollins/passlib";
        license = licenses.bsdOriginal;
        description = "comprehensive password hashing framework supporting over 30 schemes";
      };
    };



    "python-dateutil" = python.mkDerivation {
      name = "python-dateutil-2.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6/python-dateutil-2.6.0.tar.gz"; sha256 = "62a2f8df3d66f878373fd0072eacf4ee52194ba302e00082828e0d263b0418d2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://dateutil.readthedocs.io";
        license = licenses.bsdOriginal;
        description = "Extensions to the standard Python datetime module";
      };
    };



    "python-mimeparse" = python.mkDerivation {
      name = "python-mimeparse-1.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/0f/40/ac5f9e44a55b678c3cd881b4c3376e5b002677dbeab6fb3a50bac5d50d29/python-mimeparse-1.6.0.tar.gz"; sha256 = "76e4b03d700a641fd7761d3cd4fdbbdcd787eade1ebfac43f877016328334f78"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/dbtsai/python-mimeparse";
        license = licenses.mit;
        description = "A module provides basic functions for parsing mime-type names and matching them against a list of media-ranges.";
      };
    };



    "six" = python.mkDerivation {
      name = "six-1.10.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"; sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pypi.python.org/pypi/six/";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };

  };
  overrides = import ./requirements_override.nix { inherit pkgs python; };
  commonOverrides = [

  ];

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            ([overrides] ++ commonOverrides)
         )
   )