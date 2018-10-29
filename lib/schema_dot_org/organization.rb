# frozen_string_literal: true

require 'date'
require 'schema_dot_org'
require 'schema_dot_org/person'
require 'schema_dot_org/place'
require 'schema_dot_org/contact_point'


module SchemaDotOrg
  class Organization < SchemaType
    attr_accessor :address,
                  :contact_point,
                  :description,
                  :email,
                  :founder,
                  :founders,
                  :founding_date,
                  :founding_location,
                  :legal_name,
                  :location,
                  :logo,
                  :name,
                  :url,
                  :same_as


    validates :address,           type: SchemaDotOrg::PostalAddress, allow_nil: true
    validates :contact_point,     type: SchemaDotOrg::ContactPoint, allow_nil: true
    validates :description,       type: String, allow_nil: true
    validates :email,             type: String, allow_nil: true
    validates :founder,           type: SchemaDotOrg::Person, allow_nil: true
    validates :founders,          type: Array, allow_nil: true
    validates :founding_date,     type: Date, allow_nil: true
    validates :founding_location, type: SchemaDotOrg::Place, allow_nil: true
    validates :location,          type: SchemaDotOrg::PostalAddress, allow_nil: true
    validates :logo,              type: String, allow_nil: true
    validates :name,              type: String
    validates :url,               type: String, allow_nil: true
    validates :same_as,           type: Array, allow_nil: true

    def _to_json_struct
      {
        "name" => name,
        "description" => description,
        "email" => email,
        "url" => url,
        "logo" => logo,
        "address" => address&.to_json_struct,
        "location" => location&.to_json_struct,
        "founder" => founder&.to_json_struct,
        "founders" => founders&.to_json_struct,
        "foundingDate" => founding_date&.to_s,
        "foundingLocation" => founding_location&.to_json_struct,
        "contactPoint" => contact_point&.to_json_struct,
        "sameAs" => same_as

      }
    end
  end
end
