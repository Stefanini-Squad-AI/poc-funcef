{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit uMensOracle;

interface
uses uMensErro;

const
NumErros = 42;
ListaOracle : array[0..NumErros-1] of TRecMensagem = (
   (Codigo : 00001; Mensagem: 'Já existe registro com a mesma chave'),
   (Codigo : 00900; Mensagem: 'Comando SQL inválido'),
   (Codigo : 00901; Mensagem: 'Comando CREATE inválido'),
   (Codigo : 00902; Mensagem: 'Tipo de dado inválido'),
   (Codigo : 00903; Mensagem: 'Nome de TABELA inválido'),
   (Codigo : 00904; Mensagem: 'Nome de COLUNA inválido'),
   (Codigo : 00905; Mensagem: 'Falta palavra chave no comando SQL'),
   (Codigo : 00906; Mensagem: 'Falta parenteses da esquerda no comando SQL'),
   (Codigo : 00907; Mensagem: 'Falta parenteses da direita no comando SQL'),
   (Codigo : 00908; Mensagem: 'Falta palavra chave NULL'),
   (Codigo : 00909; Mensagem: 'Número de argumentos inválido'),
   (Codigo : 00910; Mensagem: 'Tamanho muito grande para este tipo de dado'),
   (Codigo : 00911; Mensagem: 'Caracter inválido'),
   (Codigo : 00914; Mensagem: 'Falta palavra chave ADD'), 
   (Codigo : 00917; Mensagem: 'Falta vírgula'),
   (Codigo : 00918; Mensagem: 'Definição de COLUNA ambigua'),
   (Codigo : 00919; Mensagem: 'Função inválida'),
   (Codigo : 00920; Mensagem: 'Operador relacional inválido'),
   (Codigo : 00921; Mensagem: 'Fim de comando SQL inesperado'),
   (Codigo : 00922; Mensagem: 'Opção inválida ou faltando'),
   (Codigo : 00923; Mensagem: 'Palavra chave FROM nào encontrada onde esperada'),
   (Codigo : 00924; Mensagem: 'Falta palavra chave BY'),
   (Codigo : 00925; Mensagem: 'Falta palavra chave INTO'),
   (Codigo : 00926; Mensagem: 'Falta palavra chave VALUES'),
   (Codigo : 00927; Mensagem: 'Falta sinal de igual'),
   (Codigo : 00928; Mensagem: 'Falta palavra chave SELECT'),
   (Codigo : 00929; Mensagem: 'Falta o ponto'),
   (Codigo : 00930; Mensagem: 'Falta asterisco'),
   (Codigo : 00931; Mensagem: 'Falta identificador'), 
   (Codigo : 00932; Mensagem: 'Tipos de dados inconsistentes'),
   (Codigo : 00933; Mensagem: 'Comando SQL não finalizado corretamente'),
   (Codigo : 00934; Mensagem: 'Função GROUP não é permitida aqui'),
   (Codigo : 00935; Mensagem: 'Função GROUP está excessivamente aninhada'),
   (Codigo : 00936; Mensagem: 'Falta expressão'),
   (Codigo : 00937; Mensagem: 'Função GROUP não é SINGLE-GROUP'),
   (Codigo : 00938; Mensagem: 'Número de argumentos insuficiente na função'),
   (Codigo : 00939; Mensagem: 'Número de argumentos excessivo na função'),
   (Codigo : 00940; Mensagem: 'Comando ALTER inválido'),
   (Codigo : 00941; Mensagem: 'Falta Nome do cluster'),
   (Codigo : 00942; Mensagem: 'TABELA ou VISÃO não existe'),
   (Codigo : 02292; Mensagem: 'Restrição na atualização'+#10#13+'Encontrado um registro Filho'),
   (Codigo : 0; Mensagem: ''));

implementation

end.
