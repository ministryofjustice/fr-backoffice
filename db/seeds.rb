# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Applicant.delete_all
Claim.delete_all
MissingEvidenceReason.delete_all
Evidence.delete_all

applicants = Applicant.create(
  [
    {
      title:                  'Mr',
      forename:               'Joe',
      surname:                'Blow',
      date_of_birth:           Date.new(1953, 4, 2),
      ni_number:              'YS 32 72 86 X',
      status:                 'Single',
      partners_age:           nil,
      num_dependent_children: 0
    },
    {
      title:                  'Ms',
      forename:               'Jane',
      surname:                'Doe',
      date_of_birth:           Date.new(1983, 8, 9),
      ni_number:              'ZT 33 73 87 Y',
      status:                 'Partnered',
      partners_age:           44,
      num_dependent_children: 3
    }
  ]
)

claims = Claim.create(
  [
    {
      applicant_id:           applicants.first.id,
      form_number:            'N5', 
      procedure_name:         'Money Claim',
      value:                  68433,
      court_fee:              25000, 
      remission_type:         'full',
      application_date:       1.day.ago
    },
    {
      applicant_id:           applicants.last.id,
      form_number:            'D8', 
      procedure_name:         'Divorce',
      value:                  nil,
      court_fee:              45000, 
      remission_type:         'partial',
      application_date:       3.days.ago
    }
  ]
)

missing_evidence_reasons = MissingEvidenceReason.create(
  [
    {
      name: "Bank Statement Missing"
    },
    {
      name: "Bank Statement Out of Date"
    },
    {
      name: "No evidence of unexplained income"
    }
  ]
)

evidence = Evidence.create(
  [
    {
      claim_id:         claims.first.id,
      supplied:         true,
      reason_ids:       [],
      custom_reason:    nil
    },
    {
      claim_id:         claims.last.id,
      supplied:         false,
      reason_ids:       [missing_evidence_reasons[1].id, missing_evidence_reasons.last.id],
      custom_reason:    'Your bank statement shows evidence of income of £35 per week, but there is no explanation as to from where this income is derived'
    }
  ]
)



 
