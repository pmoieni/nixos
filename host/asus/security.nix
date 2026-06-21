{
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam = {
      loginLimits = [
        {
          domain = "@users";
          item = "rtprio";
          type = "-";
          value = 1;
        }
      ];
      services.swaylock = { };
    };
  };
}
