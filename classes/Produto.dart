
// Class that models an object of type product. It represents a 
class Produto {

  // Attributes (all of them are instance variables)
  String nome;
  double preco;
  int quantidade;

  // Full args constructor
  Produto(this.nome, this.preco, this.quantidade);

  // overrides the default implementation of the toString() method, so that is shows a more appropriate message
  // to the users
  @override
  String toString() =>
      'Nome: $nome, Preço: R\$${preco.toStringAsFixed(2)}, Quantidade: $quantidade';
}