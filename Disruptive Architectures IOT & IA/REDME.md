# MottuFlow - Sistema de Visão Computacional

Este projeto utiliza visão computacional para detectar motocicletas e marcadores ArUco em tempo real. O sistema é capaz de processar feeds de vídeo de uma webcam, arquivos de vídeo ou imagens estáticas, exibindo as detecções em uma única janela.

## Link do Pitch e GitHub

- 🎥 **Pitch do Projeto:** [https://youtu.be/JqlE4Jymae8](https://youtu.be/JqlE4Jymae8)
- 💻 **Repositório GitHub:** [https://github.com/LucasLDC/MottuFlow](https://github.com/LucasLDC/MottuFlow)

## Funcionalidades Principais

- **Detecção de Motocicletas:** Utiliza o modelo YOLOv8n pré-treinado para identificar e desenhar caixas delimitadoras ao redor de motocicletas com alta precisão.
- **Detecção de Marcadores ArUco:** Identifica marcadores do dicionário `DICT_6X6_250`, desenha seus contornos e estima a distância em metros da câmera até cada marcador.
- **Fonte de Mídia Flexível:** O sistema pode processar diferentes fontes de mídia:
  - Webcam ao vivo.
  - Arquivos de vídeo (ex: `.mp4`).
  - Imagens estáticas (ex: `.jpg`, `.png`).
- **Interface Interativa:** Apresenta um menu simples no console para que o usuário possa iniciar a detecção ou encerrar o programa de forma controlada.
- **Saída Visual Unificada:** Exibe um único feed de vídeo com todas as detecções (motocicletas e marcadores ArUco) sobrepostas, facilitando a visualização e análise em tempo real.

## Pré-requisitos

Para executar este projeto, você precisará ter o Python 3.8+ instalado, juntamente com as seguintes bibliotecas:

- **OpenCV (contrib):** Essencial para o processamento de imagem e a detecção de marcadores ArUco.
- **Ultralytics:** Framework que fornece o modelo de detecção de objetos YOLOv8.
- **NumPy:** Utilizada para operações numéricas, especialmente no cálculo de distância dos marcadores.

## Instalação

Você pode instalar todas as dependências necessárias com um único comando no seu terminal:

```bash
pip install opencv-python-contrib ultralytics numpy
```

**Nota Importante:** Na primeira vez que o script for executado, a biblioteca `ultralytics` fará o download automático do modelo `yolov8n.pt`. Uma conexão com a internet é necessária para este passo inicial.

## Como Usar

1.  Clone ou baixe este repositório para a sua máquina local.
2.  Abra o arquivo de script principal (ex: `projeto.py`) em um editor de código.
3.  Configure a fonte de mídia: No início do script, localize e altere a variável `SOURCE_PATH` para a fonte desejada:
    - Para usar a webcam, defina: `SOURCE_PATH = 0`
    - Para usar um arquivo de vídeo, defina: `SOURCE_PATH = 'caminho/para/seu/video.mp4'`
    - Para usar uma imagem, defina: `SOURCE_PATH = 'caminho/para/sua/imagem.jpg'`
4.  Execute o script a partir do seu terminal:
    ```bash
    python seu_script.py
    ```
5.  Interaja com o menu no console. Digite `1` e pressione `Enter` para iniciar a detecção.
6.  Uma janela de vídeo será aberta, exibindo o feed com as detecções. Para parar a detecção e fechar a janela, pressione a tecla `q`.

## Saída Esperada

Ao iniciar a detecção, uma janela de vídeo será exibida com as seguintes informações visuais:

- Caixas em **azul ciano** serão desenhadas ao redor de cada motocicleta detectada, acompanhadas pelo rótulo "Motorcycle" e a pontuação de confiança da detecção.
- Contornos em **azul ciano** serão desenhados ao redor de cada marcador ArUco encontrado.
- Acima de cada marcador ArUco, serão exibidos seu **ID** e a **distância estimada em metros** (ex: `Dist: 0.75 m`).
- No console, mensagens informativas serão impressas para cada marcador ArUco detectado, confirmando seu ID e a distância calculada.

## 👨‍💻 Integrantes do Grupo

| Nome Completo                           | RM       | Turma     |
| --------------------------------------- | -------- | --------- |
| João Gabriel Boaventura Marques e Silva | RM554874 | 2TDSB2025 |
| Léo Mota Lima                           | RM557851 | 2TDSB2025 |
| Lucas Leal das Chagas                   | RM551124 | 2TDSB2025 |