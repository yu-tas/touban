# 参加者の配列
names = %W[浅沼 内堀 内海 小倉 小野 加藤 神田 チャーリー 近藤 新谷 高篠 田村 近野 デイジー 野﨑 塾長 村田]

resting_names = []
# 休みの人の配列
puts "今日は休みの人いる? 1:いる 2:いない"
answer = gets.chomp #休みの人を入力する
while answer == "1"
  if answer == "1"
    puts "誰ですか？"
    resting_names << gets.chomp
    puts "他にいる? 1:いる 2:いない"
    answer = gets.chomp
  else
    break
  end
end

# 休みの人を参加者から除外
names -= resting_names
# ランダムにグループに振り分ける
shuffle_names = names.shuffle # シャッフルする
group1 = shuffle_names.slice(0, 3)
group2 = shuffle_names.slice(3, 4)
group3 = shuffle_names.slice(7, 3)
group4 = shuffle_names.slice(10, 3)
group5 = shuffle_names.slice(13, 4)

# 振り分けたグループを表示する。
puts "ルーム1は #{group1.join("さん, ")}さん"
puts "ルーム2は #{group2.join("さん, ")}さん"
puts "ルーム3は #{group3.join("さん, ")}さん"
puts "ルーム4は #{group4.join("さん, ")}さん"
puts "ルーム5は #{group5.join("さん, ")}さん"
