require 'colorize'

namespace :db_status do
    desc "See Users db Status"
    task count_users: :environment do  
      if User.all.limit(5).empty?
        puts "0 Users on Database".yellow 
      else
        puts User.all.limit(20000).count.to_s + " Users on Database" 
      end
    end

    desc "See Quizzes db Status"
    task count_quizzes: :environment do  
      if Quiz.all.limit(5).empty?
        puts "0 Quizzes on Database".yellow 
      else
        puts Quiz.all.limit(20000).count.to_s + " Quizzes on Database" 
      end
    end

    desc "See Questions db Status"
    task count_questions: :environment do  
      if Question.all.limit(5).empty?
        puts "0 Questions on Database".yellow 
      else
        puts Question.all.limit(20000).count.to_s + " Questions on Database" 
      end
    end

    desc "See Amostras db Status" 
    task count_answears: :environment do
      if Answear.all.limit(5).empty?
        puts "0 Answears on Database".yellow
      else  
        puts Answear.all.limit(20000).count.to_s + " Answears on Database" 
      end
    end


    desc "Run All status"
    task all: :environment do
      Rake::Task['db_status:count_users'].execute
      Rake::Task['db_status:count_quizzes'].execute 
      Rake::Task['db_status:count_questions'].execute
      Rake::Task['db_status:count_answears'].execute
    end
  end
  