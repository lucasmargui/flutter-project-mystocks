
<div align="center">

# Projeto MyStock #

</div>
<br>

 
<div align="center">

## Main 

</div>

------------------------------------

O arquivo "main.dart" é onde você configura e define toda a estrutura inicial do aplicativo, incluindo a definição da árvore de widgets que compõem a interface do usuário, a definição de rotas de navegação e qualquer lógica de inicialização necessária para o seu aplicativo.

<details>
  <summary>Clique para mostrar detalhes sobre "main.dart" </summary>
  
------------------------------------

<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/8d9af620-4a09-46ca-9a06-2536b0af23f6" style="width:90%">

</div>


<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/f9d5646e-b433-47b5-add1-c771e2884425" style="width:90%">
</div>

<hr>

- WidgetsFlutterBinding.ensureInitialized() : Este método garante que os widgets do Flutter estejam inicializados antes de qualquer outra operação. É uma etapa importante, especialmente quando se trabalha com APIs assíncronas, como Firebase.
  
- setupDependencies() : Esta função é chamada para configurar as dependências do aplicativo. Isso pode incluir a configuração de serviços, instanciando objetos ou qualquer outra inicialização necessária antes de iniciar o aplicativo.Neste caso estamos inicializando os controllers,services e repositories registrados através do pacote instalado getIt, podendo acessar essas classes e suas propriedades de qualquer parte da aplicação
  
</details>

------------------------------------

<br>
<div align="center">

## App

</div> 

------------------------------------
Define a estrutura básica do aplicativo, incluindo configurações de tema, rotas e associações de widgets para cada rota específica. Ele organiza o fluxo do aplicativo e define como cada tela deve ser construída e exibida.

<details>
  <summary>Clique para mostrar detalhes sobre "app.dart"</summary>
 
------------------------------------

<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/87837e0b-ebd4-4070-a6a4-3ca4c3428d6d" style="width:90%">

</div>

<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/ae6d8af8-bed4-40e8-8ca0-d3347212bdb0" style="width:90%">

</div>


 Cada rota nomeada é mapeada para um widget correspondente, como OnboardingPage, SplashPage, SignUpPage, etc. O aplicativo usa rotas nomeadas para navegar entre diferentes telas ou páginas. Além disso, a rota "transaction" recebe argumentos, que são usados para passar informações adicionais para a página TransactionPage. Esse argumento passado é para identificar se uma transaction foi passada, se sim significa que estamos editando uma transaction da lista "GenerateTransactionList.transactions" se não, está sendo adicionado uma nova transaction a lista "GenerateTransactionList.transactions".

</details>

------------------------------------
<br>
<div align="center">

## Locator

</div>

------------------------------------
Define um contêiner de injeção de dependência usando GetIt e configura uma implementação específica . Isso permite que, por exemplo, a classe AuthService seja facilmente substituível por outras implementações sem modificar o código do cliente, promovendo a modularidade e a testabilidade do aplicativo.

<details>
  <summary>Clique para mostrar detalhes sobre "locator.dart"</summary>

------------------------------------

<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/1b8478b9-4900-4c77-94bc-69cddb76028d" style="width:90%">

</div>

<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/a40cd655-6878-4383-a2ea-98ad9e0c3bdb" style="width:90%">

</div>


<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/b655b80a-2621-45de-bf64-e1d944872487" style="width:90%">

</div>

Configura e inicializa um gerenciador de dependências utilizando a biblioteca GetIt. Ele define um objeto chamado "locator" como uma instância do GetIt.

Em seguida, há uma função chamada "setupDependencies()" que registra diferentes tipos de serviços e controladores no "locator" e é chamada na inicialização de main.dart:

------------------------------------

- AuthService é registrado como um singleton preguiçoso (lazy singleton) usando registerLazySingleton. Isso significa que uma única instância de AuthService será criada e compartilhada sempre que necessário.

  ------------------------------------

- SecureStorageService, UserDataService, SplashController, SignInController, SignUpController, TransactionRepository, HomeController e BalanceController são registrados como fábricas (factories) usando registerFactory. Isso significa que uma nova instância será criada sempre que uma dessas dependências for solicitada.

  ------------------------------------

- Algumas dependências, como UserDataService e HomeController, recebem parâmetros em seus construtores, que são resolvidos pelo GetIt usando outras dependências registradas anteriormente.


<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/02cca10f-17e5-4909-b4b0-5f0122e63269" style="width:90%">

</div>

A configuração do HomeController no locator inclui a injeção de dependência do TransactionRepositoryImpl. Isso permite que, ao registrar o HomeController, possamos usar o locator para recuperar o TransactionRepository previamente registrado. Dentro do HomeController, podemos então acessar todos os métodos definidos na implementação do TransactionRepository, ou seja, no TransactionRepositoryImpl.


<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/3f65a7e7-1808-4bde-9a6c-823ad07b3c97" style="width:90%">

</div>

</details>


------------------------------------
<br>
<div align="center">

## Common

</div>

------------------------------------

Contém funcionalidades ou recursos compartilhados que são utilizados em diferentes partes do projeto. Evitando a duplicação de código e centralizando funcionalidades que são frequentemente usadas em várias partes da aplicação.



<details>
  <summary>Clique para mostrar detalhes sobre common</summary>

------------------------------------


### constants
Contém arquivos ou módulos que definem constantes ou valores fixos que são usados em diferentes partes do código. Essas constantes podem incluir valores como configurações, chaves de API, URLs, mensagens de erro, códigos de status HTTP e outras informações que são utilizadas em várias partes do sistema.


<details>
  <summary>Clique para mostrar detalhes sobre constants</summary>


------------------------------------

- app_colors.dart : Define uma classe chamada AppColors que contém várias constantes de cores usadas em um aplicativo.

  ------------------------------------
  
- app_text_styles.dart : Define uma classe chamada AppTextStyles que contém várias constantes de estilos de texto usadas em um aplicativo.

  ------------------------------------
  
- date.dart: Define  métodos de acesso a constantes relacionadas ao tempo

  ------------------------------------
  
- keys.dart: Define uma classe chamada Keys que contém constantes estáticas representando chaves usadas para testes de widgets em um aplicativo Flutter.

  ------------------------------------
  
- routes.dart : Define uma classe chamada NamedRoute. Essa classe define rotas nomeadas

  ------------------------------------
  
- constants.dart : um conjunto de declarações de exportação em um arquivo Dart

  

</details>


------------------------------------




### data
Diretório que contém um arquivo responsável por personalizar as exceções. Nesse diretório, você pode encontrar arquivos que definem classes de exceção personalizadas, lidam com o tratamento de exceções de maneira específica para o projeto ou fornecem funções para lidar com erros de forma mais granular.

<details>
  <summary>Clique para detalhes sobre data. </summary>

------------------------------------

- data_result.dart: define uma classe abstrata simples "DataResult" e suas duas implementações "_SuccessResult" e "_FailureResult". Usado para lidar com resultados que podem ser bem-sucedidos ou representar uma falha, e ele fornece uma maneira conveniente de trabalhar com esses resultados usando o método fold.

 <div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/7f062c07-a2f2-46cf-91ef-2367edd5d380" style="width:60%">
</div>

------------------------------------

- exceptions.dart: define uma hierarquia de exceções personalizadas
  
------------------------------------

- data : um conjunto de declarações de exportação em um arquivo Dart

</details>

------------------------------------

### extensions
Contém extensões ou complementos adicionais para o projeto principal. Essas extensões podem incluir funcionalidades adicionais, módulos específicos, plugins ou qualquer outro tipo de código que estenda ou aprimore o projeto principal de alguma forma.



<details>
  <summary>Clique para mostrar detalhes sobre extensions. </summary>
 
------------------------------------

- date_formatter.dart: Define uma extensão (extension) chamada DateTimeFormatter para a classe DateTime. Isso significa que todas as instâncias de DateTime terão acesso aos métodos definidos nessa extensão sem precisar modificar a classe DateTime original.

<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/f874225b-4686-4cf0-a4e7-356a65b6b7c3" style="width:60%">
</div>

  ------------------------------------

- page_controller_ext.dart: Define uma extensão para a classe PageController e uma enumeração chamada BottomAppBarItem destinada a uma barra de navegação na parte inferior (bottom navigation bar).

  ------------------------------------
  
- sizes.dart: Define uma classe Sizes que é responsável por ajudar na adaptação de tamanhos e layouts em diferentes dispositivos móveis e também define uma extensão para o tipo num (inteiros e doubles) que adiciona duas propriedades, w e h, para facilitar o cálculo e a adaptação de tamanhos em relação ao tamanho do dispositivo.

  ------------------------------------
  
- types_ext: A primeira extensão é chamada de BoolExt e estende a classe bool. Ela adiciona um método chamado toInt(), que converte um valor booleano em um inteiro. Se o valor booleano for verdadeiro, o método retorna 1; caso contrário, retorna 0. A segunda extensão é chamada de StringExt e estende a classe String. Ela adiciona três métodos:

  ------------------------------------

- extensions : um conjunto de declarações de exportação em um arquivo Dart


</details>  

------------------------------------

### features
 São armazenados os arquivos relacionados a funcionalidades específicas do sistema ou aplicação. Essas funcionalidades podem ser agrupadas em pastas ou módulos dentro do diretório "features", facilitando a organização e manutenção do código. Por serem funcionalidades que são utilizadas em diferentes partes do projeto são incluídas em commons

<details>
  <summary>Clique para mostrar detalhes sobre features. </summary>

------------------------------------

<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/950461f8-3b2f-4180-a091-ffad181d4be6" style="width:45%">

</div><br>

------------------------------------

#### balance


- balance_controller.dart: Encapsula uma classe denominada "BalanceController", a qual tem a responsabilidade de controlar o estado dos saldos financeiros em diversas partes da aplicação. Especificamente, esta classe abrange a lógica para a obtenção, cálculo e atualização desses saldos, os quais são baseados nas transações presentes na instância da classe "GenerateTransactionList().transactions". Esta última serve como uma simulação de um repositório de dados. No construtor da classe "BalanceController", é especificado um parâmetro "TransactionRepository transactionRepository", o qual é registrado por meio do "locator". Ao se utilizar o "locator" para recuperar uma instância de "BalanceController", o objeto registrado em "locator.dart" com "TransactionRepository" será retornado.

<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/f0c4187c-2dc6-4bd9-82db-1c395b848bde" style="width:45%">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/e95d7bdc-d8aa-439b-a4c8-81d6cdcce893" style="width:45%">
</div>


<div align="center">
<h3> Fluxo para acessar métodos através do controller </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/dd429985-95dd-4fed-8eb3-7c436e58feb4" style="width:100%">
</div>

  ------------------------------------

- ballance_state.dart: Classes que permitem modelar diferentes estados

<div align="center">
<h3> Fluxo dos estados </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/1cac6e6a-3150-41ab-9fad-3c4e47876c4f" style="width:75%">
</div>

  ------------------------------------

- balance : um conjunto de declarações de exportação em um arquivo Dart

  ------------------------------------

#### transaction



- trasaction_controller.dart : Encapsula uma classe denominada TransactionController onde os estados das transações são gerenciados centralmente e notificam os widgets interessados quando há mudanças. Ele também faz uso de repositórios (TransactionRepository) presentes na instância da classe "GenerateTransactionList().transactions" para interagir com os dados das transações e um serviço de armazenamento seguro (SecureStorageService) para lidar com a segurança dos dados sensíveis.
  
  ------------------------------------

<div align="center">
<h3> Fluxo para acessar métodos através do controller </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/43712960-3df2-48f2-8b5f-526a67ad4412" style="width:100%">
</div>

  ------------------------------------

- transaction_state.dart: Classes que permitem modelar diferentes estados

<div align="center">
<h3> Fluxo dos estados </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/b2d0092e-6dc7-403a-8f80-73571c2498fa" style="width:100%">
</div>

  ------------------------------------

- transaction.dart: um conjunto de declarações de exportação em um arquivo Dart


</details>

  ------------------------------------

### models
São armazenados os modelos de dados da aplicação. Esses modelos representam as entidades principais do sistema e definem a estrutura e o comportamento dos dados que serão manipulados pela aplicação.


<details>
  <summary>Clique para mostrar detalhes sobre models. </summary>

------------------------------------

- agreements_model.dart : Define AgreementsModel. Suas propriedades incluem um título (title), um caminho para o ativo (assetPath), e uma rota nomeada (namedRoute).

  ------------------------------------
  
- balances_model.dart :  Define BalancesModel e possui três propriedades: totalIncome, totalOutcome e totalBalance, que representam, respectivamente, o total de renda, o total de despesas e o saldo total.

  ------------------------------------
  
- transaction_model.dart : Define TransactionModel, e as propriedades utilizadas são description, category, value, date, status, createdAt, id, userId e syncStatus.

  ------------------------------------
  
- user_model.dart : Define  UserModel e possui as seguintes propriedades: id, name, email e password.

  ------------------------------------
   
- models.dart : um conjunto de declarações de exportação em um arquivo Dart


</details>

------------------------------------

### utils

Contém arquivos e módulos com funções auxiliares ou utilitárias que são utilizadas em diferentes partes do projeto. Essas funções podem incluir:


<details>
  <summary>Clique para mostrar detalhes sobre utils. </summary>

------------------------------------

- money_mask_controller.dart : Define uma classe chamada MoneyMaskedTextController, que é uma subclasse de TextEditingController. Essa classe é usada para controlar e formatar valores monetários em um campo de texto.

<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/d250f3d2-c76c-4b20-9eea-023264fd96f4" style="width:50%">
</div>

  ------------------------------------

- uppercase_text_formatter.dart : Esta classe é utilizada para formatar o texto inserido em um campo de entrada de texto para que todas as letras sejam convertidas para maiúsculas.
  
 <div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/3d4ade86-525a-452b-a7c2-74ac24d3b67a" style="width:50%">
</div>

  ------------------------------------

- validator.dart: Define uma classe chamada Validator com métodos estáticos para validar diferentes tipos de entrada, como nome, email, senha e confirmação de senha.

<div align="center">
    <h3> Validação de formulário </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/24ad355a-21ad-47e9-bcfd-d2325f14c39f" style="width:100%">
</div>

  ------------------------------------

- utils : um conjunto de declarações de exportação em um arquivo Dart


</details>

------------------------------------

### widgets

Contém componentes ou elementos de interface do usuário (UI) que são compartilhados e reutilizados em várias partes do projeto. Esses widgets podem incluir botões, campos de entrada, barras de progresso, ou qualquer outro elemento de interface que seja comum e utilizado em diferentes partes da aplicação.

<details>
  <summary>Clique para mostrar detalhes sobre widgets. </summary>

------------------------------------

- app_header.dart: Um componente que representa o cabeçalho da aplicação, geralmente contendo o logotipo, título e possivelmente botões de navegação.

  ------------------------------------

- base_page.dart: Uma página base que pode ser estendida por outras páginas para fornecer funcionalidades comuns, como a estrutura básica de layout e lógica de navegação.

  ------------------------------------

- custom_bottom_app_bar.dart: Uma barra de navegação inferior personalizada que pode conter ícones, texto e funcionalidades de navegação para diferentes partes da aplicação.

  ------------------------------------

- custom_bottom_sheet.dart: Um componente que exibe um painel inferior personalizado, geralmente usado para apresentar opções de ação adicionais ou informações contextuais.

  ------------------------------------

- custom_circular_progress_indicator.dart: Um indicador de progresso circular personalizado que pode ser usado para indicar carregamento ou processamento em segundo plano.

  ------------------------------------

- custom_snackbar.dart: Um componente personalizado para exibir mensagens temporárias na parte inferior da tela, geralmente usadas para fornecer feedback ao usuário sobre ações realizadas.

  ------------------------------------

- custom_text_form_field.dart: Um campo de formulário de texto personalizado que pode incluir validações, estilos e outras personalizações específicas.

  ------------------------------------

- custom_text_title.dart: Um componente de título de texto personalizado usado para títulos de seções, cabeçalhos de páginas, etc.

  ------------------------------------

- greetings.dart: Um componente que pode ser usado para exibir saudações personalizadas com base em diferentes condições, como a hora do dia ou o estado do usuário.

  ------------------------------------

- multi_text_button.dart: Um botão personalizado que pode exibir múltiplas linhas de texto e possivelmente ícones, usado para ações específicas na aplicação.

  ------------------------------------

- notification_widget.dart: Um componente que exibe notificações ou alertas para o usuário, como mensagens de erro, avisos ou confirmações.

  ------------------------------------

- password_form_field.dart: Um campo de formulário personalizado específico para entrada de senhas, geralmente incluindo funcionalidades de ocultação de texto e validação.

  ------------------------------------

- primary_button.dart: Um botão de destaque primário na aplicação, geralmente usado para ações principais ou de destaque.

  ------------------------------------

- transaction_listview.dart: Um componente que exibe uma lista de transações ou itens, com opções de filtragem, classificação e interações adicionais.

  ------------------------------------

- widgets.dart: Um arquivo de agregação que importa e exporta todos os widgets personalizados disponíveis na aplicação, facilitando o acesso e a utilização em outras partes do projeto.


</details>

</details>

------------------------------------
<br>
<div align="center">

## Features

</div>

------------------------------------

O diretório "features" é uma abordagem organizacional adaptando os princípios de "Flux Architecture", que divide a aplicação em três componentes principais: a visualização (page), o controlador (controller) e state
(estado)

<details>
  <summary>Clique para mostrar detalhes sobre features</summary>



------------------------------------

### home 

Página inicial da aplicação, onde os principais recursos e funcionalidades são exibidos ao usuário logo após o login.

<details>
  <summary>Clique para mostrar detalhes sobre home </summary>

------------------------------------

- home_controller.dart: Define HomeController, gerencia o estado e a lógica de negócios relacionados à tela inicial da aplicação, busca as transações do repositório, ordena-as e atualiza o estado da tela de acordo com o resultado da busca. Ele também fornece acesso aos dados das transações e ao controlador de página

  ------------------------------------

- home_page_view.dart: Define a estrutura e a lógica para a página principal de um aplicativo Flutter, integrando os diferentes componentes e controladores necessários para funcionalidades como navegação entre telas, adição de transações e exibição de informações.

    Quando floatingActionButton é pressionado, ele aguarda a navegação para a rota '/transaction' usando o Navigator.pushNamed. Após a navegação, ele verifica se o resultado retornado não é nulo. Dependendo da página atual do PageController, diferentes métodos dos controladores (homeController, statsController, walletController e balanceController) são chamados para atualizar os dados da aplicação
 
  <div align="center">
    <h3> PageController </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/7558867f-174f-44c7-b8be-76522365cafa" style="width:70%">
</div><br>

  ------------------------------------

- home_page.dart: A HomePage estabelece comunicação com controladores HomeController e BalanceController, para a obtenção de dados, como transações e saldos. Essa comunicação ocorre por meio da invocação dos métodos _homeController.getAllTransactions() e _balanceController.getBalances() durante a fase de inicialização (initState).

    Posteriormente, os dados obtidos são utilizados em diferentes partes da interface. O BalanceCardWidget é configurado para receber o _balanceController, permitindo assim o acesso e utilização dos dados de saldo. Por outro lado, o TransactionListView recebe as transações disponíveis através da propriedade _homeController.transactions, cujos valores são inicializados durante o initState.

  <div align="center">
    <h3> Controllers </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/a88aa315-3c31-4dbd-9b93-c5ec10ccf7c6" style="width:100%">
</div><br>


  ------------------------------------

- home_page.state: Classes que permitem modelar diferentes estados

  ------------------------------------

- home.dart : um conjunto de declarações de exportação em um arquivo Dart

  
</details>


------------------------------------

### onboarding: 

Página de introdução ou tutorial para novos usuários, fornecendo informações sobre como usar a aplicação e seus recursos.

<details>
  <summary>Clique para mostrar detalhes sobre onboarding. </summary>
 
------------------------------------

- onboarding_page.dart : Define a estrutura e o conteúdo básico de uma página de onboarding em um aplicativo.

  ------------------------------------
  
- onboarding.dart : um conjunto de declarações de exportação em um arquivo Dart. 

</details>

------------------------------------

### profile:

Página onde os usuários podem visualizar e editar suas informações pessoais e realizar logout.

<details>
  <summary>Clique para mostrar detalhes sobre profile</summary>
 
------------------------------------

- profile_controller.dart : Define o "controller" de perfil responsável por gerenciar o estado e as operações relacionadas ao perfil do usuário, como obter dados do usuário, atualizar o nome de usuário, atualizar a senha e excluir a conta.

  ------------------------------------

- profile_page.dart : A ProfilePage estabelece comunicação com controladores ProfileController, para a obtenção de dados do usuário. Essa comunicação ocorre por meio da invocação dos métodos _homeController.getUserData() durante a fase de inicialização (initState).


  <div align="center">
    <h3> Controllers </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/03a681f6-5b2b-455e-a02a-48dbae1b091b" style="width:100%">
</div><br>

  ------------------------------------

- profile_state.dart: Classes que permitem modelar diferentes estados

</details>

 ------------------------------------

### sign_in: 

Página de login onde os usuários inserem suas credenciais para acessar a aplicação.

<details>
  <summary>Clique para mostrar detalhes sobre sign_in </summary>

------------------------------------

- sign_in_controller.dart : Estrutura básica para gerenciar o estado e a lógica por trás da tela de login em um aplicativo Flutter, abordando os diferentes estados possíveis durante o processo de autenticação do usuário.

  ------------------------------------

- sign_in_page.dart : Uma página de login funcional com validação de entrada, processamento de login e tratamento de estados de carregamento, sucesso e erro. 


<div align="center">
    <h3> Controller </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/8803aada-9ba7-4379-b38c-4cae2cf1eb6a" style="width:100%">
</div><br>

Formulário: Form(key: _formKey) define um widget de formulário que pode ser referenciado e manipulado em outras partes do aplicativo, utilizando a chave _formKey para acessar e controlar seu estado. FormState é uma classe que mantém o estado do widget Form. 
Ele é usado para realizar ações como validar, salvar ou redefinir o estado do formulário.Ao usar _formKey, você pode acessar métodos e propriedades do FormState associado ao widget Form realizando validações de formulário, salvar dados ou redefinir o estado do formulário, entre outras operações.

<div align="center">
    <h3> Formulário </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/b2e4fd43-9a9c-4400-bfde-f509c809e804" style="width:60%">
</div><br>

  ------------------------------------

- sign_in_state.dart: Classes que permitem modelar diferentes estados

</details>

------------------------------------

### sign_up: 

Página de registro onde novos usuários podem criar uma conta na aplicação fornecendo informações como nome, e-mail, senha, etc.

<details>
  <summary>Clique para mostrar detalhes sobre sign_up </summary>

------------------------------------

- sign_up_controller.dart:  Estrutura básica para gerenciar o estado e a lógica por trás da tela de registro em um aplicativo Flutter, abordando os diferentes estados possíveis durante o processo de registro do usuário.

  ------------------------------------

- sign_up_page.dart: Uma página de registro funcional com validação de entrada, processamento de registro e tratamento de estados de carregamento, sucesso e erro. 

<div align="center">
    <h3> Controller </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/d4daab47-0284-41ac-9919-f0788a843e89" style="width:100%">
</div><br>

Formulário: Form(key: _formKey) define um widget de formulário que pode ser referenciado e manipulado em outras partes do aplicativo, utilizando a chave _formKey para acessar e controlar seu estado. FormState é uma classe que mantém o estado do widget Form. 
Ele é usado para realizar ações como validar, salvar ou redefinir o estado do formulário.Ao usar _formKey, você pode acessar métodos e propriedades do FormState associado ao widget Form realizando validações de formulário, salvar dados ou redefinir o estado do formulário, entre outras operações.

<div align="center">
    <h3> Formulário </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/b2e4fd43-9a9c-4400-bfde-f509c809e804" style="width:60%">
</div><br>

  ------------------------------------

- sign_up_state.dart: Classes que permitem modelar diferentes estados

</details>

------------------------------------

### splash: 

Página de introdução ou carregamento exibida brevemente ao iniciar a aplicação, geralmente contendo o logotipo e/ou nome da aplicação.

<details>
  <summary>Clique para mostrar detalhes sobre splash </summary>

------------------------------------

- splash_controller.dart: Estrutura básica para gerenciar o estado e a lógica por trás da tela de carregamento em um aplicativo Flutter, abordando os diferentes estados possíveis durante o processo de início do aplicativo.

  ------------------------------------
  
- splash_page.dart:  Fornece uma página de inicialização  funcional para o aplicativo, dando uma introdução visual e verificando o estado de login do usuário antes de redirecioná-lo para a tela apropriada.

<div align="center">
    <h3> Controller </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/d977a17d-33c2-43e7-b13b-80a06648fca4" style="width:100%">
</div><br>


  ------------------------------------
  
- splash_state.dart: Classes que permitem modelar diferentes estados

</details>

------------------------------------

### stats: 

Página onde são exibidas estatísticas, gráficos ou dados relevantes para o usuário, como estatísticas de uso, consumo, desempenho, etc.

<details>
  <summary>Clique para mostrar detalhes sobre stats </summary>

------------------------------------

- stats_controller.dart:  Responsável por gerenciar o estado e a lógica por trás das estatísticas em um aplicativo Flutter, oferecendo métodos para calcular e agrupar dados com base em diferentes períodos de tempo. 
  
  ------------------------------------

- stats_page.dart: Estrutura básica para gerenciar o estado e a lógica por trás da tela de estatísticas, abordando os diferentes estados possíveis durante o processo de início do aplicativo.

  <div align="center">
    <h3> Controller </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/36ce6047-2b4d-426e-aa2a-1e60e1e0863a" style="width:100%">
</div><br>


  ------------------------------------
  
- stats_state.dart: Classes que permitem modelar diferentes estados

 </details> 

 ------------------------------------

### transaction: 

Página onde os usuários podem visualizar e gerenciar suas transações financeiras, como pagamentos, transferências, depósitos, etc.

<details>
  <summary>Clique para mostrar detalhes sobre transaction </summary>

------------------------------------

- transaction_page.dart: Fornece uma interface para que os usuários adicionem ou editem transações financeiras, com validação de entrada de dados e manipulação de diferentes estados e eventos

<div align="center">
    <h3> Controller </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/471a6faf-d20d-4122-ae05-62ea001e4234" style="width:100%">
</div><br>


  ------------------------------------

- transaction_state: Classes que permitem modelar diferentes estados

 </details>

------------------------------------

### wallet: 

Página onde os usuários podem visualizar o saldo da sua carteira digital.

<details>
  <summary>Clique para mostrar detalhes sobre wallet </summary>

------------------------------------

- wallet_controller.dart: Responsável por gerenciar o estado da carteira e as interações com o repositório de transações.

  ------------------------------------
  
- wallet_page.dart: Pesponsável por exibir e gerenciar as transações e saldos da carteira do usuário, permitindo que ele navegue entre os meses e visualize suas atividades financeiras de forma conveniente.

<div align="center">
    <h3> Controller </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/29122770-0b35-4038-a00a-d84f76be3ca7" style="width:100%">
</div><br>

  ------------------------------------
  
- wallet_state.dart: Classes que permitem modelar diferentes estados
  
</details>

</details>


------------------------------------
<br>
<div align="center">

## Repositories

</div>

------------------------------------
Repositório é responsável por lidar com operações relacionadas a transações, como adicionar, atualizar, excluir e obter transações, bem como calcular saldos. Segue o padrão de repositório para gerenciar os dados de transações de forma abstrata e desacoplada da camada de interface do usuário.

<details>
  <summary>Clique para mostrar detalhes sobre repositories </summary>

------------------------------------

- transaction_repository.dart: Define uma interface chamada TransactionRepository, que descreve métodos para realizar operações relacionadas a transações financeiras.Essa interface fornece um contrato claro para interagir com os dados de transações no aplicativo, permitindo a implementação de repositórios de transações que se conectam a diferentes fontes de dados, como um banco de dados local, um serviço web ou o Firebase, por exemplo.

  ------------------------------------

- transaction_repository_impl.dart: Define uma classe chamada TransactionRepositoryImpl que implementa a interface TransactionRepository. Implementa um repositório de transações com métodos para adicionar, atualizar, excluir e recuperar transações do repositório de dados, garantindo que exceções sejam tratadas adequadamente durante o processo.
  Por meio da instanciação de um controlador correspondente à funcionalidade específica, fazemos uso do locator para criar ou recuperar uma instância de TransactionRepositoryImpl, permitindo assim o acesso e utilização de suas funções para manipulação de dados.




<div align="center">
    <h3> Lógica </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/94b5d6f3-535d-42a6-bff8-94d2042f261c" style="width:100%">
</div><br>



<div align="center">
    <h3> Lógica utilizando os controllers </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/cdbc5c5f-1e39-4395-a9c3-f304f2f09711" style="width:100%">
</div><br>

   No método locator.registerLazySingleton, foram empregadas duas abordagens para passar a classe TransactionRepositoryImpl. Uma delas utiliza o locator para localizar o TransactionRepository que já foi registrado anteriormente e que irá instanciar um TransactionRepositoryImpl. A outra abordagem envolve passar diretamente a classe TransactionRepositoryImpl para o registro.



  
<div align="center">
    <h3> Exemplo </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/c43fb53d-ad0a-4c6d-be69-6d0f3b660628" style="width:100%">
</div><br>

 
  ------------------------------------

- transaction_repository_list.dart:  Define uma classe que gera uma lista de transações fictícias, utilizando o padrão Singleton para garantir que apenas uma instância da classe seja criada e fornecendo um método conveniente para acessar essa instância. Essa lista pode ser útil para testes ou para preencher dados de exemplo em uma aplicação.


   class GenerateTransactionList { ... }: Aqui, estamos definindo uma classe chamada GenerateTransactionList. Esta classe é responsável por gerar uma lista de transações.
static final GenerateTransactionList _instance = GenerateTransactionList._internal();: Esta linha declara uma variável estática _instance que é do tipo GenerateTransactionList. A variável é marcada como final, o que significa que ela não pode ser modificada após ser inicializada. É inicializada com uma nova instância de GenerateTransactionList por meio do construtor privado _internal(), que será explicado na próxima linha.

    factory GenerateTransactionList() { return _instance; }: Este é um construtor de fábrica (factory constructor) que retorna uma instância de _instance. Quando o código chama GenerateTransactionList(), ele não cria uma nova instância da classe, mas sim retorna a mesma instância que foi criada anteriormente e atribuída a _instance. Isso garante que sempre haja apenas uma única instância de GenerateTransactionList em todo o programa, seguindo o padrão Singleton.

    GenerateTransactionList._internal();: Aqui, temos um construtor privado chamado _internal(). Ele é utilizado para garantir que a classe GenerateTransactionList só possa ser instanciada internamente, ou seja, apenas dentro da própria classe. Isso impede que outras partes do código criem novas instâncias da classe diretamente, forçando o uso do construtor de fábrica para obter a instância existente.


 </details>


------------------------------------
<br>
<div align="center">

## Services

</div>

------------------------------------
Service é responsável para agrupar classes e arquivos relacionados a serviços, como acesso a APIs, bancos de dados locais, gerenciamento de estado global e outras operações de lógica de negócios.


------------------------------------
<br>
<div align="center">

## Themes

</div>

------------------------------------
Themes é responsável em armazenar classes relacionados à definição de temas e estilos da aplicação.




















