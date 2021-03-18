{ config, pkgs, ... }:
{
  users.users."sivizius"
  =   {
        extraGroups                     =   [ "wheel" ];
        initialPassword                 =   "1337";
        isNormalUser                    =   true;
        openssh.authorizedKeys.keys
        =   [
              "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDInRrwDoD8qIf07vy3KgRcHHet70zzAq8z/QaQ/J+mpcvVWnoysKBEuB6Q59ucu3AxUJsoLlvRKXdm05IfyZLLMQ018Wt2tBxqjPirraZkwnZkXYzfnQKMeN9AyWDJ3ni7VTewsLLE6+4G4H2nzWVzgox6d4yAFvaSl5S80nrUXH9Ruih3x5LFtsTbyaYJ99sS4Uh7DSiEawfJdr0kfc0k5kD9x8vDmHvKGRYY4Blsu/K41wfIxNS2doM/H82B9lmFh4nY75oQUsIclYIvRXK7Z4rmk44Ph+Ncxm+qEvSFQBBOZqdvHcBachACRO3bPoKSEWpsjq08OwqkkyoB8JKqd0CyeMiid9AAaiR8OHBI2xjpATWwirV2mqLJHBFhoWMCA8rB/EWUICmOKQ1w95XeskU53OZ3dZKBXxKPDmJyLWvD+dWfc7GWaZ2fn5gSv4MN9dO6MepsfiUHonN86SGS60wLrQSAjdG8UShiKGcgCZLPxzava4eMUpjWIISofopEKJGihy12JW2DeYR/Okannmz3AcAVgcMe2PADbSUPn65YiQtWhIqk8VRiC43gggZ4pJR4GAOS1m3N1Xct05fd5zcEWiFkSJ8krO0Y/vYNGcUZMmbGstp7dmLGC0LY1fYKBaXpQ4BfqeYDdaHjWZulDAhbN/FWj1JbYX+owHZQ9w== _sivizius"
              "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDR1eqjiJKg2fUHpCBQxVyqfaiJMhUsN0UOO6uAzm04bbEOYb+iFGV/6IZ65egQ2UmBzbghU7Wm0ngfk8PNsfZkwtfQGm9VNcU00O7gNxH29/HaRZ1fhjFVTtJCw8AQmgVlz7/bgGb2Tpr9KjuUI/R1Lmp68/2JEhmP1Uztl8mbf82vW8dpIHVlUO+YlCrP03EAFJPnTyYGv74Fw7COJCdUHmfpuOO/38sOe89nSzUskws9CjxJ4D0tG3v323EOPcY2hs0xa1mZQY/FV96Cj6Cr5XH0TKqfe7LI2MDhzven/loANRQaR1YuZ0FW59Hf4V8xBLpVhho5gCx7oJH99K20rc7agDzKy1tt61Yd/nK2Fp5xUkOvKd3ZDdXbrPuK2fPaSyNZHQBBI2zdld/jGsmCFc3sUTIleghUAPNyc/kVmyXqdI3y9UwIN6y5Ed7PwhRiLlQjdI54B9/ANI/WO7phk7d4V6G0sNMeNXFji5hiHGxKfsroVsb3aW3PdUbjfpc= hosts.ssh Hosting/ssh@initrd"
            ];
        shell                           =   pkgs.zsh;
      };
}
