# 🎧 Rhythmbox AutoPause

Este repositório contém um script bash que **pausa automaticamente o Rhythmbox** quando outro áudio começa a tocar (por exemplo, no navegador) e **retoma automaticamente** quando o outro áudio para.

Funciona perfeitamente com sistemas que utilizam **PipeWire** (como Arch Linux, Fedora etc).

---

## 🚀 Como funciona?

O script monitora os streams de áudio via `pactl list sink-inputs`, detecta quando algum áudio **não vindo do Rhythmbox** está tocando e então pausa o Rhythmbox com `playerctl`. Quando esses outros áudios param, o script retoma a reprodução do Rhythmbox.

### ✅ Exemplo:

- Você está ouvindo música no Rhythmbox 🎵  
- Abre um vídeo no YouTube ou aula da Udemy 📺  
- O Rhythmbox **pausa automaticamente**  
- Quando o vídeo termina ou é pausado, o Rhythmbox **volta a tocar automaticamente**

---

## 📦 Dependências

Certifique-se de ter os seguintes pacotes instalados:

| Pacote            | Finalidade                          |
|-------------------|--------------------------------------|
| `playerctl`       | Controlar players como Rhythmbox     |
| `pipewire`        | Gerenciamento de áudio moderno       |
| `pipewire-pulse`  | Compatibilidade com PulseAudio       |
| `bash`            | Interpretação do script `.bash`      |
| `pactl` (via `pipewire`) | Controle de streams de áudio |

### Como instalar (Arch Linux/Manjaro):

* Dependências:

```bash
sudo pacman -S playerctl pipewire pipewire-pulse
```

* Clone este repositório:

> git clone https://github.com/seu-usuario/rhythmbox-autopause.git
> cd rhythmbox-autopause

* Torne o script executável:

chmod +x rhythmboxAutoPause.bash

* Execute o script:

> `./rhythmboxAutoPause.bash`

## ⚙️ Iniciar automaticamente com o sistema (opcional)

Você pode configurar o script para iniciar junto com o sistema usando um atalho .desktop.

1. Crie o arquivo:

> mkdir -p ~/.config/autostart
> nano ~/.config/autostart/rhythmbox-autopause.desktop

2. Cole o seguinte conteúdo:

```
[Desktop Entry]
Name=Rhythmbox AutoPause
Exec=<path>/rhythmboxAutoPause.bash
Type=Application
X-GNOME-Autostart-enabled=true
```

Substitua `<path>` pelo caminho completo onde o script está salvo.

