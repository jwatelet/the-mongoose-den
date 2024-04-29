class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[new index create]
end
