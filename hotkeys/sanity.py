from plyer import notification

def notify_user(title, message):
    notification.notify(
        title=title,
        message=message,
        app_name="sanity Script",
        timeout=5  # Notification disappears after 5 seconds
    )

# Example: Notify the user when the process starts
notify_user("Process Starting", "Test is working")
