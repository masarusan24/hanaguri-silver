require 'rails_helper'

RSpec.describe Member, type: :model do
  before do
    @team = FactoryBot.create(:team)

    @member = @team.members.create(
      name:      'masarusan24',
      full_name: 'Masato Ito'
    )
  end

  # 名前(登録名)とフルネームがあれば有効
  it 'is valid with name and full_name' do
    member = FactoryBot.build(:member)
    expect(member).to be_valid
  end

  # 名前(登録名)が30文字を超えたら無効
  it 'is invalid with name over 30 charactors' do
    member = FactoryBot.build(:member, name: 'a' * 31)
    expect(member).to be_invalid
  end

  # フルネームが30文字を超えたら無効
  it 'is invalid with full_name over 30 charactors' do
    member = FactoryBot.build(:member, full_name: 'a' * 31)
    expect(member).to be_invalid
  end

  # 名前(登録名)が被っていたら無効
  it 'does not allow duplicate member`s name' do
    member = FactoryBot.build(:member, name: @member.name)
    member.valid?
    expect(member.errors[:name]).to include('はすでに存在します')
  end

  # フルネームが被っていた場合は有効(同姓同名を考慮)
  it 'allows duplicate member`s full_name' do
    member = FactoryBot.build(:member, full_name: @member.full_name)
    expect(member).to be_valid
  end
end
