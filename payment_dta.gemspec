# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{payment_dta}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Patrick Huesler"]
  s.date = %q{2009-10-25}
  s.description = %q{Generate Swiss DTA payment files to extract payments from your existing application}
  s.email = %q{patrick.huesler@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "LICENSE",
     "README.rdoc",
     "VERSION",
     "generators/payment/USAGE",
     "generators/payment/payment_generator.rb",
     "generators/payment/templates/model.rb.erb",
     "generators/payment/templates/spec.rb.erb",
     "lib/payment_dta.rb",
     "lib/payment_dta/character_conversion.rb",
     "lib/payment_dta/dta_file.rb",
     "lib/payment_dta/payment_sorting.rb",
     "lib/payment_dta/payments/bank_cheque_payment.rb",
     "lib/payment_dta/payments/base.rb",
     "lib/payment_dta/payments/domestic_chf_payment.rb",
     "lib/payment_dta/payments/esr_payment.rb",
     "lib/payment_dta/payments/financial_institution_payment.rb",
     "lib/payment_dta/payments/iban_payment.rb",
     "lib/payment_dta/payments/special_financial_institution_payment.rb",
     "lib/payment_dta/payments/total_record.rb",
     "script/destroy",
     "script/generate"
  ]
  s.homepage = %q{http://github.com/phuesler/payment_dta}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Ruby library to generate Swiss DTA payment files}
  s.test_files = [
    "spec/factory.rb",
     "spec/lib/bank_cheque_payment_spec.rb",
     "spec/lib/character_conversion_spec.rb",
     "spec/lib/domestic_chf_payment_spec.rb",
     "spec/lib/dta_file_spec.rb",
     "spec/lib/esr_payment_spec.rb",
     "spec/lib/financial_institution_payment_spec.rb",
     "spec/lib/iban_payment_spec.rb",
     "spec/lib/payment_header_spec.rb",
     "spec/lib/payment_spec.rb",
     "spec/lib/special_financial_institution_payment_spec.rb",
     "spec/lib/total_record_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rubigen>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rubigen>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rubigen>, [">= 0"])
  end
end
