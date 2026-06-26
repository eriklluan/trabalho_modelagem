# Arquitetura da solução

A solução foi modelada com uma visão arquitetural que separa o fluxo principal do sistema das operações assíncronas, como notificações e análise pedagógica.

## Escolha arquitetural

Foi adotada uma arquitetura híbrida, combinando:

- camadas para o fluxo principal do sistema;
- eventos para operações que não precisam bloquear a experiência do usuário.

Essa abordagem foi escolhida porque o MVP precisa ser claro e simples, mas também precisa suportar processos como notificação e análise posterior sem sobrecarregar o fluxo principal.

## Componentes principais

- Interface web para professores, estudantes e coordenadores.
- API para regras de negócio, validações e autorização.
- Banco de dados relacional para armazenar turmas, atividades, entregas e avaliações.
- Fila de eventos para desacoplar ações como publicação e correção.
- Módulo de análise e notificações para execução assíncrona.

## Por que essa estrutura faz sentido?

Ela permite representar a solução de forma coerente com o BPMN e o UML, mantendo a arquitetura alinhada às regras de negócio e à lógica do processo.
