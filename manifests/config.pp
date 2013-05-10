class flashpolicyd::config {
  require boxen::config

  $executable = "${boxen::config::homebrewdir}/bin/flashpolicyd.py"
  $configdir  = "${boxen::config::configdir}/flashpolicyd"
  $configfile = "${configdir}/flashpolicyd.xml"
  $datadir    = "${boxen::config::datadir}/flashpolicyd"
  $logdir     = "${boxen::config::logdir}/flashpolicyd"
  $logfile    = "${logdir}/flashpolicyd.log"
  $port       = 843
}
