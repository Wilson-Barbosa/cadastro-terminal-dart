import 'dart:io';
import 'classes/Estoque.dart';

// Like in Java or C the main() routine is the entry point of the appliocation
void main() {

  Estoque estoque = new Estoque(); // creates a new estoque object to be populated later
  
  // Calls the appropriate method based on the user's entry
  var acoes = {
    '1': () => cadastrarProdutoUI(estoque),
    '2': () => consultarProdutoUI(estoque),
    '3': () => atualizarProdutoUI(estoque),
    '4': () => removerProdutoUI(estoque),
    '5': () => estoque.listarProdutos(),
  };


  while (true) {
    print('\nSistema de Gerenciamento de Estoque');
    print(
        '1. Cadastrar produto\n2. Consultar produto\n3. Atualizar produto\n4. Remover produto\n5. Listar todos os produtos\n6. Sair');
    stdout.write('Escolha uma opção: ');
    var opcao = stdin.readLineSync();
    if (opcao == '6') break;
    (acoes[opcao] ?? () => print('Opção inválida!'))();
  }
}

/* bellow there are a couple of functions that read and check if the user's input are valid or not,
  such as price, operation options and quantity of product */
String lerString(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync()!;
}

double lerDouble(String prompt) {
  stdout.write(prompt);
  return double.tryParse(stdin.readLineSync()!) ??
      (print('Entrada inválida. Tente novamente.') as dynamic) ??
      lerDouble(prompt);
}

int lerInt(String prompt) {
  stdout.write(prompt);
  return int.tryParse(stdin.readLineSync()!) ??
      (print('Entrada inválida. Tente novamente.') as dynamic) ??
      lerInt(prompt);
}

double? lerDoubleOpcional(String prompt) {
  stdout.write(prompt);
  return double.tryParse(stdin.readLineSync()!);
}

int? lerIntOpcional(String prompt) {
  stdout.write(prompt);
  return int.tryParse(stdin.readLineSync()!);
}


// Routines that are responsible for accessing the Estoque's various methods and perform a given action
// such as udpate, register and remove products
void cadastrarProdutoUI(Estoque estoque) => estoque.cadastrarProduto(
    lerString('Nome do produto: '),
    lerDouble('Preço do produto: '),
    lerInt('Quantidade do produto: '));

void consultarProdutoUI(Estoque estoque) =>
    estoque.consultarProduto(lerInt('Código do produto: '));

void atualizarProdutoUI(Estoque estoque) => estoque.atualizarProduto(
    lerInt('Código do produto: '),
    novoPreco:
        lerDoubleOpcional('Novo preço (deixe em branco para não alterar): '),
    novaQuantidade:
        lerIntOpcional('Nova quantidade (deixe em branco para não alterar): '));

void removerProdutoUI(Estoque estoque) =>
    estoque.removerProduto(lerInt('Código do produto: '));
