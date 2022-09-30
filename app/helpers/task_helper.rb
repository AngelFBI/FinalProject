# frozen_string_literal: true

module TaskHelper
  def initialize_presenter(task)
    @presenter = TaskPresenter.new(task)
  end
end
