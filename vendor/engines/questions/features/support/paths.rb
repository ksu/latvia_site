module NavigationHelpers
  module Refinery
    module Questions
      def path_to(page_name)
        case page_name
        when /the list of questions/
          admin_questions_path

         when /the new question form/
          new_admin_question_path
        else
          nil
        end
      end
    end
  end
end
