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




















