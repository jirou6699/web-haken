class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
  def self.search(search)
    if search != ""
      Job.where('text LIKE(?)', "%#{search}%")
    else
      Job.all
    end
  end
end
