# API-REST-HORSE-AND-REACT
<h1>
Project under construction
</h1>

<h2>
Middleware Used in Projetct
</h2>
horse/json ✔️	
<br>
horse/cors✔️	 
<br>
horse/stream✔️	    
<br>
horse/jwt✔️	    
<br>
horse/exception✔️	   
<br>
horse/logger✔️	    
<br>
horse/compression✔️	
<br>
viniciussanchez/dataset-serialize ✔️	
</h2>
<br>
<br>
Construção de projeto full stack utilizando Delphi(Horse-back) e React(Client-Front);
<br>
Será feito um sistema completo com CRUD e Report;
<br><br>
Implementação da lógica de conexão com o banco de dados através de uma DLL, permitindo a configuração flexível dos parâmetros de conexão. 
Esta DLL será utilizada para facilitar e centralizar a gestão de conexões em projetos que necessitam interagir com o banco de dados.
<br>

![image](https://github.com/lucasdefreitasroberto/API_Horse_React/assets/68399974/7a5af962-7bfc-4f2f-b9bf-77a08dce6f0c)

<h2>Front-End</h2>

## Inicialização do front-end ( ./front-end )

Instale as dependências necessárias:

```shell
npm install
```

Inicie a aplicação:

```shell
npm start
```

![image](https://github.com/lucasdefreitasroberto/API_Horse_React/assets/68399974/8f7bdb4e-fd23-4064-b52b-46798843f168)



<h2>Back-End</h2>

## Inicialização do back-end ( ./back-end )

Instale as dependências necessárias:

```shell
boss install
```

Configuração dos parâmetros do banco de dados por meio da DLL:
![image](https://github.com/lucasdefreitasroberto/API_Horse_React/assets/68399974/07ae0fbf-69ec-4ae8-8923-b0bfc9d6c7e2)
```shell
Execute o projeto localizado em API_Horse_React\DLL connection\DLL.Connection.dproj
Especifique os parâmetros de configuração conforme sua preferência.
```

Atualizando DLL:
```shell
Compile o projeto DLL e, em seguida, mova a DLL atualizada para a pasta do executável.
API_Horse_React\back\Win32\Debug
```

Inicie a aplicação:

```shell
Compile o projeto backend e de Start na aplicação
```
![image](https://github.com/lucasdefreitasroberto/api-with-horse-and-react/assets/68399974/136ae2eb-bd98-40c4-8561-fff9ef439f53)

Teste de rota: 

![image](https://github.com/lucasdefreitasroberto/API_Horse_React/assets/68399974/4fe333fd-ed60-4715-ba31-d02e5cb98dec)
```shell
Você pode clicar no ícone do computador para abrir a rota /dev no navegador.
Se você receber o JSON { "nome": "Lucas De Freitas Roberto" }, significa que a API já está em execução.
```

## **Bibliotecas de Terceiros**

## Back-end:

**Dependecias:**

	"github.com/arvanus/horse-exception-logger": "^0.0.5",
	"github.com/hashload/handle-exception": "^0.1.9",
	"github.com/hashload/horse": "^3.1.5",
	"github.com/hashload/horse-basic-auth": "^1.2.3",
	"github.com/hashload/horse-cors": "^1.0.6",
	"github.com/hashload/horse-jwt": "^2.0.14",
	"github.com/hashload/horse-logger": "^2.0.7",
	"github.com/hashload/jhonson": "^1.1.8",
	"github.com/viniciussanchez/dataset-serialize": "^v2.5.6"


## Front-end

**Dependências:**

	"@testing-library/jest-dom": "^5.16.5",
	"@testing-library/react": "^13.4.0",
	"@testing-library/user-event": "^13.5.0",
	"axios": "^1.4.0",
	"react": "^18.2.0",
	"react-dom": "^18.2.0",
	"react-scripts": "5.0.1",
	"web-vitals": "^2.1.4"
