# 'レディース'
# 'メンズ'
# 'ベビー・キッズ'
# 'インテリア・住まい・小物'
# '本・音楽・ゲーム'
# 'おもちゃ・ホビー・グッズ'
# 'コスメ・香水・美容'
# '家電・スマホ・カメラ'
# 'スポーツ・レジャー'
# 'ハンドメイド'
# 'チケット'
# '自動車・オートバイ'
# 'その他'

# レディース
lady_child_array = ['トップス','ジャケット/アウター','パンツ','スカート','ワンピース','靴','ルームウェア/パジャマ','レッグウェア','帽子','バッグ','アクセサリー','ヘアアクセサリー','小物','時計','ウィッグ/エクステ','浴衣/水着','スーツ/フォーマル/ドレス','マタニティ','その他']
lady_grandchild_array = [
                          ['Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ/ブラウス(半袖/袖なし)','シャツ/ブラウス(七分/長袖)','ポロシャツ','キャミソール','タンクトップ','ホルターネック','ニット/セーター','チュニック','カーディガン/ボレロ','アンサンブル','ベスト/ジレ','パーカー','トレーナー/スウェット','ベアトップ/チューブトップ','ジャージ','その他'], 
                          ['テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','ダウンジャケット','ライダースジャケット','ミリタリージャケット','ダウンベスト','ジャンパー/ブルゾン','ポンチョ','ロングコート','トレンチコート','ダッフルコート','ピーコート','チェスターコート','モッズコート','スタジャン','毛皮/ファーコート','スプリングコート','スカジャン','その他'], 
                          ['デニム/ジーンズ','ショートパンツ','カジュアルパンツ','ハーフパンツ','チノパン','ワークパンツ/カーゴパンツ','クロップドパンツ','サロペット/オーバーオール','オールインワン','サルエルパンツ','ガウチョパンツ','その他'], 
                          ['ミニスカート','ひざ丈スカート','ロングスカート','キュロット','その他'], 
                          ['ミニワンピース','ひざ丈ワンピース','ロングワンピース','その他'], 
                          ['ハイヒール/パンプス','ブーツ','サンダル','スニーカー','ミュール','モカシン','ローファー/革靴','フラットシューズ/バレエシューズ','長靴/レインシューズ','その他'], 
                          ['パジャマ','ルームウェア'], 
                          ['ソックス','スパッツ/レギンス','ストッキング/タイツ','レッグウォーマー','その他'], 
                          ['ニットキャップ/ビーニー','ハット','ハンチング/ベレー帽','キャップ','キャスケット','麦わら帽子','その他'], 
                          ['ハンドバッグ','トートバッグ','エコバッグ','リュック/バックパック','ボストンバッグ','スポーツバッグ','ショルダーバッグ','クラッチバッグ','ポーチ/バニティ','ボディバッグ/ウェストバッグ','マザーズバッグ','メッセンジャーバッグ','ビジネスバッグ','旅行用バッグ/キャリーバッグ','ショップ袋','和装用バッグ','かごバッグ','その他'], 
                          ['ネックレス','ブレスレット','バングル/リストバンド','リング','ピアス(片耳用)','ピアス(両耳用)','イヤリング','アンクレット','ブローチ/コサージュ','チャーム','その他'], 
                          ['ヘアゴム/シュシュ','ヘアバンド/カチューシャ','ヘアピン','その他'], 
                          ['長財布','折り財布','コインケース/小銭入れ','名刺入れ/定期入れ','キーケース','キーホルダー','手袋/アームカバー','ハンカチ','ベルト','マフラー/ショール','ストール/スヌード','バンダナ/スカーフ','ネックウォーマー','サスペンダー','サングラス/メガネ','モバイルケース/カバー','手帳','イヤマフラー','傘','レインコート/ポンチョ','ミラー','タバコグッズ','その他'], 
                          ['腕時計(アナログ)','腕時計(デジタル)','ラバーベルト','レザーベルト','金属ベルト','その他'], 
                          ['前髪ウィッグ','ロングストレート','ロングカール','ショートストレート','ショートカール','その他'], 
                          ['浴衣','着物','振袖','長襦袢/半襦袢','水着セパレート','水着ワンピース','水着スポーツ用','その他'], 
                          ['スカートスーツ上下','パンツスーツ上下','ドレス','パーティーバッグ','シューズ','ウェディング','その他'], 
                          ['トップス','アウター','インナー','ワンピース','パンツ/スパッツ','スカート','パジャマ','授乳服','その他'], 
                          ['コスプレ','下着','その他']
                        ]
parent = Category.create(name: 'レディース')
lady_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  lady_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end
# メンズ
mens_child_array = ['トップス','ジャケット/アウター','パンツ','靴','バッグ','スーツ','帽子','アクセサリー','小物','時計','水着','レッグウェア','アンダーウェア','その他',]
mens_grandchild_array = [
                          ['Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ','ポロシャツ','タンクトップ','ニット/セーター','パーカー','カーディガン','スウェット','ジャージ','ベスト','その他'], 
                          ['テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','ダウンジャケット','ライダースジャケット','ミリタリージャケット','ナイロンジャケット','フライトジャケット','ダッフルコート','ピーコート','ステンカラーコート','トレンチコート','モッズコート','チェスターコート','スタジャン','スカジャン','ブルゾン','マウンテンパーカー','ダウンベスト','ポンチョ','カバーオール','その他'], 
                          ['デニム/ジーンズ','ワークパンツ/カーゴパンツ','スラックス','チノパン','ショートパンツ','ペインターパンツ','サルエルパンツ','オーバーオール','その他'], 
                          ['スニーカー','サンダル','ブーツ','モカシン','ドレス/ビジネス','長靴/レインシューズ','デッキシューズ','その他'], 
                          ['ショルダーバッグ','トートバッグ','ボストンバッグ','リュック/バックパック','ウエストポーチ','ボディーバッグ','ドラムバッグ','ビジネスバッグ','トラベルバッグ','メッセンジャーバッグ','エコバッグ','その他'], 
                          ['スーツジャケット','スーツベスト','スラックス','セットアップ','その他'], 
                          ['キャップ','ハット','ニットキャップ/ビーニー','ハンチング/ベレー帽','キャスケット','サンバイザー','その他'], 
                          ['ネックレス','ブレスレット','バングル/リストバンド','リング','ピアス(片耳用)','ピアス(両耳用)','アンクレット','その他'], 
                          ['長財布','折り財布','マネークリップ','コインケース/小銭入れ','名刺入れ/定期入れ','キーケース','キーホルダー','ネクタイ','手袋','ハンカチ','ベルト','マフラー','ストール','バンダナ','ネックウォーマー','サスペンダー','ウォレットチェーン','サングラス/メガネ','モバイルケース/カバー','手帳','ストラップ','ネクタイピン','カフリンクス','イヤマフラー','傘','レインコート','ミラー','タバコグッズ','その他'], 
                          ['腕時計(アナログ)','腕時計(デジタル)','ラバーベルト','レザーベルト','金属ベルト','その他'], 
                          ['一般水着','スポーツ用','アクセサリー','その他'], 
                          ['ソックス','レギンス/スパッツ','レッグウォーマー','その他'], 
                          ['トランクス','ボクサーパンツ','その他'], 
                          ['すべて']
                        ]
parent = Category.create(name: 'メンズ')
mens_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  mens_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end
# ベビー・キッズ
baby_child_array = ['ベビー服(女の子用)~95cm','ベビー服(男の子用)~95cm','ベビー服(男女兼用)~95cm','キッズ服(女の子用)100cm~','キッズ服(男の子用)100cm~','キッズ服(男女兼用)100cm~','キッズ靴','子ども用ファッション小物','おむつ/トイレ/バス','外出/移動用品','授乳/食事','ベビー家具/寝具/室内用品','おもちゃ','行事/記念品','その他']
baby_grandchild_array = [
                          ['トップス','アウター','パンツ','スカート'], 
                          ['トップス','アウター','パンツ','おくるみ'],
                          ['トップス','アウター','パンツ','おくるみ'],
                          ['コート','ジャケット/上着','トップス(Tシャツ/カットソー)','トップス(トレーナー)'],
                          ['コート','ジャケット/上着','トップス(Tシャツ/カットソー)','トップス(トレーナー)'],
                          ['コート','ジャケット/上着','トップス(Tシャツ/カットソー)','トップス(トレーナー)'],
                          ['スニーカー','サンダル','ブーツ','長靴'],
                          ['靴下/スパッツ','帽子','エプロン','サスペンダー'],
                          ['おむつ用品','おまる/補助便座','トレーニングパンツ','ベビーバス'],
                          ['ベビーカー','抱っこひも/スリング','チャイルドシート','その他'],
                          ['ミルク','ベビーフード','ベビー用食器','その他'],
                          ['ベッド','布団/毛布','イス','たんす'],
                          ['おふろのおもちゃ','がらがら','オルゴール','ベビージム'],
                          ['お宮参り用品','お食い初め用品','アルバム','手形/足形'],
                          ['母子手帳用品','その他'],
                        ]
parent = Category.create(name: 'ベビー・キッズ')
baby_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  baby_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end
# インテリア・住まい・小物
interior_child_array = ['キッチン/食器','ベッド/マットレス','ソファ/ソファベッド','椅子/チェア','机/テーブル','収納家具','ラグ/カーペット/マット','カーテン/ブラインド','ライト/証明','寝具','インテリア小物','季節/年中行事','その他']
interior_grandchild_array = [
                              ['食器','調理器具','収納/キッチン雑貨','弁当用品'],
                              ['セミシングルベッド','シングルベッド','セミダブルベッド','ダブルベッド'],
                              ['ソファセット','シングルソファ','ラブソファ','トリプルソファ'],
                              ['一般','スツール','ダイニングチェア','ハイバックチェア'],
                              ['こたつ','カウンターテーブル','サイドテーブル','センターテーブル'],
                              ['リビング収納','キッチン収納','玄関/屋外収納','バス/トイレ収納'],
                              ['ラグ','カーペット','ホットカーペット','玄関/キッチンマット'],
                              ['カーテン','ブラインド','ロールスクリーン','のれん'],
                              ['蛍光灯/電球','天井照明','フロアスタンド','その他'],
                              ['布団/毛布','枕','シーツカバー','その他'],
                              ['ごみ箱','ウェルカムボード','オルゴール','クッション'],
                              ['正月','成人式','バレンタインデー','ひな祭り'],
                              ['すべて'],
                            ]
parent = Category.create(name: 'インテリア・住まい・小物')
interior_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  interior_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end
# 本・音楽・ゲーム
book_child_array = ['本','漫画','雑誌','CD','DVD/ブルーレイ','レコード','テレビゲーム']
book_grandchild_array = [
                          ['文学/小説','人文/社会','ノンフィクション/教養','地図/旅行ガイド'],
                          ['全巻セット','少年漫画','少女漫画','青年漫画'],
                          ['アート/エンタメ/ホビー','ファッション','ニュース/総合','趣味/スポーツ'],
                          ['邦楽','洋楽','アニメ','クラシック'],
                          ['外国映画','日本映画','アニメ','TVドラマ'],
                          ['邦楽','洋楽','その他'],
                          ['家庭用ゲーム本体','家庭用ゲームソフト','携帯用ゲーム本体','携帯用ゲームソフト'],
                        ]
parent = Category.create(name: '本・音楽・ゲーム')
book_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  book_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end
# おもちゃ・ホビー・グッズ
toy_child_array = ['おもちゃ','タレントグッズ','コミック/アニメグッズ','トレーディングカード','フィギュア','楽器/器材','コレクション','ミニタリー','美術品','アート用品','その他']
toy_grandchild_array =[
                        ['キャラクターグッズ','ぬいぐるみ','小物/アクセサリー','模型/プラモデル'],
                        ['アイドル','ミュージシャン','タレント/お笑い芸人','スポーツ選手'],
                        ['ストラップ','キーホルダー','バッジ','カード'],
                        ['遊戯王','マジック：ザ・ギャザリング','ポケモンカードゲーム','デュエルマスターズ'],
                        ['コミック/アニメ','特撮','ゲームキャラクター','SF/ファンタジー/ホラー'],
                        ['エレキギター','アコースティックギター','ベース','エフェクター'],
                        ['武具','使用済切手/官製はがき','旧貨幣/金貨/銀貨/記念硬貨','印刷物'],
                        ['トイガン','個人装備','その他'],
                        ['陶芸','ガラス','漆芸','金属工芸'],
                        ['画材','額縁','その他'],
                        ['トランプ/UNO','カルタ/百人一首','ダーツ','ビリヤード'],
                      ]
parent = Category.create(name: 'おもちゃ・ホビー・グッズ')
toy_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  toy_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end
# コスメ・香水・美容
Category.create(name: 'コスメ・香水・美容')
# 家電・スマホ・カメラ
Category.create(name: '家電・スマホ・カメラ')
# スポーツ・レジャー
Category.create(name: 'スポーツ・レジャー')
# ハンドメイド
Category.create(name: 'ハンドメイド')
# チケット
Category.create(name: 'チケット')
# 自転車・オートバイ
Category.create(name: '自転車・オートバイ')
# その他
Category.create(name: 'その他')