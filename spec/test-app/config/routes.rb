Rails.application.routes.draw do
  mount BabelTrain::Engine => '/babel-train' # Not necessary yet, but we'll leave it here for now
  get '*action' => 'pages'
end
