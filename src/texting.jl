ENV["PYTHON"] = "C:\\Users\\dustin.irwin\\AppData\\Local\\Programs\\Python\\Python37\\python.exe"

rest = pyimport("twilio.rest")

client = rest.Client(session_id, auth_token)

test_sms() = client.messages.create(
    body = "This is a test SMS!",
    from_ = trial_number,
    to = "+15038106415")

resp_sms() = client.messages.create(
    body = "This is an automatic response SMS!",
    from_ = trial_number,
    to = "+15038106415")

test_mms() = client.messages.create(
    body = "This is a test MMS!",
    from_ = trial_number,
    media_url=["https://images-na.ssl-images-amazon.com/images/I/410rHVNt%2BzL._AC_UL160_.jpg"],
    to = "+15038106415")

3 in 0:10

body = "I feel like a 9 today!"
parse(Int, "9")

function extract_score(body, scores=[])
    for char in body
        try char = parse(Int, char)
            append!(scores, char) catch end end
    return scores
end

#print(msg.sid)
