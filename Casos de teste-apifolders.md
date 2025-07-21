# Casos de Teste: API `/folders`

# Endpoint : `GET /folders` — Listar Pastas

### TC001 - Listar sem pastas cadastradas

* **Pré-condição:** Nenhuma pasta criada
* **Entrada:** GET /folders
* **Resultado Esperado:** Lista vazia (200 OK)
* **Status:**  Aprovado

### TC002 - Listar pastas cadastradas

* **Pré-condição:** Pastas previamente criadas
* **Entrada:** GET /folders
* **Resultado Esperado:** Lista com pastas existentes (200 OK)
* **Status:**  Aprovado

### TC003 - Listar grande quantidade de pastas

* **Pré-condição:** Muitas pastas criadas
* **Entrada:** GET /folders
* **Resultado Esperado:** Lista completa sem erros (200 OK)
* **Status:**  Aprovado

### TC004 - Validar exclusão de pasta

* **Pré-condição:** Pasta excluída por outro endpoint
* **Entrada:** GET /folders
* **Resultado Esperado:** Pasta não listada
* **Status:**  Aprovado

---

## Endpoint: `POST /folders` — Criar Pasta

### TC005 - Criar pasta normalmente

* **Entrada:** Nome simples
* **Resultado Esperado:** 201 Created
* **Status:**  Aprovado

### TC006 - Criar pasta com nome duplicado

* **Pré-condição:** Nome já utilizado anteriormente
* **Entrada:** Mesmo nome anterior
* **Resultado Esperado:** Pasta criada (201 Created)
* **Status:**  Aprovado
* **Observação:** Não há validação de duplicidade. **Ponto de melhoria**.

### TC007 - Nome com 255 caracteres

* **Entrada:** Nome com exatamente 255 caracteres
* **Resultado Esperado:** 201 Created
* **Status:**  Aprovado

### TC008 - Criar subpasta (com pasta pai)

* **Pré-condição:** Pasta pai já criada
* **Entrada:** Nome da subpasta + ID da pasta pai
* **Resultado Esperado:** 201 Created
* **Status:**  Aprovado
* **Observação:** Subpastas são criadas corretamente ao informar o ID do pai

#### Pontos de melhoria:

* Reduzir o limite de caracteres permitido
* Bloquear nomes duplicados

---

## Endpoint: `PUT /folders/{id}` — Atualizar Pasta

### TC009 - Atualização de nome com sucesso

* **Entrada:** Novo nome válido
* **Resultado Esperado:** 200 OK
* **Status:**  Aprovado

### TC010 - Tentar atualizar outro campo além do nome

* **Entrada:** Campo inválido
* **Resultado Esperado:** Erro de validação (400 Bad Request)
* **Resultado Obtido:** 502 Server Error
* **Status:**  Reprovado
* **Observação:** Não há tratativa para campos inválidos

### TC011 - Atualizar nome com caracteres excedentes

* **Entrada:** Nome > 255 caracteres
* **Resultado Esperado:** Erro tratado (422 Unprocessable Entity, por exemplo)
* **Resultado Obtido:** 502 Server Error
* **Status:**  Reprovado

### TC012 - Atualizar subpasta vinculada à pasta pai

* **Pré-condição:** Subpasta criada dentro de uma pasta pai
* **Entrada:** Novo nome válido para a subpasta
* **Resultado Esperado:** 200 OK
* **Status:**  Aprovado

#### Ponto de melhoria:

* Tratar erros 502 com mensagens amigáveis

---

## Endpoint: `DELETE /folders/{id}` — Excluir Pasta

### TC013 - Excluir pasta existente

* **Pré-condição:** Pasta criada previamente
* **Entrada:** ID da pasta
* **Resultado Esperado:** 204 No Content
* **Resultado Obtido:** 500 Internal Server Error
* **Status:**  Reprovado

### TC014 - Excluir pasta já removida

* **Pré-condição:** Pasta foi excluída anteriormente
* **Entrada:** ID da pasta excluída
* **Resultado Esperado:** 404 Not Found
* **Status:**  Aprovado

### TC015 - Excluir subpasta vinculada à pasta pai

* **Pré-condição:** Subpasta existente
* **Entrada:** ID da subpasta
* **Resultado Esperado:** 204 No Content
* **Resultado Obtido:** 500 Internal Server Error
* **Status:**  Reprovado

#### Bug Identificado:

Ao excluir pasta/subpasta, a API retorna **500**, mas a exclusão é realizada com sucesso.

#### Tratativa sugerida:

* Retornar **204** ou **200** com confirmação clara.
* O erro **500** não deve ocorrer em casos de sucesso.

---
