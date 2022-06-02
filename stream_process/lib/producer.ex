defmodule Producer do
  use GenServer

  #TODO 1. Connect link to DB -> get topology pid
  #TODO 2. Extract data from specified collection -> Mongo.find() -> Enum.to_list()
  #TODO 3. Establish connection with TCP Supervisor
  #TODO 4. Send data to when worker will be connected

  def start_module()


end
