# Docker Secretがマウントされるパス
secret_file_path = '/run/secrets/secret_key_base'

if File.exist?(secret_file_path)
  # ファイルから内容を読み込み、末尾の改行を取り除いて設定
  ENV['SECRET_KEY_BASE'] = File.read(secret_file_path).strip
end
