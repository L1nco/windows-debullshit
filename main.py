import tkinter as tk
from tkinter import ttk
from PIL import Image, ImageTk
import subprocess
import os
import ctypes

# ---------- CONFIG ----------
APP_TITLE = "Windows Debloat"
WINDOW_SIZE = "660x540"
SCRIPTS_DIR = "scripts"

BG_COLOR      = "#1a1a1a"
BG_SECONDARY  = "#242424"
BG_CARD       = "#2a2a2a"
BTN_HOVER     = "#353535"
BTN_ACTIVE    = "#404040"
FG_COLOR      = "#f0f0f0"
FG_SUBTEXT    = "#888888"
FG_ACCENT     = "#4fc3f7"
FG_SUCCESS    = "#81c784"
FG_WARNING    = "#ffb74d"
FG_DANGER     = "#e57373"
BORDER_COLOR  = "#333333"

CATEGORY_ICONS = {
    "Serviços":              "⚙️",
    "Desempenho":            "⚡",
    "Telemetria e propaganda": "🛡️",
    "Aparência":             "🎨",
    "Privacidade":           "🔒",
    "default":               "📁",
}
# ----------------------------


def run_script(script_path):
    if not os.path.isfile(script_path):
        show_toast(f"Arquivo não encontrado:\n{script_path}", error=True)
        return
    try:
        ctypes.windll.shell32.ShellExecuteW(
            None, "runas", "cmd.exe",
            f'/c "{script_path}"',
            None, 1
        )
        name = os.path.basename(script_path).replace(".bat", "")
        show_toast(f"Executando: {name}")
    except Exception as e:
        show_toast(str(e), error=True)


# ---------- JANELA ----------
root = tk.Tk()
root.title(APP_TITLE)
root.geometry(WINDOW_SIZE)
root.configure(bg=BG_COLOR)
root.resizable(True, True)
root.minsize(500, 400)

# Tenta carregar ícone da janela
try:
    icon_img = Image.open("assets/logo.png").resize((32, 32))
    icon_photo = ImageTk.PhotoImage(icon_img)
    root.iconphoto(True, icon_photo)
except Exception:
    pass

# ---------- HEADER ----------
header = tk.Frame(root, bg=BG_SECONDARY, pady=12)
header.pack(fill="x")

# Linha decorativa no topo
tk.Frame(root, bg=FG_ACCENT, height=2).pack(fill="x")
header.pack(fill="x")

header_inner = tk.Frame(header, bg=BG_SECONDARY)
header_inner.pack(fill="x", padx=18)

# Logo
logo_label = None
try:
    logo_raw = Image.open("assets/logo.png").resize((40, 40), Image.LANCZOS)
    logo_photo = ImageTk.PhotoImage(logo_raw)
    logo_label = tk.Label(header_inner, image=logo_photo, bg=BG_SECONDARY)
    logo_label.image = logo_photo
    logo_label.pack(side="left", padx=(0, 12))
except Exception:
    pass

title_frame = tk.Frame(header_inner, bg=BG_SECONDARY)
title_frame.pack(side="left", fill="y")

tk.Label(
    title_frame, text=APP_TITLE,
    fg=FG_COLOR, bg=BG_SECONDARY,
    font=("Segoe UI", 15, "bold")
).pack(anchor="w")

subtitle_label = tk.Label(
    title_frame, text="Selecione uma categoria",
    fg=FG_SUBTEXT, bg=BG_SECONDARY,
    font=("Segoe UI", 9)
)
subtitle_label.pack(anchor="w")

# ---------- BREADCRUMB ----------
breadcrumb_frame = tk.Frame(root, bg=BG_COLOR, pady=6)
breadcrumb_frame.pack(fill="x", padx=18)

breadcrumb_label = tk.Label(
    breadcrumb_frame, text="🏠  Início",
    fg=FG_ACCENT, bg=BG_COLOR,
    font=("Segoe UI", 9)
)
breadcrumb_label.pack(anchor="w")

# ---------- ÁREA ROLÁVEL ----------
container = tk.Frame(root, bg=BG_COLOR)
container.pack(fill="both", expand=True, padx=14, pady=(0, 6))

canvas = tk.Canvas(container, bg=BG_COLOR, highlightthickness=0)
canvas.pack(side="left", fill="both", expand=True)

style = ttk.Style()
style.theme_use("clam")
style.configure(
    "Dark.Vertical.TScrollbar",
    background=BG_CARD,
    troughcolor=BG_COLOR,
    bordercolor=BG_COLOR,
    arrowcolor=FG_SUBTEXT,
    relief="flat"
)

scrollbar = ttk.Scrollbar(container, orient="vertical", command=canvas.yview, style="Dark.Vertical.TScrollbar")
scrollbar.pack(side="right", fill="y")

canvas.configure(yscrollcommand=scrollbar.set)

content_frame = tk.Frame(canvas, bg=BG_COLOR)
canvas_window = canvas.create_window((0, 0), window=content_frame, anchor="nw")


def update_scroll(_=None):
    canvas.configure(scrollregion=canvas.bbox("all"))


def resize_canvas(event):
    canvas.itemconfig(canvas_window, width=event.width)


content_frame.bind("<Configure>", update_scroll)
canvas.bind("<Configure>", resize_canvas)


def _on_mousewheel(event):
    canvas.yview_scroll(int(-1 * (event.delta / 120)), "units")


canvas.bind_all("<MouseWheel>", _on_mousewheel)


def clear_content():
    for widget in content_frame.winfo_children():
        widget.destroy()


# ---------- TOAST ----------
_toast_job = None

def show_toast(message, error=False):
    global _toast_job
    color = FG_DANGER if error else FG_SUCCESS
    icon  = "✗" if error else "✓"
    toast_label.config(text=f"  {icon}  {message}  ", fg=color)
    if _toast_job:
        root.after_cancel(_toast_job)
    _toast_job = root.after(3500, lambda: toast_label.config(text=""))


# ---------- STATUS BAR ----------
status_bar = tk.Frame(root, bg=BG_SECONDARY, pady=5)
status_bar.pack(fill="x", side="bottom")

toast_label = tk.Label(
    status_bar, text="",
    fg=FG_SUCCESS, bg=BG_SECONDARY,
    font=("Segoe UI", 9), anchor="w"
)
toast_label.pack(side="left", padx=10)

tk.Label(
    status_bar, text="Windows Debloat  •  github",
    fg=FG_SUBTEXT, bg=BG_SECONDARY,
    font=("Segoe UI", 8)
).pack(side="right", padx=10)


# ---------- BOTÃO HELPER ----------
def make_button(parent, text, command, icon="", description="", tag_color=None):
    outer = tk.Frame(parent, bg=BG_CARD, pady=0)
    outer.pack(fill="x", pady=3)

    inner = tk.Frame(outer, bg=BG_CARD, padx=12, pady=10)
    inner.pack(fill="x")

    left = tk.Frame(inner, bg=BG_CARD)
    left.pack(side="left", fill="both", expand=True)

    label_text = f"{icon}  {text}" if icon else text
    lbl = tk.Label(left, text=label_text, fg=FG_COLOR, bg=BG_CARD,
                   font=("Segoe UI", 10), anchor="w")
    lbl.pack(anchor="w")

    if description:
        desc = tk.Label(left, text=description, fg=FG_SUBTEXT, bg=BG_CARD,
                        font=("Segoe UI", 8), anchor="w")
        desc.pack(anchor="w")

    if tag_color:
        tag = tk.Frame(inner, bg=tag_color, width=4)
        tag.pack(side="right", fill="y", padx=(8, 0))

    widgets = [outer, inner, left, lbl]
    if description:
        widgets.append(desc)

    def on_enter(_):
        for w in widgets:
            w.config(bg=BTN_HOVER)
        lbl.config(bg=BTN_HOVER)
        if description:
            desc.config(bg=BTN_HOVER)
        outer.config(cursor="hand2")

    def on_leave(_):
        for w in widgets:
            w.config(bg=BG_CARD)
        lbl.config(bg=BG_CARD)
        if description:
            desc.config(bg=BG_CARD)

    def on_click(_):
        for w in widgets:
            w.config(bg=BTN_ACTIVE)
        root.after(120, lambda: on_leave(None))
        command()

    for w in [outer, inner, left, lbl] + ([desc] if description else []):
        w.bind("<Enter>", on_enter)
        w.bind("<Leave>", on_leave)
        w.bind("<Button-1>", on_click)

    return outer


# ---------- TELAS ----------
def show_categories():
    clear_content()
    subtitle_label.config(text="Selecione uma categoria")
    breadcrumb_label.config(text="🏠  Início")

    if not os.path.exists(SCRIPTS_DIR):
        os.makedirs(SCRIPTS_DIR)

    folders = [f for f in sorted(os.listdir(SCRIPTS_DIR))
               if os.path.isdir(os.path.join(SCRIPTS_DIR, f))]

    if not folders:
        tk.Label(content_frame, text="Nenhuma categoria encontrada.",
                 fg=FG_SUBTEXT, bg=BG_COLOR, font=("Segoe UI", 10)).pack(pady=20)
        return

    for folder in folders:
        path = os.path.join(SCRIPTS_DIR, folder)
        icon = CATEGORY_ICONS.get(folder, CATEGORY_ICONS["default"])
        count = len([f for f in os.listdir(path) if f.lower().endswith(".bat")])
        desc = f"{count} script{'s' if count != 1 else ''} disponível{'is' if count != 1 else ''}"
        make_button(
            content_frame,
            text=folder,
            command=lambda p=path, n=folder: show_scripts(p, n),
            icon=icon,
            description=desc,
            tag_color=FG_ACCENT
        )


def show_scripts(category_path, category_name):
    clear_content()
    subtitle_label.config(text=f"Categoria: {category_name}")
    icon = CATEGORY_ICONS.get(category_name, CATEGORY_ICONS["default"])
    breadcrumb_label.config(text=f"🏠  Início  ›  {icon} {category_name}")

    # Botão voltar
    back_outer = tk.Frame(content_frame, bg=BG_COLOR)
    back_outer.pack(fill="x", pady=(0, 8))

    back_btn = tk.Label(
        back_outer, text="← Voltar para categorias",
        fg=FG_ACCENT, bg=BG_COLOR,
        font=("Segoe UI", 9), cursor="hand2"
    )
    back_btn.pack(anchor="w")

    def go_back(_=None):
        show_categories()

    back_btn.bind("<Button-1>", go_back)
    back_btn.bind("<Enter>", lambda _: back_btn.config(fg=FG_COLOR))
    back_btn.bind("<Leave>", lambda _: back_btn.config(fg=FG_ACCENT))

    # Separador
    tk.Frame(content_frame, bg=BORDER_COLOR, height=1).pack(fill="x", pady=(0, 8))

    files = [f for f in sorted(os.listdir(category_path)) if f.lower().endswith(".bat")]

    if not files:
        tk.Label(content_frame, text="Nenhum script encontrado nesta categoria.",
                 fg=FG_SUBTEXT, bg=BG_COLOR, font=("Segoe UI", 10)).pack(pady=20)
        return

    for file in files:
        path = os.path.join(category_path, file)
        name = file.replace(".bat", "")
        make_button(
            content_frame,
            text=name,
            command=lambda p=path: run_script(p),
            icon="▶",
            tag_color=FG_WARNING
        )


# ---------- START ----------
show_categories()
root.mainloop()
