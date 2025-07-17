# Teste Prático 01

Realizadas as validações do folders como solicitado; criado as validações de testes e exportado em PDF (anexo);
Caso deseje visualizar os testes do Postman (opcional), criei uma documentação à parte;

Como rodar os testes no Postman passo a passo:

Crie uma conta na PandaVideo, vá em Configuração > Avançado > Gerar chave API.

No Postman:

Crie uma Collection;
Crie um endpoint GET com a URL https://api-v2.pandavideo.com.br/folders
Na aba Headers, na coluna Key informe "Authorization", na coluna Value informe o Token (chave da API).
Clique em Send e pronto, irá trazer a "Listar Pastas".

OBS: Para inserir o token no endpoint pode ser de duas maneiras:
1: pela forma acima
2: criando uma variável com nome token e informando a chave da API.

Para os demais endpoints, faça o mesmo processo acima, mas informando a funcionalidade deles, seja POST, PUT etc., e no Body > Raw > JSON informe:

{ "name": "informe o nome da pasta" }

Para os endpoints para testes de pasta PAI, será necessário informar o ID na URL.
Exemplo: https://api-v2.pandavideo.com.br/folders/41b05c5d-8d35-4c2f-836e-d1d8163f198e

Informando o ID você irá atualizar a pasta PAI específica que deseja.
No PUT, Criar Pasta é a mesma coisa se você desejar criar uma subpasta na pasta PAI criada anteriormente.

O ID da pasta que deseja utilizar será na URL do site PandaVideo.
Exemplo: https://dashboard.pandavideo.com.br/#/folders/682ac1c5-88fb-49c0-b6e2-3373e4d40122
ID: 682ac1c5-88fb-49c0-b6e2-3373e4d40122

OBS: Você pode criar uma variável também com esse ID para melhorar o visual.

Documentação de testes pelo Postman: https://documenter.getpostman.com/view/24380492/2sB34ijeeW

# Teste Prático 02

Realizado fluxo de automação com a ferramenta Robot Framework.

Realizar login no site
Validar o fluxo de adição de itens no carrinho
Validar todo o fluxo de compra até a finalização

Realizados os 3 fluxos solicitados acima, estão todos pelo GitHub.

Passo a passo de como realizei a automação:

Primeiramente deixar o ambiente local apropriado, com o driver do navegador que deseja realizar a automação;

Para essa automação utilizei o navegador Chrome: https://googlechromelabs.github.io/chrome-for-testing/
Após baixar o driver do navegador (precisa ser a mesma versão do Chrome que você utiliza)

Baixar o Python: https://www.python.org/downloads/

Utilizei a versão Python 8 que já tinha no meu computador;

Após isso, baixe as bibliotecas abaixo pelo terminal CMD:


pip install robotframework

pip install robotframework-seleniumlibrary

pip install webdriver-manager


Obs: É fundamental verificar se essas bibliotecas estejam baixadas devidamente.

Pronto, agora sim, pode rodar o código anexado, seja na ferramenta que deseja ou até no terminal.

Resultado da automação está todo pelo GitHub.
