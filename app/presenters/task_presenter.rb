# frozen_string_literal: true

class TaskPresenter
  include ActionView::Helpers
  include Rails.application.routes.url_helpers

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

  def justification?
    return unless @task.justification

    html = '<h5>Justification</h5>'.html_safe
    html + @task.justification
  end

  def start_finish_justification_button?
    if @task.started_at.nil?
      link_to 'Start Task',
      task_path(@task, task: { started_at: Time.now }),
      method: :put, data: { confirm: 'Are you sure?' },
      class:'btn btn-outline-primary'
    elsif @task.finished_at.nil?
      link_to 'Finish Task',
      task_path(@task, task: { finished_at: Time.now }),
      method: :put, data: { confirm: 'Are you sure?' },
      class:'btn btn-outline-info'
    else
      link_to 'Add Justification',
      justification_path(@task),
      class:'btn btn-outline-warning'
    end
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
