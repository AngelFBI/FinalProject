module TaskHelper
  def has_value?(task_value)
    task_value.nil? ? 'Not yet' : task_value
  end
end
