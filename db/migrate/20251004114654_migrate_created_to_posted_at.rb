class MigrateCreatedToPostedAt < ActiveRecord::Migration[8.0]
  # マイグレーション内で使うため、モデルをローカルで定義（最新のPostモデルに依存しないようにする）
  class Post < ApplicationRecord
  end

  def up
    puts "PostedAtにcreated_atの値をコピーしています..."

    # update_all を使うと、SQLが1回だけ実行され、find_each よりさらに高速です
    Post.update_all('posted_at = created_at')
    
    puts "データ移行が完了しました。"
  end

  def down
    puts "posted_at の値を nil に戻しています..."
    
    # ロールバック時は posted_at の値を nil にクリア
    Post.update_all(posted_at: nil)

    puts "ロールバックが完了しました。"
  end
end
