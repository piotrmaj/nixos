{ ... }:

let
  settings = import ../../../settings.nix;
in {

  programs = {
    # version control.
    git = {
        enable = true;
        userName = settings.user.name;
        userEmail = settings.user.email;
        /*signing = {
            signByDefault = true;
            key = settings.user.gpg.signingKey;
        };*/
        delta = {
            enable = true;
        };
    };
  };
}