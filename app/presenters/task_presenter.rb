# frozen_string_literal: true

class TaskPresenter
  include ActionView::Helpers::TextHelper
  def initialize(task)
    @task = task
  end

  def started_at?
    display_time(@task.started_at)
  end

  def finished_at?
    display_time(@task.finished_at)
  end

  def doing_time?
    return unless @task.doing_time

    html = '<b>Doing Time: </b>'.html_safe
    html + pluralized_time
  end

  private

  def display_time(task_time_value)
    task_time_value.nil? ? 'Not yet' : task_time_value
  end

  def pluralized_time
    if @task.doing_time.positive?
      pluralize(@task.doing_time, 'hour')
    else
      '>1 hour'
    end
  end
end
