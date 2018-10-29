# frozen_string_literal: true

require 'spec_helper'
require 'schema_dot_org/contact_point'

RSpec.describe SchemaDotOrg::ContactPoint do # rubocop:disable Metrics/BlockLength
  let(:point) { SchemaDotOrg::ContactPoint.new(
      telephone: '+1-123-456-7890'
    ) }

  describe "#new" do
    xit 'will not create a ContactPoint without an telephone' do
      expect { SchemaDotOrg::ContactPoint.new }.to raise_error(ArgumentError)
    end

    it 'will not create a ContactPoint with an unknown attribute' do
      expect do
        SchemaDotOrg::Place.new(
          address: 'Address',
          author: 'Hemmingway'
        )
      end.to raise_error(NoMethodError)
    end
  end

  describe "#to_json_struct" do

    it "has exactly the correct attributes and values" do
      pp point.to_json_struct
      expect(point.to_json_struct).to eq(
        '@type' => 'ContactPoint',
        'telephone' => '+1-123-456-7890'
      )
    end
  end

end
