# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :first_name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
user.last_name = "Kung"
user.save
puts 'user: ' << user.first_name
user.add_role :admin

puts 'Loading Job types'

["Accounting",
"Actuary",
"Asset Management",
"Capital Markets",
"Commercial Banking",
"Commodities",
"Compliance / Legal",
"Computer Science",
"Consulting",
"Credit",
"Debt / Fixed Income",
"Derivatives",
"Education",
"Equities",
"Finance",
"FX & Money Markets",
"Government",
"Human Resources",
"Information Technology",
"Insurance",
"Investment Banking",
"Investment Management",
"Investor Relations",
"Marketing",
"Medical",
"Operations",
"Pharmaceutical",
"Public Relations",
"Private Equity / Venture Capital",
"Quantitative Analysis",
"Real Estate",
"Research",
"Retail Banking",
"Risk Management",
"Sales and Marketing",
"Trading",
"Wealth Management"].each do |job_type|
	JobType.find_or_create_by_name({ :name => job_type }, :without_protection => true)
end

puts 'Loading Skill tags'
[
	'U.S. English Basic Skills',
	'English Spelling (U.S. Version)',
	'Windows XP',
	'Office Skills',
	'English Vocabulary (U.S. Version)',
	'Email Etiquette Certification',
	'MS Word 2003',
	'Search Engine Optimization',
	'Telephone Etiquette Certification',
	'Adobe Photoshop CS3',
	'Call Center Skills',
	'Customer Service',
	'MS Word 2007',
	'UK English Basic Skills',
	'MS Excel 2003',
	'MS Excel 2007',
	'SQL',
	'Management Skills',
	'English To Tagalog (Filipino) Translation Skills',
	'U.S. Word Usage',
	'Programming with C',
	'Joomla 1.5',
	'Book keeping',
	'Softwareing',
	'Internet Marketing',
	'MySQL 5.0',
	'Networking Concepts',
	'Online Article Writing and Blogging (U.S. Version)',
	'XHTML 1.0',
	'English Spelling (UK Version)',
	'ASP.Net 3.5 using C#',
	'Adobe Photoshop 6.0',
	'Social Media Marketing',
	'U.S. English Chicago Style Editing Skills',
	'Technical Writing Skills Certification',
	'Programming with C++',
	'Programming with C#',
	'Creative Writing - Fiction (U.S. Version)',
	'Adobe Photoshop CS4',
	'Help Desk Certification',
	'Accounting Principles',
	'Knowledge of WordPress 3.1 Skills',
	'Analytical Skills',
	'PC Graphics',
	'English To Spanish Translation Skills',
	'Accounting Skills (Assets and Revenue)',
	'UK English Grammar (For Writing Professionals)',
	'TCP/IP',
	'JavaScript 1.8',
	'Organizational Behavior',
	'AutoCad 2007',
	'AJAX',
	'Adobe Illustrator CS3',
	'Microsoft Excel 2010',
	'Advertising Skills Certification',
	'Knowledge of jQuery 1.3.2 Skills',
	'Microsoft Word 2010',
	'English To French Translation Skills',
	'Unix',
	'iPhone Programming OS 4.0',
	'Outbound Sales Skills',
	'ASP.NET with SQL Server',
	'MS Word 2000',
	'Magento eCommerce',
	'MS Excel 2000',
	'PHP',
	'English To Arabic Translation Skills',
	'HTML',
	'DotNet 2.0 using C#',
	'Google AdWords',
	'U.S. English Proofreading Skills (Chicago)',
	'Spanish To English Translation Skills',
	'Business Writing Skills Certification',
	'Objective C',
	'DotNet 3.5 using C#',
	'MS PowerPoint 2003',
	'U.S. English Sentence Structure',
	'MS PowerPoint 2007',
	'Marketing Terminology',
	'Drupal 6.14',
	'CISCO',
	'Accounts Payable',
	'U.S. English Punctuation and Mechanics',
	'Business Plans',
	'Resume Writing Skills',
	'Adobe Photoshop CS5 Extended',
	'MS SQL Server 2005',
	'Mechanical IQ',
	'Redhat Linux 9.0 General',
	'French To English Translation Skills',
	'Data Structures',
	'French Spelling Skills',
	'Quick Books Pro 2008',
	'CSS',
	'Networking XP',
	'Computer Aptitude',
	'DHTML',
	'Principles of Web Graphics Design'
].each do |skill_tag|
	SkillTag.find_or_create_by_name({ :name => skill_tag }, :without_protection => true)
end