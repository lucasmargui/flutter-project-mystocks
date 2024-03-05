<H1 align="center">Projeto MyStock</H1>
<p align="center">🚀 Desenvolvimento de um projeto contendo separação por funcionalidade, utilização do padrão MVC, modularização ,gerenciamento de estado e service pattern para referências futuras</p>

## Recursos Utilizados
- Flutter 3.3.5

<div align="center">
    <img src="" style="width:45%">

</div>

```
```

<details>
  <summary>Clique para mostrar documentação do projeto</summary>
  </details>


# Documentação


## main.dart

<details>
  <summary>Clique para mostrar detalhes sobre "main.dart" </summary>
  

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




## app.dart


<details>
  <summary>Clique para mostrar detalhes sobre "app.dart"</summary>


<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/87837e0b-ebd4-4070-a6a4-3ca4c3428d6d" style="width:90%">

</div>

<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/ae6d8af8-bed4-40e8-8ca0-d3347212bdb0" style="width:90%">

</div>


 Cada rota nomeada é mapeada para um widget correspondente, como OnboardingPage, SplashPage, SignUpPage, etc. O aplicativo usa rotas nomeadas para navegar entre diferentes telas ou páginas. Além disso, a rota "transaction" recebe argumentos, que são usados para passar informações adicionais para a página TransactionPage. Esse argumento passado é para identificar se uma transaction foi passada, se sim significa que estamos editando uma transaction da lista "GenerateTransactionList.transactions" se não, está sendo adicionado uma nova transaction a lista "GenerateTransactionList.transactions".

</details>

## locator.dart

<details>
  <summary>Clique para mostrar detalhes sobre "locator.dart"</summary>



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

- AuthService é registrado como um singleton preguiçoso (lazy singleton) usando registerLazySingleton. Isso significa que uma única instância de AuthService será criada e compartilhada sempre que necessário.

- SecureStorageService, UserDataService, SplashController, SignInController, SignUpController, TransactionRepository, HomeController e BalanceController são registrados como fábricas (factories) usando registerFactory. Isso significa que uma nova instância será criada sempre que uma dessas dependências for solicitada.

- Algumas dependências, como UserDataService e HomeController, recebem parâmetros em seus construtores, que são resolvidos pelo GetIt usando outras dependências registradas anteriormente.




<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/02cca10f-17e5-4909-b4b0-5f0122e63269" style="width:90%">

</div>

A configuração do HomeController no locator inclui a injeção de dependência do TransactionRepositoryImpl. Isso permite que, ao registrar o HomeController, possamos usar o locator para recuperar o TransactionRepository previamente registrado. Dentro do HomeController, podemos então acessar todos os métodos definidos na implementação do TransactionRepository, ou seja, no TransactionRepositoryImpl.


<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/3f65a7e7-1808-4bde-9a6c-823ad07b3c97" style="width:90%">

</div>

</details>



## Common
Contém funcionalidades ou recursos compartilhados que são utilizados em diferentes partes do projeto. Evitando a duplicação de código e centralizando funcionalidades que são frequentemente usadas em várias partes da aplicação.

### constants
Contém arquivos ou módulos que definem constantes ou valores fixos que são usados em diferentes partes do código. Essas constantes podem incluir valores como configurações, chaves de API, URLs, mensagens de erro, códigos de status HTTP e outras informações que são utilizadas em várias partes do sistema.

<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/34ddbbc0-2bdd-4375-8172-5234927ba702" style="width:90%">
</div>

- app_colors.dart : Define uma classe chamada AppColors que contém várias constantes de cores usadas em um aplicativo.
- app_text_styles.dart : Define uma classe chamada AppTextStyles que contém várias constantes de estilos de texto usadas em um aplicativo.
- date.dart: Define  métodos de acesso a constantes relacionadas ao tempo 
- keys.dart: Define uma classe chamada Keys que contém constantes estáticas representando chaves usadas para testes de widgets em um aplicativo Flutter. 
- routes.dart : Define uma classe chamada NamedRoute. Essa classe define rotas nomeadas 
- constants.dart : um conjunto de declarações de exportação em um arquivo Dart


### data
Diretório que contém um arquivo responsável por personalizar as exceções. Nesse diretório, você pode encontrar arquivos que definem classes de exceção personalizadas, lidam com o tratamento de exceções de maneira específica para o projeto ou fornecem funções para lidar com erros de forma mais granular.

- data_result.dart: define uma classe abstrata simples "DataResult" e suas duas implementações "_SuccessResult" e "_FailureResult". Usado para lidar com resultados que podem ser bem-sucedidos ou representar uma falha, e ele fornece uma maneira conveniente de trabalhar com esses resultados usando o método fold.

 <div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/7f062c07-a2f2-46cf-91ef-2367edd5d380" style="width:60%">
</div>

- exceptions.dart: define uma hierarquia de exceções personalizadas
- data : um conjunto de declarações de exportação em um arquivo Dart

### extensions
Contém extensões ou complementos adicionais para o projeto principal. Essas extensões podem incluir funcionalidades adicionais, módulos específicos, plugins ou qualquer outro tipo de código que estenda ou aprimore o projeto principal de alguma forma.


 <div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/e2dc6fa6-d0dd-4395-ad93-5c9d8bbe81df" style="width:60%">
</div>


- date_formatter.dart: Define uma extensão (extension) chamada DateTimeFormatter para a classe DateTime. Isso significa que todas as instâncias de DateTime terão acesso aos métodos definidos nessa extensão sem precisar modificar a classe DateTime original.

<div align="center">
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/f874225b-4686-4cf0-a4e7-356a65b6b7c3" style="width:60%">
</div>


- page_controller_ext.dart: Define uma extensão para a classe PageController e uma enumeração chamada BottomAppBarItem destinada a uma barra de navegação na parte inferior (bottom navigation bar).
- sizes.dart: Define uma classe Sizes que é responsável por ajudar na adaptação de tamanhos e layouts em diferentes dispositivos móveis e também define uma extensão para o tipo num (inteiros e doubles) que adiciona duas propriedades, w e h, para facilitar o cálculo e a adaptação de tamanhos em relação ao tamanho do dispositivo.
- types_ext: A primeira extensão é chamada de BoolExt e estende a classe bool. Ela adiciona um método chamado toInt(), que converte um valor booleano em um inteiro. Se o valor booleano for verdadeiro, o método retorna 1; caso contrário, retorna 0. A segunda extensão é chamada de StringExt e estende a classe String. Ela adiciona três métodos:
- extensions : um conjunto de declarações de exportação em um arquivo Dart


### features
 São armazenados os arquivos relacionados a funcionalidades específicas do sistema ou aplicação. Essas funcionalidades podem ser agrupadas em pastas ou módulos dentro do diretório "features", facilitando a organização e manutenção do código. Por serem funcionalidades que são utilizadas em diferentes partes do projeto são incluídas em commons

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

- ballance_state.dart: Classes que permitem modelar diferentes estados 
- balance : um conjunto de declarações de exportação em um arquivo Dart

#### transaction

- trasaction_controller.dart : Encapsula uma classe denominada TransactionController onde os estados das transações são gerenciados centralmente e notificam os widgets interessados quando há mudanças. Ele também faz uso de repositórios (TransactionRepository) presentes na instância da classe "GenerateTransactionList().transactions" para interagir com os dados das transações e um serviço de armazenamento seguro (SecureStorageService) para lidar com a segurança dos dados sensíveis.





<div align="center">
<h3> Fluxo para acessar métodos através do controller </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/43712960-3df2-48f2-8b5f-526a67ad4412" style="width:100%">
</div>


- transaction_state.dart: Classes que permitem modelar diferentes estados

<div align="center">
<h3> Fluxo dos estados </h3>
    <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/b66d4d0d-4feb-4455-aa28-5dc3d9d5c69d" style="width:100%">
</div>



-transaction.dart: um conjunto de declarações de exportação em um arquivo Dart

### models
São armazenados os modelos de dados da aplicação. Esses modelos representam as entidades principais do sistema e definem a estrutura e o comportamento dos dados que serão manipulados pela aplicação.

### utils

Contém arquivos e módulos com funções auxiliares ou utilitárias que são utilizadas em diferentes partes do projeto. Essas funções podem incluir:

### widgets

Contém componentes ou elementos de interface do usuário (UI) que são compartilhados e reutilizados em várias partes do projeto. Esses widgets podem incluir botões, campos de entrada, barras de progresso, ou qualquer outro elemento de interface que seja comum e utilizado em diferentes partes da aplicação.

## features

## repositories

## services

## themes






















