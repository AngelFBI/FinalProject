require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:list){
    List.create(name:'Example List', color:'success', priority:'Low')
  }

  let(:task_with_list) {
    Task.new(title:'Example',
    details:'Task to be done',
    list_id:list.id)
  }

  context 'with correct info' do
    it 'can be save' do
      expect(task_with_list.save).to eq(true)
    end

    it 'has list_id' do
      expect(task_with_list.list_id).to be_truthy
    end

    it 'can save list' do
      expect(list.save).to eq(true)
    end

    it "can save with started_at" do
      task_with_list.started_at = Time.zone.now
      expect(task_with_list.save).to eq(true)
    end

    it "can save with started_at and finished_at" do
      task_with_list.started_at = Time.zone.now
      task_with_list.finished_at = Time.zone.now
      expect(task_with_list.save).to eq(true)
    end

    it "can save with started_at, finished_at and justification" do
      task_with_list.started_at = Time.zone.now
      task_with_list.finished_at = Time.zone.now
      task_with_list.justification = 'easy task'
      expect(task_with_list.save).to eq(true)
    end
  end

  context 'with wrong info' do
    let(:task) {
      Task.new(title:'Example', details:'Task to be done')
    }

    it 'needs list_id' do
      expect(task.save).to eq(false)
    end

    context 'with list_id' do
      it "can't save without first started_at" do
        task_with_list.finished_at = Time.zone.now
        expect(task_with_list.save).to eq(false)
      end

      it "can't save without first finished_at" do
        task_with_list.justification = 'impossible task'
        expect(task_with_list.save).to eq(false)
      end
    end
  end
end
