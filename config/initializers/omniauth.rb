Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :weibo, '699628272', '8e6ce6163a6ec96a4e3d85a2ae55b61e'
  else
    provider :weibo, '2785118012', '56286c6cc169d2162d731f3281b43c11'
  end
end
