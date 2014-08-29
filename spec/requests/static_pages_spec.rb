require 'rails_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }
    it { should have_content('Вы студент?') }

    describe "for signed-in users" do
      
      describe "as company" do    
        let(:company) { FactoryGirl.create(:company) }
        before do
          sign_in company.user, "company"
        end

        it "should render company's profile" do
          should have_content(company.name)        
        end        
      end

      describe "as student" do    
        let(:student) { FactoryGirl.create(:student) }
        before do
          sign_in student.user, "student"
        end

        it "should render student's profile" do
          should have_content(student.name)        
        end        
      end

    end
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
