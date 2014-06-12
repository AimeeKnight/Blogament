def set_current_user(user)
  Blogament::ApplicationController.send(:define_method, :current_user) {}
  Blogament::ApplicationController.send(:helper_method, :current_user) {}

  allow_any_instance_of(Blogament::ApplicationController).to(
    receive(:current_user).
    and_return user)
end
