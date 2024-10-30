<a name="readme-top"></a>

# 📗 Tabla de Contenidos

- [📖 Sobre el Proyecto](#about-project)
  - [🛠 Creada con](#built-with)
    - [Tech Stack](#tech-stack)
    - [Características claves](#key-features)
    - [Recursos](#resources)
- [💻 Live Link](#live-link)
- [💻 Para Empezar](#getting-started)
  - [Setup](#setup)
  - [Uso](#usage)
- [👥 Autores](#authors)
- [🔭 Características Futuras](#future-features)
- [🤝 Contribución](#contributing)
- [⭐️ Apoya mi trabajo](#support)
- [🙏 Reconocimientos](#acknowledgements)
- [📝 Licencia](#license)


# 📖 VitaWallet API <a name="about-project"></a>

**VitaWallet API** es una API Rest que permite realizar transacciones de compra o venta entre USD y BTC al precio actual del mercado, revisar la tasa de cambio del BTC/USD, consultar todas las transacciones de un usuario y consultar los detalles de una transacción.

Por favor, lee la <a href="https://documenter.getpostman.com/view/31013872/2sAY4vghqp">documentación</a> antes de usar la API.

## 🛠 Creada Con <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>
<details>
  <summary>BackEnd</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Rails</a></li>
    <li><a href="https://www.postman.com/">Postman</a></li>
  </ul>
</details>
<details>
  <summary>DataBase</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Características clave <a name="key-features"></a>

- **Un usuario se crea con un saldo inicial de BTC y/o USD**
- **Si tiene el saldo suficiente el usuario puede realizar transacciones**
- **El precio del bitcoin es obtenido mediante la API de CoinDesk**
- **Se especifica la moneda a enviar, la moneda a recibir y la cantidad a enviar, la cantidad a recibir se calcula automáticamente**

### Recursos <a name="resources"></a>
<ul>
<li><a href="https://api.coindesk.com/v1/bpi/currentprice.json">CoinDesk API</a></li>
<li><a href="https://lostisland.github.io/faraday/#/">Gema Faraday</a></li>
</ul>

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Live Link <a name="live-link"></a>
<a href="https://vitawalletapi.onrender.com">vitawalletapi.onrender.com/users</a>
<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 💻 Getting Started <a name="getting-started"></a>

Para obtener una copia local y ejecutar el proyecto, siga los siguientes pasos:

### Prerrequisitos

Para ejecutar este proyecto localmente necesitará:

Instalar Git, Ruby, Rails y PostgreSQL, si usa Linux, siga este [tutorial](https://www.theodinproject.com/guides/installations)

### Setup

Clonar el repositorio en el directorio de su elección:

```sh
  cd my-folder
  git clone git@github.com:danifromecuador/vitaWalletBackEnd.git
  cd vitaWallerBackEnd
```


### Uso

Para correr este proyecto, ejecute los siguientes comandos, presione Enter luego de cada línea 

```sh
  bundle install
  rails db:create
  rails s
```


Luego de eso el proyecto estará ejecutándose en el servidor local, abra el siguiente enlace en el navegador de su preferencia: [http://127.0.0.1:3000/users](http://127.0.0.1:3000/users
)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 👥 Autores <a name="authors"></a>

👤 **Dani Morillo**

- GitHub: [danifromecuador](https://github.com/danifromecuador)
- LinkedIn: [danifromec](https://www.linkedin.com/in/danifromec/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🔭 Características Futuras <a name="future-features"></a>

- **Se crearán los tests usando RSpec**
- **Se añadirán validaciones adicionales como cantidades máximas en User y Transaction**
- **Se creará un FrontEnd básico para consumir la API**
- **El precio del bitcoin se actualizará automáticamente y se mostrará en el FrontEnd**
- **Se autentificará la creación e inicio de sesión de los usuarios, con contraseña y correo de recuperación**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🤝 Contribuciones <a name="contributing"></a>

Si deseas contribuir, reportar issues o cualquier sugerencia, puedes hacerlo en la [issues page](https://github.com/danifromecuador/vitaWalletBackEnd/issues) de GitHub

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Apoya mi trabajo <a name="support"></a>

Si le gustó este proyecto, deme una estrella en [mi repo de GitHub](https://github.com/danifromecuador/plannywise)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Agradecimientos <a name="acknowledgements"></a>

Me gustaría agradecer a [César Valencia](https://www.linkedin.com/in/cesar-valencia-aguilar/) por el apoyo técnico y moral en este proyecto

También me gustaría agrader a [Julieta Clara](https://www.linkedin.com/in/julieta-clara-26b207296/) por la oportunidad de poner a prueba mis habilidades técnicas en back-end con esta prueba técnica

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 Licencia <a name="license"></a>

Este proyecto tiene licencia [MIT](./LICENSE)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
