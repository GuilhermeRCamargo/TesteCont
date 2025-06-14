# 📦 API de Consulta de Endereço por CEP

Este repositório contém uma API simples desenvolvida em Delphi XE 12, capaz de consultar informações completas de um endereço com base em um **CEP (Código de Endereçamento Postal)** brasileiro.

---

## 🔹 Método Disponível

### `function GetEndereco(const ACEP: String): TJSONObject`

---

### 📘 Descrição

O método `GetEndereco` consulta e retorna os dados completos de um endereço a partir do CEP informado. É ideal para sistemas que precisam preencher automaticamente formulários ou validar dados de localização.

---

### 📥 Parâmetros

| Nome   | Tipo    | Obrigatório | Descrição                                                  |
|--------|---------|-------------|-------------------------------------------------------------|
| `ACEP` | `String`| Sim         | CEP a ser consultado. Deve conter apenas números (sem traços). |

---

### 📤 Retorno

Retorna um objeto JSON contendo os dados do endereço. Em caso de erro ou CEP inexistente, retorna um JSON vazio ou um erro HTTP apropriado.

#### Exemplo de resposta:

```json
{
    "ACEP": "87010360",
    "result": {
        "bairro": "Zona 02",
        "cep": "87010360",
        "cidade": "Maringá",
        "complemento": "",
        "dDD": "44",
        "distrito": "",
        "estado": "PR",
        "ibge": "4115200",
        "gia": "",
        "latitude": "-23.4301129",
        "localidade": "",
        "logradouro": "Rua Estácio de Sá",
        "longitude": "-51.932658",
        "regiao": "",
        "siafi": "",
        "tipoLogradouro": "",
        "uf": "PR",
        "unidade": ""
    }
}
```
## 🧱 Padrões de Projeto e Organização

Este projeto adota uma arquitetura **modular e em camadas**, com separação clara de responsabilidades entre os componentes. A estrutura foi inspirada em boas práticas de Clean Architecture e MVC, adaptadas ao contexto do Delphi com DataSnap.

---

## 👩‍💻 Guia para Desenvolvedores

- **Adicionar um novo provedor de CEP?**  
  Crie uma nova unit no diretório `provider/endereco/` e implemente a interface `IEnderecoProvider`.

- **Deseja expor uma nova funcionalidade no servidor?**  
  Crie um método em `ServerMethods.pas` e use `TJSONObject` para entrada/saída.

- **Criar um novo modelo de dados?**  
  Crie a classe em `model/entities/` e implemente os métodos `FromJSON` e `ToJSON`.

---
