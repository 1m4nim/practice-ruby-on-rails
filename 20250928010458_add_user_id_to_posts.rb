class AddUserIdToPosts < ActiveRecord::Migration[7.1]
  def up
    # 1. まず、NULLを許可してカラムを追加する
    add_reference :posts, :user, foreign_key: true, null: true
    
    # 2. 【重要】最初のユーザーを取得し、既存のすべての記事をそのユーザーに紐づける
    #    このステップが、NOT NULLエラーを防ぎます。
    user = User.first
    if user.nil?
      # ユーザーがいない場合は、マイグレーションを失敗させるか、
      # 匿名ユーザーとして進めるか選択できますが、ここでは停止します。
      raise "データベースにユーザーレコードが存在しません。最初にユーザーを作成してください。"
    end
    
    # 既存のすべてのPostのuser_idを、最初のユーザーIDに更新する
    Post.update_all(user_id: user.id)

    # 3. 最後に、NOT NULL制約を追加して、今後のデータ整合性を保証する
    change_column_null :posts, :user_id, false
  end

  def down
    # upの内容を取り消すために、カラム全体を削除します
    remove_reference :posts, :user, foreign_key: true
  end
end
