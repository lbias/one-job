module Admin::JobsHelper
  # 判断显示/隐藏icon #
  def render_job_status(job)
    if job.is_hidden
      "fa fa-lock"
    else
      "fa fa-globe"
    end
  end

  # 薪水区间 #
  def render_job_wage(job)
    "#{job.wage_lower_bound} k ~ #{job.wage_upper_bound} k"
  end

  # 判断是否隐藏该职缺 #
  def render_job_hidden(job)
    if job.is_hidden
      "hidden-box"
    end
  end
end
