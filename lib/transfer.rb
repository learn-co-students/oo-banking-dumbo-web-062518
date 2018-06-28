class Transfer
  # your code here
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if valid? && status == "pending" && sender.balance > @amount
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && status == "complete"
      receiver.balance -= @amount
      sender.balance += @amount
      @status = "reversed"
    end
  end
end
