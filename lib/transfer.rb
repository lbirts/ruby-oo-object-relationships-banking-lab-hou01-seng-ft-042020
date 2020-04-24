class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
  #   if valid? && @sender.balance > @amount && @status == "pending"
  #     @sender.balance -= @amount
  #     @receiver.balance += @amount
  #     @status = "complete"
  #   elsif @sender.balance < @amount
  #     "Transaction rejected. Please check your account balance."
  #     @status = "rejected"
  #   end
  # end
    unless @status == "complete"
      if @sender.balance > @amount && valid?
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end
