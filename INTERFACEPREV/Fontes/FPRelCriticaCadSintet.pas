// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : leo
// Data        : 10/03/2006
// Pendência   : 21713
// Rotina      : consultas da tela
// Alteração   : inclusão dos códigod 121 e 122
//------------------------------------------------------------------------------
// Autor(a)    : leo
// Data        : 01/08/2005
// Pendência   : 19809
// Rotina      : consultas da tela
// Alteração   : inclusão do combo de situação do funcionário e mudanças para seleção do usuário
//------------------------------------------------------------------------------
// Autor(a)    : leo
// Data        : 14/07/2005
// Pendência   : 19809
// Rotina      : consultas da tela
// Alteração   : inclusão do combo de situação do participante e mudanças para seleção do usuário
//------------------------------------------------------------------------------
// Autor(a)    : leo
// Data        : 13/07/2005
// Pendência   : 19823
// Rotina      : bbtnConfirmarClick
// Alteração   : complementação do DECODE(CODERRO de códigos faltando
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 08.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FPRelCriticaCadSintet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, Spin, Mask, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TfrmPRelCriticaCadSintet = class(TfrmOkCancelar)
    Panel1: TPanel;
    grpAnoMesReferencia: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    mebMes: TComboBox;
    mebAno: TSpinEdit;
    grpPatro: TGroupBox;
    dblookupPatrocinadora: TCMDBLookupCombo;
    qryPatro: TwwQuery;
    qryPatroNOME: TStringField;
    qryPatroIDPESSOA: TFloatField;
    grpGrupo: TGroupBox;
    chkDadosCadastrais: TCheckBox;
    chkDependentes: TCheckBox;
    chkEnderecos: TCheckBox;
    chkEvolucaoFuncional: TCheckBox;
    GroupBox1: TGroupBox;
    dbcmbTipoErro: TwwDBComboBox;
    chkDocumentos: TCheckBox;
    chkEventos: TCheckBox;
    chkLotacoes: TCheckBox;
    chkContatos: TCheckBox;
    GroupBox2: TGroupBox;
    qrySitPartInterno: TwwQuery;
    dblkpcmbSitPartInterno: TwwDBLookupCombo;
    qrysitfunc: TwwQuery;
    GroupBox3: TGroupBox;
    cmbsitfunc: TwwDBLookupCombo;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelCriticaCadSintet: TfrmPRelCriticaCadSintet;

implementation

uses dRelatorios, UMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmPRelCriticaCadSintet.FormActivate(Sender: TObject);
var wAno, wMes, wDia : word;
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  mebMes.ItemIndex := wMes - 1;
  mebAno.Value := wAno;

  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;

  chkDadosCadastrais.Checked   := True;
  chkEnderecos.Checked         := True;
  chkDependentes.Checked       := True;
  chkEvolucaoFuncional.Checked := True;

  dbcmbTipoErro.Text           := '';

  qrySitPartInterno.close;
  qrySitPartInterno.open;

  qrySitfunc.close;
  qrySitfunc.open;
end;

procedure TfrmPRelCriticaCadSintet.bbtnConfirmarClick(Sender: TObject);
var sGrupo, sAnoMes : string;
begin
  inherited;
  // Verificar dados obrigatorios
  if mebMes.ItemIndex = -1  then begin
    MsgDlg('Mês incorreto !','Informação',mtInformation,[mbOk,mbHelp],0);
    mebMes.SetFocus;
    exit;
  end;

  if trim(mebAno.Text) = '' then begin
    MsgDlg('Informe o ano desejado.','Informação',mtInformation,[mbOk,mbHelp],0);
    mebAno.SetFocus;
    exit;
  end;

  sAnoMes := mebAno.Text;
  // Montar as Datas
  if mebMes.ItemIndex+1 < 10
  then sAnoMes     := sAnoMes+'0'+IntToStr(mebMes.ItemIndex+1)
  else sAnoMes     := sAnoMes+ IntToStr(mebMes.ItemIndex+1);

  sGrupo := '';
  if chkDadosCadastrais.Checked   then sGrupo := sGrupo +', ''C'' ';
  if chkEnderecos.Checked         then sGrupo := sGrupo +', ''E'' ';
  if chkDependentes.Checked       then sGrupo := sGrupo +', ''D'' ';
  if chkDocumentos.Checked        then sGrupo := sGrupo +', ''O'' ';
  if chkEvolucaoFuncional.Checked then sGrupo := sGrupo +', ''V'' ';
  if chkEventos.Checked           then sGrupo := sGrupo +', ''N'' ';
  if chkLotacoes.Checked          then sGrupo := sGrupo +', ''L'' ';
  if chkContatos.Checked          then sGrupo := sGrupo +', ''T'' ';

  if Trim(sGrupo) = ''
  then sGrupo := 'C'
  else sGrupo := Copy(sGrupo, 2, Length(sGrupo));

  with dtmRelatorios do
  begin
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
     qryFundacao.Open;

     if cTipoRelCriticaCadastral = 'S'
     then begin
        qryInterfCadSintetico.Close;
        qryInterfCadSintetico.SQL.Clear;
        qryInterfCadSintetico.SQL.Add(' SELECT COUNT(1) AS TOTAL, '+
        '       SUBSTR(MESCOBRANCA,5,2)||''/''||SUBSTR(MESCOBRANCA,1,4) AS MESREFERENCIA, '+
        '       DECODE(FLGPROCESSADO, 0, ''Não'', ''Sim'')  AS DESCPROCESSADO, '+
        '       DECODE(CODERRO, '+
        ' 0, ''Participante não encontrado'',             '+
        ' 1, ''Agência Bancária não encontrada'',         '+
        ' 2, ''Banco não encontrado'',                    '+
        ' 3, ''Nome do Participante alterado'',           '+
        ' 4, ''Data de Admissão alterada'',               '+
        ' 5, ''Data de Nascimento alterada'',             '+
        ' 6, ''Documento alterado'',                      '+
        ' 7, ''Número de Dependentes para IR alterado'',  '+
        ' 8, ''Cargo não encontrado'',                    '+
        ' 9, ''Cargo alterado'',                          '+
        ' 10, ''Nivel não encontrado'',                   '+
        ' 11, ''Nivel alterado'',                         '+
        ' 12, ''Sexo alterado'',                          '+
        ' 13, ''Conta Corrente alterada'',                '+
        ' 14, ''Erro ao alterar conta corrente'',         '+
        ' 15, ''Erro ao alterar nome'',                   '+
        ' 16, ''Erro ao alterar CPF'',                    '+
        ' 17, ''Erro ao alterar sexo'',                   '+
        ' 18, ''Erro ao alterar data de nascimento'',     '+
        ' 19, ''Erro ao altarer data de admissão'',       '+
        ' 20, ''Erro ao alterar n. dependentes IRRF'',    '+
        ' 21, ''Erro ao alterar cargo'',                  '+
        ' 22, ''Erro ao alterar nivel'',                  '+
        ' 23, ''Participante Assistido - dados não atualizados '', '+
        ' 24, ''Participante Mantido - dados não atualizados '',   '+
        ' 25, ''Endereço Inserido'',                      '+
        ' 26, ''Logradouro alterado'',                    '+
        ' 27, ''Bairro alterado'',                        '+
        ' 28, ''CEP alterado'',                           '+
        ' 29, ''UF do Endereço alterado'',                '+
        ' 30, ''Número do Telefone alterado'',            '+
        ' 31, ''Cidade do Endereço alterada'',            '+
        ' 32, ''Telefone Inserido'',                      '+
        ' 33, ''Número da Carteira de Identidade alterado'', '+
        ' 34, ''UF da Carteira de Identidade alterada'',     '+
        ' 35, ''Data de Expedição da Carteira de Identidade alterada'', '+
        ' 36, ''Nome do Pai alterado'',                          '+
        ' 37, ''Nome da Mãe alterado'',                          '+
        ' 38, ''Código do Municipio de Naturalidade alterado'',  '+
        ' 39, ''Matrícula do Conjuge alterada '',                '+
        ' 40, ''Tempo de Serviço Total alterado '',              '+
        ' 41, ''Tempo de Serviço Não Creditado  alterado '',     '+
        ' 42, ''Documento de Identidade Inserido'',              '+
        ' 43, ''Dependente Inserido (não existia no cadastro)'', '+
        ' 44, ''Estado Civil  alterado '',                       '+
        ' 45, ''Indicador para Salário de IR  alterado '',       '+
        ' 46, ''Indicador para Salário Família  alterado '',     '+
        ' 47, ''Indicador de Invalidez  alterado '',             '+
        ' 48, ''Data de Início do Dependente  alterada'',        '+
        ' 49, ''Grau de Dependência  alterado '',                '+
        ' 50, ''Indicador de Cargo de Diretor  alterado '',      '+
        ' 51, ''Tempo de Serviço Anterior alterado'',            '+
        ' 52, ''Tempo de Serviço Publico Anterior alterado'',    '+
        ' 53, ''Tempo de Serviço Privado Anterior alterado'',    '+
        ' 54, ''Tempo de Serviço Anterior Real alterado'',       '+
        ' 55, ''Filial do Empregado alterada'',                  '+
        ' 56, ''Filial não encontrada'',                         '+
        ' 57, ''Situação do Empregado alterada'',                '+
        ' 58, ''Vinculação Funcional do Empregado alterada'',    '+
        ' 59, ''Função Não Encontrada'',                         '+
        ' 60, ''Função alterada'',                               '+
        ' 61, ''Data de Demissão alterada'',                     '+
        ' 62, ''Data de Readmissão alterada'',                   '+
        ' 63, ''Data do Falecimento alterada'',                  '+
        ' 64, ''Participante Cancelado - dados não atualizados '', '+
        ' 65, ''Cidade do Endereço não encontrada '',            '+
        ' 66, ''Agência Bancária em Branco'',                    '+
        ' 67, ''UF não encontrada na tabela de Estado      '',   '+
        ' 68, ''Erro ao inserir novo dependente            '',   '+
        ' 69, ''Novo Funcionario Cadastrado                '',   '+
        ' 70, ''Centro de Custo do Empregado Alterado      '',   '+
        ' 71, ''Salário Total na Empresa Alterado          '',   '+
        ' 72, ''Matricula Alterada                         '',   '+
        ' 73, ''Email do Contato Alterado                  '',   '+
        ' 74, ''Cargo do Contato Alterado                  '',   '+
        ' 75, ''Setor do Contato Alterado                  '',   '+
        ' 76, ''Data Nascimento do Contato Alterado        '',   '+
        ' 77, ''Obs do Contato Alterado                    '',    '+
        ' 78, ''Novo cargo inserido na evolução funcional   '',   '+
        ' 79, ''Nova função inserida na evolução funcional  '',   '+
        ' 80, ''Inserido Adicional compensatório            '',   '+
        ' 81, ''Inserido adicional por tempo de serviço     '',   '+
        ' 82, ''Inserido adicional noturno                  '',   '+
        ' 83, ''Inserido percentual por periculosidade      '',   '+
        ' 84, ''Inserido percentual de insalubridade        '',   '+
        ' 85, ''Data final do cargo atual alterada          '',   '+
        ' 86, ''Data final da função atual alterada         '',   '+
        ' 87, ''Data final do percentual por insalubridade alterado'',   '+
        ' 88, ''Percentual de insalubridade alterado       '',   '+
        ' 89, ''Percentual por periculosidade alterado     '',   '+
        ' 90, ''Data final do adicional noturno alterada   '',   '+
        ' 91, ''Percentual do aicional noturno alterado    '',   '+
        ' 92, ''Inserido pecentual de adicional noturno    '',   '+
        ' 93, ''Data final d adicional por tempo de serviço alterada'',   '+
        ' 94, ''Percentual por tempo de serviço alterado    '',   '+
        ' 95, ''Data final do adicional compensatório alterada'',   '+
        ' 96, ''Percental de adicional compensatório alterado'',   '+
        ' 97, ''Situação do funcionário alterada         '' ,  '+
        ' 98, ''Valor da opção 1 da patrocinadora alterado   '' ,  '+
        ' 99, ''Valor da opção 2 da patrocinadora alterado   '' ,  '+
        ' 100, ''Valor da opção 3 da patrocinadora alterado   '' ,  '+
        ' 101, ''Valor da opção 4 da patrocinadora alterado   '' ,  '+
        ' 102, ''Valor da opção 5 da patrocinadora alterado   '' ,  '+
        ' 103, ''Valor da opção 6 da patrocinadora alterado   '' ,  '+
        ' 104, ''Evento previdenciário inserido (Desfazer apenas pelo AdmPrev)'',   '+
        ' 105, ''Descrição da rubrica alterada    '',   '+
        ' 106, ''Indicador (Provento/Desconto) da rubrica alterado   '',   '+
        ' 107, ''Indicador (Atraso/Devolução/Normal) da rubrica alterado    '',   '+
        ' 108, ''Rubrica inserida    '',   '+
        ' 109, ''Nome da filial alterado    '',   '+
        ' 110, ''Tipo da filial (Capital/Interior) alterado    '',   '+
        ' 111, ''CGC da filial alterado    '',   '+
        ' 112, ''Sigla da filial alterada    '',   '+
        ' 113, ''Filial inserida    '',   '+
        ' 114, ''Noma da agência alterado    '',   '+
        ' 115, ''Agência inserida    '' ,  '+
        ' 116, ''Elegível inserido    '' ,  '+
        ' 117, ''Erro ao inserir elegível    '',   '+
        ' 118, ''e-mail alterado    '' ,   '+
        ' 119, ''Dt. inicio do cargo informado menor que a do cargo atual '' ,   '+
        ' 120, ''Dt. inicio da função infromada menor que a da função atual '',    '+
        ' 121, ''Data final da filial alterada  '', '+
        ' 122, ''DDD Alterado '' '+
        '      ) AS DESCERRO, '+
        '      CODERRO, '+
        '       DECODE(GRUPO, ''C'', ''Dados Cadastrais'',   '+
        '                     ''E'', ''Endereço'',           '+
        '                     ''D'', ''Dependentes'',        '+
        '                     ''O'', ''Documentos'',         '+
        '                     ''V'', ''Evolução Funcional'', '+
        '                     ''N'', ''Eventos'',            '+
        '                     ''L'', ''Lotações'',           '+
        '                     ''T'', ''Contatos''            '+
        '              ) AS DESCGRUPO '+
        ' FROM  TABCRITICASCCP  '+
        ' WHERE MESCOBRANCA  = '''+sAnoMes+''''+
        ' AND   IDPESSJUR    = '+qryPatro.FieldbyName('IDPESSOA').AsString+
        ' AND   GRUPO        IN ('+sGrupo+') '+
        ' AND   NOT (CODERRO IN (23, 24, 64) ) ');
        if Trim(dbcmbTipoErro.Text) <> ''
        then qryInterfCadSintetico.SQL.Add(' AND CODERRO = '+IntToStr(dbcmbTipoErro.ItemIndex) );

        //seleção de situalção
        if trim(dblkpcmbSitPartInterno.text) <> '' then
        qryInterfCadSintetico.SQL.Add(' AND NVL(FLGSITPART,''AT'') = '''+qrySitPartInterno.FieldByName('FLGINTERNO').AsString+''' ');

        if trim(cmbsitfunc.text) <> '' then
        qryInterfCadSintetico.sql.text := qryInterfCadSintetico.sql.text +  ' AND  IDSITFUNC  = '''+qrysitfunc.FieldByName('IDSITFUNC').AsString+''' ';

        qryInterfCadSintetico.SQL.Add(' GROUP BY MESCOBRANCA, GRUPO, CODERRO, FLGPROCESSADO '+
                                      ' ORDER BY GRUPO, DESCERRO ');
        qryInterfCadSintetico.Open;
     end
     else begin
        qryInterfCadAnalitico.Close;
        qryInterfCadAnalitico.SQL.Clear;
        qryInterfCadAnalitico.SQL.Add(' SELECT SUBSTR(MESCOBRANCA,5,2)||''/''||SUBSTR(MESCOBRANCA,1,4) AS MESREFERENCIA, '+
        '       DECODE(GRUPO, ''C'', ''Dados Cadastrais'',   '+
        '                     ''E'', ''Endereço'',           '+
        '                     ''D'', ''Dependentes'',        '+
        '                     ''O'', ''Documentos'',         '+
        '                     ''V'', ''Evolução Funcional'', '+
        '                     ''N'', ''Eventos'',            '+
        '                     ''L'', ''Lotações'',           '+
        '                     ''T'', ''Contatos''            '+
        '              ) AS DESCGRUPO, '+
        '       CODERRO,                                                   '+
        '       DECODE(FLGPROCESSADO, 0, ''Não'', ''Sim'')  AS DESCPROCESSADO, '+
        '       DECODE(CODERRO, '+
        ' 0, ''Participante não encontrado'',             '+
        ' 1, ''Agência Bancária não encontrada'',         '+
        ' 2, ''Banco não encontrado'',                    '+
        ' 3, ''Nome do Participante alterado'',           '+
        ' 4, ''Data de Admissão alterada'',               '+
        ' 5, ''Data de Nascimento alterada'',             '+
        ' 6, ''Documento alterado'',                      '+
        ' 7, ''Número de Dependentes para IR alterado'',  '+
        ' 8, ''Cargo não encontrado'',                    '+
        ' 9, ''Cargo alterado'',                          '+
        ' 10, ''Nivel não encontrado'',                   '+
        ' 11, ''Nivel alterado'',                         '+
        ' 12, ''Sexo alterado'',                          '+
        ' 13, ''Conta Corrente alterada'',                '+
        ' 14, ''Erro ao alterar conta corrente'',         '+
        ' 15, ''Erro ao alterar nome'',                   '+
        ' 16, ''Erro ao alterar CPF'',                    '+
        ' 17, ''Erro ao alterar sexo'',                   '+
        ' 18, ''Erro ao alterar data de nascimento'',     '+
        ' 19, ''Erro ao altarer data de admissão'',       '+
        ' 20, ''Erro ao alterar n. dependentes IRRF'',    '+
        ' 21, ''Erro ao alterar cargo'',                  '+
        ' 22, ''Erro ao alterar nivel'',                  '+
        ' 23, ''Participante Assistido - dados não atualizados '', '+
        ' 24, ''Participante Mantido - dados não atualizados '',   '+
        ' 25, ''Endereço Inserido'',                      '+
        ' 26, ''Logradouro alterado'',                    '+
        ' 27, ''Bairro alterado'',                        '+
        ' 28, ''CEP alterado'',                           '+
        ' 29, ''UF do Endereço alterado'',                '+
        ' 30, ''Número do Telefone alterado'',            '+
        ' 31, ''Cidade do Endereço alterada'',            '+
        ' 32, ''Telefone Inserido'',                      '+
        ' 33, ''Número da Carteira de Identidade alterado'', '+
        ' 34, ''UF da Carteira de Identidade alterada'',     '+
        ' 35, ''Data de Expedição da Carteira de Identidade alterada'', '+
        ' 36, ''Nome do Pai alterado'',                          '+
        ' 37, ''Nome da Mãe alterado'',                          '+
        ' 38, ''Código do Municipio de Naturalidade alterado'',  '+
        ' 39, ''Matrícula do Conjuge alterada '',                '+
        ' 40, ''Tempo de Serviço Total alterado '',              '+
        ' 41, ''Tempo de Serviço Não Creditado  alterado '',     '+
        ' 42, ''Documento de Identidade Inserido'',              '+
        ' 43, ''Dependente Inserido (não existia no cadastro)'', '+
        ' 44, ''Estado Civil  alterado '',                       '+
        ' 45, ''Indicador para Salário de IR  alterado '',       '+
        ' 46, ''Indicador para Salário Família  alterado '',     '+
        ' 47, ''Indicador de Invalidez  alterado '',             '+
        ' 48, ''Data de Início do Dependente  alterada'',        '+
        ' 49, ''Grau de Dependência  alterado '',                '+
        ' 50, ''Indicador de Cargo de Diretor  alterado '',      '+
        ' 51, ''Tempo de Serviço Anterior alterado'',            '+
        ' 52, ''Tempo de Serviço Publico Anterior alterado'',    '+
        ' 53, ''Tempo de Serviço Privado Anterior alterado'',    '+
        ' 54, ''Tempo de Serviço Anterior Real alterado'',       '+
        ' 55, ''Filial do Empregado alterada'',                  '+
        ' 56, ''Filial não encontrada'',                         '+
        ' 57, ''Situação do Empregado alterada'',                '+
        ' 58, ''Vinculação Funcional do Empregado alterada'',    '+
        ' 59, ''Função Não Encontrada'',                         '+
        ' 60, ''Função alterada'',                               '+
        ' 61, ''Data de Demissão alterada'',                     '+
        ' 62, ''Data de Readmissão alterada'',                   '+
        ' 63, ''Data do Falecimento alterada'',                  '+
        ' 64, ''Participante Cancelado - dados não atualizados '', '+
        ' 65, ''Cidade do Endereço não encontrada '',            '+
        ' 66, ''Agência Bancária em Branco'',                    '+
        ' 67, ''UF não encontrada na tabela de Estado      '',   '+
        ' 68, ''Erro ao inserir novo dependente            '',   '+
        ' 69, ''Novo Funcionario Cadastrado                '',   '+
        ' 70, ''Centro de Custo do Empregado Alterado      '',   '+
        ' 71, ''Salário Total na Empresa Alterado          '',   '+
        ' 72, ''Matricula Alterada                         '',   '+
        ' 73, ''Email do Contato Alterado                  '',   '+
        ' 74, ''Cargo do Contato Alterado                  '',   '+
        ' 75, ''Setor do Contato Alterado                  '',   '+
        ' 76, ''Data Nascimento do Contato Alterado        '',   '+
        ' 77, ''Obs do Contato Alterado                    '',    '+
        ' 78, ''Novo cargo inserido na evolução funcional   '',   '+
        ' 79, ''Nova função inserida na evolução funcional  '',   '+
        ' 80, ''Inserido Adicional compensatório            '',   '+
        ' 81, ''Inserido adicional por tempo de serviço     '',   '+
        ' 82, ''Inserido adicional noturno                  '',   '+
        ' 83, ''Inserido percentual por periculosidade      '',   '+
        ' 84, ''Inserido percentual de insalubridade        '',   '+
        ' 85, ''Data final do cargo atual alterada          '',   '+
        ' 86, ''Data final da função atual alterada         '',   '+
        ' 87, ''Data final do percentual por insalubridade alterado'',   '+
        ' 88, ''Percentual de insalubridade alterado       '',   '+
        ' 89, ''Percentual por periculosidade alterado     '',   '+
        ' 90, ''Data final do adicional noturno alterada   '',   '+
        ' 91, ''Percentual do aicional noturno alterado    '',   '+
        ' 92, ''Inserido pecentual de adicional noturno    '',   '+
        ' 93, ''Data final d adicional por tempo de serviço alterada'',   '+
        ' 94, ''Percentual por tempo de serviço alterado    '',   '+
        ' 95, ''Data final do adicional compensatório alterada'',   '+
        ' 96, ''Percental de adicional compensatório alterado'',   '+
        ' 97, ''Situação do funcionário alterada         '' ,  '+
        ' 98, ''Valor da opção 1 da patrocinadora alterado   '' ,  '+
        ' 99, ''Valor da opção 2 da patrocinadora alterado   '' ,  '+
        ' 100, ''Valor da opção 3 da patrocinadora alterado   '' ,  '+
        ' 101, ''Valor da opção 4 da patrocinadora alterado   '' ,  '+
        ' 102, ''Valor da opção 5 da patrocinadora alterado   '' ,  '+
        ' 103, ''Valor da opção 6 da patrocinadora alterado   '' ,  '+
        ' 104, ''Evento previdenciário inserido (Desfazer apenas pelo AdmPrev)'',   '+
        ' 105, ''Descrição da rubrica alterada    '',   '+
        ' 106, ''Indicador (Provento/Desconto) da rubrica alterado   '',   '+
        ' 107, ''Indicador (Atraso/Devolução/Normal) da rubrica alterado    '',   '+
        ' 108, ''Rubrica inserida    '',   '+
        ' 109, ''Nome da filial alterado    '',   '+
        ' 110, ''Tipo da filial (Capital/Interior) alterado    '',   '+
        ' 111, ''CGC da filial alterado    '',   '+
        ' 112, ''Sigla da filial alterada    '',   '+
        ' 113, ''Filial inserida    '',   '+
        ' 114, ''Noma da agência alterado    '',   '+
        ' 115, ''Agência inserida    '' ,  '+
        ' 116, ''Elegível inserido    '' ,  '+
        ' 117, ''Erro ao inserir elegível    '',   '+
        ' 118, ''e-mail alterado    '' ,   '+
        ' 119, ''Dt. inicio do cargo informado menor que a do cargo atual '' ,   '+
        ' 120, ''Dt. inicio da função infromada menor que a da função atual '',    '+
        ' 121, ''Data final da filial alterada  '', '+
        ' 122, ''DDD Alterado '' '+
        '      ) AS DESCERRO, '+
        '      DECODE(CHAVE, ''M'', ''Matrícula'', ''Inscrição'') AS CHAVE, '+
        '      1 AS CONT,                                                   '+
        '      VALORCHAVE,                                                  '+
        '      VALORNAFUNDACAO,                                             '+
        '      VALORNOINTERFACE,                                            '+
        ' DECODE(FLGSITPART, ''AT'', ''ATIVO'',''MA'',''MANTIDO'',''MP'', ''MANTIDO PARCIAL'',''MS'',''MANUTENÇÃO DE SALDO DE CONTA'','+
        ' ''AS'',''ASSISTIDO'',''CA'',''CANCELADO'',''AE'',''PN'', ''PENDENTE'','''' ) SITPART, '+
        ' S.DESCRICAO SITFUNC, '+
        ' DECODE(CHAVE,''M'',''Categ. de Sit. do Part. na Fundação'','''') TITULO1, '+
        ' DECODE(CHAVE,''M'',''Situação do Funcionário na Patrocinadora'','''') TITULO2 '+
        ' FROM  TABCRITICASCCP  , SITFUNC S                          '+
        ' WHERE MESCOBRANCA = '''+sAnoMes+''''+
        ' AND   IDPESSJUR   = '+qryPatro.FieldbyName('IDPESSOA').AsString+
        ' AND   S.IDSITFUNC(+) = TABCRITICASCCP.IDSITFUNC '+
        ' AND   GRUPO       IN ('+sGrupo+') ');

        if Trim(dbcmbTipoErro.Text) <> ''
        then qryInterfCadAnalitico.SQL.Add(' AND CODERRO = '+IntToStr(dbcmbTipoErro.ItemIndex) );

        //seleção de situalção
        if trim(dblkpcmbSitPartInterno.text) <> '' then
        qryInterfCadAnalitico.SQL.Add(' AND NVL(FLGSITPART,''AT'') = '''+qrySitPartInterno.FieldByName('FLGINTERNO').AsString+''' ');

        if trim(cmbsitfunc.text) <> '' then
        qryInterfCadSintetico.sql.text := qryInterfCadSintetico.sql.text +  ' AND  IDSITFUNC  = '''+qrysitfunc.FieldByName('IDSITFUNC').AsString+''' ';

        qryInterfCadAnalitico.SQL.Add(' ORDER BY GRUPO, DESCERRO, VALORCHAVE ');
        qryInterfCadAnalitico.Open;
     end;
  end;

end;

procedure TfrmPRelCriticaCadSintet.FormShow(Sender: TObject);
begin
  inherited;
  if dtmRelatorios.cTipoRelCriticaCadastral = 'A'
  then Caption := 'Parâmetros para as Críticas de Interface Cadastral - Analítico'
  else Caption := 'Parâmetros para as Críticas de Interface Cadastral - Sintético';
end;

end.

