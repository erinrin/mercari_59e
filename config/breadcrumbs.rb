
# トップページ
crumb :items do
  link '商品一覧', root_path
end

# 各ユーザーページ
crumb :user do |user|
  link '@#{user.nickname}', user_path
end

# 各商品ページ
crumb :item do |item|
  link "@#{item.name}", item_path(item)
  parent :items
end