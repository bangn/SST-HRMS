class User::TimesheetsController < User::UsersController

  def index
    @timesheets = Timesheet.where(user_id: current_user.id)
  end

end
