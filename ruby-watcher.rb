require File.join(File.dirname(__FILE__), 'init')


#Watcher::Command.capture
EventMachine.run {
  Watcher::Logger.log("Taking snapshots every #{Watcher::Config['capture']['time']} seconds")

  EM.add_periodic_timer(Watcher::Config['capture']['time']) {
    Watcher::Capture.create!
  }
}