msgs = (
  p = findone(Patients.Patient, MRN=1),
  dep_score=99,
  slp_score=99,
  MHP="Maddie Jacobs",
  clinic_phone="555-555-5555") -> Dict(

    "dep_level" => "Hello $(p.first_name), please rate your depression " *
      "level today on a scale of 0-10, with 0 being no depression at all, and " *
      "10 being the most depressed.",

    "hours_slept" => "How many hours did you sleep last night?",

    "final_response" => "Thank you $(p.first_name), your responses of " *
      "$dep_score (depression level) and $slp_score (hours slept) have been " *
      "recorded. If you have any questions or concerns please contact " *
      "your mental health professional, $MHP at $clinic_phone.",

    "request_mhp" => "Your request has been forwarded to your " *
      "mental health professional. If this is a medical emergency please dial " *
      "911 for assistance.",

    "help" => """
  Welcome to Epione!
  Available Commands:

    pat_info: {id}
      Returns patient information such as name, age, sex, etc.
      e.g. 'get_pat_info: john doe'

    pat_chart: {id}
      Returns a chart with patient sleep and depression data trends.
      e.g. 'get_pat_chart: 5035551234'

    pat_stats: {id}
      Returns statistics related to the patient's mental health record.

  Available Ids:
    first_name last_name, MRN, or phone_number

  For technical assistance, please dial 800-555-5555. If this is a medical
  emergency, dial 911.""")
