class TaskPresenter
  include ActionView::Helpers::TextHelper
  def initialize(task)
    @task = task
  end

  def has_started_at?
    display_time(@task.started_at)
  end

  def has_finished_at?
    display_time(@task.finished_at)
  end

  def has_doing_time?
    if @task.doing_time
      html = ("<b>Doing Time: </b>").html_safe
      return html + pluralized_time
    end
  end

  private
  def display_time(task_time_value)
    task_time_value.nil? ? 'Not yet' : task_time_value
  end

  def pluralized_time
    @task.doing_time > 0 ?
      pluralize(@task.doing_time,'hour') : '>1 hour'
  end
end
