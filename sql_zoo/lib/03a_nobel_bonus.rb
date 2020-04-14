# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT
    *
  FROM
    nobels as chemistry
  JOIN
    nobels as physics
    ON chemistry.yr = physics.yr
  WHERE
    chemistry.subject = 'Chemistry' AND
    chemistry.winner  is NULL AND
    physics.subject = 'Physics' AND
    physics.winner is NOT NULL
  SQL
end
