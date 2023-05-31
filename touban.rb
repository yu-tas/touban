# ランダムに朝礼を行う人を選ぶ
def select_name(names, finish_names)
  remaining_name = names - finish_names #残りの参加者を出す
  if remaining_name.empty? # 残りの参加者はいるのかを確認する
    finish_names.clear # いない場合は、既に朝礼を行なった人の配列を空にする。
    remaining_name = names # 再度、残りの参加者を出す。
  end
  selected_name = remaining_name.sample # シャッフルする
  finish_names << selected_name # シャッフルして選ばれた人を既に朝礼を行なっている人の配列に追加する
  selected_name # 今日の朝礼を行う人が決まる
end

# 参加者の配列
names = %W[浅沼 内堀 内海 小倉 小野 加藤 神田 チャーリー 近藤 新谷 高篠 田村 近野 出島 野﨑 増山 村田]

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

# 既に朝礼を行った人の配列
finish_names = []
if File.exist?("finish_names.txt") # finish_namesの内容を読み込む
  finish_names = File.read("finish_names.txt").split("\n")
end

# 朝礼を行う人を1人だけ選らんで表示
selected_name = select_name(names, finish_names)
puts "今日の朝礼/終礼を行う人は#{selected_name}さんです。"

# finish_namesの内容をファイルに保存
File.open("finish_names.txt", "w") { |file| file.write(finish_names.join("\n")) }
