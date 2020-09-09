{ config, home-manager, ... }:
{
  home-manager                          =
  {
    users                               =
    {
      "${config.self.userName}"         =
      {
        programs                        =
        {
          htop                          =
          {
            accountGuestInCpuMeter      =   false;
            colorScheme                 =   0;
            cpuCountFromZero            =   true;
            delay                       =   9;
            detailedCpuTime             =   false;
            enable                      =   true;
            fields                      =
            [
              "PID"
              "USER"
              "PRIORITY"
              "NICE"
              "M_SIZE"
              "M_RESIDENT"
              "M_SHARE"
              "STATE"
              "PERCENT_CPU"
              "PERCENT_MEM"
              "TIME"
              "COMM"
            ];
            headerMargin                =   true;
            hideKernelThreads           =   true;
            hideThreads                 =   false;
            hideUserlandThreads         =   false;
            highlightBaseName           =   false;
            highlightMegabytes          =   true;
            highlightThreads            =   true;
            meters                      =
            {
              left                      =
              [
                { kind  = "AllCPUs";      mode  = 1;  }
                { kind  = "CPU";          mode  = 1;  }
                { kind  = "Memory";       mode  = 1;  }
                { kind  = "Swap";         mode  = 1;  }
              ];
              right                     =
              [
                { kind  = "Clock";        mode  = 4;  }
                { kind  = "Tasks";        mode  = 2;  }
                { kind  = "LoadAverage";  mode  = 2;  }
                { kind  = "Uptime";       mode  = 2;  }
                { kind  = "Battery";      mode  = 3;  }
                { kind  = "Battery";      mode  = 1;  }
              ];
            };
            shadowOtherUsers            =   true;
            showProgramPath             =   true;
            showThreadNames             =   false;
            sortDescending              =   true;
            sortKey                     =   "PERCENT_CPU";
            treeView                    =   false;
            updateProcessNames          =   false;
          };
        };
      };
    };
  };
}
