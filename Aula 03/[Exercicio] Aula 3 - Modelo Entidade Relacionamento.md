# **Banco de dados**
## Aula 03 - Modelo Entidade Relacionamento
Prof. Felipe Marx Benghi 

## Atividade prática:

1.  Considere o seguinte conjunto de requisitos para 
um banco de dados UNIVERSIDADE, que é usado para registrar os históricos dos alunos:
    * A universidade quer registrar o nome, número de aluno, número do CPF, endereço atual e com seu número de telefone fixo, data de nascimento, sexo, turma, departamento principal, departamento secundário (se houver) e programa de formação (graduação, mestrado, ..., doutorado) de cada aluno. Algumas aplicações precisam se referir à cidade, estado e CEP do endereço permanente do aluno e ao sobrenome do aluno. O número do CPF e o número de aluno possuem valores exclusivos para cada um deles.

    * Cada departamento é descrito por um nome, código de departamento, número de escritório, número de telefone comercial e faculdade. Nome e código possuem valores exclusivos para cada departamento.

    * Cada disciplina tem um nome, descrição, número de disciplina, número de horas por semestre, nível e departamento que oferece. O valor do número da disciplina é exclusivo para cada uma delas.
    
    * Cada turma tem um professor, semestre, ano, disciplina e número de turma. O número de turma distingue as turmas da mesma disciplina que são lecionadas durante o mesmo semestre/ano; seus valores são 1, 2, 3, ..., até o número de turmas lecionadas durante cada semestre.

    * Um relatório de notas tem um aluno, turma, nota com letra e nota numérica (0 A 10).

    Projete um esquema ER para essa aplicação e desenhe um diagrama ER para o esquema. Especifique os atributos de chave de cada tipo de entidade, e as restrições estruturais sobre cada tipo de relacionamento. Observe quaisquer requisitos não especificados e faça suposições apropriadas para tornar a especificação completa.

1. Considere o estudo de caso a seguir (este mesmo cenário será utilizado para todas as atividades):

    O hotel San Germain mantém o cadastro de seus clientes com RG, nome, telefone, sexo, endereço, data de nascimento e CPF (se brasileiro) ou número do passaporte (se estrangeiro). Os clientes podem reservar quartos do hotel para uma determinada data e por um período (quantidade de dias), diretamente na página eletrônica do hotel e caso queira, pode solicitar um quarto específico, mas sua aprovação dependerá da aprovação do gerente do hotel. As reservas podem ser canceladas com até 24 horas de antecedência, após esse período o cliente deverá pagar pela diária. Os quartos são cadastrados por número, andar, tipo, descrição e valor da diária. Para os quartos já ocupados pelos clientes, é mantida a data e hora de entrada e de saída do quarto, isto é, existe um registro diferenciado de quartos reservados e quartos ocupados. Para um cliente ficar cadastrado é suficiente que tenha feito uma reserva alguma vez embora não tenha ocupado efetivamente o quarto. Os clientes que ocupam um quarto do hotel podem solicitar determinador serviços que são registrados associados ao quarto ocupado para posterior cobrança.

    Os serviços oferecidos são:
    - Restaurante: onde fica armazenado o prato solicitado, quantidade e preço
    - Frigobar: item consumido, quantidade e preço
    - Massagem: data e hora da sessão, tipo da massagem, preço, descrição dos produtos utilizados

    Ao final de sua estadia, os itens de restaurante, frigobar, massagem e diárias são cobrados do hospede, permitindo pagamento com cartão de crédito/débito ou dinheiro. Cheque não é aceito. O controle de pagamento por cartão é realizado por um sistema externo que tem integração com o sistema do hotel.

    Caso o cliente faça o pagamento em dinheiro ele receberá um bônus de 20% em sua próxima estadia.

    Apenas o gerente do hotel pode emitir relatórios gerenciais: controle financeiro e controle de funcionários. Mas o gerente pode fazer as mesmas ações que o atendente da recepção.

    Para o estudo de caso apresentado, elabore o Modelo Conceitual gerando o Diagrama Entidade-Relacionamento, utilizando notação Chen.



