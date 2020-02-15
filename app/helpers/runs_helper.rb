module RunsHelper

  def run_date(run)
    run.date.strftime("%A, %B %e")
  end

  def format_run_time(run_time)
    total_seconds = run_time * 60
    Time.at(total_seconds).utc.strftime("%H:%M:%S")
  end

end
