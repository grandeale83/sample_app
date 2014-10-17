class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    #
    # add_index method takes two argument mandatory, and some others optionally
    # the first is the name of the table on wich create the index
    # the second is the column of the table wich index refers
    # in this case thirth say that the entry of the column must be unique
    #
    add_index :users, :email, unique: true
  end
end
