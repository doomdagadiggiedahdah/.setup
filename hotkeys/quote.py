import pyautogui
import pyperclip
import time
import datetime
import psutil

LOG_FILE = "/tmp/quote_performance.log"

def log_time(message):
    """Log with timestamp and system stats"""
    timestamp = datetime.datetime.now().isoformat()
    cpu = psutil.cpu_percent(interval=0)
    mem = psutil.virtual_memory().percent
    with open(LOG_FILE, 'a') as f:
        f.write(f"{timestamp} | CPU={cpu:5.1f}% MEM={mem:5.1f}% | {message}\n")

def wait_for_clipboard_change(old_value, timeout=4.0):
    """Wait until clipboard actually changes"""
    start = time.time()
    checks = 0
    while time.time() - start < timeout:
        new_value = pyperclip.paste()
        checks += 1
        if new_value != old_value:
            elapsed = time.time() - start
            log_time(f"  Clipboard changed after {elapsed:.3f}s ({checks} checks)")
            return new_value
        time.sleep(0.05)  # Check every 50ms
    
    elapsed = time.time() - start
    log_time(f"  WARNING: Clipboard timeout after {elapsed:.3f}s ({checks} checks)")
    return new_value

def copy_with_retry(operation_func, operation_name, max_attempts=3):
    """Retry an operation if it fails"""
    for attempt in range(max_attempts):
        start = time.time()
        result = operation_func()
        elapsed = time.time() - start
        
        if result and result.strip():
            log_time(f"{operation_name} succeeded in {elapsed:.3f}s (attempt {attempt + 1})")
            return result
        
        log_time(f"{operation_name} FAILED in {elapsed:.3f}s (attempt {attempt + 1})")
        time.sleep(0.2 * (attempt + 1))
    
    log_time(f"{operation_name} GAVE UP after {max_attempts} attempts")
    raise RuntimeError(f"{operation_name} failed after {max_attempts} attempts")

def copy_selected_text():
    """Copy selected text to clipboard."""
    old_clipboard = pyperclip.paste()
    
    start = time.time()
    pyautogui.hotkey('Esc')
    log_time(f"  Esc pressed ({time.time() - start:.3f}s)")
    
    time.sleep(0.1)
    
    start = time.time()
    pyautogui.hotkey('ctrl', 'c')
    log_time(f"  Ctrl+C pressed ({time.time() - start:.3f}s)")
    
    return wait_for_clipboard_change(old_clipboard)

def copy_current_url():
    """Copy the current URL from the browser."""
    old_clipboard = pyperclip.paste()
    
    start = time.time()
    pyautogui.hotkey('i')
    log_time(f"  'i' pressed ({time.time() - start:.3f}s)")
    time.sleep(0.05)
    
    start = time.time()
    pyautogui.hotkey('ctrl', 'l')
    log_time(f"  Ctrl+L pressed ({time.time() - start:.3f}s)")
    time.sleep(0.05)
    
    start = time.time()
    pyautogui.hotkey('ctrl', 'c')
    log_time(f"  Ctrl+C pressed ({time.time() - start:.3f}s)")
    
    url = wait_for_clipboard_change(old_clipboard)
    
    pyautogui.hotkey('F6')
    pyautogui.hotkey('Esc')
    
    return url.strip()

def format_quote(quote, url):
    """Format the quote and URL into a markdown string."""
    quote = quote.strip("\n")
    if '"' in quote:
        formatted_text = f"''' {quote} ''' -[source]({url})"
    else:
        formatted_text = f'"{quote}" -[source]({url})'

    pyperclip.copy(formatted_text)

def main():
    print(f"Logs located in {LOG_FILE}")
    script_start = time.time()
    log_time("========== SCRIPT START ==========")
    
    try:
        pyperclip.copy('')
        log_time("Clipboard cleared")
        
        selected_text = copy_with_retry(copy_selected_text, "Copy selected text")
        current_url = copy_with_retry(copy_current_url, "Copy URL")
        
        format_quote(selected_text, current_url)
        
        total_time = time.time() - script_start
        log_time(f"========== COMPLETE: {total_time:.3f}s ==========\n")
        
        print(f"Success! Total time: {total_time:.3f}s")
        
    except RuntimeError as e:
        total_time = time.time() - script_start
        log_time(f"========== FAILED: {total_time:.3f}s - {e} ==========\n")
        print(f"Error: {e}")
        return

if __name__ == '__main__':
    main()
