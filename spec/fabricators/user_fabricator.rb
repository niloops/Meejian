Fabricator(:user) do
  after_create {|user| user.authentications << Fabricate(:weibo, user: user, current: true)}
end
