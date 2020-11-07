namespace :article do
  task fetch: :environment do
    FetchArticleBatch.new.execute
  end
end
