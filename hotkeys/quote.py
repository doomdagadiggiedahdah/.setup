import pyautogui
import pyperclip
import time

def clear_clipboard():
    """Clear the clipboard."""
    pyperclip.copy('')
    time.sleep(0.3)

def copy_selected_text():
    """Copy selected text to clipboard."""
    pyautogui.hotkey('ctrl', 'c')
    return pyperclip.paste()

def copy_current_url():
    """Copy the current URL from the browser."""
    pyautogui.hotkey('ctrl', 'l')
    pyautogui.hotkey('ctrl', 'c')
    pyautogui.hotkey('fn', 'f6')
    return pyperclip.paste()

def format_quote(quote, url):
    """Format the quote and URL into a markdown string."""
    return f'"{quote}" - [source]({url})'

def main():
    clear_clipboard()
    selected_text = copy_selected_text()
    current_url = copy_current_url()
    formatted_text = format_quote(selected_text, current_url)
    pyperclip.copy(formatted_text)

    print("Formatted text copied to clipboard!")

if __name__ == '__main__':
    main()
