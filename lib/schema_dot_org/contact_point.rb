# frozen_string_literal: true

require 'schema_dot_org'

module SchemaDotOrg
  # Model the Schema.org `Thing > Intangible > ContactPoint`.
  # See https://schema.org/ContactPoint
  class ContactPoint < SchemaType
    attr_accessor :area_served,
                  :available_language,
                  :contact_option,
                  :contact_type,
                  :email,
                  :fax_number,
                  :hours_available,
                  :name,
                  :product_supported,
                  :telephone

    validates :area_served,        type: Array, allow_nil: true
    validates :available_language, type: Array, allow_nil: true
    validates :contact_option,     type: String, allow_nil: true
    validates :contact_type,       type: String, allow_nil: true
    validates :telephone,          type: String, allow_nil: true
    validates :fax_number,         type: String, allow_nil: true
    validates :email,              type: String, allow_nil: true
    validates :hours_available,    type: String, allow_nil: true
    validates :name,               type: String, allow_nil: true
    validates :product_supported,  type: String, allow_nil: true


    def _to_json_struct
      {
        'telephone' => telephone,
        'contactType' => contact_type,
        'contactOption' => contact_option,
        'areaServed' => area_served,
        'availableLanguage' => available_language,
        'faxNumber' => fax_number,
        'email' => email,
        'hoursAvailable' => hours_available,
        'name' => name,
        'productSupported' => product_supported,
      }
    end

    private

  end
end
