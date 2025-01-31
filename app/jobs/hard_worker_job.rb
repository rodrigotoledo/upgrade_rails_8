class HardWorkerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Turbo::StreamsChannel.broadcast_update_to(
      "timing",
      target: "timing",
      partial: "layouts/timing"
    )
  end
end
