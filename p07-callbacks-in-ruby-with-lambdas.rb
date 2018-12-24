require 'ostruct'

class Generator
  attr_reader :report

  def initialize(report)
    @report = report
  end

  def run
    report.to_csv
  end
end

class Notifier
    attr_reader :generator, :callbacks
  
    def initialize(generator, callbacks)
      @generator = generator
      @callbacks = callbacks
    end
  
    def run
      result = generator.run
      if result
        callbacks.fetch(:on_success).call(result)
      else
        callbacks.fetch(:on_failure).call
      end
    end
  end

good_report = OpenStruct.new(to_csv: "20.00: Great Success")

Notifier.new(Generator.new(good_report), {
  on_success: lambda { |r| puts "Send #{r}  to boss@acme.co" },
  on_failure: lambda { |r| puts "Send email to ben@acme.co" }
  }).tap do |n|
  n.run
end
