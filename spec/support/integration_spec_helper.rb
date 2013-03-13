module IntegrationSpecHelper
  def login_with_oauth(service = :podio)
    visit "/auth/#{service}"
  end
end