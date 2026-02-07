import tkinter as tk
from tkinter import ttk
import subprocess
import os
import ctypes

# ---------- CONFIG ----------
APP_TITLE = "Script Runner"
WINDOW_SIZE = "600x500"
SCRIPTS_DIR = "scripts"

BG_COLOR = "#1e1e1e"
FG_COLOR = "#ffffff"
BTN_COLOR = "#2d2d2d"
BTN_HOVER = "#3a3a3a"
SUBTEXT = "#aaaaaa"
# ----------------------------


'''def run_script(script_path):
    subprocess.Popen(
        ["cmd.exe", "/c", script_path],
        creationflags=subprocess.CREATE_NEW_CONSOLE
    )
'''

def run_script(script_path):
    if not os.path.isfile(script_path):
        raise FileNotFoundError(script_path)

    ctypes.windll.shell32.ShellExecuteW(
        None,
        "runas",         
        "cmd.exe",        
        f'/c "{script_path}"',
        None,
        1
    )


# ---------- JANELA ----------
root = tk.Tk()
root.title(APP_TITLE)
root.geometry(WINDOW_SIZE)
root.configure(bg=BG_COLOR)

# ---------- HEADER ----------
header = tk.Frame(root, bg=BG_COLOR)
header.pack(fill="x", padx=10, pady=10)

title_label = tk.Label(
    header,
    text=APP_TITLE,
    fg=FG_COLOR,
    bg=BG_COLOR,
    font=("Segoe UI", 14, "bold")
)
title_label.pack(anchor="w")

subtitle_label = tk.Label(
    header,
    text="Selecione uma categoria",
    fg=SUBTEXT,
    bg=BG_COLOR,
    font=("Segoe UI", 9)
)
subtitle_label.pack(anchor="w")

# ---------- ÁREA ROLÁVEL ----------
container = tk.Frame(root, bg=BG_COLOR)
container.pack(fill="both", expand=True, padx=10, pady=(0, 10))

canvas = tk.Canvas(container, bg=BG_COLOR, highlightthickness=0)
canvas.pack(side="left", fill="both", expand=True)

scrollbar = ttk.Scrollbar(container, orient="vertical", command=canvas.yview)
scrollbar.pack(side="right", fill="y")

canvas.configure(yscrollcommand=scrollbar.set)

content_frame = tk.Frame(canvas, bg=BG_COLOR)
canvas.create_window((0, 0), window=content_frame, anchor="nw")


def update_scroll(_=None):
    canvas.configure(scrollregion=canvas.bbox("all"))


content_frame.bind("<Configure>", update_scroll)


def clear_content():
    for widget in content_frame.winfo_children():
        widget.destroy()


def _on_mousewheel(event):
    canvas.yview_scroll(int(-1 * (event.delta / 120)), "units")


canvas.bind_all("<MouseWheel>", _on_mousewheel)

# ---------- TELAS ----------
def show_categories():
    clear_content()
    subtitle_label.config(text="Selecione uma categoria")

    if not os.path.exists(SCRIPTS_DIR):
        os.makedirs(SCRIPTS_DIR)

    for folder in sorted(os.listdir(SCRIPTS_DIR)):
        path = os.path.join(SCRIPTS_DIR, folder)
        if os.path.isdir(path):
            btn = tk.Button(
                content_frame,
                text=folder,
                anchor="w",
                command=lambda p=path, n=folder: show_scripts(p, n),
                bg=BTN_COLOR,
                fg=FG_COLOR,
                activebackground=BTN_HOVER,
                activeforeground=FG_COLOR,
                relief="flat",
                padx=10,
                pady=10
            )
            btn.pack(fill="x", pady=4)


def show_scripts(category_path, category_name):
    clear_content()
    subtitle_label.config(text=f"Categoria: {category_name}")

    back_btn = tk.Button(
        content_frame,
        text="← Voltar",
        anchor="w",
        command=show_categories,
        bg="#252525",
        fg=FG_COLOR,
        activebackground=BTN_HOVER,
        activeforeground=FG_COLOR,
        relief="flat",
        padx=10,
        pady=8
    )
    back_btn.pack(fill="x", pady=(0, 10))

    for file in sorted(os.listdir(category_path)):
        if file.lower().endswith(".bat"):
            path = os.path.join(category_path, file)

            btn = tk.Button(
                content_frame,
                text=file.replace(".bat", ""),
                anchor="w",
                command=lambda p=path: run_script(p),
                bg=BTN_COLOR,
                fg=FG_COLOR,
                activebackground=BTN_HOVER,
                activeforeground=FG_COLOR,
                relief="flat",
                padx=10,
                pady=8
            )
            btn.pack(fill="x", pady=4)


# ---------- START ----------
show_categories()
root.mainloop()
