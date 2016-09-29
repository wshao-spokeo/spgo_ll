class PortalController < ApplicationController
  def index
    @radius = params[:radius] || 5;
    @occupation_options = [
      "Homemaker",
      "Professional/Technical",
      "Upper Management/Executive",
      "Middle Management",
      "Sales/Marketing",
      "Clerical/Service Worker",
      "Tradesman/Machine/Laborer",
      "Retired",
      "Student",
      "Executive/Administrator",
      "Self Employed",
      "Professional Driver",
      "Military",
      "Civil Servant",
      "Farming/Agriculture",
      "Work from Home",
      "Health Services",
      "Financial Services",
      "Business Owner",
      "Teacher/Educator",
      "Retail Sales",
      "Computer Professional",
      "Beauty",
      "Real Estate",
      "Architect",
      "Interior Designer",
      "Landscape Architect",
      "Electrician",
      "Engineer",
      "Accountant",
      "Attorney",
      "Social Worker",
      "Counselor",
      "Occupational Therapist/Physical Therapist",
      "Speech Pathologist/Audiologist",
      "Psychologist",
      "Pharmacist",
      "Opticians/Optometrist",
      "Veterinarian",
      "Dentist/Dental Hygienist",
      "Nurse",
      "Doctor/Physician/Surgeon",
      "Chiropractor",
      "Surveyor",
      "Disabled"
    ]
    @ethnicity_options = [
      "Asian",
      "African-American",
      "Caucasian",
      "Hispanic",
      "Middle-Eastern",
      "Native American",
      "South-Asian"
    ]
    @education_options = [
      "High School",
      "Some College",
      "College Degree",
      "Graduate Degree"
    ]
    @contribute_options = [
"Contribute Animal",
"Contribute Childrens",
"Contribute Environm",
"Contribute General",
"Contribute Health",
"Contribute Political",
"Contribute Religious",
"Contribute Veterans"
    ]
    @sports_options = [
"Sports Baseball",
"Sports Basketball",
"Sports Boating Or Sailing",
"Sports Camping Or Hiking",
"Sports Fishing",
"Sports Fitness",
"Sports Football",
"Sports Golf",
"Sports Hockey",
"Sports Hunting",
"Sports Nascar",
"Sports Running",
"Sports Scuba Diving",
"Sports Snow Skiing",
"Sports Tennis",
"Sports Walking",
"Sports Weight Lifting"
    ]
    @collector_options = [
"Collector Coins",
"Collector Dolls",
"Collector Figurines",
"Collector Fine Arts",
"Collector Plates",
"Collector Sports",
"Collector Stamps"
    ]
  end

  def radius
    @radius_list = [
        {id: 1, text: "Within 1 Mile"},
        {id: 3, text: "Within 3 Miles"},
        {id: 5, text: "Within 5 Miles"},
        {id: 10, text: "Within 10 Miles"},
    ]
    render plain: JSON.generate(@radius_list)
  end

end
