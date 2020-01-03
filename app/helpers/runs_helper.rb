module RunsHelper

  def run_date(run)
    run.date.strftime("%A, %B %e")
  end

  def run_time(run)
    total_seconds = run.run_time * 60
    Time.at(total_seconds).utc.strftime("%H:%M:%S")
  end

end
