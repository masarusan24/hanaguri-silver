module MembersHelper
  def choose_new_or_edit_member
    if action_name == 'new' or action_name == 'confirm'
      members_path
    elsif action_name == 'edit'
      member_path
    end
  end
end
