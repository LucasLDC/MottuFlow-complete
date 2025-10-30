# 🎬 Roteiro de Vídeo - MottuFlow
## Apresentação do Projeto (2min 30s)

---

## 👥 Distribuição dos Apresentadores

| Apresentador | Nome | Tempo | Tema |
|--------------|------|-------|------|
| **Apresentador 1** | Lucas Leal das Chagas | 50s | Introdução e Visão Geral do Projeto |
| **Apresentador 2** | João Gabriel Boaventura | 50s | Arquitetura e Tecnologias |
| **Apresentador 3** | Léo Mota Lima | 50s | Demonstração e Diferenciais |

---

## 🎤 APRESENTADOR 1 - Lucas Leal das Chagas (0:00 - 0:50)
### Tema: Introdução e Visão Geral do Projeto

**[TEMPO: 50 segundos]**

---

**[0:00 - 0:10] Abertura e Apresentação**
> "Olá! Somos a equipe MottuFlow: Lucas, João Gabriel e Léo, da turma 2TDSB2025. Hoje vamos apresentar nossa solução completa para gerenciamento inteligente de frotas de motocicletas."

**[0:10 - 0:25] Problema e Solução**
> "O MottuFlow foi criado para resolver um desafio real: otimizar o controle de entrada e saída de motos em pátios da Mottu, reduzindo tempo de operação e aumentando a precisão do rastreamento. Nossa solução integra três tecnologias principais trabalhando em conjunto."

**[0:25 - 0:40] Componentes do Sistema**
> "O sistema é composto por um backend robusto em .NET 8 com banco Oracle, um aplicativo mobile multiplataforma desenvolvido em React Native com Expo, e um sistema IoT de visão computacional em Python que detecta automaticamente motos e marcadores ArUco em tempo real."

**[0:40 - 0:50] Transição**
> "Para explicar melhor como tudo isso funciona, passo a palavra para o João Gabriel, que vai detalhar nossa arquitetura e as tecnologias utilizadas."

---

## 🎤 APRESENTADOR 2 - João Gabriel Boaventura (0:50 - 1:40)
### Tema: Arquitetura e Tecnologias

**[TEMPO: 50 segundos]**

---

**[0:50 - 1:05] Arquitetura em Camadas**
> "Obrigado, Lucas! Nossa arquitetura segue o padrão de camadas para garantir manutenibilidade e escalabilidade. O backend em .NET possui Controllers para receber requisições, Services com regras de negócio, Repositories para acesso a dados, e um DbContext que gerencia o Oracle Database."

**[1:05 - 1:20] Fluxo de Dados**
> "O fluxo funciona assim: as câmeras Python detectam as motos e seus marcadores ArUco, enviando esses dados via HTTP POST para nossa API. O backend valida e persiste no Oracle. Simultaneamente, o app mobile consulta essas informações em tempo real através de endpoints REST."

**[1:20 - 1:35] Tecnologias Principais**
> "Utilizamos YOLOv8 para detecção de objetos, marcadores ArUco para identificação única de veículos, Entity Framework Core como ORM, e implementamos HATEOAS para tornar nossa API autodescritiva. Tudo documentado automaticamente com Swagger."

**[1:35 - 1:40] Transição**
> "Agora, o Léo vai demonstrar o sistema funcionando e apresentar nossos diferenciais."

---

## 🎤 APRESENTADOR 3 - Léo Mota Lima (1:40 - 2:30)
### Tema: Demonstração e Diferenciais

**[TEMPO: 50 segundos]**

---

**[1:40 - 1:55] Demonstração Prática**
> "Obrigado, João! Aqui temos o sistema em operação. [MOSTRA TELA] A câmera detecta a moto e o marcador ArUco automaticamente, calcula a distância, e envia para o backend. No app mobile, podemos escanear QR Codes ArUco, visualizar todas as tags cadastradas e acompanhar o status em tempo real."

**[1:55 - 2:10] Diferenciais e Otimizações**
> "Nossos principais diferenciais incluem: visão computacional com IA para detecção automática, API REST seguindo padrões HATEOAS, autenticação JWT com refresh tokens automáticos, e otimizações como Connection Pool, compressão GZIP que reduz dados em 65%, e batch processing para operações em lote."

**[2:10 - 2:25] Resultados e Impacto**
> "Com o MottuFlow, conseguimos automatizar 100% da identificação de veículos, reduzir erros humanos, manter auditoria completa de todas operações, e fornecer dados em tempo real para tomada de decisões. Tudo isso com segurança, escalabilidade e performance."

**[2:25 - 2:30] Encerramento**
> "Obrigado pela atenção! Estamos à disposição para perguntas."

---

## 📋 Orientações Gerais de Gravação

### ✅ Antes de Gravar
- [ ] Testar microfone e áudio
- [ ] Preparar telas de demonstração
- [ ] Ensaiar cada parte individualmente
- [ ] Verificar iluminação e enquadramento
- [ ] Ter cronômetro visível

### 🎬 Durante a Gravação
- **Postura**: Natural e confiante
- **Tom de voz**: Claro e entusiasta
- **Ritmo**: Nem rápido demais, nem lento
- **Olhar**: Diretamente para a câmera
- **Gestos**: Moderados para enfatizar pontos importantes

### 🖥️ Telas para Demonstração

**Apresentador 1 (Lucas):**
- Slide com logo MottuFlow
- Diagrama de arquitetura geral

**Apresentador 2 (João Gabriel):**
- Diagrama de fluxo de dados
- Print do Swagger mostrando endpoints
- Diagrama de camadas

**Apresentador 3 (Léo):**
- Vídeo da câmera detectando moto + ArUco
- App mobile em funcionamento
- Dashboard com métricas (se tiver)

---

## ⏱️ Controle de Tempo

| Apresentador | Início | Fim | Duração | Checkpoint |
|--------------|--------|-----|---------|------------|
| Lucas | 0:00 | 0:50 | 50s | "passo a palavra" |
| João Gabriel | 0:50 | 1:40 | 50s | "Léo vai demonstrar" |
| Léo | 1:40 | 2:30 | 50s | "Obrigado pela atenção" |

---

## 🎯 Palavras-Chave a Mencionar

### Apresentador 1 (Lucas)
✅ MottuFlow  
✅ Gerenciamento de frotas  
✅ Backend .NET 8  
✅ Mobile React Native  
✅ IoT Python  
✅ Visão computacional  

### Apresentador 2 (João Gabriel)
✅ Arquitetura em camadas  
✅ Oracle Database  
✅ YOLOv8  
✅ ArUco Tags  
✅ HATEOAS  
✅ Swagger  

### Apresentador 3 (Léo)
✅ Tempo real  
✅ Autenticação JWT  
✅ Connection Pool  
✅ GZIP  
✅ Automação  
✅ Auditoria  

---

## 💡 Dicas Extras

### Para um Vídeo Profissional:

1. **Introdução Visual (5s antes de falar)**
   - Logo MottuFlow animado
   - Texto: "Sistema de Gerenciamento de Frotas - Sprint 3"

2. **Transições entre Apresentadores**
   - Fade suave (0.5s)
   - Opcional: Nome do apresentador em lower third

3. **Trilha Sonora**
   - Background music leve e profissional
   - Volume: 10-15% para não atrapalhar a fala

4. **Legendas**
   - Adicionar legendas para acessibilidade
   - Destacar palavras-chave em negrito

5. **Call to Action Final**
   - QR Code do GitHub
   - Email de contato
   - "Obrigado!" em tela cheia

---

## 📝 Checklist Final

- [ ] Cada apresentador gravou sua parte completa
- [ ] Áudio está claro e sem ruídos
- [ ] Vídeo tem boa iluminação
- [ ] Demonstrações estão funcionando
- [ ] Tempo total está entre 2:20 - 2:30
- [ ] Transições estão suaves
- [ ] Música de fundo está balanceada
- [ ] Legendas foram adicionadas
- [ ] Qualidade final: 1080p mínimo

---

## 🎥 Formato de Entrega

- **Resolução**: 1920x1080 (Full HD)
- **FPS**: 30 ou 60
- **Formato**: MP4 (H.264)
- **Áudio**: AAC 320kbps
- **Duração**: 2:30 ± 5s

---

<div align="center">
  <p><strong>Boa sorte na gravação! 🎬</strong></p>
  <p>Equipe MottuFlow - 2TDSB2025</p>
</div>
