require('open-uri')
require('json')
require('awesome_print')
page = open("http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=")
lotto_info = page.read
lotto_hash=JSON.parse(lotto_info)

bonus_number = lotto_hash["bnusNo"]

drw_numbers = [lotto_hash["drwtNo1"],lotto_hash["drwtNo2"],lotto_hash["drwtNo3"],lotto_hash["drwtNo4"],lotto_hash["drwtNo5"],lotto_hash["drwtNo6"]]
my_numbers = (1..45).to_a.sample(6).sort

match_numbers=[]
cnt = -1;
for i in 0..5
    for j in 0..5
        if drw_numbers[i]==my_numbers[j]
            cnt = cnt+1
            match_numbers[cnt]=drw_numbers[i]
            break
        end
    end
end
isbonus = 0
for i in 0..5
    if drw_numbers[i]==bonus_number
        isbonus=1
        break
    end
end

puts "이번주 로또 번호는 #{drw_numbers}이고, 보너스 번호는 #{bonus_number} 입니다."
puts "추첨한 로또 번호는 #{my_numbers}입니다."
puts "겹치는 번호는 #{match_numbers} 입니다."

if cnt + 1 == 6
    puts "결과는 1등입니다"
elsif cnt + 1 == 5 && isbonus == 1
    puts "결과는 2등입니다"
elsif cnt + 1 == 5 
    puts "결과는 3등입니다"
elsif cnt + 1 == 4
    puts "결과는 4등입니다"
elsif cnt + 1 == 3
    puts "결과는 5등입니다"
else
    puts "결과는 꽝입니다"
end