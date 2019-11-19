require 'spec_helper'

describe SlackCccdbot::Bot do
  subject { SlackCccdbot::Bot.instance }

  it_behaves_like 'a slack ruby bot'
end
