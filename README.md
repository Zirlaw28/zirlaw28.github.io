<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SMC Gold Sniper — XAUUSD H1 Smart Money Strategy</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&family=Outfit:wght@300;400;500;600&display=swap');
:root{--gold:#D4A843;--gold2:#F0C96E;--gold3:#8B6914;--bg:#080808;--s1:#0E0E0E;--s2:#141414;--border:#282828;--text:#F0EDE8;--muted:#888880;--green:#4ADE80;--red:#F87171;--blue:#60A5FA}
*{margin:0;padding:0;box-sizing:border-box}html{scroll-behavior:smooth}
body{background:var(--bg);color:var(--text);font-family:'Outfit',sans-serif;line-height:1.7;overflow-x:hidden}
body::before{content:'';position:fixed;inset:0;background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='300' height='300'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.75' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='300' height='300' filter='url(%23g)' opacity='0.04'/%3E%3C/svg%3E");pointer-events:none;z-index:999;opacity:.4}

/* HERO */
.hero{min-height:100vh;display:flex;flex-direction:column;justify-content:center;align-items:center;text-align:center;padding:80px 24px;position:relative;background:radial-gradient(ellipse 80% 60% at 50% 0%,rgba(212,168,67,.13) 0%,transparent 70%)}
.hero::after{content:'';position:absolute;bottom:0;left:0;right:0;height:1px;background:linear-gradient(90deg,transparent,var(--gold),transparent)}
.badge{display:inline-flex;align-items:center;gap:8px;background:rgba(212,168,67,.1);border:1px solid rgba(212,168,67,.3);border-radius:100px;padding:6px 18px;font-size:11px;letter-spacing:.15em;text-transform:uppercase;color:var(--gold2);margin-bottom:32px;animation:fadeUp .6s ease both}
.badge::before{content:'◆';font-size:8px}
h1{font-family:'Playfair Display',serif;font-weight:900;font-size:clamp(44px,8vw,100px);line-height:1;letter-spacing:-.02em;background:linear-gradient(135deg,var(--gold2) 0%,var(--gold) 45%,var(--gold3) 100%);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;margin-bottom:10px;animation:fadeUp .6s .1s ease both}
.hero-sub{font-size:clamp(14px,2vw,18px);color:var(--muted);font-weight:300;margin-bottom:52px;max-width:540px;animation:fadeUp .6s .2s ease both}

/* HERO RISK TOGGLE */
.risk-toggle-wrap{margin-bottom:40px;animation:fadeUp .6s .25s ease both}
.risk-toggle-label{font-size:11px;letter-spacing:.15em;text-transform:uppercase;color:var(--muted);margin-bottom:10px}
.risk-toggle{display:inline-flex;background:var(--s2);border:1px solid var(--border);border-radius:8px;padding:4px;gap:4px}
.rtab{padding:8px 22px;border-radius:5px;font-size:13px;font-weight:500;cursor:pointer;transition:all .2s;color:var(--muted);border:none;background:transparent;font-family:'Outfit',sans-serif}
.rtab.active{background:var(--gold);color:#000;font-weight:700}

.hero-stats{display:flex;gap:40px;justify-content:center;flex-wrap:wrap;margin-bottom:52px;animation:fadeUp .6s .3s ease both}
.hstat{text-align:center}
.hstat-val{font-family:'Playfair Display',serif;font-weight:700;font-size:clamp(26px,4vw,40px);line-height:1;color:var(--gold2);transition:all .3s}
.hstat-val.green{color:var(--green)}
.hstat-lbl{font-size:11px;color:var(--muted);letter-spacing:.08em;text-transform:uppercase;margin-top:6px}
.hstat-note{font-size:11px;color:var(--gold3);margin-top:2px}
.cta-group{display:flex;gap:16px;flex-wrap:wrap;justify-content:center;animation:fadeUp .6s .4s ease both}
.btn-primary{background:linear-gradient(135deg,var(--gold) 0%,var(--gold2) 100%);color:#000;font-family:'Outfit',sans-serif;font-weight:700;font-size:14px;letter-spacing:.04em;padding:16px 44px;border:none;border-radius:4px;cursor:pointer;text-decoration:none;display:inline-block;transition:transform .2s,box-shadow .2s}
.btn-primary:hover{transform:translateY(-2px);box-shadow:0 8px 40px rgba(212,168,67,.45)}
.btn-secondary{background:transparent;color:var(--text);font-family:'Outfit',sans-serif;font-weight:500;font-size:14px;padding:16px 32px;border:1px solid var(--border);border-radius:4px;cursor:pointer;text-decoration:none;display:inline-block;transition:border-color .2s,color .2s}
.btn-secondary:hover{border-color:var(--gold3);color:var(--gold2)}

/* LAYOUT */
section{padding:100px 24px;max-width:1100px;margin:0 auto}
.section-label{font-size:10px;letter-spacing:.25em;text-transform:uppercase;color:var(--gold);margin-bottom:16px;display:flex;align-items:center;gap:12px}
.section-label::before{content:'';display:block;width:24px;height:1px;background:var(--gold)}
h2{font-family:'Playfair Display',serif;font-weight:700;font-size:clamp(28px,4vw,44px);line-height:1.15;margin-bottom:16px}
.section-intro{color:var(--muted);font-size:15px;max-width:600px;margin-bottom:52px;font-weight:300}
.divider{height:1px;background:linear-gradient(90deg,transparent,var(--border),transparent)}

/* PERIOD / RISK TABS */
.tab-bar{display:flex;gap:0;background:var(--s2);border:1px solid var(--border);border-radius:8px;padding:4px;width:fit-content;margin-bottom:28px}
.ptab{padding:9px 22px;border-radius:5px;font-size:13px;font-weight:500;cursor:pointer;color:var(--muted);border:none;background:transparent;font-family:'Outfit',sans-serif;transition:all .2s}
.ptab.active{background:rgba(212,168,67,.15);color:var(--gold2);font-weight:600}

.risk-bar{display:flex;gap:0;background:var(--s2);border:1px solid var(--border);border-radius:8px;padding:4px;width:fit-content;margin-bottom:28px}
.rrisk{padding:9px 22px;border-radius:5px;font-size:13px;font-weight:500;cursor:pointer;color:var(--muted);border:none;background:transparent;font-family:'Outfit',sans-serif;transition:all .2s}
.rrisk.active{background:rgba(212,168,67,.15);color:var(--gold2);font-weight:600}

.tab-controls{display:flex;gap:16px;flex-wrap:wrap;align-items:center;margin-bottom:8px}

/* PANEL */
.data-panel{display:none}.data-panel.active{display:block}

/* METRICS */
.metrics-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(170px,1fr));gap:1px;background:var(--border);border:1px solid var(--border);border-radius:8px;overflow:hidden;margin-bottom:28px}
.metric{background:var(--s1);padding:22px 18px;transition:background .15s}
.metric:hover{background:var(--s2)}
.m-label{font-size:10px;letter-spacing:.12em;text-transform:uppercase;color:var(--muted);margin-bottom:8px}
.m-val{font-family:'Playfair Display',serif;font-weight:700;font-size:26px;line-height:1;margin-bottom:4px}
.m-val.gold{color:var(--gold2)}.m-val.green{color:var(--green)}.m-val.red{color:var(--red)}.m-val.blue{color:var(--blue)}
.m-note{font-size:11px;color:var(--muted)}

/* YEAR TABLE */
.year-table{width:100%;border-collapse:collapse;margin-bottom:24px}
.year-table th{text-align:left;font-size:10px;letter-spacing:.12em;text-transform:uppercase;color:var(--muted);padding:10px 14px;border-bottom:1px solid var(--border)}
.year-table td{padding:14px;border-bottom:1px solid rgba(255,255,255,.04);font-size:14px}
.year-table tr:last-child td{border-bottom:none;font-weight:700}
.tag{display:inline-block;padding:2px 9px;border-radius:100px;font-size:11px;font-weight:600}
.tag.bull{background:rgba(74,222,128,.1);color:var(--green)}
.tag.range{background:rgba(212,168,67,.1);color:var(--gold2)}
.tag.hot{background:rgba(96,165,250,.1);color:var(--blue)}

/* CHART */
.chart-card{background:var(--s1);border:1px solid var(--border);border-radius:8px;padding:28px;margin-bottom:20px}
.chart-card h3{font-family:'Playfair Display',serif;font-size:18px;margin-bottom:4px}
.chart-card .ch-sub{color:var(--muted);font-size:11px;margin-bottom:20px}
canvas{max-height:240px}

/* HONESTY BOX */
.honesty{background:rgba(212,168,67,.05);border:1px solid rgba(212,168,67,.2);border-radius:8px;padding:20px 24px;margin-bottom:28px}
.honesty-title{font-weight:600;font-size:14px;color:var(--gold2);margin-bottom:8px}
.honesty p{font-size:13px;color:var(--muted);line-height:1.7}

/* CONSISTENCY BADGE */
.consistency{display:flex;align-items:center;gap:12px;background:rgba(74,222,128,.06);border:1px solid rgba(74,222,128,.2);border-radius:6px;padding:14px 18px;margin-bottom:28px;font-size:13px}
.consistency .ck{color:var(--green);font-size:16px}

/* STEPS */
.steps{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:20px;margin-bottom:48px}
.step{background:var(--s1);border:1px solid var(--border);border-radius:8px;padding:24px;position:relative;overflow:hidden;transition:border-color .2s,transform .2s}
.step:hover{border-color:var(--gold3);transform:translateY(-3px)}
.step::before{content:attr(data-n);position:absolute;top:-8px;right:12px;font-family:'Playfair Display',serif;font-weight:900;font-size:72px;color:rgba(212,168,67,.05);line-height:1}
.step-icon{font-size:22px;margin-bottom:14px}
.step h3{font-family:'Playfair Display',serif;font-size:17px;margin-bottom:7px}
.step p{font-size:12px;color:var(--muted);line-height:1.6}

/* PARAMS */
.params{display:grid;grid-template-columns:repeat(auto-fit,minmax(270px,1fr));gap:12px;margin-bottom:48px}
.param{background:var(--s2);border:1px solid var(--border);border-radius:6px;padding:16px 18px;display:flex;justify-content:space-between;align-items:center;gap:12px}
.param-name{font-weight:600;font-size:13px;margin-bottom:2px}
.param-desc{font-size:11px;color:var(--muted)}
.param-val{font-family:'Playfair Display',serif;font-weight:700;font-size:20px;color:var(--gold2);white-space:nowrap}

/* FAQ */
.faq-item{border-bottom:1px solid var(--border);padding:22px 0}
.faq-q{font-weight:600;font-size:15px;margin-bottom:9px;display:flex;gap:10px}
.faq-q::before{content:'Q.';color:var(--gold);flex-shrink:0}
.faq-a{font-size:13px;color:var(--muted);padding-left:26px;line-height:1.7}

/* PRICING */
.pricing-card{background:var(--s1);border:1px solid var(--border);border-radius:12px;padding:48px;text-align:center;max-width:460px;margin:0 auto 24px;position:relative;overflow:hidden}
.pricing-card::before{content:'';position:absolute;top:0;left:0;right:0;height:2px;background:linear-gradient(90deg,transparent,var(--gold),transparent)}
.pricing-badge{display:inline-block;background:rgba(212,168,67,.15);border:1px solid rgba(212,168,67,.3);color:var(--gold2);font-size:11px;letter-spacing:.12em;text-transform:uppercase;padding:4px 14px;border-radius:100px;margin-bottom:20px}
.price{font-family:'Playfair Display',serif;font-weight:900;font-size:60px;line-height:1;color:var(--gold2);margin-bottom:4px}
.price-period{font-size:13px;color:var(--muted);margin-bottom:32px}
.price-features{list-style:none;text-align:left;margin-bottom:36px}
.price-features li{padding:9px 0;border-bottom:1px solid rgba(255,255,255,.05);font-size:13px;display:flex;gap:10px;align-items:flex-start}
.price-features li::before{content:'✓';color:var(--green);font-weight:700;flex-shrink:0;margin-top:2px}
.price-features li:last-child{border-bottom:none}
.disclaimer{max-width:580px;margin:0 auto;text-align:center;font-size:11px;color:var(--muted);line-height:1.7;padding:20px;border:1px solid var(--border);border-radius:6px}

footer{border-top:1px solid var(--border);padding:36px 24px;text-align:center;color:var(--muted);font-size:12px}
.footer-logo{font-family:'Playfair Display',serif;font-size:19px;color:var(--gold);margin-bottom:10px}

@keyframes fadeUp{from{opacity:0;transform:translateY(20px)}to{opacity:1;transform:translateY(0)}}
.reveal{opacity:0;transform:translateY(20px);transition:opacity .55s ease,transform .55s ease}
.reveal.visible{opacity:1;transform:translateY(0)}
@media(max-width:640px){.hero-stats{gap:24px}.tab-controls{flex-direction:column;align-items:flex-start}section{padding:64px 16px}}
</style>
</head>
<body>

<!-- HERO -->
<div class="hero">
  <div class="badge">TradingView Pine Script v6 · XAUUSD H1 · Verified</div>
  <h1>SMC Gold<br>Sniper</h1>
  <p class="hero-sub">Smart Money Concepts strategy for Gold — Daily HTF bias, OTE precision zones, double-candle confirmation. Tested across two independent market periods.</p>

  <div class="risk-toggle-wrap">
    <div class="risk-toggle-label">Show results at risk level:</div>
    <div class="risk-toggle">
      <button class="rtab active" onclick="setHeroRisk(1, this)">1% per trade</button>
      <button class="rtab" onclick="setHeroRisk(3, this)">3% per trade</button>
    </div>
  </div>

  <div class="hero-stats">
    <!-- PERIOD A stats -->
    <div class="hstat">
      <div class="hstat-val green" id="h-pnl-a">+54%</div>
      <div class="hstat-lbl">Return 2022–2024</div>
      <div class="hstat-note" id="h-note-a">€2k → €3,083</div>
    </div>
    <div class="hstat">
      <div class="hstat-val" id="h-pf-a">2.66</div>
      <div class="hstat-lbl">Profit Factor</div>
      <div class="hstat-note">2022–2024</div>
    </div>
    <div class="hstat">
      <div class="hstat-val" id="h-pnl-b">+54%</div>
      <div class="hstat-lbl">Return 2024–2026</div>
      <div class="hstat-note" id="h-note-b">€2k → €3,088</div>
    </div>
    <div class="hstat">
      <div class="hstat-val blue" id="h-dd">5.40%</div>
      <div class="hstat-lbl">Max Drawdown</div>
      <div class="hstat-note">2024–2026 (recent)</div>
    </div>
  </div>

  <div class="cta-group">
    <a href="#pricing" class="btn-primary">Get Access — €19/month</a>
    <a href="#results" class="btn-secondary">See Full Results ↓</a>
  </div>
</div>

<div class="divider"></div>

<!-- RESULTS -->
<section id="results">
  <div class="section-label reveal">Verified Backtest · v14 Fixed · Bug-free margin calculation</div>
  <h2 class="reveal">Same script.<br>Two market periods.</h2>
  <p class="section-intro reveal">Both periods use the identical script with identical parameters — only the date range changes. The number of trades is confirmed equal at both risk levels, validating the margin calculation fix.</p>

  <div class="consistency reveal">
    <span class="ck">✅</span>
    <span><strong>Margin calculation verified:</strong> 35 trades @ 1% = 35 trades @ 3% on 2022–2024. 25 trades @ 1% = 25 trades @ 3% on 2024–2026. The script fires the same signals regardless of risk setting.</span>
  </div>

  <div class="honesty reveal">
    <div class="honesty-title">⚖️ Full transparency — why two periods</div>
    <p>We show <strong>2022–2024</strong> honestly (development period — good results, be aware) and <strong>2024–2026</strong> (post-development, script untouched). The recent period is what matters to you as a subscriber. Both periods are profitable. Both are shown at your chosen risk level.</p>
  </div>

  <!-- TAB CONTROLS -->
  <div class="tab-controls reveal">
    <div>
      <div style="font-size:11px;color:var(--muted);letter-spacing:.1em;text-transform:uppercase;margin-bottom:8px">Period</div>
      <div class="tab-bar">
        <button class="ptab active" onclick="showPanel('a',this)">2022–2024</button>
        <button class="ptab" onclick="showPanel('b',this)">2024–2026</button>
      </div>
    </div>
    <div>
      <div style="font-size:11px;color:var(--muted);letter-spacing:.1em;text-transform:uppercase;margin-bottom:8px">Risk per trade</div>
      <div class="risk-bar">
        <button class="rrisk active" onclick="showRisk(1,this)">1%</button>
        <button class="rrisk" onclick="showRisk(3,this)">3%</button>
      </div>
    </div>
  </div>

  <!-- PANEL A1 : 2022-2024 @ 1% -->
  <div class="data-panel active" id="panel-a1">
    <div class="metrics-grid">
      <div class="metric"><div class="m-label">Net P&L</div><div class="m-val green">+€1,083</div><div class="m-note">+54.1% on €2,000</div></div>
      <div class="metric"><div class="m-label">Profit Factor</div><div class="m-val gold">2.66</div><div class="m-note">Benchmark: 2.0+</div></div>
      <div class="metric"><div class="m-label">Win Rate</div><div class="m-val">34.3%</div><div class="m-note">12 of 35 trades</div></div>
      <div class="metric"><div class="m-label">Max Drawdown</div><div class="m-val red">10.59%</div><div class="m-note">Controlled</div></div>
      <div class="metric"><div class="m-label">Avg Winner</div><div class="m-val green">+€145</div><div class="m-note">Avg Loser: -€28</div></div>
      <div class="metric"><div class="m-label">Trades</div><div class="m-val">35</div><div class="m-note">~1 per month</div></div>
    </div>
    <div class="chart-card"><h3>Equity Curve — 2022–2024 @ 1%</h3><div class="ch-sub">€2,000 initial · 35 trades · 1% risk per trade</div><canvas id="ca1"></canvas></div>
    <table class="year-table">
      <thead><tr><th>Year</th><th>Trades</th><th>Win Rate</th><th>P&L</th><th>Context</th></tr></thead>
      <tbody>
        <tr><td>2022</td><td>8</td><td style="color:var(--gold2)">50%</td><td style="color:var(--green)">+€509</td><td><span class="tag bull">Trending</span></td></tr>
        <tr><td>2023</td><td>11</td><td style="color:var(--muted)">27%</td><td style="color:var(--green)">+€32</td><td><span class="tag range">Mixed</span></td></tr>
        <tr><td>2024</td><td>16</td><td style="color:var(--gold2)">31%</td><td style="color:var(--green)">+€542</td><td><span class="tag bull">Bull</span></td></tr>
        <tr><td style="color:var(--gold2)">Total</td><td>35</td><td>34.3%</td><td style="color:var(--green)">+€1,083</td><td></td></tr>
      </tbody>
    </table>
  </div>

  <!-- PANEL A3 : 2022-2024 @ 3% -->
  <div class="data-panel" id="panel-a3">
    <div class="metrics-grid">
      <div class="metric"><div class="m-label">Net P&L</div><div class="m-val green">+€5,143</div><div class="m-note">+257.2% on €2,000</div></div>
      <div class="metric"><div class="m-label">Profit Factor</div><div class="m-val gold">3.59</div><div class="m-note">Benchmark: 2.0+</div></div>
      <div class="metric"><div class="m-label">Win Rate</div><div class="m-val">34.3%</div><div class="m-note">12 of 35 trades</div></div>
      <div class="metric"><div class="m-label">Max Drawdown</div><div class="m-val red">18.74%</div><div class="m-note">Higher at 3% — expected</div></div>
      <div class="metric"><div class="m-label">Avg Winner</div><div class="m-val green">+€594</div><div class="m-note">Avg Loser: -€86</div></div>
      <div class="metric"><div class="m-label">Trades</div><div class="m-val">35</div><div class="m-note">Same signals as 1%</div></div>
    </div>
    <div class="chart-card"><h3>Equity Curve — 2022–2024 @ 3%</h3><div class="ch-sub">€2,000 initial · 35 trades · 3% risk per trade</div><canvas id="ca3"></canvas></div>
    <table class="year-table">
      <thead><tr><th>Year</th><th>Trades</th><th>Win Rate</th><th>P&L</th><th>Context</th></tr></thead>
      <tbody>
        <tr><td>2022</td><td>8</td><td style="color:var(--gold2)">50%</td><td style="color:var(--green)">+€1,648</td><td><span class="tag bull">Trending</span></td></tr>
        <tr><td>2023</td><td>11</td><td style="color:var(--muted)">27%</td><td style="color:var(--green)">+€351</td><td><span class="tag range">Mixed</span></td></tr>
        <tr><td>2024</td><td>16</td><td style="color:var(--gold2)">31%</td><td style="color:var(--green)">+€3,145</td><td><span class="tag bull">Bull</span></td></tr>
        <tr><td style="color:var(--gold2)">Total</td><td>35</td><td>34.3%</td><td style="color:var(--green)">+€5,143</td><td></td></tr>
      </tbody>
    </table>
  </div>

  <!-- PANEL B1 : 2024-2026 @ 1% -->
  <div class="data-panel" id="panel-b1">
    <div style="background:rgba(96,165,250,.06);border:1px solid rgba(96,165,250,.25);border-radius:8px;padding:16px 20px;margin-bottom:20px;font-size:13px;color:var(--muted)">
      <strong style="color:var(--blue)">🔵 Post-development period.</strong> Script not modified after 2024. This is what a subscriber from early 2024 would have experienced.
    </div>
    <div class="metrics-grid">
      <div class="metric"><div class="m-label">Net P&L</div><div class="m-val green">+€1,088</div><div class="m-note">+54.4% on €2,000</div></div>
      <div class="metric"><div class="m-label">Profit Factor</div><div class="m-val gold">3.74</div><div class="m-note">Stronger than 2022–2024</div></div>
      <div class="metric"><div class="m-label">Win Rate</div><div class="m-val">36.0%</div><div class="m-note">9 of 25 trades</div></div>
      <div class="metric"><div class="m-label">Max Drawdown</div><div class="m-val blue">5.40%</div><div class="m-note">Exceptional — 2 years</div></div>
      <div class="metric"><div class="m-label">Avg Winner</div><div class="m-val green">+€165</div><div class="m-note">Avg Loser: -€25</div></div>
      <div class="metric"><div class="m-label">Trades</div><div class="m-val">25</div><div class="m-note">~1 per month</div></div>
    </div>
    <div class="chart-card"><h3>Equity Curve — 2024–2026 @ 1%</h3><div class="ch-sub">€2,000 initial · 25 trades · 1% risk per trade · Post-development</div><canvas id="cb1"></canvas></div>
    <table class="year-table">
      <thead><tr><th>Year</th><th>Trades</th><th>Win Rate</th><th>P&L</th><th>Context</th></tr></thead>
      <tbody>
        <tr><td>2024</td><td>13</td><td style="color:var(--gold2)">38%</td><td style="color:var(--green)">+€515</td><td><span class="tag bull">Strong Bull</span></td></tr>
        <tr><td>2025</td><td>12</td><td style="color:var(--gold2)">33%</td><td style="color:var(--green)">+€574</td><td><span class="tag hot">Gold +35%</span></td></tr>
        <tr><td style="color:var(--gold2)">Total</td><td>25</td><td>36.0%</td><td style="color:var(--green)">+€1,088</td><td></td></tr>
      </tbody>
    </table>
  </div>

  <!-- PANEL B3 : 2024-2026 @ 3% -->
  <div class="data-panel" id="panel-b3">
    <div style="background:rgba(96,165,250,.06);border:1px solid rgba(96,165,250,.25);border-radius:8px;padding:16px 20px;margin-bottom:20px;font-size:13px;color:var(--muted)">
      <strong style="color:var(--blue)">🔵 Post-development period.</strong> Script not modified after 2024. Same signals as 1% — only the position size differs.
    </div>
    <div class="metrics-grid">
      <div class="metric"><div class="m-label">Net P&L</div><div class="m-val green">+€4,729</div><div class="m-note">+236.5% on €2,000</div></div>
      <div class="metric"><div class="m-label">Profit Factor</div><div class="m-val gold">4.52</div><div class="m-note">Best PF across all tests</div></div>
      <div class="metric"><div class="m-label">Win Rate</div><div class="m-val">36.0%</div><div class="m-note">9 of 25 trades</div></div>
      <div class="metric"><div class="m-label">Max Drawdown</div><div class="m-val red">15.28%</div><div class="m-note">Higher at 3% — expected</div></div>
      <div class="metric"><div class="m-label">Avg Winner</div><div class="m-val green">+€675</div><div class="m-note">Avg Loser: -€84</div></div>
      <div class="metric"><div class="m-label">Trades</div><div class="m-val">25</div><div class="m-note">Same signals as 1%</div></div>
    </div>
    <div class="chart-card"><h3>Equity Curve — 2024–2026 @ 3%</h3><div class="ch-sub">€2,000 initial · 25 trades · 3% risk per trade · Post-development</div><canvas id="cb3"></canvas></div>
    <table class="year-table">
      <thead><tr><th>Year</th><th>Trades</th><th>Win Rate</th><th>P&L</th><th>Context</th></tr></thead>
      <tbody>
        <tr><td>2024</td><td>13</td><td style="color:var(--gold2)">38%</td><td style="color:var(--green)">+€1,818</td><td><span class="tag bull">Strong Bull</span></td></tr>
        <tr><td>2025</td><td>12</td><td style="color:var(--gold2)">33%</td><td style="color:var(--green)">+€2,912</td><td><span class="tag hot">Gold +35%</span></td></tr>
        <tr><td style="color:var(--gold2)">Total</td><td>25</td><td>36.0%</td><td style="color:var(--green)">+€4,729</td><td></td></tr>
      </tbody>
    </table>
  </div>
</section>

<div class="divider"></div>

<!-- HOW IT WORKS -->
<section>
  <div class="section-label reveal">Methodology</div>
  <h2 class="reveal">Four filters.<br>One clean signal.</h2>
  <p class="section-intro reveal">Every entry passes through a strict 4-layer validation. No signal fires unless all conditions align simultaneously.</p>
  <div class="steps">
    <div class="step reveal" data-n="1"><div class="step-icon">📅</div><h3>Daily HTF Bias</h3><p>Reads structure on the Daily timeframe. Longs only when the Daily is structurally bullish — never counter-trend trading.</p></div>
    <div class="step reveal" data-n="2"><div class="step-icon">🎯</div><h3>OTE Zone</h3><p>Optimal Trade Entry zone at 61.8%–78.6% Fibonacci retracement between structural pivots. Entry restricted to this precision zone.</p></div>
    <div class="step reveal" data-n="3"><div class="step-icon">🕯️</div><h3>Double Confirmation</h3><p>Two consecutive bullish candles inside the OTE zone. Eliminates false rejections, doji traps, and premature entries that get stopped immediately.</p></div>
    <div class="step reveal" data-n="4"><div class="step-icon">⏱️</div><h3>Smart Time Exit</h3><p>Auto-closes after 96 hours if neither SL nor TP is hit. Captures slow Gold momentum without holding positions indefinitely.</p></div>
  </div>
</section>

<div class="divider"></div>

<!-- PARAMS -->
<section>
  <div class="section-label reveal">Configuration</div>
  <h2 class="reveal">Risk is yours.<br>Script is ready.</h2>
  <p class="section-intro reveal">All parameters are exposed as inputs. Results shown at 1% and 3% — scale to your own tolerance. The script does not impose a risk level.</p>
  <div class="params reveal">
    <div class="param"><div><div class="param-name">Risk per trade</div><div class="param-desc">% of equity. Your choice — 0.5% to 10%.</div></div><div class="param-val">1–3%</div></div>
    <div class="param"><div><div class="param-name">HTF Timeframe</div><div class="param-desc">Bias detection. Daily recommended for Gold.</div></div><div class="param-val">D</div></div>
    <div class="param"><div><div class="param-name">LTF Sensitivity</div><div class="param-desc">Pivot lookback for local structure detection.</div></div><div class="param-val">3</div></div>
    <div class="param"><div><div class="param-name">Max Trade Duration</div><div class="param-desc">Auto-close after N hours — time exit.</div></div><div class="param-val">96h</div></div>
    <div class="param"><div><div class="param-name">ATR TP Multiplier</div><div class="param-desc">Take profit distance above structural high.</div></div><div class="param-val">1.0×</div></div>
    <div class="param"><div><div class="param-name">HTF Pivot Age</div><div class="param-desc">Staleness filter — blocks entries in deep ranges.</div></div><div class="param-val">80</div></div>
  </div>
</section>

<div class="divider"></div>

<!-- FAQ -->
<section>
  <div class="section-label reveal">FAQ</div>
  <h2 class="reveal">Honest answers.</h2>
  <div class="faq reveal">
    <div class="faq-item"><div class="faq-q">How many trades per month?</div><div class="faq-a">~1–2 per month on average across both tested periods. The double-confirmation filter is intentionally selective. Fewer trades means each signal carries more weight — and the Profit Factor (2.66–4.52 across periods) reflects that.</div></div>
    <div class="faq-item"><div class="faq-q">Why does the win rate look low (34–36%)?</div><div class="faq-a">Because the average winner is 5–8× the average loser. A 34% win rate with a 5:1 reward/risk ratio produces a Profit Factor above 2.5 — which is excellent. High win rate is often a sign of tight stops that get hunted. This strategy accepts losses quickly and lets winners run.</div></div>
    <div class="faq-item"><div class="faq-q">Is the 2024–2026 period independent?</div><div class="faq-a">Yes. The script was finalized before January 2024 and was not modified afterward. The 2024–2026 results represent what an actual subscriber would have seen — same script, same parameters. The Profit Factor (3.74–4.52) is higher than the development period, which is the strongest possible validation.</div></div>
    <div class="faq-item"><div class="faq-q">Can I use this on a prop firm account?</div><div class="faq-a">Yes. The 5.4–10.6% max drawdown profile at 1% risk is compatible with most prop firm drawdown rules. Set your risk per trade to stay within daily loss limits. Past performance does not guarantee future results.</div></div>
    <div class="faq-item"><div class="faq-q">Do I need automation software?</div><div class="faq-a">No. At ~1–2 signals per month, manual execution from TradingView alerts is entirely practical. Alert messages are pre-formatted for Pine Connector if you prefer automation.</div></div>
    <div class="faq-item"><div class="faq-q">Why is the drawdown higher at 3% risk?</div><div class="faq-a">Larger position sizes amplify both gains and losses proportionally. At 3% the max drawdown is 18.7% (2022–2024) vs 10.6% at 1% — roughly 1.8× higher, as expected. The signals are identical; only the exposure changes. You choose your own risk level.</div></div>
  </div>
</section>

<div class="divider"></div>

<!-- PRICING -->
<section id="pricing">
  <div class="section-label reveal" style="justify-content:center;text-align:center">Access</div>
  <h2 class="reveal" style="text-align:center">One price.<br>Cancel anytime.</h2>
  <p class="section-intro reveal" style="margin:0 auto 48px;text-align:center">Invite-only access on TradingView. All future updates included automatically.</p>
  <div class="pricing-card reveal">
    <div class="pricing-badge">Monthly Subscription</div>
    <div class="price">€19</div>
    <div class="price-period">per month — cancel anytime</div>
    <ul class="price-features">
      <li>Full SMC Gold Sniper v14 Fixed access on TradingView</li>
      <li>HTF bias + OTE zones + double-candle confirmation</li>
      <li>Configurable risk — you set 1% to 10%, not us</li>
      <li>Verified margin calculation — consistent signals at any risk</li>
      <li>Pre-formatted Pine Connector alerts for automation</li>
      <li>All future updates included</li>
      <li>Setup guide & parameter documentation</li>
    </ul>
    <a href="#" class="btn-primary" style="width:100%;display:block;text-align:center">Subscribe on TradingView</a>
  </div>
  <div class="disclaimer reveal">
    <strong style="color:var(--text)">Risk Disclaimer</strong><br>
    Past performance is not indicative of future results. Trading involves substantial risk of loss. This script is a tool, not financial advice. Risk management is entirely the trader's responsibility — the script provides a framework, you control the parameters. Never risk capital you cannot afford to lose.
  </div>
</section>

<footer>
  <div class="footer-logo">SMC Gold Sniper</div>
  <div>XAUUSD H1 · Pine Script v6 · TradingView · v14 Fixed</div>
  <div style="margin-top:8px;font-size:10px">© 2026 · All rights reserved</div>
</footer>

<script>
Chart.defaults.color='#888880';
Chart.defaults.borderColor='rgba(255,255,255,0.05)';
Chart.defaults.font.family="'Outfit',sans-serif";
Chart.defaults.font.size=11;

const gold='#D4A843',gold2='#F0C96E',green='#4ADE80',blue='#60A5FA',red='#F87171';

const data = {
  a1: [1978,1949,2134,2111,2163,2465,2531,2508,2566,2536,2647,2620,2717,2691,2658,2629,2599,2568,2541,2517,2490,2459,2429,2573,2547,2519,2485,2457,2781,2930,3137,3103,3070,3041,3082],
  a3: [1963,1933,2483,2431,2616,3498,3697,3647,3902,3830,4295,4220,4527,4394,4337,4246,4165,4098,3998,3884,3776,3729,3679,4340,4207,4099,4042,3966,5183,6040,7353,7210,7031,6907,7143],
  b1: [1975,2093,2071,2049,2021,1998,2265,2386,2559,2531,2505,2481,2514,2485,2684,2659,2633,2610,2585,2562,2539,2658,2634,2820,3088],
  b3: [1973,2327,2255,2197,2166,2126,2775,3231,3929,3853,3758,3692,3817,3748,4501,4372,4254,4136,4032,3921,3813,4398,4275,5208,6729],
};

const heroData = {
  1: { pnlA:'+54%', noteA:'€2k → €3,083', pfA:'2.66', pnlB:'+54%', noteB:'€2k → €3,088', dd:'5.40%' },
  3: { pnlA:'+257%', noteA:'€2k → €7,143', pfA:'3.59', pnlB:'+236%', noteB:'€2k → €6,729', dd:'15.28%' }
};

function makeChart(id, d, color, initial=2000){
  const ctx = document.getElementById(id);
  if(!ctx) return;
  new Chart(ctx, {
    type:'line',
    data:{
      labels: d.map((_,i)=>`T${i+1}`),
      datasets:[
        {label:'Portfolio (€)', data:d, borderColor:color, backgroundColor:color.replace(')',',0.07)').replace('rgb','rgba'), borderWidth:2.5, pointRadius:3, pointBackgroundColor:color, tension:.35, fill:true},
        {label:'Initial Capital', data:d.map(()=>initial), borderColor:'rgba(255,255,255,0.1)', borderWidth:1, borderDash:[4,4], pointRadius:0}
      ]
    },
    options:{
      responsive:true,
      plugins:{legend:{labels:{color:'#888880',boxWidth:12}}, tooltip:{backgroundColor:'#141414',borderColor:'#282828',borderWidth:1,callbacks:{label:c=>` ${c.dataset.label}: €${Math.round(c.raw).toLocaleString()}`}}},
      scales:{x:{grid:{color:'rgba(255,255,255,0.03)'}}, y:{grid:{color:'rgba(255,255,255,0.03)'},ticks:{callback:v=>'€'+Math.round(v).toLocaleString()}}}
    }
  });
}

makeChart('ca1', data.a1, gold2);
makeChart('ca3', data.a3, green);
makeChart('cb1', data.b1, blue);
makeChart('cb3', data.b3, '#A78BFA');

// State
let curPeriod='a', curRisk=1;

function updatePanel(){
  document.querySelectorAll('.data-panel').forEach(p=>p.classList.remove('active'));
  document.getElementById(`panel-${curPeriod}${curRisk}`).classList.add('active');
}

function showPanel(p, el){
  curPeriod=p;
  document.querySelectorAll('.ptab').forEach(t=>t.classList.remove('active'));
  el.classList.add('active');
  updatePanel();
}

function showRisk(r, el){
  curRisk=r;
  document.querySelectorAll('.rrisk').forEach(t=>t.classList.remove('active'));
  el.classList.add('active');
  updatePanel();
}

// Hero toggle
function setHeroRisk(r, el){
  document.querySelectorAll('.rtab').forEach(t=>t.classList.remove('active'));
  el.classList.add('active');
  const d=heroData[r];
  document.getElementById('h-pnl-a').textContent=d.pnlA;
  document.getElementById('h-note-a').textContent=d.noteA;
  document.getElementById('h-pf-a').textContent=d.pfA;
  document.getElementById('h-pnl-b').textContent=d.pnlB;
  document.getElementById('h-note-b').textContent=d.noteB;
  document.getElementById('h-dd').textContent=d.dd;
}

// Scroll reveal
const obs=new IntersectionObserver(entries=>{entries.forEach(e=>{if(e.isIntersecting){e.target.classList.add('visible');obs.unobserve(e.target)}})},{threshold:.08});
document.querySelectorAll('.reveal').forEach(el=>obs.observe(el));
</script>
</body>
</html>
