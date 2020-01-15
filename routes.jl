using Genie.Router
using Main.PatientsController

MessagingResponse = pyimport("twilio.twiml.messaging_response")

route("/") do
  serve_static_file("welcome.html")
end

route("/patients", PatientsController.patient_list)

route("/sum/:x::Int/:y::Int") do
    @params(:x) + @params(:y)
end

route("/echo/:message") do
    @params(:message)
end

route("/sms") do
    resp_sms()
    from = Genie.Requests.payload(:From)
    body = Genie.Requests.payload(:Body)
    print("from: $from message: $body")
end
