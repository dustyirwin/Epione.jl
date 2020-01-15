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

route("/sms", method=POST) do
    body = Genie.Requests.payload(:Body)
    from = Genie.Requests.payload(:From)

    client.messages.create(
        body = "Text received! from: $from message: $body",
        from_ = trial_number,
        to = "+15038106415")
end
