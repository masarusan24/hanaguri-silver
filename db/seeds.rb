teams = [
  { team_name: '花栗シルバーソフト', team_short_name: 'silver', home_ground: '松原小学校' },
  { team_name: '峰分ゴーゴー', team_short_name: 'gogo', home_ground: '松原小学校' },
  { team_name: '花小ソフト', team_short_name: 'hanasho', home_ground: '松原小学校' },
  { team_name: 'カームズ', team_short_name: 'calms', home_ground: '松原小学校' },
  { team_name: 'シャーク', team_short_name: 'shark', home_ground: '松原小学校' },
  { team_name: '栄小', team_short_name: 'sakae', home_ground: '栄小学校' }
]

members = [
  { name: 'ito_ma', full_name: '伊藤 真人', uniform_number: '11', position: '外野手,投手', image: 'IMG_20170913_133535_177.png' },
  { name: 'sumiyoshi', full_name: '住吉 琢磨', uniform_number: '', position: '内野手', image: 'Image_2018-03-20_15-52-14.png' },
  { name: 'shimoda', full_name: '下田 健一', uniform_number: '26', position: '外野手', image: 'Image_Shimoda_2018-03-20_15-54-19.png' },
  { name: 'nakayama', full_name: '中山 雄輔', uniform_number: '4', position: '内野手', image: 'Image_Nakayama_2018-03-20_15-54-59.png' },
  { name: 'ito_tei', full_name: '伊藤 停司', uniform_number: '15', position: '投手,内野手', image: 'Image_Itoteiji_2018-03-20_15-56-40.png' },
  { name: 'tanaka_hiro', full_name: '田中 宏夫', uniform_number: '17', position: '投手,内野手', image: 'Image_Tanakahiro_2018-03-20_15-58-27.png' },
  { name: 'tanaka_hide', full_name: '田中 秀人', uniform_number: '5', position: '内野手', image: 'Image_Tanakahide_2018-03-21_00-21-48.png' },
  { name: 'fukuoka', full_name: '福岡 輝泰', uniform_number: '11', position: '捕手,内野手', image: 'Image_Fukuoka_2018-03-21_13-31-40.png' },
  { name: 'kobayashi', full_name: '小林 敦史', uniform_number: '', position: '内野手', image: '' }
]

teams.each do |team|
  Team.create!(
    team_name: team[:team_name],
    team_short_name: team[:team_short_name],
    home_ground: team[:home_ground]
  )
end

members.each do |member|
  Member.create!(
    name: member[:name],
    full_name: member[:full_name],
    uniform_number: member[:uniform_number],
    position: member[:position],
    image: members[:image]
  )
end
