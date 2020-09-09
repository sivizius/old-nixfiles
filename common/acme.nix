{ config, ... }:
{
  security                              =
  {
    acme                                =
    {
      acceptTerms                       =   true;
      email                             =   "cert@${config.self.domain}";
    };
  };
}
