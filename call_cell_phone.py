from twilio.rest import Client
account_sid = 'account_sid'
auth_token = 'auth_token'

client = Client(account_sid, auth_token)

call = client.calls.create(
                        url='http://demo.twilio.com/docs/voice.xml',
                        to='your_number',
                        from_='your_twilio_number'
                    )
