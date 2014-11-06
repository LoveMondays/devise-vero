module VeroDevise
  class Mail
    attr_reader :record, :action, :data, :mail

    def initialize(record, action, data, mail=nil)
      @mail = mail
      @record = record
      @action = action
      @data = data
    end

    def deliver
      mail.deliver if mail.present?
      vero.events.track!(record.id, data: data)
    end
  end
end
