msgs = (
  p,
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

  "help_requested" => "Your request for help has been forwarded to your " *
    "mental health professional. If this is a medical emergency please dial " *
    "911 for assistance."
  )
