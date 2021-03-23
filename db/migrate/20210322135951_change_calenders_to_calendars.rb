class ChangeCalendersToCalendars < ActiveRecord::Migration[5.2]
  def change
    rename_table :calenders, :calendars
  end
end
