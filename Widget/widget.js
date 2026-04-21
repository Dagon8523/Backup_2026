class HelloWidget extends HTMLElement {

  constructor() {
    super();

    // Shadow DOM (aislamiento del widget)
    this.attachShadow({ mode: "open" });

    this.shadowRoot.innerHTML = `
      <style>
        .container {
          font-family: Arial;
          padding: 10px;
          background: #0a0a0a;
          color: white;
          border-radius: 8px;
          text-align: center;
        }
      </style>
      <div class="container">
        <span id="text">Cargando...</span>
      </div>
    `;
  }

  // Se ejecuta cuando el widget cambia propiedades
  onCustomWidgetAfterUpdate(changedProperties) {
    if ("text" in changedProperties) {
      this.shadowRoot.getElementById("text").textContent = this.text;
    }
  }
}

// Registrar el componente
customElements.define("com-ean-hello-widget", HelloWidget);