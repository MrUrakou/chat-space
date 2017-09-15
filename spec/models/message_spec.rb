require 'rails_helper'

describe Message do
  describe '#create' do
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }

    it "is valid with a text" do
      message = build(:message, text: "test")
      expect(message).to be_valid
    end

    it "is valid with a image" do
      message = build(:message, image: image)
      expect(message).to be_valid
    end

    it "is valid with a text, image" do
      message = build(:message, text: "hello!", image: image)
      expect(message).to be_valid
    end

    it "is invalid without a text, image" do
      message = build(:message, text: nil, image: nil)
      message.valid?
      expect(message.errors[:text_or_image]).to include("を入力してください")
    end

    it "is invalid without a group_id" do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group_id]).to include()
    end

    it "is invalid without a user_id" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user_id]).to include()
    end
  end
end
