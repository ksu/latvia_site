module Admin
  class QuestionsController < Admin::BaseController

    crudify :question, :xhr_paging => true

  end
end
