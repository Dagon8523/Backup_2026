class SurveyWidget extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: "open" });
    this.data = [];
  }

  onCustomWidgetAfterUpdate(changedProperties) {
    if (changedProperties.data) {
      try {
        this.data = JSON.parse(this.data);
      } catch (e) {
        this.data = [];
      }
    }
    this.render();
  }

  // 🔢 Procesamiento de datos
  processData() {
    const escala = this.escala || "1-5";
    const values = escala === "1-5" ? [1,2,3,4,5] : [0,1,2,3,4,5,6,7,8,9,10];

    let counts = {};
    values.forEach(v => counts[v] = 0);

    this.data.forEach(v => {
      if (counts[v] !== undefined) counts[v]++;
    });

    const total = this.data.length || 1;

    let percentages = {};
    values.forEach(v => {
      percentages[v] = (counts[v] / total) * 100;
    });

    // 📊 TTB
    let ttb = 0;
    if (escala === "1-5") {
      ttb = ((counts[4] + counts[5]) / total) * 100;
    } else {
      ttb = ((counts[9] + counts[10]) / total) * 100;
    }

    // 📊 NPS
    let promotores = 0, detractores = 0;
    if (escala === "0-10") {
      promotores = ((counts[9] + counts[10]) / total) * 100;
      detractores = ((counts[0] + counts[1] + counts[2] + counts[3] + counts[4] + counts[5] + counts[6]) / total) * 100;
    }

    const nps = promotores - detractores;

    return { values, percentages, ttb, nps };
  }

  getColor(value, escala) {
    if (escala === "1-5") {
      if (value <= 2) return "#e74c3c";
      if (value === 3) return "#f1c40f";
      return "#2ecc71";
    } else {
      if (value <= 6) return "#e74c3c";
      if (value <= 8) return "#f1c40f";
      return "#2ecc71";
    }
  }

  render() {
    const { values, percentages, ttb, nps } = this.processData();

    this.shadowRoot.innerHTML = `
      <style>
        :host {
          font-family: Arial, sans-serif;
          display: block;
          padding: 10px;
        }
        .container {
          background: #fff;
          border-radius: 8px;
          padding: 15px;
        }
        h3 {
          margin-bottom: 10px;
        }
        .bar {
          display: flex;
          align-items: center;
          margin: 5px 0;
        }
        .label {
          width: 30px;
        }
        .bar-fill {
          height: 18px;
          border-radius: 4px;
        }
        .percentage {
          margin-left: 8px;
          font-size: 12px;
        }
        .kpi {
          margin-top: 15px;
          font-size: 18px;
          font-weight: bold;
        }
      </style>

      <div class="container">
        <h3>${this.titulo}</h3>

        ${values.map(v => `
          <div class="bar">
            <div class="label">${v}</div>
            <div class="bar-fill" style="
              width:${percentages[v]}%;
              background:${this.getColor(v, this.escala)};
            "></div>
            <div class="percentage">${percentages[v].toFixed(1)}%</div>
          </div>
        `).join("")}

        ${this.mostrarTTB ? `
          <div class="kpi">TTB: ${ttb.toFixed(1)}%</div>
        ` : ""}

        ${this.mostrarNPS ? `
          <div class="kpi">NPS: ${nps.toFixed(1)}</div>
        ` : ""}
      </div>
    `;
  }
}

customElements.define("survey-widget", SurveyWidget);