pid = fork {
  trap("USR1") {
    $stdout.syswrite("Hello world!\n")
    exit
  }
}

Process.kill("USR1", pid)

Process.wait(pid)

 puts "Bye" 
