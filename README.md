# calculadora_mc

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

Interface do Usuário (UI):
A tela principal exibe um AppBar com o título “Calculadora de IMC” e um botão de ação para resetar os campos.
O corpo da tela é um SingleChildScrollView que contém um formulário (Form) com dois campos de texto (TextFormField) para entrada de peso e altura.
Os campos de texto têm validação para garantir que os dados sejam inseridos corretamente, com mensagens de erro personalizadas se pontos forem usados em vez de vírgulas.
Um botão “Calcular” é fornecido para realizar o cálculo do IMC quando os dados são validados.
Uma mensagem de texto é exibida na parte inferior para mostrar o resultado do cálculo do IMC.
Lógica de Cálculo:
O IMC é calculado dividindo o peso (em quilogramas) pelo quadrado da altura (em metros).
O aplicativo verifica várias faixas de IMC e fornece uma mensagem correspondente, como “Abaixo do peso”, “Peso Ideal”, “Levemente Acima do peso”, “Obesidade Grau I”, “Obesidade Grau II” e “Obesidade Grau III”.
Funcionalidades:
O botão de resetar no AppBar limpa os campos de texto e a mensagem de resultado.
A validação dos campos de texto garante que os usuários não deixem os campos vazios e usem vírgulas para decimais.
O cálculo do IMC é realizado em tempo real quando o usuário pressiona o botão “Calcular”.
Estilização:
O aplicativo utiliza uma paleta de cores com ciano e cinza azulado.
A imagem de fundo é definida para cobrir toda a tela, proporcionando uma aparência agradável e consistente.
Os estilos de texto são personalizados para melhorar a legibilidade e a estética do aplicativo.
