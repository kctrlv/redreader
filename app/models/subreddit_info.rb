class SubredditInfo
  attr_reader :submit_text, :display_name, :public_description, :description, :subscribers

  def initialize(raw_info)
    @submit_text = raw_info[:submit_text]
    @display_name = raw_info[:display_name]
    @public_description = raw_info[:public_description]
    @description = raw_info[:description]
    @subscribers = raw_info[:subscribers]
  end
end
