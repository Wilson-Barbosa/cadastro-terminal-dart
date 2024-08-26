import 'Produto.dart';

// Class that models a colletction of products, known as Estoque, where each product is mapped to a unique
// identifier, that is unique.
class Estoque {

  Map<int, Produto> produtos = {};
  int _codigoAtual = 0;

  // Method that takes the name, price and quantity, creates a new Product object and assigns a
  // unique identifier to it, then adds it to the map attribute, informing the user
  void cadastrarProduto(String nome, double preco, int quantidade) {
    produtos[++_codigoAtual] = Produto(nome, preco, quantidade);
    print('Produto cadastrado com sucesso! Código: $_codigoAtual');
  }

  // Method that receives a int as parameter and looks inside the map for a correspondent product
  // if does't find one, prints a message informing the user
  void consultarProduto(int codigo) =>
      print(produtos[codigo] ?? 'Produto não encontrado!');

  // MEthod that receives an int as parameter and optional price and quantity
  void atualizarProduto(int codigo, {double? novoPreco, int? novaQuantidade}) {

    var produto = produtos[codigo];
    // of a valid product was found try to alter its price and or quantity, then send a message to the user
    if (produto != null) {
      produto
        ..preco = novoPreco ?? produto.preco
        ..quantidade = novaQuantidade ?? produto.quantidade;
      print('Produto atualizado com sucesso!');
    } else {
      print('Produto não encontrado!'); // if the product was not found send a message informing the user
    }
  }

  // Method that receives an int and searches the map inside Estoque for a correspondent product
  // if it finds it then deletes it, otherwise just prints a message for the user
  void removerProduto(int codigo) => print(produtos.remove(codigo) != null
      ? 'Produto removido com sucesso!'
      : 'Produto não encontrado!');

  // Method that iterates through the whole Estoque's map and, for each entry, prints the product's information
  // on the temrinal (if the the map is empty just print a message on the terminal)
  void listarProdutos() {
    produtos.isEmpty
        ? print('Nenhum produto cadastrado.')
        : produtos
            .forEach((codigo, produto) => print('Código: $codigo, $produto'));
  }
}
