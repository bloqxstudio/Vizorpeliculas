# VIZOR Design System
## Películas Protetoras — v1.0

> Documento de referência para design e desenvolvimento do site vizor.com.br.  
> Todas as decisões visuais, tipográficas, de componentes e tokens estão documentadas aqui.

---

## Índice

1. [Princípios de Design](#1-princípios-de-design)
2. [Paleta de Cores](#2-paleta-de-cores)
3. [Tipografia](#3-tipografia)
4. [Espaçamento e Grid](#4-espaçamento-e-grid)
5. [Border Radius e Sombras](#5-border-radius-e-sombras)
6. [Iconografia](#6-iconografia)
7. [Componentes — Botões](#7-componentes--botões)
8. [Componentes — Badges e Labels](#8-componentes--badges-e-labels)
9. [Componentes — Cards de Produto](#9-componentes--cards-de-produto)
10. [Componentes — Product Finder](#10-componentes--product-finder)
11. [Componentes — Navegação](#11-componentes--navegação)
12. [Componentes — Section Header](#12-componentes--section-header)
13. [Padrões de Layout](#13-padrões-de-layout)
14. [Modo Escuro e Claro](#14-modo-escuro-e-claro)
15. [Tokens CSS — Referência Completa](#15-tokens-css--referência-completa)
16. [Diretrizes de Voz e Tom](#16-diretrizes-de-voz-e-tom)
17. [Checklist de Consistência](#17-checklist-de-consistência)

---

## 1. Princípios de Design

Estes são os 6 princípios inegociáveis que guiam cada decisão visual da Vizor.

### 1.1 Fabricante, não loja
Toda linguagem visual e textual comunica que a Vizor **fabrica** o produto. Fotos de fábrica, maquinário, processos e certificações são ativos de marca — não apenas conteúdo de "sobre nós".

### 1.2 Paixão visível
O site deve sentir como um motociclista entusiasta criou. Energia, movimento e velocidade devem estar presentes nas escolhas tipográficas, nos ângulos das fotos e na intensidade da paleta azul.

### 1.3 Catálogo inteligente
O buscador de compatibilidade (Marca → Modelo → Ano) é mais importante que qualquer banner ou promoção. A primeira pergunta do usuário é sempre: **"serve pra minha moto?"** — responder isso rápido é o KPI principal de UX.

### 1.4 Mobile primeiro
Mais de 70% do tráfego virá de celular. Todo componente é desenhado para mobile e adaptado para desktop — nunca o contrário.

### 1.5 Confiança técnica
Especificações, materiais, SGQ (Sistema de Gestão da Qualidade) e a origem nacional devem aparecer com naturalidade ao longo do site, não apenas em uma página de "sobre". Confiança se constrói por acumulação.

### 1.6 Blue is the brand
A paleta azul da Vizor é um ativo diferencial. Usada com consistência e coragem, cria reconhecimento instantâneo. Nunca diluir ou trocar por azuis genéricos.

---

## 2. Paleta de Cores

### 2.1 Vizor Blue — Paleta Principal

A identidade cromática da marca. Baseada no azul do catálogo físico, refinada em 10 stops para uso digital.

| Token | Nome | Hex | Uso Principal |
|-------|------|-----|---------------|
| `--vz-900` | Deep Navy | `#021A2D` | Background máximo escuro |
| `--vz-800` | Dark Navy | `#0A2E4A` | Navbar, hero bg, seções escuras |
| `--vz-700` | Brand Dark | `#0D3E63` | Headings em fundo claro, display type |
| `--vz-600` | **Brand Primary ★** | `#1A5C8A` | Botão primário, links, destaques |
| `--vz-500` | Brand Mid | `#2172A8` | Hover states, ícones ativos |
| `--vz-400` | Brand Light | `#2E8BC7` | Overlines, códigos, accent |
| `--vz-300` | Sky | `#5BAEE0` | Texto em fundos escuros, hero accent |
| `--vz-200` | Light Sky | `#93CDF0` | Subtexto em fundos escuros |
| `--vz-100` | Pale Blue | `#C6E6F8` | Badge brilho bg, elementos sutis |
| `--vz-50`  | Ice | `#EAF5FC` | Backgrounds de seções claras |

> **Regra de ouro:** `vz-600` é a cor da marca. Sempre que precisar de "a cor da Vizor", use `vz-600`.

### 2.2 Steel Gray — Neutros

Grays com leve tom azulado para manter coerência com a paleta principal. Evitar cinzas puros que parecem desconectados da marca.

| Token | Hex | Uso |
|-------|-----|-----|
| `--vz-gray-900` | `#1C2730` | Texto principal em fundos claros |
| `--vz-gray-700` | `#3A4B57` | Texto secundário, labels |
| `--vz-gray-500` | `#6B7E8C` | Placeholder, metadados |
| `--vz-gray-300` | `#B8C4CC` | Bordas, divisores |
| `--vz-gray-100` | `#EDF0F2` | Backgrounds alternativos |
| `--vz-off-white` | `#F5F7F9` | Page background padrão |

### 2.3 Cores Semânticas

| Situação | Hex | Uso |
|----------|-----|-----|
| Sucesso / Novo | `#E6F9F0` bg · `#0A5C35` text | Badge "Novo 2025", confirmações |
| Atenção | `#FFF8E6` bg · `#7A5000` text | Alertas de compatibilidade |
| Erro | `#FEF0F0` bg · `#8B1A1A` text | Erro no buscador |

### 2.4 Contraste e Acessibilidade

Combinações aprovadas (WCAG AA mínimo):

| Texto | Fundo | Ratio | Status |
|-------|-------|-------|--------|
| `#FFFFFF` | `vz-600` (#1A5C8A) | 4.8:1 | ✅ AA |
| `#FFFFFF` | `vz-800` (#0A2E4A) | 9.2:1 | ✅ AAA |
| `vz-700` (#0D3E63) | `vz-50` (#EAF5FC) | 6.1:1 | ✅ AA |
| `vz-600` (#1A5C8A) | `#FFFFFF` | 4.8:1 | ✅ AA |
| `vz-800` (#0A2E4A) | `#FFFFFF` | 9.2:1 | ✅ AAA |

> **Proibido:** texto `vz-300` ou mais claro em fundo branco — não passa no contraste mínimo.

---

## 3. Tipografia

### 3.1 Stack de Fontes

Três fontes com papéis bem definidos. Nunca misturar fora desses papéis.

```css
--font-display: 'Barlow Condensed', sans-serif;
--font-body:    'Barlow', sans-serif;
--font-mono:    'JetBrains Mono', monospace;
```

**Import Google Fonts:**
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;900&family=Barlow:wght@400;500;600&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
```

### 3.2 Barlow Condensed — Display

Usada exclusivamente para headlines de impacto, logo, hero e títulos de seção principais. Comunica velocidade, força e identidade industrial.

| Variante | Peso | Tamanho | Line-height | Uso |
|----------|------|---------|-------------|-----|
| Display XL | 900 | 52–72px | 0.95 | Hero headline, logo grande |
| Display L | 900 | 42–52px | 1.0 | Hero mobile, títulos de página |
| Display M | 700 | 32–36px | 1.1 | Títulos de seção |
| Display S | 700 | 24–28px | 1.15 | Títulos de cards grandes, seções |

```css
/* Display XL */
font-family: var(--font-display);
font-weight: 900;
font-size: 52px;
line-height: 0.95;
letter-spacing: -0.01em;
color: var(--vz-700);

/* Display M */
font-family: var(--font-display);
font-weight: 700;
font-size: 32px;
line-height: 1.1;
color: var(--vz-700);
```

**Exemplo de uso:**
```
PROTEÇÃO
COM PROPÓSITO
```

### 3.3 Barlow — Body

Usada para todo texto funcional: parágrafos, botões, navegação, labels de formulário, descrições de produto.

| Variante | Peso | Tamanho | Line-height | Uso |
|----------|------|---------|-------------|-----|
| Heading | 600 | 22px | 1.25 | H2 de seção em corpo de página |
| Subheading | 500 | 16–18px | 1.3 | Subtítulos, labels importantes |
| Body | 400 | 15px | 1.7 | Parágrafos, descrições |
| Small | 400 | 13px | 1.5 | Captions, notas, metadados |
| Button | 600 | 14px | 1 | Texto de botões |
| Nav | 500 | 13–14px | 1 | Links de navegação |

```css
/* Body padrão */
font-family: var(--font-body);
font-weight: 400;
font-size: 15px;
line-height: 1.7;
color: var(--vz-gray-900);

/* Button */
font-family: var(--font-body);
font-weight: 600;
font-size: 14px;
letter-spacing: 0.01em;
```

### 3.4 JetBrains Mono — Técnico

Usada para tudo que é técnico, preciso ou requer destaque diferenciado: códigos de produto, overlines, labels de categoria no catálogo.

| Variante | Peso | Tamanho | Letter-spacing | Uso |
|----------|------|---------|----------------|-----|
| Overline | 400 | 11px | +0.14em | Categorias, seção acima de títulos |
| Product Code | 500 | 12–13px | +0.04em | VZB0001, VZF0001 |
| Caption Tech | 400 | 10px | +0.08em | Labels de tabela, metadados |

```css
/* Overline */
font-family: var(--font-mono);
font-size: 11px;
font-weight: 400;
letter-spacing: 0.14em;
text-transform: uppercase;
color: var(--vz-400);

/* Product Code */
font-family: var(--font-mono);
font-size: 13px;
font-weight: 500;
letter-spacing: 0.04em;
color: var(--vz-500);
```

### 3.5 Hierarquia em Contexto

Exemplo completo de como as três fontes se combinam em um card de produto:

```
[JetBrains Mono 11px · uppercase · vz-400]
Honda · Motocicletas

[Barlow Condensed 700 · 26px · vz-700]
CB 300F Twister

[Barlow 400 · 13px · gray-500]
Aplicação: 2023 até 2025

[JetBrains Mono 500 · 12px]
VZB0043     VZF0043
```

### 3.6 Regras Tipográficas

- **Nunca usar Inter, Roboto ou Arial.** São fontes sem personalidade para este contexto.
- **Barlow Condensed só em maiúsculo ou caso sentença** — nunca mixed case decorativo.
- **JetBrains Mono nunca em parágrafos longos** — só elementos curtos e técnicos.
- **Peso máximo do body text é 600.** Acima disso, usar Barlow Condensed.
- **Line-height do display é sempre abaixo de 1.2.** Títulos comprimidos têm mais impacto.

---

## 4. Espaçamento e Grid

### 4.1 Escala de Espaçamento

Baseada em múltiplos de 4px para consistência.

| Token | Valor | Uso Típico |
|-------|-------|------------|
| `--space-1` | `4px` | Gap mínimo entre elementos inline |
| `--space-2` | `8px` | Gap interno de componentes pequenos |
| `--space-3` | `12px` | Padding de badges, gap entre badges |
| `--space-4` | `16px` | Padding interno de cards pequenos |
| `--space-5` | `24px` | Gap entre cards, padding de seção |
| `--space-6` | `32px` | Margem entre componentes |
| `--space-7` | `48px` | Separação de seções |
| `--space-8` | `64px` | Padding vertical de seções desktop |
| `--space-9` | `96px` | Padding hero, grandes separações |
| `--space-10` | `128px` | Seções de destaque máximo |

```css
:root {
  --space-1: 4px;
  --space-2: 8px;
  --space-3: 12px;
  --space-4: 16px;
  --space-5: 24px;
  --space-6: 32px;
  --space-7: 48px;
  --space-8: 64px;
  --space-9: 96px;
  --space-10: 128px;
}
```

### 4.2 Grid do Site

```css
/* Container principal */
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;       /* mobile */
}

@media (min-width: 768px) {
  .container { padding: 0 40px; }
}

@media (min-width: 1200px) {
  .container { padding: 0 64px; }
}
```

**Colunas por contexto:**

| Contexto | Mobile | Tablet | Desktop |
|----------|--------|--------|---------|
| Cards de produto | 1 col | 2 col | 3–4 col |
| Cards de marca | 2 col | 3 col | 4–6 col |
| Diferenciais | 1 col | 2 col | 4 col |
| Catálogo com filtro | 1 col (stacked) | sidebar + 2 col | sidebar + 3 col |

### 4.3 Breakpoints

```css
--bp-sm:  480px;   /* Phones grandes */
--bp-md:  768px;   /* Tablets */
--bp-lg:  1024px;  /* Laptops */
--bp-xl:  1200px;  /* Desktop */
--bp-2xl: 1440px;  /* Desktop largo */
```

---

## 5. Border Radius e Sombras

### 5.1 Border Radius

| Token | Valor | Uso |
|-------|-------|-----|
| `--radius-sm` | `4px` | Badges, tags pequenas, inputs |
| `--radius-md` | `6px` | Botões, select |
| `--radius-lg` | `8px` | Cards de produto, modais, dropdowns |
| `--radius-xl` | `12px` | Cards grandes, hero finder, seções |
| `--radius-2xl` | `16px` | Seções com imagem, hero cards |
| `--radius-full` | `999px` | Pills, avatars, ícones circulares |

```css
:root {
  --radius-sm:   4px;
  --radius-md:   6px;
  --radius-lg:   8px;
  --radius-xl:   12px;
  --radius-2xl:  16px;
  --radius-full: 999px;
}
```

### 5.2 Sombras

Sombras sutis com tom azulado para manter coerência com a marca. Nunca sombras neutras (cinza puro).

| Token | Valor | Uso |
|-------|-------|-----|
| `--shadow-sm` | `0 1px 3px rgba(10,46,74,0.08)` | Cards no hover |
| `--shadow-md` | `0 4px 12px rgba(10,46,74,0.12)` | Dropdowns, modais |
| `--shadow-lg` | `0 8px 24px rgba(10,46,74,0.16)` | Cards de destaque |
| `--shadow-none` | `none` | Estado padrão (flat) |

> **Regra:** Estado padrão é sempre sem sombra (`shadow-none`). Sombra aparece no hover/focus — não decorativamente.

---

## 6. Iconografia

### 6.1 Estilo

- **Stroke, não fill** — ícones com contorno, não sólidos
- **Peso de stroke:** 1.5px para ícones 16px, 2px para 20px+
- **Corner:** rounded (stroke-linecap: round, stroke-linejoin: round)
- **Biblioteca recomendada:** Lucide Icons (alinha com o estilo técnico da marca)

### 6.2 Tamanhos

| Contexto | Tamanho |
|----------|---------|
| Inline em texto | 16×16px |
| Botão com ícone | 16×16px |
| Card de feature | 24×24px |
| Seção institucional | 32×32px |
| Hero / destaque | 48×48px |

### 6.3 Ícones-chave para a Vizor

| Ícone | Uso |
|-------|-----|
| `shield` | Proteção, qualidade, garantia |
| `gauge` / `speedometer` | Velocidade, performance, marca (faz parte do logo) |
| `layers` | Película, camada protetora |
| `search` | Buscador de compatibilidade |
| `check-circle` | Compatibilidade confirmada |
| `x-circle` | Incompatível |
| `factory` | Fabricação nacional |
| `star` | Avaliações, destaque |
| `map-pin` | São Leopoldo, RS |
| `phone` | Contato |
| `mail` | Contato |

---

## 7. Componentes — Botões

### 7.1 Variantes

#### Primary
Ação principal da página. Usar com parcimônia — máximo 1–2 por seção.

```css
.btn-primary {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: var(--vz-600);
  color: #ffffff;
  font-family: var(--font-body);
  font-size: 14px;
  font-weight: 600;
  letter-spacing: 0.01em;
  padding: 11px 22px;
  border-radius: var(--radius-md);
  border: none;
  cursor: pointer;
  transition: background 0.15s ease;
}

.btn-primary:hover  { background: var(--vz-700); }
.btn-primary:active { background: var(--vz-800); transform: scale(0.99); }
.btn-primary:focus-visible {
  outline: 2px solid var(--vz-400);
  outline-offset: 2px;
}
```

#### Secondary
Ação importante mas não principal. Usar ao lado do primary.

```css
.btn-secondary {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: transparent;
  color: var(--vz-600);
  font-family: var(--font-body);
  font-size: 14px;
  font-weight: 600;
  padding: 10px 22px;
  border-radius: var(--radius-md);
  border: 1.5px solid var(--vz-600);
  cursor: pointer;
  transition: background 0.15s ease, color 0.15s ease;
}

.btn-secondary:hover  { background: var(--vz-50); }
.btn-secondary:active { background: var(--vz-100); }
```

#### Ghost
Ação terciária. Usa apenas em contextos de muito conteúdo ou para ações destrutivas.

```css
.btn-ghost {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: transparent;
  color: var(--vz-gray-500);
  font-family: var(--font-body);
  font-size: 14px;
  font-weight: 500;
  padding: 10px 22px;
  border-radius: var(--radius-md);
  border: 0.5px solid var(--vz-gray-300);
  cursor: pointer;
  transition: background 0.15s ease, color 0.15s ease;
}

.btn-ghost:hover { background: var(--vz-gray-100); color: var(--vz-gray-900); }
```

#### Dark (para uso em fundos escuros)

```css
.btn-dark-primary {
  background: var(--vz-400);
  color: #ffffff;
  /* mesmas regras do primary */
}

.btn-dark-ghost {
  background: transparent;
  color: var(--vz-200);
  border: 1px solid var(--vz-700);
  /* mesmas regras do ghost */
}

.btn-dark-ghost:hover { background: rgba(255,255,255,0.08); color: white; }
```

### 7.2 Tamanhos

| Tamanho | Padding | Font |
|---------|---------|------|
| `sm` | `7px 14px` | 12px |
| `md` (default) | `11px 22px` | 14px |
| `lg` | `14px 28px` | 16px |

### 7.3 Regras de Uso

- **Nunca dois botões primary lado a lado.** Um é primary, o outro é secondary ou ghost.
- **Em fundos escuros** (vz-800, vz-900), usar `btn-dark-primary` e `btn-dark-ghost`.
- **Botão com ícone:** ícone sempre à esquerda do texto, 16×16px.
- **Loading state:** substituir texto por spinner + texto "Buscando..." — nunca desabilitar visualmente sem feedback.

---

## 8. Componentes — Badges e Labels

### 8.1 Badge de Variante de Produto

Identifica a variante do produto (Brilho/Fosco) e seu código.

```css
.badge {
  display: inline-block;
  font-family: var(--font-mono);
  font-size: 10px;
  font-weight: 500;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  padding: 3px 8px;
  border-radius: var(--radius-sm);
  white-space: nowrap;
}

/* Brilho — glossy */
.badge-brilho {
  background: var(--vz-100);
  color: var(--vz-700);
}

/* Fosco — matte */
.badge-fosco {
  background: var(--vz-gray-100);
  color: var(--vz-gray-700);
}

/* Novo lançamento */
.badge-novo {
  background: #E6F9F0;
  color: #0A5C35;
}

/* Marca */
.badge-marca {
  background: var(--vz-800);
  color: var(--vz-100);
}
```

**HTML:**
```html
<span class="badge badge-brilho">VZB0043</span>
<span class="badge badge-fosco">VZF0043</span>
<span class="badge badge-novo">Novo 2025</span>
<span class="badge badge-marca">Honda</span>
```

### 8.2 Tag de Aplicação

Para mostrar o período de compatibilidade.

```css
.tag-aplicacao {
  font-family: var(--font-mono);
  font-size: 10px;
  color: var(--vz-gray-500);
  letter-spacing: 0.04em;
}
```

---

## 9. Componentes — Cards de Produto

### 9.1 Estrutura

```html
<div class="product-card">
  <div class="product-card-image">
    <!-- imagem do painel ou placeholder SVG -->
  </div>
  <div class="product-card-body">
    <div class="product-card-brand">Honda</div>
    <h3 class="product-card-name">CB 300F Twister</h3>
    <p class="product-card-aplicacao">2023 até 2025</p>
    <div class="product-card-codes">
      <span class="badge badge-brilho">VZB0043</span>
      <span class="badge badge-fosco">VZF0043</span>
    </div>
  </div>
</div>
```

### 9.2 CSS

```css
.product-card {
  background: #ffffff;
  border: 0.5px solid var(--vz-gray-300);
  border-radius: var(--radius-xl);
  overflow: hidden;
  transition: box-shadow 0.2s ease, transform 0.2s ease;
  cursor: pointer;
}

.product-card:hover {
  box-shadow: var(--shadow-md);
  transform: translateY(-2px);
}

.product-card-image {
  width: 100%;
  aspect-ratio: 16 / 7;
  background: linear-gradient(135deg, var(--vz-800) 0%, var(--vz-600) 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
}

/* Quando tem foto real */
.product-card-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center;
}

.product-card-body {
  padding: 14px 16px;
}

.product-card-brand {
  font-family: var(--font-mono);
  font-size: 10px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  color: var(--vz-400);
  margin-bottom: 4px;
}

.product-card-name {
  font-family: var(--font-body);
  font-size: 14px;
  font-weight: 600;
  color: var(--vz-gray-900);
  line-height: 1.3;
  margin-bottom: 4px;
}

.product-card-aplicacao {
  font-family: var(--font-mono);
  font-size: 10px;
  color: var(--vz-gray-500);
  margin-bottom: 10px;
}

.product-card-codes {
  display: flex;
  gap: 6px;
  flex-wrap: wrap;
}
```

### 9.3 Variante com Badge "Novo"

Quando o produto é um lançamento, adicionar badge posicionado sobre a imagem:

```html
<div class="product-card">
  <div class="product-card-image">
    <span class="badge badge-novo" style="position: absolute; top: 8px; right: 8px;">Novo 2025</span>
    <!-- imagem -->
  </div>
  ...
</div>
```

### 9.4 Grid de Produtos

```css
.products-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 16px;
}

@media (min-width: 480px) {
  .products-grid { grid-template-columns: repeat(2, 1fr); }
}

@media (min-width: 768px) {
  .products-grid { grid-template-columns: repeat(3, 1fr); gap: 20px; }
}

@media (min-width: 1024px) {
  .products-grid { grid-template-columns: repeat(4, 1fr); gap: 24px; }
}
```

---

## 10. Componentes — Product Finder

O componente mais crítico do site. Resolve a pergunta principal do usuário: **"serve pra minha moto?"**

### 10.1 Estrutura

```html
<div class="product-finder">
  <div class="product-finder-inner">
    <h2 class="product-finder-title">Encontre a película para sua moto</h2>
    <div class="product-finder-form">
      <div class="finder-select-wrap">
        <label class="finder-label">Marca</label>
        <select class="finder-select" id="select-marca">
          <option value="">Selecione a marca</option>
          <option value="bajaj">Bajaj</option>
          <option value="bmw">BMW</option>
          <option value="ducati">Ducati</option>
          <option value="haojue">Haojue</option>
          <option value="harley">Harley Davidson</option>
          <option value="honda">Honda</option>
          <option value="kawasaki">Kawasaki</option>
          <option value="ktm">KTM</option>
          <option value="royal-enfield">Royal Enfield</option>
          <option value="shineray">Shineray</option>
          <option value="suzuki">Suzuki</option>
          <option value="triumph">Triumph</option>
          <option value="voltz">Voltz</option>
          <option value="yamaha">Yamaha</option>
          <option value="zontes">Zontes</option>
        </select>
      </div>

      <div class="finder-select-wrap">
        <label class="finder-label">Modelo</label>
        <select class="finder-select" id="select-modelo" disabled>
          <option value="">Selecione o modelo</option>
        </select>
      </div>

      <div class="finder-select-wrap">
        <label class="finder-label">Ano</label>
        <select class="finder-select" id="select-ano" disabled>
          <option value="">Selecione o ano</option>
        </select>
      </div>

      <button class="btn-primary finder-btn" id="btn-buscar">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/>
        </svg>
        Buscar película
      </button>
    </div>
  </div>
</div>
```

### 10.2 CSS

```css
.product-finder {
  background: #ffffff;
  border: 0.5px solid var(--vz-gray-300);
  border-radius: var(--radius-2xl);
  padding: 28px 32px;
  box-shadow: var(--shadow-lg);
}

.product-finder-title {
  font-family: var(--font-display);
  font-weight: 700;
  font-size: 22px;
  color: var(--vz-700);
  margin-bottom: 20px;
  letter-spacing: 0.01em;
}

.product-finder-form {
  display: flex;
  gap: 12px;
  flex-wrap: wrap;
  align-items: flex-end;
}

.finder-select-wrap {
  flex: 1;
  min-width: 160px;
}

.finder-label {
  display: block;
  font-family: var(--font-mono);
  font-size: 10px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  color: var(--vz-gray-500);
  margin-bottom: 6px;
}

.finder-select {
  width: 100%;
  padding: 10px 14px;
  border: 0.5px solid var(--vz-gray-300);
  border-radius: var(--radius-md);
  font-family: var(--font-body);
  font-size: 14px;
  color: var(--vz-gray-900);
  background: #ffffff;
  cursor: pointer;
  transition: border-color 0.15s;
  -webkit-appearance: none;
  appearance: none;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%236B7E8C' stroke-width='2'%3E%3Cpath d='m6 9 6 6 6-6'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: right 12px center;
  padding-right: 36px;
}

.finder-select:hover  { border-color: var(--vz-400); }
.finder-select:focus  { outline: none; border-color: var(--vz-600); }
.finder-select:disabled {
  background-color: var(--vz-gray-100);
  color: var(--vz-gray-500);
  cursor: not-allowed;
}

.finder-btn {
  flex-shrink: 0;
  white-space: nowrap;
  height: 42px;
  padding: 0 24px;
}

/* Mobile: stacked */
@media (max-width: 600px) {
  .product-finder { padding: 20px; }
  .finder-select-wrap { min-width: 100%; }
  .finder-btn { width: 100%; justify-content: center; }
}
```

### 10.3 Estado dos Resultados

Após busca bem-sucedida, exibir resultados abaixo do finder:

```html
<div class="finder-result" id="finder-result">
  <div class="finder-result-header">
    <span class="finder-result-label">Honda CB 300F Twister · 2023</span>
    <span class="finder-result-count">1 película encontrada</span>
  </div>
  <!-- product-card aqui -->
</div>
```

---

## 11. Componentes — Navegação

### 11.1 Navbar Desktop

```html
<nav class="navbar">
  <div class="container navbar-inner">
    <a href="/" class="navbar-logo">VIZOR</a>

    <ul class="navbar-links">
      <li><a href="/produtos" class="nav-link">Produtos</a></li>
      <li><a href="/sobre" class="nav-link">Sobre</a></li>
      <li><a href="/tecnologia" class="nav-link">Tecnologia</a></li>
      <li><a href="/revendedores" class="nav-link">Revendedores</a></li>
    </ul>

    <div class="navbar-actions">
      <button class="btn-primary" style="font-size: 13px; padding: 8px 18px;">
        Buscar moto
      </button>
    </div>
  </div>
</nav>
```

```css
.navbar {
  background: var(--vz-900);
  position: sticky;
  top: 0;
  z-index: 100;
  border-bottom: 1px solid rgba(255,255,255,0.06);
}

.navbar-inner {
  display: flex;
  align-items: center;
  gap: 40px;
  height: 64px;
}

.navbar-logo {
  font-family: var(--font-display);
  font-weight: 900;
  font-size: 24px;
  letter-spacing: 0.06em;
  color: #ffffff;
  text-decoration: none;
  flex-shrink: 0;
}

.navbar-links {
  display: flex;
  gap: 32px;
  list-style: none;
  margin: 0; padding: 0;
}

.nav-link {
  font-family: var(--font-body);
  font-size: 14px;
  font-weight: 500;
  color: var(--vz-300);
  text-decoration: none;
  transition: color 0.15s;
}

.nav-link:hover,
.nav-link.active { color: #ffffff; }

.navbar-actions { margin-left: auto; }
```

### 11.2 Navbar Mobile

```css
@media (max-width: 768px) {
  .navbar-links { display: none; }

  .navbar-mobile-toggle {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    background: none;
    border: none;
    cursor: pointer;
    color: #ffffff;
    margin-left: auto;
  }
}
```

---

## 12. Componentes — Section Header

Cabeçalho de seção no catálogo. Separa visualmente cada marca.

### 12.1 Estrutura

```html
<div class="section-header">
  <div class="section-header-accent"></div>
  <div class="section-header-content">
    <div class="section-header-brand">HONDA</div>
    <div class="section-header-sub">Película Protetora Painel</div>
  </div>
  <div class="section-header-count">48 modelos</div>
</div>
```

### 12.2 CSS

```css
.section-header {
  background: var(--vz-800);
  color: #ffffff;
  border-radius: var(--radius-xl);
  padding: 18px 24px;
  display: flex;
  align-items: center;
  gap: 16px;
  margin-bottom: 24px;
}

.section-header-accent {
  width: 3px;
  height: 40px;
  background: var(--vz-400);
  border-radius: 2px;
  flex-shrink: 0;
}

.section-header-brand {
  font-family: var(--font-display);
  font-weight: 900;
  font-size: 28px;
  letter-spacing: 0.04em;
  color: #ffffff;
  line-height: 1;
}

.section-header-sub {
  font-family: var(--font-body);
  font-size: 12px;
  color: var(--vz-200);
  margin-top: 3px;
}

.section-header-count {
  margin-left: auto;
  font-family: var(--font-mono);
  font-size: 12px;
  color: var(--vz-300);
  flex-shrink: 0;
}
```

---

## 13. Padrões de Layout

### 13.1 Estrutura de Página

```
┌─────────────────────────────────┐
│ NAVBAR (sticky, dark vz-900)    │
├─────────────────────────────────┤
│ HERO (dark vz-800/900)          │
│ — Headline + Product Finder     │
├─────────────────────────────────┤
│ MARCAS (light vz-off-white)     │
│ — Grid de logos de marcas       │
├─────────────────────────────────┤
│ DIFERENCIAIS (dark vz-800)      │
│ — 4 blocos com ícone + texto    │
├─────────────────────────────────┤
│ CATÁLOGO DESTAQUE (white)       │
│ — Lançamentos / mais vendidos   │
├─────────────────────────────────┤
│ TECNOLOGIA (light vz-50)        │
│ — Foto fábrica + textos         │
├─────────────────────────────────┤
│ SOBRE / MANIFESTO (dark vz-900) │
│ — Quote + história da empresa   │
├─────────────────────────────────┤
│ SEJA REVENDEDOR (vz-600)        │
│ — CTA para B2B                  │
├─────────────────────────────────┤
│ FOOTER (dark vz-900)            │
└─────────────────────────────────┘
```

### 13.2 Ritmo de Alternância Dark/Light

O site alterna entre seções escuras e claras para criar ritmo visual:

| Seção | Background |
|-------|------------|
| Hero | `vz-900` → `vz-800` (gradient) |
| Marcas (logos) | `vz-off-white` |
| Diferenciais | `vz-800` |
| Catálogo destaque | `#ffffff` |
| Tecnologia | `vz-50` |
| Manifesto/Quote | `vz-900` |
| Seja Revendedor | `vz-600` |
| Footer | `vz-900` |

> **Regra:** Nunca duas seções escuras ou duas claras consecutivas — manter o ritmo de alternância.

### 13.3 Seção Hero

```css
.hero {
  background: var(--vz-900);
  position: relative;
  overflow: hidden;
  padding: 80px 0 100px;
}

/* Elemento decorativo diagonal */
.hero::after {
  content: '';
  position: absolute;
  top: 0; right: 0;
  width: 45%;
  height: 100%;
  background: linear-gradient(135deg, transparent 20%, var(--vz-800) 100%);
  opacity: 0.6;
  pointer-events: none;
}

.hero-overline {
  font-family: var(--font-mono);
  font-size: 11px;
  letter-spacing: 0.16em;
  text-transform: uppercase;
  color: var(--vz-300);
  margin-bottom: 16px;
}

.hero-title {
  font-family: var(--font-display);
  font-weight: 900;
  font-size: clamp(44px, 8vw, 80px);
  line-height: 0.92;
  color: #ffffff;
  margin-bottom: 24px;
  letter-spacing: -0.01em;
}

.hero-title em {
  font-style: normal;
  color: var(--vz-300);
}

.hero-sub {
  font-family: var(--font-body);
  font-size: 16px;
  color: var(--vz-200);
  max-width: 520px;
  line-height: 1.7;
  margin-bottom: 40px;
}

.hero-finder {
  max-width: 640px;
  position: relative;
  z-index: 2;
}
```

### 13.4 Seção de Diferenciais

```css
.features-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 24px;
}

@media (min-width: 768px) {
  .features-grid { grid-template-columns: repeat(2, 1fr); }
}

@media (min-width: 1024px) {
  .features-grid { grid-template-columns: repeat(4, 1fr); }
}

.feature-card {
  padding: 28px 24px;
  border: 0.5px solid rgba(255,255,255,0.08);
  border-radius: var(--radius-xl);
  transition: border-color 0.2s, background 0.2s;
}

.feature-card:hover {
  border-color: rgba(255,255,255,0.16);
  background: rgba(255,255,255,0.04);
}

.feature-icon {
  color: var(--vz-400);
  margin-bottom: 16px;
}

.feature-title {
  font-family: var(--font-display);
  font-weight: 700;
  font-size: 20px;
  color: #ffffff;
  margin-bottom: 8px;
}

.feature-text {
  font-family: var(--font-body);
  font-size: 13px;
  color: var(--vz-200);
  line-height: 1.6;
}
```

---

## 14. Modo Escuro e Claro

O site não tem toggle de dark/light mode — ele **usa as duas paletas intencionalmente** em diferentes seções. O controle é por seção, não por preferência do usuário.

### 14.1 Seções Escuras — Checklist

Em qualquer seção com `background: vz-700` ou mais escuro:

- [ ] Headings principais: `color: #ffffff`
- [ ] Texto de suporte: `color: var(--vz-200)` ou `vz-300`
- [ ] Labels/overlines: `color: var(--vz-300)` ou `vz-400`
- [ ] Botões: usar variantes `btn-dark-*`
- [ ] Bordas de cards: `rgba(255,255,255,0.08)` a `0.15`
- [ ] Ícones: `color: var(--vz-400)`

### 14.2 Seções Claras — Checklist

Em qualquer seção com `background: vz-50`, `vz-off-white` ou `#ffffff`:

- [ ] Headings principais: `color: var(--vz-700)` ou `vz-800`
- [ ] Texto de suporte: `color: var(--vz-gray-700)`
- [ ] Labels/overlines: `color: var(--vz-400)`
- [ ] Botões: usar variantes padrão (`btn-primary`, `btn-secondary`)
- [ ] Bordas de cards: `0.5px solid var(--vz-gray-300)`
- [ ] Ícones: `color: var(--vz-600)`

---

## 15. Tokens CSS — Referência Completa

Copie este bloco para o `:root` do projeto:

```css
:root {
  /* ── Vizor Blue ── */
  --vz-900: #021A2D;
  --vz-800: #0A2E4A;
  --vz-700: #0D3E63;
  --vz-600: #1A5C8A;   /* ★ Brand primary */
  --vz-500: #2172A8;
  --vz-400: #2E8BC7;
  --vz-300: #5BAEE0;
  --vz-200: #93CDF0;
  --vz-100: #C6E6F8;
  --vz-50:  #EAF5FC;

  /* ── Steel Gray ── */
  --vz-gray-900: #1C2730;
  --vz-gray-700: #3A4B57;
  --vz-gray-500: #6B7E8C;
  --vz-gray-300: #B8C4CC;
  --vz-gray-100: #EDF0F2;
  --vz-off-white: #F5F7F9;

  /* ── Semantic ── */
  --vz-success-bg:   #E6F9F0;
  --vz-success-text: #0A5C35;
  --vz-warning-bg:   #FFF8E6;
  --vz-warning-text: #7A5000;
  --vz-error-bg:     #FEF0F0;
  --vz-error-text:   #8B1A1A;

  /* ── Typography ── */
  --font-display: 'Barlow Condensed', sans-serif;
  --font-body:    'Barlow', sans-serif;
  --font-mono:    'JetBrains Mono', monospace;

  /* ── Spacing ── */
  --space-1:  4px;
  --space-2:  8px;
  --space-3:  12px;
  --space-4:  16px;
  --space-5:  24px;
  --space-6:  32px;
  --space-7:  48px;
  --space-8:  64px;
  --space-9:  96px;
  --space-10: 128px;

  /* ── Border Radius ── */
  --radius-sm:   4px;
  --radius-md:   6px;
  --radius-lg:   8px;
  --radius-xl:   12px;
  --radius-2xl:  16px;
  --radius-full: 999px;

  /* ── Shadows (tom azulado) ── */
  --shadow-sm: 0 1px 3px rgba(10, 46, 74, 0.08);
  --shadow-md: 0 4px 12px rgba(10, 46, 74, 0.12);
  --shadow-lg: 0 8px 24px rgba(10, 46, 74, 0.16);

  /* ── Breakpoints (referência) ── */
  --bp-sm:  480px;
  --bp-md:  768px;
  --bp-lg:  1024px;
  --bp-xl:  1200px;
  --bp-2xl: 1440px;

  /* ── Transitions ── */
  --transition-fast:   0.1s ease;
  --transition-normal: 0.2s ease;
  --transition-slow:   0.35s ease;
}
```

---

## 16. Diretrizes de Voz e Tom

### 16.1 Personalidade da Marca

| Atributo | Descrição |
|----------|-----------|
| **Apaixonado** | Fala como motociclista, não como loja |
| **Técnico** | Usa terminologia correta, sem simplificar demais |
| **Nacional** | Orgulhoso de ser brasileiro, made in São Leopoldo |
| **Preciso** | Especificações corretas, compatibilidade clara |
| **Direto** | Sem rodeios, vai ao ponto |

### 16.2 Exemplos de Copy

| Situação | ❌ Evitar | ✅ Usar |
|----------|-----------|---------|
| CTA principal | "Comprar agora" | "Encontrar minha película" |
| CTA catálogo | "Ver produtos" | "Ver catálogo completo" |
| Título hero | "Bem-vindo à Vizor" | "Proteção com propósito" |
| Diferencial | "Alta qualidade" | "Fabricado conforme especificações das montadoras" |
| Origem | "Empresa brasileira" | "100% nacional · São Leopoldo, RS" |
| Produto | "Produto compatível" | "Película para [Marca] [Modelo] · [Ano]" |
| B2B | "Seja nosso parceiro" | "Trabalhe com a Vizor" |

### 16.3 Overlines Padrão

```
CATÁLOGO DE PRODUTOS 2025
PELÍCULAS PROTETORAS
FABRICAÇÃO NACIONAL
TECNOLOGIA E PROCESSO
SOBRE A VIZOR
SEJA REVENDEDOR
```

### 16.4 Frases da Marca

Quote oficial (do catálogo):
> *"Quando há paixão no que se faz, o resultado é excelência. Por isso, cada detalhe Vizor entrega proteção e estilo com propósito."*

Tagline curta: **"Proteção com propósito."**

Pitch técnico: **"Películas fabricadas com as especificações técnicas das principais montadoras."**

---

## 17. Checklist de Consistência

Use antes de qualquer entrega ou commit:

### Tipografia
- [ ] Barlow Condensed apenas em headlines e logo
- [ ] Barlow apenas em body, nav, botões
- [ ] JetBrains Mono apenas em códigos, overlines e labels técnicos
- [ ] Nenhuma fonte genérica (Inter, Roboto, Arial, system-ui) usada

### Cores
- [ ] Todos os azuis usam tokens `--vz-*` (nunca hex direto no CSS de componentes)
- [ ] Texto em fundo escuro usa `vz-100` a `vz-300` ou `#ffffff`
- [ ] Texto em fundo claro usa `vz-700`, `vz-800` ou `gray-900`
- [ ] Sem contraste abaixo de 4.5:1 em qualquer combinação

### Componentes
- [ ] Botões primários: no máximo 1 por seção visível
- [ ] Todos os cards têm hover state
- [ ] Product Finder tem estado desabilitado nos selects dependentes
- [ ] Badges de produto sempre em par (Brilho + Fosco)

### Layout
- [ ] Seções alternando dark/light corretamente
- [ ] Container com padding responsivo em todos os breakpoints
- [ ] Product grid responsivo: 1 → 2 → 3 → 4 colunas
- [ ] Navbar é sticky e não bloqueia conteúdo

### Acessibilidade
- [ ] Todos os botões e links com foco visível
- [ ] Selects com label associada (`for` / `id`)
- [ ] Imagens de painel com `alt` descritivo
- [ ] Skip to main content no início do HTML

---

*VIZOR Design System v1.0 — Películas Protetoras*  
*São Leopoldo, RS · vizor.com.br*  
*Última atualização: Março 2026*
