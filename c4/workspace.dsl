workspace "Sistema de Gestao de Sala de Aula Online" "Modelo C4 nivel 1 e nivel 2" {
    model {
        estudante = person "Estudante" "Acessa turmas, atividades e acompanha notas."
        professor = person "Professor" "Cria turmas, publica atividades e corrige entregas."
        coordenador = person "Coordenador" "Acompanha indicadores e apoia decisoes academicas."
        administrador = person "Administrador" "Gerencia usuarios e permissoes institucionais."

        classroom = softwareSystem "Plataforma Classroom" "Gestao de turmas, atividades e avaliacoes." {
            web = container "Aplicacao Web" "Interface para usuarios do sistema." "React/HTML/CSS/JS"
            api = container "API Backend" "Regras de negocio e integracoes." "Node.js/Java" {
                authComponent = component "Autenticacao" "Login, tokens e sessoes." "Componente"
                authzComponent = component "Autorizacao" "Validacao de permissoes (RBAC)." "Componente"
                turmasComponent = component "Turmas" "CRUD e matriculas de turmas." "Componente"
                atividadesComponent = component "Atividades" "Publicacao e gestao de atividades." "Componente"
                entregasComponent = component "Entregas" "Submissao e validacao de entregas." "Componente"
                avaliacoesComponent = component "Avaliacoes" "Notas, feedback e resultados." "Componente"
                notificacoesComponent = component "Notificacoes" "Publicacao de eventos de dominio." "Componente"
                auditComponent = component "Auditoria" "Registro de auditoria e logs (criação/atualização/exclusão de entidades críticas)." "Componente"
            }
            database = container "Banco de Dados" "Usuarios, turmas, atividades, entregas e notas." "PostgreSQL" {
                tags "Database"
            }
            fileStorage = container "Storage Arquivos" "Anexos e arquivos de entregas." "Object Storage"
            eventQueue = container "Fila de Eventos" "Eventos de dominio assincronos." "RabbitMQ/SQS"
            notificationWorker = container "Worker Notificacoes" "Processamento de notificacoes." "Background Worker"
            analytics = container "Analise Pedagogica" "Indicadores e sugestoes de apoio." "Servico interno"
        }

        auth = softwareSystem "Servico Autenticacao" "Login e validacao de identidade."
        email = softwareSystem "Servico E-mail" "Envio de notificacoes."

        estudante -> web "Usa"
        professor -> web "Usa"
        coordenador -> web "Consulta indicadores e sugestoes"
        administrador -> web "Administra"

        web -> api "Consome API HTTPS/JSON"
        
        # Relacoes entre componentes internos da API
        web -> authComponent "Autentica usuarios"
        web -> turmasComponent "Gerencia turmas"
        web -> atividadesComponent "Gerencia atividades"
        web -> entregasComponent "Submete entregas"
        web -> avaliacoesComponent "Consulta notas"
        
        authComponent -> auth "Valida credenciais"
        authComponent -> database "Le dados de usuarios"
        authzComponent -> database "Consulta permissoes"
        turmasComponent -> database "CRUD de turmas"
        turmasComponent -> authzComponent "Valida permissoes"
        atividadesComponent -> database "CRUD de atividades"
        atividadesComponent -> authzComponent "Valida permissoes"
        atividadesComponent -> fileStorage "Upload de anexos"
        atividadesComponent -> eventQueue "Publica evento AtividadePublicada"
        entregasComponent -> database "Registra entregas"
        entregasComponent -> fileStorage "Upload de arquivos"
        entregasComponent -> eventQueue "Publica evento EntregaRealizada"
        entregasComponent -> auditComponent "Registra auditoria de envio de entrega"
        avaliacoesComponent -> database "Registra notas"
        avaliacoesComponent -> eventQueue "Publica evento AvaliacaoLiberada"
        avaliacoesComponent -> auditComponent "Registra auditoria de notas e liberacao"
        notificacoesComponent -> eventQueue "Consome eventos de dominio"
        atividadesComponent -> auditComponent "Registra auditoria de publicacao de atividade"
        
        api -> auth "Valida login e tokens"
        api -> database "Le e grava dados"
        api -> fileStorage "Envia e recupera anexos"
        api -> eventQueue "Publica eventos de dominio"
        api -> auditComponent "Centraliza gravação de logs de auditoria"
        notificationWorker -> eventQueue "Consome eventos de notificacao"
        notificationWorker -> email "Envia mensagens"
        notificationWorker -> database "Consulta destinatarios e eventos"
        auditComponent -> database "Grava eventos de auditoria"
        api -> analytics "Solicita indicadores e sugestoes"
        analytics -> eventQueue "Consome eventos pedagogicos"
        analytics -> database "Le historico academico"
    }

    views {
        systemContext classroom "C4_Contexto" {
            include *
            autolayout tb 100 100
            title "C4 Nivel 1 - Contexto"
            description "Usuarios e sistemas externos da Plataforma Classroom."
        }

        container classroom "C4_Containers" {
            include *
            autolayout tb 120 120
            title "C4 Nivel 2 - Containers"
            description "Principais containers da solucao."
        }

        component api "C4_Componentes_API" {
            include *
            autolayout tb 100 100
            title "C4 Nivel 3 - Componentes da API"
            description "Componentes internos da API Backend."
        }

        styles {
            element "Person" {
                shape Person
                background #08427B
                color #FFFFFF
                fontSize 22
                width 400
                height 400
            }
            element "Software System" {
                background #1168BD
                color #FFFFFF
                fontSize 20
                width 450
                height 300
            }
            element "Container" {
                background #438DD5
                color #FFFFFF
                fontSize 18
                width 400
                height 280
            }
            element "Component" {
                background #85BBF0
                color #000000
                fontSize 16
                width 350
                height 220
            }
            element "Database" {
                shape Cylinder
            }
        }
    }
}