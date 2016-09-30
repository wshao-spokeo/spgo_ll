class PortalController < ApplicationController

  def index

    @radius = params[:radius] || 3;
    @lat = params[:lat] || 34.142750;
    @lon = params[:lon] || -118.141953;

    @income_pairs = [
      ['A', 'Under $10k'],
      ['B', '$10k - $20k'],
      ['C', '$20k - $30k'],
      ['D', '$30k - $40k'],
      ['E', '$40k - $50k'],
      ['F', '$50k - $60k'],
      ['G', '$60k - $70k'],
      ['H', '$70k - $80k'],
      ['I', '$80k - $90k'],
      ['J', '$90k - $100k'],
      ['K', '$100k - $150k'],
      ['L', '$150k - $175k'],
      ['M', '$175k - $200k'],
      ['N', '$200k - $250k'],
      ['O', '250K+']
    ]

    @politics_pairs = [
      ['D', 'Democrat'],
      ['R', 'Republican'],
      ['I', 'Independent']
    ]

    @education_pairs = [
      ['1', 'High School'],
      ['2', 'Some College'],
      ['3', 'College Degree'],
      ['4', 'Graduate Degree']
    ]

    @occupation_pairs = [
      ['01', 'Homemaker'],
      ['02', 'Professional/Technical'],
      ['03', 'Upper Management/Executive'],
      ['04', 'Middle Management'],
      ['05', 'Sales/Marketing'],
      ['06', 'Clerical/Service Worker'],
      ['07', 'Tradesman/Machine/Laborer'],
      ['08', 'Retired'],
      ['09', 'Student'],
      ['10', 'Executive/Administrator'],
      ['11', 'Self Employed'],
      ['12', 'Professional Driver'],
      ['13', 'Military'],
      ['14', 'Civil Servant'],
      ['15', 'Farming/Agriculture'],
      ['16', 'Work from Home'],
      ['17', 'Health Services'],
      ['18', 'Financial Services'],
      ['20', 'Business Owner'],
      ['21', 'Teacher/Educator'],
      ['22', 'Retail Sales'],
      ['23', 'Computer Professional'],
      ['30', 'Beauty'],
      ['31', 'Real Estate'],
      ['32', 'Architect'],
      ['33', 'Interior Designer'],
      ['34', 'Landscape Architect'],
      ['35', 'Electrician'],
      ['36', 'Engineer'],
      ['37', 'Accountant'],
      ['38', 'Attorney'],
      ['39', 'Social Worker'],
      ['40', 'Counselor'],
      ['41', 'Occupational Therapist/Physical Therapist'],
      ['42', 'Speech Pathologist/Audiologist'],
      ['43', 'Psychologist'],
      ['44', 'Pharmacist'],
      ['45', 'Opticians/Optometrist'],
      ['46', 'Veterinarian'],
      ['47', 'Dentist/Dental Hygienist'],
      ['48', 'Nurse'],
      ['49', 'Doctor/Physician/Surgeon'],
      ['50', 'Chiropractor'],
      ['51', 'Surveyor'],
      ['52', 'Disabled']
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

    @language_pairs = [
      ['A', 'Arabic'],
      ['C', 'Chinese'],
      ['D', 'Pashtu'],
      ['F', 'French'],
      ['E', 'English'],
      ['G', 'Greek'],
      ['H', 'Hindu'],
      ['I', 'Italian'],
      ['J', 'Japanese'],
      ['K', 'Korean'],
      ['N', 'German'],
      ['P', 'Polish'],
      ['R', 'Russian'],
      ['S', 'Spanish'],
      ['T', 'Thai'],
      ['U', 'Portuguese'],
      ['V', 'Vietnamese'],
      ['W', 'Hebrew'],
      ['Z', 'Persian'],
      ['BLANK', 'Unknown']
    ]

    @religion_pairs = [
      ['B', 'Buddhist'],
      ['C', 'Catholic'],
      ['G', 'Greek Orthodox'],
      ['H', 'Hindu'],
      ['I', 'Islamic / Muslim'],
      ['J', 'Jewish'],
      ['K', 'sikh'],
      ['L', 'lutheran'],
      ['O', 'Eastern orthodox'],
      ['P', 'Protestant'],
      ['S', 'Shinto']
    ]

    @contribute_options = [
      "Animal",
      "Childrens",
      "Environm",
      "General",
      "Health",
      "Political",
      "Religious",
      "Veterans"
    ]

    @sports_options = [
      "Baseball",
      "Basketball",
      "Boating Or Sailing",
      "Camping Or Hiking",
      "Fishing",
      "Fitness",
      "Football",
      "Golf",
      "Hockey",
      "Hunting",
      "Nascar",
      "Running",
      "Scuba Diving",
      "Snow Skiing",
      "Tennis",
      "Walking",
      "Weight Lifting"
    ]

    @collector_options = [
      "Coins",
      "Dolls",
      "Figurines",
      "Fine Arts",
      "Plates",
      "Sports",
      "Stamps"
    ]

    @age_pairs = [
      ["18-25", "18-25"],
      ["26-39", "26-39"],
      ["40-49", "40-49"],
      ["50-59", "50-59"],
      ["60-100", "60+"]
    ]

    @home_value_pairs = [
      ["A", "$0K-100K"],
      ["B", "$100K-250K"],
      ["C", "$250K-500K"],
      ["D", "$500K-750K"],
      ["E", "$750K-1M"]
    ]

    @radius_pairs = [
      ["1", "Within 1 Mile"],
      ["3", "Within 3 Miles"],
      ["5", "Within 5 Miles"],
      ["10", "Within 10 Miles"]
    ]

    @gender_pairs = [
      ["M", "Male"],
      ["F", "Female"]
    ]

  end

  def ddmaker(id, desc, ncol, items_var)
    result = "    <select id=''#{id}' class='form-control'>\n"
    result << "    <option value=''><b>#{desc}:</b></option>\n"
    eval("@items = @#{items_var}")
    if ncol == 1
      @items.each do |item|
        result << "      <option value='#{item}'>#{item}</option>\n"
      end
    else
      @items.each do |item|
        result << "      <option value='#{item[0]}'>#{item[1]}</option>\n"
      end
    end
    result << "    </select>\n"
    return result
  end
  helper_method :ddmaker

end
