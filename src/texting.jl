ENV["PYTHON"] = "C:\\Users\\dustin.irwin\\AppData\\Local\\Programs\\Python\\Python37\\python.exe"

rest = pyimport("twilio.rest")
client = rest.Client(session_id, auth_token)

test_sms() = client.messages.create(
    body = "This is a test SMS!",
    from_ = trial_number,
    to = "+15038106415")

test_mms() = client.messages.create(
    body = "This is a test MMS!",
    from_ = trial_number,
    media_url=["https://images-na.ssl-images-amazon.com/images/I/410rHVNt%2BzL._AC_UL160_.jpg"],
    to = "+15038106415")

function extract_score(body, scores=[])
    for char in body
        try char = parse(Int, char)
            append!(scores, char) catch end end
    return scores
end

function get_first_name_from_phone_number(phone_num)
    phone_num = parse(Int, phone_num[3:end])
    for p in all(Patients.Patient)
        if p.phone1 == phone_num || p.phone2 == phone_num
            return p.first_name
    end end end


#print(msg.sid)
