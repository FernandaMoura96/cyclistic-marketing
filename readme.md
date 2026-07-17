# Cyclistic Bike-Share Analysis 🚴‍♂️

> **Estudo de Caso:** Como uma empresa de compartilhamento de bicicletas navega rumo ao sucesso rápido?

## Como os membros anuais e os ciclistas casuais usam as bicicletas da Cyclistic de forma diferente?

A equipe de marketing solicitou uma análise para diferenciar o perfil de cada tipo de usuário, a fim de definir qual a melhor estratégia para converter usuários casuais em assinantes.

Os dados vieram do sistema de coleta interno, com registro de mais de 423.000 viagens em um período de aproximadamente 90 dias (primeiro trimestre). Os dados foram limpos e validados em Excel, e as análises foram realizadas em SQL, com um banco de dados local.

A amostra continha a identificação de cada cliente, a identificação de cada viagem, e os nomes e códigos identificadores de cada estação, indicando o local de retirada e devolução do equipamento. Continha também data e hora de cada viagem, permitindo calcular a duração de cada trajeto.

---

##  Limpeza e Preparação dos Dados

**Google Sheets**

A limpeza e padronização dos dados foi realizada excluindo registros nulos e padronizando os campos de data e hora. Durante esse processo, foram identificadas duas inconsistências principais:

1. **Viagens com duração negativa** e **viagens com mais de 24 horas** (indicando bicicleta não devolvida — outlier de equipamento).
2. Ao investigar as viagens com duração negativa, identifiquei que **todas partiam da mesma estação: HQ QR**. Uma análise mais aprofundada revelou que essa estação era usada para testes internos — todas as corridas registradas ali tinham duração abaixo de 3 segundos, incluindo os valores negativos. Por se tratar de dados de teste (e não de viagens reais de usuários), os registros dessa estação foram descartados via filtro.

**SQLite**

O banco de dados (`divvy_trips.db`) foi estruturado a partir do dataset já limpo, com apoio do Claude (Anthropic) na etapa de construção do schema e das queries de carga — o processo de identificação dos outliers e a decisão de exclusão da estação de teste foram conduzidos manualmente na etapa de exploração dos dados.

---

##  Principais Descobertas (Insights)

**1. Assinantes dominam o volume, mas casuais ganham espaço conforme o trimestre avança.**
Do total de 423.010 viagens no período, 89,43% foram feitas por membros e apenas 10,57% por usuários casuais. No entanto, essa proporção não é estática: a participação casual cresceu de **5,41% em janeiro para 8,86% em fevereiro e 17,56% em março** — mais que triplicando ao longo do trimestre. Isso indica forte sensibilidade do usuário casual às condições climáticas, enquanto o membro mantém uso consistente independente da estação do ano.

**2. O padrão semanal confirma dois perfis de uso opostos.**
Usuários casuais concentram o uso no fim de semana: **domingo é disparado o dia de pico (14.880 viagens)**, quase o dobro do segundo colocado (sábado, 7.479), enquanto segunda-feira é o dia mais fraco (3.699). Já os membros mostram o padrão clássico de deslocamento: **terça-feira lidera (69.674 viagens)**, com uso elevado e estável de segunda a sexta, caindo nos fins de semana (domingo é o dia mais fraco, com 35.957).

**3. A geografia de uso aponta pontos físicos ideais para propaganda no local.**
O ranking das 50 estações mais usadas por cada tipo de usuário (disponível em arquivo separado) revela onde cada perfil se concentra fisicamente. Essas estações de alta frequência funcionam como pontos de contato natural: são locais onde o público-alvo já circula repetidamente, tornando a propaganda visual no próprio ponto (totens, banners, adesivos na doca) mais eficiente do que uma campanha dispersa pela cidade.

---

##  Recomendações Estratégicas

**1. Lance a campanha de conversão no início do ano, não no pico do verão.**
Como a participação casual mais que triplicou de janeiro (5,41%) para março (17,56%), o comportamento sugere que o usuário casual que já pedala mesmo no frio é um público mais engajado e mais propenso a virar assinante — ele não depende só do clima ideal para usar o serviço. Recomenda-se concentrar o orçamento de marketing digital em **janeiro e fevereiro**, com uma oferta de assinatura antecipada ("garanta seu passe anual antes do verão") mirando esse grupo de early adopters casuais, em vez de esperar o pico sazonal de março, quando o app já está lotado de usuários ocasionais sem intenção de fidelização.

**2. Crie uma oferta de assinatura "fim de semana" para converter o perfil de domingo.**
O pico de domingo entre casuais (14.880 viagens, quase o dobro do segundo colocado) mostra que esse grupo usa a bike por lazer, não por deslocamento — logo, o plano anual tradicional (pensado para uso diário de commute) não fala com essa necessidade. Recomenda-se testar um **plano de assinatura de fim de semana ou de uso limitado**, com preço mais baixo que o plano completo, para atrair quem já usa a bike aos domingos mas não vê valor em pagar por um plano de uso diário que não vai aproveitar.

**3. Instale propaganda visual segmentada nas estações de maior concentração casual.**
Com base no ranking das 50 estações mais usadas por usuários casuais, recomenda-se priorizar essas localidades para ações de mídia física — banners nas docas, adesivos nas bicicletas retiradas ali, ou totens informativos — com uma mensagem simples de conversão ("você já pedala aqui, que tal economizar com o plano anual?"). Como são estações de alto fluxo casual comprovado, o investimento em mídia física nesses pontos específicos tende a gerar mais retorno por real investido do que uma campanha de propaganda dispersa sem direcionamento geográfico.

---

##  Conclusão

Este estudo respondeu à pergunta central proposta pela equipe de marketing: **como usuários casuais e assinantes utilizam o serviço de forma diferente**. Os dados mostram que membros usam o serviço como parte da rotina — concentrando viagens em dias úteis, com padrão estável ao longo do trimestre — enquanto usuários casuais o utilizam predominantemente aos fins de semana, com forte sensibilidade sazonal e concentração em estações específicas.

A partir desses padrões, foram propostas três recomendações estratégicas — direcionadas a **quando** lançar a campanha, **qual produto** oferecer e **onde** posicionar a propaganda — todas fundamentadas nos dados analisados, não em suposições.

Como próximos passos, sugere-se validar essas recomendações com um teste piloto de baixo custo (ex: campanha localizada em 5 a 10 estações do ranking casual) antes de um rollout completo, além de acompanhar o percentual de conversão casual → membro nos meses seguintes ao lançamento para medir o real impacto das ações propostas.

---

##  Limitações do Estudo

- **Janela temporal restrita**: os dados cobrem apenas o primeiro trimestre (janeiro a março), um período de inverno em Chicago. O comportamento sazonal identificado — especialmente o crescimento da participação casual ao longo do trimestre — pode se acentuar ainda mais nos meses de primavera e verão, quando a demanda por lazer tende a aumentar. Recomenda-se replicar a análise com dados anuais completos para confirmar se o padrão se mantém ou se intensifica.

- **Ausência de dados demográficos**: a base não contém idade, gênero ou localização de residência dos usuários, o que limita a personalização das campanhas de marketing propostas. Uma segmentação mais precisa (por exemplo, direcionar anúncios por faixa etária) exigiria integração com dados de cadastro do usuário.

- **Causalidade não estabelecida**: as recomendações partem de correlações observadas nos padrões de uso (dia da semana, sazonalidade, estação). O estudo não testa diretamente se essas ações realmente aumentam a taxa de conversão — por isso a sugestão de um teste piloto antes do rollout completo.

- **Possíveis fatores externos não capturados**: clima diário, feriados e eventos locais (shows, maratonas) podem ter influenciado picos ou quedas específicas de uso que não foram isolados nesta análise.

---

##  Tecnologias e Ferramentas Utilizadas

- **Armazenamento e Manipulação:** Google Sheets / SQLite
- **Visualização de Dados:** Power BI

---

##  Autor

- **Fernanda Moura** - [LinkedIn](https://linkedin.com/in/fernanda-moura96)