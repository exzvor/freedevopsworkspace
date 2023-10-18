import shutil
import smtplib

def send_email(subject, message):
    sender_email = "your_email@gmail.com"  # Sender's e-mail address
    sender_password = "your_password"      # Sender's e-mail password
    recipient_email = "recipient_email@example.com"  # Recipient's e-mail address

    email_body = f"Subject: {subject}\n\n{message}"
    email_body = email_body.encode("utf-8")

    try:
        server = smtplib.SMTP("smtp.gmail.com", 587)
        server.starttls()
        server.login(sender_email, sender_password)

        server.sendmail(sender_email, recipient_email, email_body)
        print("Alert successfully sent!")
    except Exception as e:
        print(f"Error when sending an alert: {str(e)}")
    finally:
        server.quit()

def check_disk_space():
    threshold = 35  # Free space threshold value in percent

    total, used, free = shutil.disk_usage("/")  # Getting disk information
    percent_free = (free / total) * 100

    if percent_free < threshold:
        subject = "Attention! Little free disk space!"
        message = f"Free disk space: {percent_free:.2f}%"
        send_email(subject, message)

check_disk_space()