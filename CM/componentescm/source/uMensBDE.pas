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
unit uMensBDE;

interface
uses uMensErro;

const
NumErros = 74;
ListaBDE : array[0..NumErros-1] of TRecMensagem = (
   (Codigo :  9985; Mensagem: 'Número fora da faixa limite'),
   (Codigo :  9986; Mensagem: 'Parâmetro inválido'),
   (Codigo :  9987; Mensagem: 'Nome de arquivo inválido'),
   (Codigo :  9988; Mensagem: 'Arquivo não existe'),
   (Codigo :  9989; Mensagem: 'Opção inválida'),
   (Codigo :  9990; Mensagem: '"Handle" iválido para a função'),
   (Codigo :  9991; Mensagem: 'Tipo de tabela desconhecido'),
   (Codigo :  9992; Mensagem: 'Não consegui abrir o arquivo'),
   (Codigo :  9993; Mensagem: 'Não consequi redefinir a chave primaria'),
   (Codigo :  9995; Mensagem: 'Chaves primaria e estrangeira incompativeis'),
   (Codigo :  9996; Mensagem: 'Solicitação de modificação inválida'),
   (Codigo :  9997; Mensagem: 'Indice não existe'),
   (Codigo : 10000; Mensagem: 'Tipo de campo inválido'),
   (Codigo : 10003; Mensagem: 'Estrutura de registro inválida'),
   (Codigo : 10009; Mensagem: 'Nome não unico neste contexto'),
   (Codigo : 10010; Mensagem: 'Obrigatorio informar nome do índice'),
   (Codigo : 10013; Mensagem: 'Driver não é conhecido pelo sistema'),
   (Codigo : 10014; Mensagem: '"Database" desconhecido'),
   (Codigo : 10015; Mensagem: 'Senha inválida'),
   (Codigo : 10018; Mensagem: 'Diretorio inválido'),
   (Codigo : 10024; Mensagem: 'Tabela não existe'),
   (Codigo : 10025; Mensagem: 'Tabela tem usuarios demais'),
   (Codigo : 10026; Mensagem: 'Não consigo avaliar a Chave ou Chave não corresponde às condições do filtro'),
   (Codigo : 10027; Mensagem: 'Indice já existe'),
   (Codigo : 10028; Mensagem: 'Indice está aberto'),
   (Codigo : 10029; Mensagem: 'Comprimento de BLOB inválido'),
   (Codigo : 10031; Mensagem: 'Tabela está aberta'),
   (Codigo : 10034; Mensagem: 'Não consigo fechar o índice'),
   (Codigo : 10035; Mensagem: 'Indice está sendo usado por outra tabela'),
   (Codigo : 10036; Mensagem: 'Nome de usuario ou senha desconhecida'),
   (Codigo : 10037; Mensagem: '"Cascade" multi nivel não é suportado'),
   (Codigo : 10038; Mensagem: 'Nome de campo inválido'),
   (Codigo : 10039; Mensagem: 'Nome de tabela inválido'),
   (Codigo : 10041; Mensagem: 'Nome é reservado'),
   (Codigo : 10042; Mensagem: 'Extensão de arquivo inválida'),
   (Codigo : 10043; Mensagem: 'Driver de linguagem inválido'),
   (Codigo : 10044; Mensagem: '"Alias" não está aberto no momento'),
   (Codigo : 10045; Mensagem: 'Estrutura de registros incompativeis'),
   (Codigo : 10046; Mensagem: 'Nome reservado do DOS'),
   (Codigo : 10047; Mensagem: 'Destino tem de estar indexado'),
   (Codigo : 10048; Mensagem: 'Tipo de indice inválido'),
   (Codigo : 10049; Mensagem: 'Drivers de Linguagens da tabela e indice são incompativeis'),
   (Codigo : 10051; Mensagem: 'Filtro inválido'),
   (Codigo : 10058; Mensagem: 'Hora inválida'),
   (Codigo : 10059; Mensagem: 'Data inválida'),
   (Codigo : 10060; Mensagem: 'Datetime invalido'),
   (Codigo : 10061; Mensagem: 'Tabelas em diretorios diferentes'),
   (Codigo : 10062; Mensagem: 'Número de argumentos errado'),
   (Codigo : 10065; Mensagem: 'Nome de procedure inválido'),
   (Codigo : 10241; Mensagem: 'Registro em uso por outro usuário'),
   (Codigo : 10242; Mensagem: 'Falha no Destravamento de registro'),
   (Codigo : 10243; Mensagem: 'Tabela em uso'),
   (Codigo : 10244; Mensagem: 'Diretorio em uso'),
   (Codigo : 10245; Mensagem: 'Arquivo está travado'),
   (Codigo : 10246; Mensagem: 'Diretorio está travado'),
   (Codigo : 10247; Mensagem: 'Registro já está travado nesta sessão'),
   (Codigo : 10248; Mensagem: 'Objeto não está travado'),
   (Codigo : 10250; Mensagem: 'Grupo chave travado'),
   (Codigo : 10251; Mensagem: 'Travamento de tabela perdido'),
   (Codigo : 10252; Mensagem: 'Acesso exclusivo perdido'),
   (Codigo : 10253; Mensagem: 'Tabela não pode ser aberta para uso exclusivo'),
   (Codigo : 10254; Mensagem: 'Conflito de travamento de registro nesta sessão'),
   (Codigo : 10255; Mensagem: 'Foi detectado um deadlock'),
   (Codigo : 10256; Mensagem: 'Uma transação de usuario já está em progresso'),
   (Codigo : 10257; Mensagem: 'Não há transação de usuario atualmente em progresso'),
   (Codigo : 10258; Mensagem: 'Falha no travamento de registro'),
   (Codigo : 10259; Mensagem: 'Não foi possivel efetuar a edição porque outro usuario alterou o registro'),
   (Codigo : 10260; Mensagem: 'Não foi possivel efetuar a edição porque outro usuario deletou ou moveu o registro'),
   (Codigo : 13057; Mensagem: 'Arquivo já existe'),
   (Codigo : 13058; Mensagem: 'BLOB foi alterado'),
   (Codigo : 13059; Mensagem: 'Erro genérico de SQL'),
   (Codigo : 13060; Mensagem: 'Tabela já existe'),
   (Codigo : 13062; Mensagem: 'Atualização cancelada'),
   (Codigo : 0; Mensagem: ''));

implementation

end.
