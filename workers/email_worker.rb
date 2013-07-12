class EmailWorker
  include Sidekiq::Worker
  sidekiq_options queue: :emails, retry: 10, backtrace: true

  def perform(args={})
    Mail.deliver do
       from    args[:from]
       to      args[:to]
       subject args[:subject]
       body    args[:body]
    end
  end
end
