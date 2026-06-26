# Entrega Individual - Erik Luan Lasch

Este repositório reúne a entrega individual de modelagem do projeto Helix LMS, com foco em BPMN, UML e C4. A ideia foi preservar o contexto da solução, as decisões principais e o porquê de cada representação, em vez de deixar apenas as imagens finais.

## Visão geral

O trabalho modela um sistema de gestão educacional para publicação de atividades, entrega de trabalhos, correção, feedback e acompanhamento acadêmico. A entrega foi organizada para mostrar não só o resultado final, mas também a lógica que levou à escolha de cada artefato.

## Artefatos principais

- [BPMN.png](BPMN.png) — fluxo principal de publicação, entrega e correção de atividades
- [UML.png](UML.png) — modelo conceitual e visão do domínio do sistema
- [C4.png](C4.png) — visão arquitetural do sistema em níveis de contexto e containers

## Por que cada modelo foi utilizado?

| Artefato | Objetivo | Por que foi escolhido |
|---|---|---|
| BPMN | Representar o processo de negócio | Permite mostrar claramente o fluxo de publicação, validações, prazos e correções |
| UML | Modelar o domínio e os casos de uso | Ajuda a representar entidades, relações, regras e comportamento do sistema |
| C4 | Explicar a arquitetura | Facilita a compreensão da estrutura do sistema, componentes e comunicação entre partes |

## Decisões principais

- A modelagem foi pensada para cobrir tanto o processo quanto a estrutura do sistema.
- A arquitetura foi organizada com foco em separação de responsabilidades, validações e evolução futura.
- As decisões foram escolhidas para manter a solução compreensível, coerente e alinhada com as regras de negócio.

## Regras de negócio representadas

- RN01: apenas professores vinculados podem publicar atividades
- RN02: entregas fora do prazo devem ser sinalizadas
- RN03: apenas professores vinculados podem acessar entregas
- RN06: notas devem respeitar a faixa de 0 a 10

## Estrutura do repositório

- [README.md](README.md) — visão geral da entrega
- [BPMN.png](BPMN.png) — diagrama BPMN final
- [UML.png](UML.png) — modelo UML final
- [C4.png](C4.png) — visão C4 final
- [docs/](docs/) — documentação resumida com decisões, justificativas e contexto

## Como usar esta entrega

1. Comece pelo BPMN para entender o fluxo do processo.
2. Em seguida, veja o UML para compreender o domínio.
3. Por fim, consulte o C4 para entender a arquitetura.

Essa organização foi pensada para deixar a entrega mais clara, mais didática e mais parecida com uma apresentação estrutural de projeto.
