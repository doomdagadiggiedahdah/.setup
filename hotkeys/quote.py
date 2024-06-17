import pyautogui
import pyperclip
import time

def clear_clipboard():
    """Clear the clipboard."""
    pyperclip.copy('')

def copy_selected_text():
    """Copy selected text to clipboard."""
    time.sleep(0.5)
    pyautogui.hotkey('ctrl', 'c')
    return pyperclip.paste()

def copy_current_url():
    """Copy the current URL from the browser."""
    pyautogui.hotkey('i')
    pyautogui.hotkey('ctrl', 'l')
    pyautogui.hotkey('ctrl', 'c')
    pyautogui.hotkey('F6')
    pyautogui.hotkey('Esc')
    return pyperclip.paste().strip()

def format_quote(quote, url):
    """Format the quote and URL into a markdown string."""
    formatted_quote = f'""" {quote} """ -[source]({url})'
    return formatted_quote

def main():
    clear_clipboard()
    selected_text = copy_selected_text()
    current_url = copy_current_url()
    formatted_text = format_quote(selected_text, current_url)
    pyperclip.copy(formatted_text)

    print("Formatted text copied to clipboard!")

if __name__ == '__main__':
    main()
