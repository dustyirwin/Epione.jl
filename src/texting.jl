ENV["PYTHON"] = "C:\\Users\\dustin.irwin\\AppData\\Local\\Programs\\Python\\Python37\\python.exe"

rest = pyimport("twilio.rest")

client = rest.Client(session_id, auth_token)

test_sms = client.messages.create(
    body = "This is a test SMS!",
    from_ = trial_number,
    to = "+15038106415")

test_mms = client.messages.create(
    body = "This is a test MMS!",
    from_ = trial_number,
    media_url=["https://images-na.ssl-images-amazon.com/images/I/410rHVNt%2BzL._AC_UL160_.jpg"],
    to = "+15038106415")


print(msg.sid)
