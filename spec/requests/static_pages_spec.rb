require 'rails_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }
    it { should have_content('Вы студент?') }
  end

  describe "About page" do
    before { visit about_path }
    it { should have_content('about') }
  end

  describe "Contact page" do
    before { visit contact_path }
    it { should have_content('contact') }
  end

  describe "Feedback page" do
    before { visit feedback_path }
    it { should have_content('feedback') }
  end

end
