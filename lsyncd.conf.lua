settings {
    logfile = "/var/log/lsyncd/lsyncd.log",
    statusFile = "/var/log/lsyncd/lsyncd_status.log"
}

sync {
   default.rsyncssh,
   delete=true,
   source="/wordpress_share",
   host="$host",
   targetdir="/sync-dir",
   excludeFrom="/etc/lsyncd/lsyncd.exclude",
   exclude={'.tmp'},
   rsync = {
     update = true,
     archive = true,
     links = false,
     perms = true,
     owner = true,
     compress = false,
     whole_file = false
   },
   ssh = {
     port = 57713
   }
}

sync {
   default.rsyncssh,
   delete=true,
   source="/block_storage",
   host="$host",
   targetdir="/target-sync",
   exclude={'.tmp'},
   rsync = {
     update = true,
     archive = true,
     links = false,
     perms = true,
     owner = true,
     compress = false,
     whole_file = false
   },
   ssh = {
     port = 57713
   }
}

