---
marp: true
theme: gaia
_class: lead
paginate: true
backgroundColor: #fff
backgroundImage: url('https://marp.app/assets/hero-background.svg')
---

# **Banco de dados**
#### Felipe Marx Benghi
fbenghi@gmail.com

---

# Objetivos
[  ] Apresentação do plano de aulas da disciplina (Ementa)
[  ] Combinados
[  ] Ferramentas para disciplina
[  ] Conscientização sobre ética, segurança, autenticação, integridade e responsabilidade dos dados (LGPD).

---
# Sugestões de sites e leituras
* Bibliografia
[Livro - Database Design (full)](https://opentextbc.ca/dbdesign01/front-matter/about-the-book/)
[Geeks for Geeks](https://www.geeksforgeeks.org/introduction-of-dbms-database-management-system-set-1/?ref=lbp)

* Open datasets
    [Google Data Search](https://datasetsearch.research.google.com/)
    [Kaggle](https://www.kaggle.com/datasets)

---
# Ferramentas 
## MySQL Workbench
https://dev.mysql.com/downloads/workbench/

## Visual Code (opcional)
https://code.visualstudio.com/
### Extensions
[Marp](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode) Cria uma presentação com Markdown

---

# Lei Geral de Proteção dos Dados (LGPD)
* Objetivo: proteger dados pessoais
* Obrigatória desde 01/08/2021

---
## Dados pessoais
> Dados pessoais são informações sobre uma pessoa física identificada ou identificável

Exemplos:
* Dados de funcionários
* Dados de clientes
* Dados do fornecedor
* Dados agregados (para análise)
* Dados médicos

---
## Identificador Direto ou Indireto
Um dado pessoal pode ser:
* Identificador Direto 
    * Aplicável a uma pessoa
    * Ex. CPF, **Pelé**

* Identificador Indireto
    * Aplicável possivelmente a mais de uma pessoa
    * Data de nascimento, Endereço de IP, nacionalidade
**Importante: vários identificadores indiretos podem se tornar um identificador direto.**

---
## Dados Confidenciais
Dados (identificadores indiretos) que apresentam maior risco aos **direitos** dos indivíduos.

* Exemplo: vida sexual ou orientação sexual, dados genéticos, opiniões políticas, dados biométricos, crenças religiosas, origem racial ou étnica

Normalmente é necessário ter consentimento para armazenamento de tais dados

---

## Agentes de processamento
Precisam estar em conformidade com a LGPD (independentemente da localização), agentes que:
1. Processam dados pessoais no Brasil
1. Coletam dados pessoais no Brasil ou de indivíduos no Brasil
1. Oferecem bens ou serviços a indivíduos no Brasil

Agentes de processamento devem: manter registros de quais dados armazenam, do que pode ser removido e do que pode ser destruído.

<!--
---
### Anonimização vs pseudonimização
* Dados Anonimizados: não podem ser vinculados a um indivíduo identificável

* Dados Pseudonimizados:a identificação é mantida  separadamente de outros dados
-->
---
## Direitos dos titulares (Gratuitos, adequados e imediato)
Titulares têm o direito a:
* Avisos de privacidade - ser informados sobre quais dados foram coletados e com quem são compartilhados.
* Portabilidade - mediante solicitação, os dados podem ser transferidos e devem estar em formato legível.
* Exclusão - dados podem ser mantidos por motivos legais ou regulatórios.
* Correção dados incompletos, imprecisos ou desatualizados.


---
## E eu com isso...
Um administrador do Banco de Dados precisa garantir que o sistema está de acordo com a LGPD!

Administradores de Banco de dados têm acesso a mais dados do que usuários normais!

---

![bg](_img/image.png)

---
# Conceitos Básicos
## Dados
Fatos que podem ser gravados e tem um significado implícito
Exemplos: Nomes, telefones, email, dia do nascimento

---
## Banco de dados (Database)
* Conjunto de Dados que se relacionam
* Possui alguma fonte em comum de onde os dados são derivados, algum grau de interação com eventos do mundo real, e uma audiência interessada nos seu conteúdo 

--- 

## Persistência
* A persistência de dados é a garantia de que um dado foi salvo e que poderá ser recuperado quando necessário no futuro
* São registros permanentes e que não são perdidos quando há o encerramento da sessão
Exemplo de sistemas para persistência de dados: Livros, Arquivos (físicos e digitais), Banco de dados  

--- 
# Persistência de dados em Arquivos
Forma clássica de armazenamento de dados. Funciona, mas:
* Permite redundância / mais de uma instância de um atributo
<!--- 
Problemas:
Inconsistência no formato / organização dos dados nos arquivos
Mesma informação armazenada em lugares diferentes
Mesma informação diferente
-->
* Não garante integridade /permite dados (in)corretos e (in)consistentes
<!--- 
Dados precisam seguir certos padrões:
    Como tipo (número, texto)
    Intervalo (mínimo ou máximo) - Ex. 30 de fevereiro
    Tamanho máximo - Ex. 50 caracteres
-->
* Sem isolação / uma modificação é imediatamente visível
<!--- 
Alguém querendo ler o dado, enquanto a escrita ainda não foi terminada
-->
   
* Com problemas de segurança
<!--- 
Sem proteção para quem pode ler / escrever ou controle de acesso
-->
* Sem acesso concorrente
<!--
Só uma pessoa pode escrever num arquivo ao mesmo tempo
-->
---
# Solução:
![](https://i.imgflip.com/hb9zb.jpg)

---
## Evolução dos Banco de Dados
<div class="mermaid">
timeline
    1960:  Popularização de computadores
    1970 : SQL Language
         : Edgar Codd 
         :  A Relational Model of Data for Large Shared Data Banks)
    1980 : Popularização dos Bancos de Dados
         : Google
    1995 : MySQL     
    2000s : NoSQL
    2010s : Big Data
</div>

<!--
MYSQL:
An open-sourced relational database management system (RDBMS)
    According to a Stack Overflow survey in 2020, MySQL is being used by 55.6% of the survey participants, making it the most popular database in the world
    
    MySQL is the DBMS behind some of the top websites and web-based applications in the world, including Airbnb, Uber, LinkedIn, Facebook, Twitter, and YouTube (https://www.oracle.com/database/what-is-database/#link4)
-->

<!--
NoSQL - not only SQL
    NoSQL databases came about as a response to the growth of the internet and the need for faster speed and processing of unstructured data. Today, cloud databases and self-driving databases are breaking new ground when it comes to how data is collected, stored, managed, and utilized
-->

<!--
    Big Data
        Describe a large volume of data that is too large or complex to be dealt with by traditional data-processing application software
        3Vs 
            Data that contains greater Variety
            Arriving in increasing Volumes 
            With more Velocity

        Example
            Posts, tweets, images, and video clips
-->
---