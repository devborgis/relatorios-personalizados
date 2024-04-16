<!-- Logo -->
<p align="center">
  <img src="https://borgis.com.br/assets/imgs/logo-borgis.svg" alt="Logo Borgis" height="200" width="200">
</p>

<!-- Título -->
<h1 align="center">Borgis - Relatórios Personalizados</h1>

Esta aplicação foi idealizada para oferecer flexibilidade aos usuários de sistemas que não possuem um gerador de relatórios personalizados integrado, proporcionando acesso facilitado a informações diferenciadas não apenas para o usuário final de um sistema, mas também para aqueles que revendem sistemas e dependem de atualizações de software houses e solicitações que frequentemente podem demorar.

<div align="center">
  <!-- License -->
  <img src="https://img.shields.io/github/license/devborgis/relatorios-personalizados" alt="License">
  <!-- Version -->
  <img src="https://img.shields.io/github/v/release/devborgis/relatorios-personalizados?label=Version" alt="Version">
  <!-- Downloads -->
  <img src="https://img.shields.io/github/downloads/devborgis/relatorios-personalizados/total?label=Downloads" alt="Downloads">
  <!-- Contributors -->
  <img src="https://img.shields.io/github/contributors/devborgis/relatorios-personalizados?label=Contributors" alt="Contributors">
</div>

## Versão Compilada

A versão compilada do projeto, completa e pronta para uso imediato, não está disponível para download gratuito!

Entre em contato conosco para adquirir a aplicação pronta para uso. Estamos felizes em discutir opções de personalizações ou qualquer outra necessidade que você tenha.

## Começando

Estas instruções permitirão que você obtenha uma cópia do projeto em funcionamento em sua máquina local para fins de desenvolvimento e teste.

### Pré-requisitos

- IDE Delphi para as versões mais recentes e o Lazarus para as versões 1.0.0 e anteriores.
```
  - O projeto foi feito usando a versão 11 do Delphi; recomendo a mesma ou superior.
  - A versão em Lazarus foi feita com a versão 3.0 da IDE.
```

- FastReport 6.0
```
  - Os componentes do FastReport usados são da versão 6.0.
```

- JCL e JVCL
  ```
  - Alguns componentes visuais usam o JVCL; recomendo a versão 3.0 ou superior.
  ```

- Zeos Connection
  ```
  - Para a conexão com o banco de integração (terceiros), usamos o Zeos na versão 7.0 e superior.
  ```

### Compilação

Para a Compilação, todos os componentes acima mencionados são necessários.
```

 Com o Delphi instalado, faça o download desses pacotes e os configure. Após isso, crie um fork do projeto e uma branch em sua máquina local. Em seguida, é só abrir o arquivo `rlsBorgis.dproj` e compilar a aplicação.

 É necessário um banco de dados para integração para realizar as consultas em SQL no FastReport e imprimir os relatórios. Suportamos a versão 2.0 do Firebird.
```

## Executando os testes

Após compilar e ter a aplicação em funcionamento, abra a tela de relatórios e crie um novo relatório em "Adicionar" > "Editar .fr3" (é necessário conhecimento prévio em FastReport para edição e manipulação de relatórios).

Verifique a tela de cadastro de usuários.
```

Utilize em ambas as telas as opções de cadastro, exclusão, inclusão e adição para testes sólidos.
```

## Implantação

Para implantar a aplicação em um sistema de terceiros, basta agrupar o executável compilado e as pastas `.system` e `.integracao` em um lugar só (Ex C:Borgis) e fazer a ligação com o banco de dados no arquivo `conf`.

## Construído com

<p align="left">
  <img src="https://img.shields.io/badge/Delphi-E62431.svg?style=for-the-badge&logo=Delphi&logoColor=white" alt="Delphi" /> Delphi - IDE Utilizada a partir da versão 2.0.0
</p>
<p align="left">
  <img src="https://img.shields.io/badge/Lazarus-000000.svg?style=for-the-badge&logo=Lazarus&logoColor=white" alt="Lazarus" /> Lazarus - IDE Utilizada nas versões 1.0.1 e anteriores
</p>
<p align="left">
  <img src="https://img.shields.io/badge/GitHub-181717.svg?style=for-the-badge&logo=GitHub&logoColor=white" alt="GitHub" /> GitHub - Controle de código e versionamento
</p>

## Colaborando

Por favor, em caso de colaboração, abra um fork do projeto, faça as alterações de código necessárias e nos mande um Pull Request para análise.

## Licença

Este projeto está sob a licença APACHE 2.0 - veja o arquivo [LICENSE.md](https://github.com/devborgis/relatorios-personlizados/license.md) para detalhes.

## Contatos

- Email: contato@borgis.com.br
- Telefone: 16 9 93917443
- Site: [borgis.com.br](https://borgis.com.br)
