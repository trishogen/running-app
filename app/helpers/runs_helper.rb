module RunsHelper

  def run_date(run)
    run.date.strftime("%A, %B %e")
  end

  def run_time(run)
    total_seconds = run.run_time * 60
    Time.at(total_seconds).utc.strftime("%H:%M:%S")
  end

  def current_user_been_on_run(run)
    current_user.runs.include?(run)
  end

  def forbid_if_user_hasnt_been_on_run(run)
    return head(:forbidden) unless current_user_been_on_run(run)
  end

  def redirect_if_user_hasnt_been_on_run(run)
    if @run == nil
      flash[:alert] = 'Run not found'
      redirect_to user_runs_path(current_user)
    end
  end

end
