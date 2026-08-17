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
// Data        : 03/08/2005
// Pendência   : 19809
// Rotina      : consultas da tela
// Alteração   : inclusão do combo de situação do FUNCIONÁRIO e mudanças para seleção do usuário
//------------------------------------------------------------------------------
// Autor(a)    : leo
// Data        : 13/07/2005
// Pendência   : 19809
// Rotina      : consultas da tela
// Alteração   : inclusão do combo de situação do participante e mudanças para seleção do usuário
//------------------------------------------------------------------------------

unit FConsCriticasCcp1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc,
  DBTables, Wwquery, wwdblook, Mask, MskEdDlg, UTabCriticasCcp, wwdbedit,
  Wwdotdot, Wwdbcomb;

type
  TfrmConsCriticasCcp = class(TfrmOkCancelar)
    qryResumo: TwwQuery;
    dsResumo: TwwDataSource;
    qryDet: TwwQuery;
    dsDet: TwwDataSource;
    qryPatroCombo: TwwQuery;
    ToolbarSep972: TToolbarSep97;
    qryAux: TwwQuery;
    bbtnRel: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    qryMes: TwwQuery;
    grpFiltro: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    dblkPatrocinadora: TwwDBLookupCombo;
    cmbMes: TwwDBComboBox;
    pnlOcorrencias: TPanel;
    grpResumo: TGroupBox;
    dbgrdResumo: TwwDBGrid;
    grpDet: TGroupBox;
    Panel3: TPanel;
    btnaceitar: TSpeedButton;
    btnrejeitar: TSpeedButton;
    btndesfaz: TSpeedButton;
    Panel5: TPanel;
    dbgrddetalhe: TwwDBGrid;
    dbgrddetalhebtn: TwwIButton;
    Panel6: TPanel;
    rdgrpvis: TRadioGroup;
    Label7: TLabel;
    pnlcores: TPanel;
    Shape2: TShape;
    Label1: TLabel;
    Shape4: TShape;
    Label4: TLabel;
    Shape5: TShape;
    Label5: TLabel;
    Label8: TLabel;
    sbtnVoltar: TSpeedButton;
    cmbGrupo: TComboBox;
    qryupdate: TwwQuery;
    qrySitPartInterno: TwwQuery;
    dblkpcmbSitPartInterno: TwwDBLookupCombo;
    Label9: TLabel;
    cmbsitfunc: TwwDBLookupCombo;
    Label10: TLabel;
    qrysitfunc: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure qryResumoAfterScroll(DataSet: TDataSet);
    procedure dblkPatrocinadoraChange(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure bbtnRelClick(Sender: TObject);
    procedure dbgrddetalhebtnClick(Sender: TObject);
    procedure btnaceitarClick(Sender: TObject);
    procedure btnrejeitarClick(Sender: TObject);
    procedure dbgrddetalheCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure rdgrpvisClick(Sender: TObject);
    procedure dbgrddetalheTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btndesfazClick(Sender: TObject);
    procedure cmbMesCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure cmbMesExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnVoltarClick(Sender: TObject);
    procedure dbgrdResumoDblClick(Sender: TObject);
    procedure dblkpcmbSitPartInternoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    sFlgProcessado , sOrder : String;
    bPodeAtualizar : Boolean;
    procedure AbreDet;

    { Public declarations }
  end;

var
  frmConsCriticasCcp: TfrmConsCriticasCcp;
  TabCriticasCcp : TTabCriticasCcp;

implementation

uses FImportaDadosCadastrais, dRelatorios, UMensErro, UDataBase, DBaseDados,
  UAdmPrev ;

{$R *.DFM}

procedure TfrmConsCriticasCcp.FormCreate(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.enabled := false;
  bbtnConfirmar.enabled := false;
  TabCriticasCcp := TTabCriticasCcp.Create;
  grpResumo.BringToFront;

  qryPatroCombo.Close;
  qryPatroCombo.Open;

  qrySitPartInterno.close;
  qrySitPartInterno.open;

  qrySitfunc.close;
  qrySitfunc.open;

  qryMes.close;
  qryMes.open;

  if qrymes.isempty then
  begin
     MsgDlg('Não há nenhuma crítica de interface registrada até o momento.','Aviso',mtWarning,[mbOk],0);
     exit;
  end;

  while not qrymes.eof do
  begin
     cmbMes.items.add(Copy(qrymes.fieldbyname('MESCOBRANCA').AsString,5,2)+'/'+
                    Copy(qrymes.fieldbyname('MESCOBRANCA').AsString,0,4));
     qryMes.next;
  end;

  bPodeAtualizar := (TabCriticasCcp.PegaUltMes( qryaux,
                                                qryPatroCombo.fieldbyname('IDPESSOA').AsInteger,
                                                Copy(cmbGrupo.text,1,1)
                                               ) <= Copy(cmbMes.Items[0],4,4)+ Copy(cmbMes.Items[0],0,2));

  if frmImportaDadosCadastrais <> nil
  then begin
     qryPatroCombo.Locate('NOME',
                          frmImportaDadosCadastrais.dblkPatrocinadora.text,
                          [loCaseInsensitive,loPartialKey]);

     dblkPatrocinadora.text := qryPatroCombo.fieldbyname('NOME').AsString ;
     cmbMes.text            := cmbMes.Items[0];
     cmbGrupo.ItemIndex     := 0;


     qryResumo.Close;
     qryresumo.sql.text := 'SELECT COUNT(1), '+
                           ' DECODE(CODERRO, 0, ''Participante não encontrado'', '+
                           '              1, ''Agência Bancária não encontrada'', '+
                           '              2, ''Banco não encontrado'', '+
                           '              3, ''Nome do Participante alterado'', '+
                           '              4, ''Data de Admissão alterada'', '+
                           '              5, ''Data de Nascimento alterada'', '+
                           '              6, ''Documento alterado'', '+
                           '              7, ''Número de Dependentes para IR alterado'', '+
                           '              8, ''Cargo não encontrado'',                      '+
                           '              9, ''Cargo alterado'', '+
                           '              10,''Nivel não encontrado'', '+
                           '              11,''Nivel alterado'', '+
                           '              12, ''Sexo alterado'', '+
                           '              13, ''Conta Corrente alterada'', '+
                           '              14, ''Erro ao alterar conta corrente'', '+
                           '              15, ''Erro ao alterar nome'', '+
                           '              16, ''Erro ao alterar documento'', '+
                           '              17, ''Erro ao alterar sexo'',  '+
                           '              18, ''Erro ao alterar data de nascimento'', '+
                           '              19, ''Erro ao altarer data de admissão'',      '+
                           '              20, ''Erro ao alterar n. dependentes IRRF'', '+
                           '              21, ''Erro ao alterar cargo'', '+
                           '              22, ''Erro ao alterar nivel'', '+
                           '              23, ''Participante Assistido - dados não atualizados '', '+
                           '              24, ''Participante Mantido - dados não atualizados '',       '+
                           '              25, ''Endereço Inserido'', '+
                           '              26, ''Logradouro alterado'', '+
                           '              27, ''Bairro alterado'', '+
                           '              28, ''CEP alterado'', '+
                           '              29, ''UF do Endereço alterado'', '+
                           '              30, ''Número do Telefone alterado'', '+
                           '              31, ''Cidade do Endereço alterada'', '+
                           '              32, ''Telefone Inserido'', '+
                           '              33, ''Número da Carteira de Identidade alterado'', '+
                           '              34, ''UF da Carteira de Identidade alterada'', '+
                           '              35, ''Data de Expedição da Carteira de Identidade alterada'', '+
                           '              36, ''Nome do Pai alterado'', '+
                           '              37, ''Nome da Mãe alterado'', '+
                           '              38, ''Código do Municipio de Naturalidade alterado'', '+
                           '              39, ''Matrícula do Conjuge alterada '', '+
                           '              40, ''Tempo de Serviço Total alterado '', '+
                           '              41, ''Tempo de Serviço Não Creditado  alterado '', '+
                           '              42, ''Documento de Identidade Inserido'', '+
                           '              43, ''Dependente Inserido (não existia no cadastro)'', '+
                           '              44, ''Estado Civil  alterado '', '+
                           '              45, ''Indicador para Salário de IR  alterado '', '+
                           '              46, ''Indicador para Salário Família  alterado '', '+
                           '              47, ''Indicador de Invalidez  alterado '', '+
                           '              48, ''Data de Início do Dependente  alterada'', '+
                           '              49, ''Grau de Dependência  alterado '', '+
                           '              50, ''Indicador de Cargo de Diretor  alterado '', '+
                           '              51, ''Tempo de Serviço Anterior alterado'', '+
                           '              52, ''Tempo de Serviço Publico Anterior alterado'', '+
                           '              53, ''Tempo de Serviço Privado Anterior alterado'', '+
                           '              54, ''Tempo de Serviço Anterior Real alterado'', '+
                           '              55, ''Filial do Empregado alterada'', '+
                           '              56, ''Filial não encontrada'', '+
                           '              57, ''Situação do Empregado alterada'', '+
                           '              58, ''Vinculação Funcional do Empregado alterada'', '+
                           '              59, ''Função Não Encontrada'', '+
                           '              60, ''Função alterada'', '+
                           '              61, ''Data de Demissão alterada'', '+
                           '              62, ''Data de Readmissão alterada'', '+
                           '              63, ''Data do Falecimento alterada'', '+
                           '              64, ''Participante Cancelado - dados não atualizados '', '+
                           '              65, ''Cidade do Endereço não encontrada '', '+
                           '              66, ''Agência Bancária em Branco'', '+
                           '              67, ''UF não encontrada na tabela de Estado'', '+
                           '              68, ''Erro ao inserir novo dependente'', '+
                           '              69, ''Novo Funcionario Cadastrado'', '+
                           '              70, ''Centro de Custo do Empregado Alterado'', '+
                           '              71, ''Salário Total na Empresa Alterado'', '+
                           '              72, ''Matricula Alterada'', '+
                           '              73, ''Email do Contato Alterado'', '+
                           '              74, ''Cargo do Contato Alterado'', '+
                           '              75, ''Setor do Contato Alterado'', '+
                           '              76, ''Data Nascimento do Contato Alterado'', '+
                           '              77, ''Obs do Contato Alterado'', '+
                           '              78, ''Novo cargo inserido na evolução funcional'', '+
                           '              79, ''Nova função inserida na evolução funcional'', '+
                           '              80, ''Inserido Adicional compensatório'', '+
                           '              81, ''Inserido adicional por tempo de serviço'', '+
                           '              82, ''Inserido adicional noturno'', '+
                           '              83, ''Inserido percentual por periculosidade'', '+
                           '              84, ''Inserido percentual de insalubridade'', '+
                           '              85, ''Data final do cargo atual alterada'', '+
                           '              86, ''Data final da função atual alterada'', '+
                           '              87, ''Data final do percentual por insalubridade alterado'', '+
                           '              88, ''Percentual de insalubridade alterado'', '+
                           '              89, ''Percentual por periculosidade alterado'', '+
                           '              90, ''Data final do adicional noturno alterada'', '+
                           '              91, ''Percentual do aicional noturno alterado'', '+
                           '              92, ''Inserido pecentual de adicional noturno'', '+
                           '              93, ''Data final d adicional por tempo de serviço alterada'', '+
                           '              94, ''Percentual por tempo de serviço alterado'', '+
                           '              95, ''Data final do adicional compensatório alterada'', '+
                           '              96, ''Percental de adicional compensatório alterado'', '+
                           '              97, ''Situação na patrocinadora alterada'', '+
                           '              98, ''Valor da opção 1 da patrocinadora alterado'' , '+
                           '              99, ''Valor da opção 2 da patrocinadora alterado'' , '+
                           '              100, ''Valor da opção 3 da patrocinadora alterado'' , '+
                           '              101, ''Valor da opção 4 da patrocinadora alterado'' , '+
                           '              102, ''Valor da opção 5 da patrocinadora alterado'' , '+
                           '              103, ''Valor da opção 6 da patrocinadora alterado'' , '+
                           '              104, ''Evento previdenciário inserido'', '+
                           '              105, ''Descrição da rubrica alterada'', '+
                           '              106, ''Indicador (Provento/Desconto) da rubrica alterado'', '+
                           '              107, ''Indicador (Atraso/Devolução/Normal) da rubrica alterado'', '+
                           '              108, ''Rubrica inserida'', '+
                           '              109, ''Nome da filial alterado'', '+
                           '              110, ''Tipo da filial (Capital/Interior) alterado'', '+
                           '              111, ''CGC da filial alterado'', '+
                           '              112, ''Sigla da filial alterada'', '+
                           '              113, ''Filial inserida'', '+
                           '              114, ''Noma da agência alterado'', '+
                           '              115, ''Agência inserida'', '+
                           '              116, ''Elegível inserido'', '+
                           '              117, ''Erro ao inserir elegível'', '+
                           '              118, ''e-mail alterado'', '+
                           '              119, ''Dt. inicio do cargo informado menor que a do cargo atual '', '+
                           '              120, ''Dt. inicio da função infromada menor que a da função atual '', '+
                           '              121, ''Data final da filial alterada  '', '+
                           '              122, ''DDD Alterado '' '+
                           '              ) AS DESCERRO, '+
                           ' CODERRO, GRUPO '+
                           ' FROM TABCRITICASCCP '+
                           ' WHERE MESCOBRANCA = '''+Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2)+''' '+
                           ' AND   IDPESSJUR   = '''+qryPatroCombo.fieldbyname('IDPESSOA').AsString+''' '+
                           ' AND   GRUPO       = '''+Copy(cmbGrupo.text,1,1)+''' ';

     if trim(dblkpcmbSitPartInterno.text) <> '' then
     qryresumo.sql.text := qryresumo.sql.text +  ' AND NVL(FLGSITPART,''AT'') = '''+qrySitPartInterno.FieldByName('FLGINTERNO').AsString+''' ';

     if trim(cmbsitfunc.text) <> '' then
     qryresumo.sql.text := qryresumo.sql.text +  ' AND  IDSITFUNC  = '''+qrysitfunc.FieldByName('IDSITFUNC').AsString+''' ';


     qryresumo.sql.text := qryresumo.sql.text +  ' GROUP BY DECODE(CODERRO, 0, ''Participante não encontrado'', '+
                           '              1, ''Agência Bancária não encontrada'', '+
                           '              2, ''Banco não encontrado'', '+
                           '              3, ''Nome do Participante alterado'', '+
                           '              4, ''Data de Admissão alterada'', '+
                           '              5, ''Data de Nascimento alterada'', '+
                           '              6, ''Documento alterado'', '+
                           '              7, ''Número de Dependentes para IR alterado'', '+
                           '              8, ''Cargo não encontrado'', '+
                           '              9, ''Cargo alterado'', '+
                           '              10, ''Nivel não encontrado'', '+
                           '              11, ''Nivel alterado'', '+
                           '              12, ''Sexo alterado'', '+
                           '              13, ''Conta Corrente alterada'', '+
                           '              14, ''Erro ao alterar conta corrente'', '+
                           '              15, ''Erro ao alterar nome'', '+
                           '              16, ''Erro ao alterar Documento'', '+
                           '              17, ''Erro ao alterar sexo'', '+
                           '              18, ''Erro ao alterar data de nascimento'', '+
                           '              19, ''Erro ao altarer data de admissão'', '+
                           '              20, ''Erro ao alterar n. dependentes IRRF'', '+
                           '              21, ''Erro ao alterar cargo'', '+
                           '              22, ''Erro ao alterar nivel'', '+
                           '              23, ''Participante Assistido - dados não atualizados '', '+
                           '              24, ''Participante Mantido - dados não atualizados '', '+
                           '              25, ''Endereço Inserido'', '+
                           '              26, ''Logradouro alterado'', '+
                           '              27, ''Bairro alterado'', '+
                           '              28, ''CEP alterado'', '+
                           '              29, ''UF do Endereço alterado'', '+
                           '              30, ''Número do Telefone alterado'', '+
                           '              31, ''Cidade do Endereço alterada'', '+
                           '              32, ''Telefone Inserido'', '+
                           '              33, ''Número da Carteira de Identidade alterado'', '+
                           '              34, ''UF da Carteira de Identidade alterada'', '+
                           '              35, ''Data de Expedição da Carteira de Identidade alterada'', '+
                           '              36, ''Nome do Pai alterado'', '+
                           '              37, ''Nome da Mãe alterado'', '+
                           '              38, ''Código do Municipio de Naturalidade alterado'', '+
                           '              39, ''Matrícula do Conjuge alterada '', '+
                           '              40, ''Tempo de Serviço Total alterado '', '+
                           '              41, ''Tempo de Serviço Não Creditado  alterado '', '+
                           '              42, ''Documento de Identidade Inserido'', '+
                           '              43, ''Dependente Inserido (não existia no cadastro)'', '+
                           '              44, ''Estado Civil  alterado '', '+
                           '              45, ''Indicador para Salário de IR  alterado '', '+
                           '              46, ''Indicador para Salário Família  alterado '', '+
                           '              47, ''Indicador de Invalidez  alterado '', '+
                           '              48, ''Data de Início do Dependente  alterada'', '+
                           '              49, ''Grau de Dependência  alterado '', '+
                           '              50, ''Indicador de Cargo de Diretor  alterado '', '+
                           '              51, ''Tempo de Serviço Anterior alterado'', '+
                           '              52, ''Tempo de Serviço Publico Anterior alterado'', '+
                           '              53, ''Tempo de Serviço Privado Anterior alterado'', '+
                           '              54, ''Tempo de Serviço Anterior Real alterado'', '+
                           '              55, ''Filial do Empregado alterada'', '+
                           '              56, ''Filial não encontrada'', '+
                           '              57, ''Situação do Empregado alterada'', '+
                           '              58, ''Vinculação Funcional do Empregado alterada'', '+
                           '              59, ''Função Não Encontrada'', '+
                           '              60, ''Função alterada'', '+
                           '              61, ''Data de Demissão alterada'', '+
                           '              62, ''Data de Readmissão alterada'', '+
                           '              63, ''Data do Falecimento alterada'', '+
                           '              64, ''Participante Cancelado - dados não atualizados '', '+
                           '              65, ''Cidade do Endereço não encontrada '', '+
                           '              66, ''Agência Bancária em Branco'', '+
                           '              68, ''Erro ao inserir novo dependente'', '+
                           '              69, ''Novo Funcionario Cadastrado'', '+
                           '              70, ''Centro de Custo do Empregado Alterado'', '+
                           '              71, ''Salário Total na Empresa Alterado'', '+
                           '              72, ''Matricula Alterada'', '+
                           '              73, ''Email do Contato Alterado'', '+
                           '              74, ''Cargo do Contato Alterado'', '+
                           '              75, ''Setor do Contato Alterado'', '+
                           '              76, ''Data Nascimento do Contato Alterado'', '+
                           '              77, ''Obs do Contato Alterado'', '+
                           '              78, ''Novo cargo inserido na evolução funcional'', '+
                           '              79, ''Nova função inserida na evolução funcional'', '+
                           '              80, ''Inserido Adicional compensatório'', '+
                           '              81, ''Inserido adicional por tempo de serviço'', '+
                           '              82, ''Inserido adicional noturno'', '+
                           '              83, ''Inserido percentual por periculosidade'', '+
                           '              84, ''Inserido percentual de insalubridade'', '+
                           '              85, ''Data final do cargo atual alterada'', '+
                           '              86, ''Data final da função atual alterada'', '+
                           '              87, ''Data final do percentual por insalubridade alterado'', '+
                           '              88, ''Percentual de insalubridade alterado'', '+
                           '              89, ''Percentual por periculosidade alterado'', '+
                           '              90, ''Data final do adicional noturno alterada'', '+
                           '              91, ''Percentual do aicional noturno alterado'', '+
                           '              92, ''Inserido pecentual de adicional noturno'', '+
                           '              93, ''Data final d adicional por tempo de serviço alterada'', '+
                           '              94, ''Percentual por tempo de serviço alterado'', '+
                           '              95, ''Data final do adicional compensatório alterada'', '+
                           '              96, ''Percental de adicional compensatório alterado'', '+
                           '              97, ''Situação do funcionário alterada'', '+
                           '              98, ''Valor da opção 1 da patrocinadora alterado'' , '+
                           '              99, ''Valor da opção 2 da patrocinadora alterado'', '+
                           '              100, ''Valor da opção 3 da patrocinadora alterado'' , '+
                           '              101, ''Valor da opção 4 da patrocinadora alterado'' , '+
                           '              102, ''Valor da opção 5 da patrocinadora alterado'' , '+
                           '              103, ''Valor da opção 6 da patrocinadora alterado'' , '+
                           '              104, ''Evento previdenciário inserido'', '+
                           '              105, ''Descrição da rubrica alterada'', '+
                           '              106, ''Indicador (Provento/Desconto) da rubrica alterado'', '+
                           '              107, ''Indicador (Atraso/Devolução/Normal) da rubrica alterado'', '+
                           '              108, ''Rubrica inserida'', '+
                           '              109, ''Nome da filial alterado'', '+
                           '              110, ''Tipo da filial (Capital/Interior) alterado'', '+
                           '              111, ''CGC da filial alterado'', '+
                           '              112, ''Sigla da filial alterada'', '+
                           '              113, ''Filial inserida'', '+
                           '              114, ''Noma da agência alterado'', '+
                           '              115, ''Agência inserida'', '+
                           '              116, ''Elegível inserido'', '+
                           '              117, ''Erro ao inserir elegível'', '+
                           '              118, ''e-mail alterado'', '+
                           '              119, ''Dt. inicio do cargo informado menor que a do cargo atual '' , '+
                           '              120, ''Dt. inicio da função infromada menor que a da função atual '', '+
                           '              121, ''Data final da filial alterada  '', '+
                           '              122, ''DDD Alterado '' '+
                           '               ),  CODERRO, GRUPO  '+
                           ' ORDER BY CODERRO ';

     qryResumo.Open;
  end;

  sOrder         := ' ORDER BY VALORCHAVE';
  sFlgProcessado := ' ';



end;

procedure TfrmConsCriticasCcp.AbreDet;
begin

  if (qryPatroCombo.fieldbyname('IDPESSOA').AsInteger > 0) and
     (trim(Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2)) <> '') then
  begin

     if not qryresumo.active then
     begin
        qryResumo.Close;
        qryresumo.sql.text := 'SELECT COUNT(1), '+
                              ' DECODE(CODERRO, 0, ''Participante não encontrado'', '+
                              '              1, ''Agência Bancária não encontrada'', '+
                              '              2, ''Banco não encontrado'', '+
                              '              3, ''Nome do Participante alterado'', '+
                              '              4, ''Data de Admissão alterada'', '+
                              '              5, ''Data de Nascimento alterada'', '+
                              '              6, ''Documento alterado'', '+
                              '              7, ''Número de Dependentes para IR alterado'', '+
                              '              8, ''Cargo não encontrado'',                      '+
                              '              9, ''Cargo alterado'', '+
                              '              10,''Nivel não encontrado'', '+
                              '              11,''Nivel alterado'', '+
                              '              12, ''Sexo alterado'', '+
                              '              13, ''Conta Corrente alterada'', '+
                              '              14, ''Erro ao alterar conta corrente'', '+
                              '              15, ''Erro ao alterar nome'', '+
                              '              16, ''Erro ao alterar documento'', '+
                              '              17, ''Erro ao alterar sexo'',  '+
                              '              18, ''Erro ao alterar data de nascimento'', '+
                              '              19, ''Erro ao altarer data de admissão'',      '+
                              '              20, ''Erro ao alterar n. dependentes IRRF'', '+
                              '              21, ''Erro ao alterar cargo'', '+
                              '              22, ''Erro ao alterar nivel'', '+
                              '              23, ''Participante Assistido - dados não atualizados '', '+
                              '              24, ''Participante Mantido - dados não atualizados '',       '+
                              '              25, ''Endereço Inserido'', '+
                              '              26, ''Logradouro alterado'', '+
                              '              27, ''Bairro alterado'', '+
                              '              28, ''CEP alterado'', '+
                              '              29, ''UF do Endereço alterado'', '+
                              '              30, ''Número do Telefone alterado'', '+
                              '              31, ''Cidade do Endereço alterada'', '+
                              '              32, ''Telefone Inserido'', '+
                              '              33, ''Número da Carteira de Identidade alterado'', '+
                              '              34, ''UF da Carteira de Identidade alterada'', '+
                              '              35, ''Data de Expedição da Carteira de Identidade alterada'', '+
                              '              36, ''Nome do Pai alterado'', '+
                              '              37, ''Nome da Mãe alterado'', '+
                              '              38, ''Código do Municipio de Naturalidade alterado'', '+
                              '              39, ''Matrícula do Conjuge alterada '', '+
                              '              40, ''Tempo de Serviço Total alterado '', '+
                              '              41, ''Tempo de Serviço Não Creditado  alterado '', '+
                              '              42, ''Documento de Identidade Inserido'', '+
                              '              43, ''Dependente Inserido (não existia no cadastro)'', '+
                              '              44, ''Estado Civil  alterado '', '+
                              '              45, ''Indicador para Salário de IR  alterado '', '+
                              '              46, ''Indicador para Salário Família  alterado '', '+
                              '              47, ''Indicador de Invalidez  alterado '', '+
                              '              48, ''Data de Início do Dependente  alterada'', '+
                              '              49, ''Grau de Dependência  alterado '', '+
                              '              50, ''Indicador de Cargo de Diretor  alterado '', '+
                              '              51, ''Tempo de Serviço Anterior alterado'', '+
                              '              52, ''Tempo de Serviço Publico Anterior alterado'', '+
                              '              53, ''Tempo de Serviço Privado Anterior alterado'', '+
                              '              54, ''Tempo de Serviço Anterior Real alterado'', '+
                              '              55, ''Filial do Empregado alterada'', '+
                              '              56, ''Filial não encontrada'', '+
                              '              57, ''Situação do Empregado alterada'', '+
                              '              58, ''Vinculação Funcional do Empregado alterada'', '+
                              '              59, ''Função Não Encontrada'', '+
                              '              60, ''Função alterada'', '+
                              '              61, ''Data de Demissão alterada'', '+
                              '              62, ''Data de Readmissão alterada'', '+
                              '              63, ''Data do Falecimento alterada'', '+
                              '              64, ''Participante Cancelado - dados não atualizados '', '+
                              '              65, ''Cidade do Endereço não encontrada '', '+
                              '              66, ''Agência Bancária em Branco'', '+
                              '              67, ''UF não encontrada na tabela de Estado'', '+
                              '              68, ''Erro ao inserir novo dependente'', '+
                              '              69, ''Novo Funcionario Cadastrado'', '+
                              '              70, ''Centro de Custo do Empregado Alterado'', '+
                              '              71, ''Salário Total na Empresa Alterado'', '+
                              '              72, ''Matricula Alterada'', '+
                              '              73, ''Email do Contato Alterado'', '+
                              '              74, ''Cargo do Contato Alterado'', '+
                              '              75, ''Setor do Contato Alterado'', '+
                              '              76, ''Data Nascimento do Contato Alterado'', '+
                              '              77, ''Obs do Contato Alterado'', '+
                              '              78, ''Novo cargo inserido na evolução funcional'', '+
                              '              79, ''Nova função inserida na evolução funcional'', '+
                              '              80, ''Inserido Adicional compensatório'', '+
                              '              81, ''Inserido adicional por tempo de serviço'', '+
                              '              82, ''Inserido adicional noturno'', '+
                              '              83, ''Inserido percentual por periculosidade'', '+
                              '              84, ''Inserido percentual de insalubridade'', '+
                              '              85, ''Data final do cargo atual alterada'', '+
                              '              86, ''Data final da função atual alterada'', '+
                              '              87, ''Data final do percentual por insalubridade alterado'', '+
                              '              88, ''Percentual de insalubridade alterado'', '+
                              '              89, ''Percentual por periculosidade alterado'', '+
                              '              90, ''Data final do adicional noturno alterada'', '+
                              '              91, ''Percentual do aicional noturno alterado'', '+
                              '              92, ''Inserido pecentual de adicional noturno'', '+
                              '              93, ''Data final d adicional por tempo de serviço alterada'', '+
                              '              94, ''Percentual por tempo de serviço alterado'', '+
                              '              95, ''Data final do adicional compensatório alterada'', '+
                              '              96, ''Percental de adicional compensatório alterado'', '+
                              '              97, ''Situação na patrocinadora alterada'', '+
                              '              98, ''Valor da opção 1 da patrocinadora alterado'' , '+
                              '              99, ''Valor da opção 2 da patrocinadora alterado'' , '+
                              '              100, ''Valor da opção 3 da patrocinadora alterado'' , '+
                              '              101, ''Valor da opção 4 da patrocinadora alterado'' , '+
                              '              102, ''Valor da opção 5 da patrocinadora alterado'' , '+
                              '              103, ''Valor da opção 6 da patrocinadora alterado'' , '+
                              '              104, ''Evento previdenciário inserido'', '+
                              '              105, ''Descrição da rubrica alterada'', '+
                              '              106, ''Indicador (Provento/Desconto) da rubrica alterado'', '+
                              '              107, ''Indicador (Atraso/Devolução/Normal) da rubrica alterado'', '+
                              '              108, ''Rubrica inserida'', '+
                              '              109, ''Nome da filial alterado'', '+
                              '              110, ''Tipo da filial (Capital/Interior) alterado'', '+
                              '              111, ''CGC da filial alterado'', '+
                              '              112, ''Sigla da filial alterada'', '+
                              '              113, ''Filial inserida'', '+
                              '              114, ''Noma da agência alterado'', '+
                              '              115, ''Agência inserida'', '+
                              '              116, ''Elegível inserido'', '+
                              '              117, ''Erro ao inserir elegível'', '+
                              '              118, ''e-mail alterado'', '+
                              '              119, ''Dt. inicio do cargo informado menor que a do cargo atual '', '+
                              '              120, ''Dt. inicio da função infromada menor que a da função atual '', '+
                              '              121, ''Data final da filial alterada  '', '+
                              '              122, ''DDD Alterado '' '+
                              '              ) AS DESCERRO, '+
                              ' CODERRO, GRUPO '+
                              ' FROM TABCRITICASCCP '+
                              ' WHERE MESCOBRANCA = '''+Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2)+''' '+
                              ' AND   IDPESSJUR   = '''+qryPatroCombo.fieldbyname('IDPESSOA').AsString+''' '+
                              ' AND   GRUPO       = '''+Copy(cmbGrupo.text,1,1)+''' ';

        if trim(dblkpcmbSitPartInterno.text) <> '' then
        qryresumo.sql.text := qryresumo.sql.text +  ' AND NVL(FLGSITPART,''AT'') = '''+qrySitPartInterno.FieldByName('FLGINTERNO').AsString+''' ';

        if trim(cmbsitfunc.text) <> '' then
        qryresumo.sql.text := qryresumo.sql.text +  ' AND  IDSITFUNC  = '''+qrysitfunc.FieldByName('IDSITFUNC').AsString+''' ';

        qryresumo.sql.text := qryresumo.sql.text +  ' GROUP BY DECODE(CODERRO, 0, ''Participante não encontrado'', '+
                              '              1, ''Agência Bancária não encontrada'', '+
                              '              2, ''Banco não encontrado'', '+
                              '              3, ''Nome do Participante alterado'', '+
                              '              4, ''Data de Admissão alterada'', '+
                              '              5, ''Data de Nascimento alterada'', '+
                              '              6, ''Documento alterado'', '+
                              '              7, ''Número de Dependentes para IR alterado'', '+
                              '              8, ''Cargo não encontrado'', '+
                              '              9, ''Cargo alterado'', '+
                              '              10, ''Nivel não encontrado'', '+
                              '              11, ''Nivel alterado'', '+
                              '              12, ''Sexo alterado'', '+
                              '              13, ''Conta Corrente alterada'', '+
                              '              14, ''Erro ao alterar conta corrente'', '+
                              '              15, ''Erro ao alterar nome'', '+
                              '              16, ''Erro ao alterar Documento'', '+
                              '              17, ''Erro ao alterar sexo'', '+
                              '              18, ''Erro ao alterar data de nascimento'', '+
                              '              19, ''Erro ao altarer data de admissão'', '+
                              '              20, ''Erro ao alterar n. dependentes IRRF'', '+
                              '              21, ''Erro ao alterar cargo'', '+
                              '              22, ''Erro ao alterar nivel'', '+
                              '              23, ''Participante Assistido - dados não atualizados '', '+
                              '              24, ''Participante Mantido - dados não atualizados '', '+
                              '              25, ''Endereço Inserido'', '+
                              '              26, ''Logradouro alterado'', '+
                              '              27, ''Bairro alterado'', '+
                              '              28, ''CEP alterado'', '+
                              '              29, ''UF do Endereço alterado'', '+
                              '              30, ''Número do Telefone alterado'', '+
                              '              31, ''Cidade do Endereço alterada'', '+
                              '              32, ''Telefone Inserido'', '+
                              '              33, ''Número da Carteira de Identidade alterado'', '+
                              '              34, ''UF da Carteira de Identidade alterada'', '+
                              '              35, ''Data de Expedição da Carteira de Identidade alterada'', '+
                              '              36, ''Nome do Pai alterado'', '+
                              '              37, ''Nome da Mãe alterado'', '+
                              '              38, ''Código do Municipio de Naturalidade alterado'', '+
                              '              39, ''Matrícula do Conjuge alterada '', '+
                              '              40, ''Tempo de Serviço Total alterado '', '+
                              '              41, ''Tempo de Serviço Não Creditado  alterado '', '+
                              '              42, ''Documento de Identidade Inserido'', '+
                              '              43, ''Dependente Inserido (não existia no cadastro)'', '+
                              '              44, ''Estado Civil  alterado '', '+
                              '              45, ''Indicador para Salário de IR  alterado '', '+
                              '              46, ''Indicador para Salário Família  alterado '', '+
                              '              47, ''Indicador de Invalidez  alterado '', '+
                              '              48, ''Data de Início do Dependente  alterada'', '+
                              '              49, ''Grau de Dependência  alterado '', '+
                              '              50, ''Indicador de Cargo de Diretor  alterado '', '+
                              '              51, ''Tempo de Serviço Anterior alterado'', '+
                              '              52, ''Tempo de Serviço Publico Anterior alterado'', '+
                              '              53, ''Tempo de Serviço Privado Anterior alterado'', '+
                              '              54, ''Tempo de Serviço Anterior Real alterado'', '+
                              '              55, ''Filial do Empregado alterada'', '+
                              '              56, ''Filial não encontrada'', '+
                              '              57, ''Situação do Empregado alterada'', '+
                              '              58, ''Vinculação Funcional do Empregado alterada'', '+
                              '              59, ''Função Não Encontrada'', '+
                              '              60, ''Função alterada'', '+
                              '              61, ''Data de Demissão alterada'', '+
                              '              62, ''Data de Readmissão alterada'', '+
                              '              63, ''Data do Falecimento alterada'', '+
                              '              64, ''Participante Cancelado - dados não atualizados '', '+
                              '              65, ''Cidade do Endereço não encontrada '', '+
                              '              66, ''Agência Bancária em Branco'', '+
                              '              68, ''Erro ao inserir novo dependente'', '+
                              '              69, ''Novo Funcionario Cadastrado'', '+
                              '              70, ''Centro de Custo do Empregado Alterado'', '+
                              '              71, ''Salário Total na Empresa Alterado'', '+
                              '              72, ''Matricula Alterada'', '+
                              '              73, ''Email do Contato Alterado'', '+
                              '              74, ''Cargo do Contato Alterado'', '+
                              '              75, ''Setor do Contato Alterado'', '+
                              '              76, ''Data Nascimento do Contato Alterado'', '+
                              '              77, ''Obs do Contato Alterado'', '+
                              '              78, ''Novo cargo inserido na evolução funcional'', '+
                              '              79, ''Nova função inserida na evolução funcional'', '+
                              '              80, ''Inserido Adicional compensatório'', '+
                              '              81, ''Inserido adicional por tempo de serviço'', '+
                              '              82, ''Inserido adicional noturno'', '+
                              '              83, ''Inserido percentual por periculosidade'', '+
                              '              84, ''Inserido percentual de insalubridade'', '+
                              '              85, ''Data final do cargo atual alterada'', '+
                              '              86, ''Data final da função atual alterada'', '+
                              '              87, ''Data final do percentual por insalubridade alterado'', '+
                              '              88, ''Percentual de insalubridade alterado'', '+
                              '              89, ''Percentual por periculosidade alterado'', '+
                              '              90, ''Data final do adicional noturno alterada'', '+
                              '              91, ''Percentual do aicional noturno alterado'', '+
                              '              92, ''Inserido pecentual de adicional noturno'', '+
                              '              93, ''Data final d adicional por tempo de serviço alterada'', '+
                              '              94, ''Percentual por tempo de serviço alterado'', '+
                              '              95, ''Data final do adicional compensatório alterada'', '+
                              '              96, ''Percental de adicional compensatório alterado'', '+
                              '              97, ''Situação do funcionário alterada'', '+
                              '              98, ''Valor da opção 1 da patrocinadora alterado'' , '+
                              '              99, ''Valor da opção 2 da patrocinadora alterado'', '+
                              '              100, ''Valor da opção 3 da patrocinadora alterado'' , '+
                              '              101, ''Valor da opção 4 da patrocinadora alterado'' , '+
                              '              102, ''Valor da opção 5 da patrocinadora alterado'' , '+
                              '              103, ''Valor da opção 6 da patrocinadora alterado'' , '+
                              '              104, ''Evento previdenciário inserido'', '+
                              '              105, ''Descrição da rubrica alterada'', '+
                              '              106, ''Indicador (Provento/Desconto) da rubrica alterado'', '+
                              '              107, ''Indicador (Atraso/Devolução/Normal) da rubrica alterado'', '+
                              '              108, ''Rubrica inserida'', '+
                              '              109, ''Nome da filial alterado'', '+
                              '              110, ''Tipo da filial (Capital/Interior) alterado'', '+
                              '              111, ''CGC da filial alterado'', '+
                              '              112, ''Sigla da filial alterada'', '+
                              '              113, ''Filial inserida'', '+
                              '              114, ''Noma da agência alterado'', '+
                              '              115, ''Agência inserida'', '+
                              '              116, ''Elegível inserido'', '+
                              '              117, ''Erro ao inserir elegível'', '+
                              '              118, ''e-mail alterado'', '+
                              '              119, ''Dt. inicio do cargo informado menor que a do cargo atual '' , '+
                              '              120, ''Dt. inicio da função infromada menor que a da função atual '', '+
                              '              121, ''Data final da filial alterada  '', '+
                              '              122, ''DDD Alterado '' '+
                              '               ),  CODERRO, GRUPO  '+
                              ' ORDER BY CODERRO ';

        qryResumo.Open;
     end;

     if qryResumo.fieldbyname('CODERRO').AsString <> ''
     then begin
        qryDet.close;
        qryDet.SQL.clear;
        qryDet.sql.add(' SELECT DECODE(CHAVE,''M'',''Matrícula'',''I'',''Inscrição'',''A'',''Num. Agência'',''F'',''Num. Filial'',''R'',''Cod. Rubrica'') CHAVE, '+
                       '        VALORCHAVE, VALORNAFUNDACAO, VALORNOINTERFACE,         '+
                       '        NVL(FLGPROCESSADO,0) FLGPROCESSADO , DTPROCESSADO, SEQCRITICA, IDPESSOA , '+
                       '        DECODE( FLGPROCESSADO, ''1'', ''Aceito'',''2'',''Rejeitado'',''Não processado'') STATUSPROC, '+
                       '        VALORCHAVEAUX NOME, AUXILIAR1, AUXILIAR2 ,AUXILIAR3,AUXILIAR4 ,AUXILIAR5          '+
                       ' FROM   TABCRITICASCCP '+
                       ' WHERE  MESCOBRANCA = '''+Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2)+''''+
                       ' AND    IDPESSJUR   = '+qryPatroCombo.fieldbyname('IDPESSOA').AsString+
                       ' AND    CODERRO     = '+qryResumo.fieldbyname('CODERRO').AsString+
                       ' AND    GRUPO       = '''+qryResumo.fieldbyname('GRUPO').AsString+''' ');

        //leofuncef - 13072005 - seleção de situalção
        if trim(dblkpcmbSitPartInterno.text) <> '' then
        qryDet.SQL.Add(' AND NVL(FLGSITPART,''AT'') = '''+qrySitPartInterno.FieldByName('FLGINTERNO').AsString+''' ');
        //leofuncef - 13072005 - fim

        if trim(cmbsitfunc.text) <> '' then
        qryresumo.sql.text := qryresumo.sql.text +  ' AND  IDSITFUNC  = '''+qrysitfunc.FieldByName('IDSITFUNC').AsString+''' ';

        qryDet.SQL.Add(sFlgProcessado+sOrder);
        qryDet.open;
     end;
  end;
end;

procedure TfrmConsCriticasCcp.qryResumoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AbreDet;

  bPodeAtualizar :=  (TabCriticasCcp.PegaUltMes(qryaux,
                     qryPatroCombo.fieldbyname('IDPESSOA').AsInteger, Copy(cmbGrupo.text,1,1)) <=
                     Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2));

  if not   bPodeAtualizar then
  begin
     MsgDlg('Os dados deste mês não podem mais ser atualizados, pois os arquivos de'+
            ' um mês posterior já foi importado.','Aviso',mtWarning,[mbOk],0);
     btnAceitar.Enabled := false;
     btnDesfaz.Enabled := false;
     btnRejeitar.Enabled := false;
     exit;
  end
  else
  begin
     btnAceitar.Enabled := true;
     btnDesfaz.Enabled := true;
     btnRejeitar.Enabled := true;
  end;

  if qryResumo.fieldbyname('coderro').AsInteger in [0,1,2,8,10,14,15,16,17,18,
     19,20,21,22,23,24,104, 102, 67, 59, 56, 117, 119, 120]
  then begin
     btnAceitar.Enabled := false;
     btnDesfaz.Enabled := false;
     btnRejeitar.Enabled := false;
  end
  else
  begin
     btnAceitar.Enabled := true;
     btnDesfaz.Enabled := true;
     btnRejeitar.Enabled := true;
  end;

  if qryResumo.fieldbyname('coderro').AsInteger = 116
  then  btnDesfaz.Enabled := false;

end;

procedure TfrmConsCriticasCcp.dblkPatrocinadoraChange(Sender: TObject);
begin
  inherited;
  qryDet.close;
  qryResumo.Close;

  AbreDet;
end;


procedure TfrmConsCriticasCcp.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qrydet.isempty then
  bbtnrel.enabled := false
  else   bbtnrel.enabled := true;
end;

procedure TfrmConsCriticasCcp.bbtnRelClick(Sender: TObject);
begin
  inherited;
  if qryresumo.isempty then exit;
  with dtmRelatorios do
  begin
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
     qryFundacao.Open;

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
     '                     ''T'', ''Contatos'',           '+
     '                     ''R'', ''Rubricas'',           '+
     '                     ''F'', ''Filiais'',           '+
     '                     ''A'', ''Agências''            '+
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
     '      DECODE(CHAVE,''M'',''Matrícula'',''I'',''Inscrição'',''A'',''Num. Agência'',''F'',''Num. Filial'',''R'',''Cod. Rubrica'') CHAVE, '+
     '      1 AS CONT,                                                   '+
     '      VALORCHAVE,                                                  '+
     '      VALORNAFUNDACAO,                                             '+
     '      VALORNOINTERFACE,                                             '+
     ' DECODE(FLGSITPART, ''AT'', ''ATIVO'',''MA'',''MANTIDO'',''MP'', ''MANTIDO PARCIAL'',''MS'',''MANUTENÇÃO DE SALDO DE CONTA'','+
     ' ''AS'',''ASSISTIDO'',''CA'',''CANCELADO'',''AE'',''PN'', ''PENDENTE'','''' ) SITPART, '+
     ' S.DESCRICAO SITFUNC, '+
     ' DECODE(CHAVE,''M'',''Categ. de Sit. do Part. na Fundação'','''') TITULO1, '+
     ' DECODE(CHAVE,''M'',''Situação do Funcionário na Patrocinadora'','''') TITULO2 '+
     ' FROM  TABCRITICASCCP , SITFUNC S                         '+
     ' WHERE MESCOBRANCA = '''+Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2)+''''+
     ' AND   IDPESSJUR   = '+qryPatroCombo.fieldbyname('IDPESSOA').AsString+
     ' AND   GRUPO       = '''+Copy(cmbGrupo.text,1,1)+''''+
     ' AND   S.IDSITFUNC(+) = TABCRITICASCCP.IDSITFUNC '+
     ' AND CODERRO = '+qryResumo.fieldbyname('CODERRO').AsString);

     //leofuncef - 13072005 - seleção de situalção
     if trim(dblkpcmbSitPartInterno.text) <> '' then
     qryInterfCadAnalitico.SQL.Add(' AND NVL(FLGSITPART,''AT'') = '''+qrySitPartInterno.FieldByName('FLGINTERNO').AsString+''' ');
     //leofuncef - 13072005 - fim

     if trim(cmbsitfunc.text) <> '' then
     qryresumo.sql.text := qryresumo.sql.text +  ' AND  IDSITFUNC  = '''+qrysitfunc.FieldByName('IDSITFUNC').AsString+''' ';

     qryInterfCadAnalitico.SQL.Add(' ORDER BY GRUPO, DESCERRO, VALORCHAVE ');
     qryInterfCadAnalitico.Open;

     rpInterfCadAnalitico.ModalPreview := False;
     rpInterfCadAnalitico.ModalCancelDialog := False;

     rpInterfCadAnalitico.Print;
  end;

end;



procedure TfrmConsCriticasCcp.dbgrddetalhebtnClick(Sender: TObject);
begin
  inherited;
  if  not dbgrddetalhe.datasource.dataset.isempty then
  begin
     if uppercase(dbgrddetalhebtn.Hint) = 'SELECIONAR TODOS'
     then
     begin
        dbgrddetalhe.SelectAll;
        dbgrddetalhebtn.Glyph := SpeedButton1.Glyph;
        dbgrddetalhebtn.Hint := 'Retirar Seleção';
     end
     else
     begin
        dbgrddetalhe.UnSelectAll;
        dbgrddetalhebtn.Glyph := SpeedButton2.Glyph;
        dbgrddetalhebtn.Hint := 'Selecionar todos';
     end;
  end;

end;

procedure TfrmConsCriticasCcp.btnaceitarClick(Sender: TObject);
var i : integer;
begin
  inherited;

  if qrydet.isempty then exit;

  if not  dtmBaseDados.dbBaseDados.InTransaction then
  begin
     dtmBaseDados.dbBaseDados.StartTransaction;
     bbtnConfirmar.enabled := true;
     bbtnCancelar.enabled := true;
  end;


  if dbgrddetalhe.SelectedList.Count > 0
  then begin
         for i:= 0 to dbgrddetalhe.SelectedList.Count-1 do
         begin
            dbgrddetalhe.datasource.dataset.GotoBookmark(dbgrddetalhe.SelectedList.items[i]);

            TabCriticasCcp.ProcessaCritica(qryaux, qryupdate,
                                  qryPatroCombo.fieldbyname('IDPESSOA').AsInteger,
                                  qryDet.fieldbyname('IDPESSOA').AsInteger,
                                  qryDet.fieldbyname('SEQCRITICA').AsInteger,
                                  Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2),
                                  qryDet.fieldbyname('VALORNAFUNDACAO').AsString,
                                  qryDet.fieldbyname('VALORNOINTERFACE').AsString,
                                  'DD/MM/YYYY',
                                  TabCriticasCcp.TrazTipoCodErro(qryresumo.fieldbyname('CODERRO').AsInteger),
                                  True,False,
                                  TabCriticasCcp.TrazTipoProcesso(qryDet.fieldbyname('FLGPROCESSADO').AsString),
                                  qryDet.fieldbyname('NOME').AsString,
                                  qryDet.fieldbyname('AUXILIAR1').AsString ,
                                  qryDet.fieldbyname('AUXILIAR2').AsString,
                                  qryDet.fieldbyname('AUXILIAR3').AsString,
                                  qryDet.fieldbyname('AUXILIAR4').AsString,
                                  qryDet.fieldbyname('AUXILIAR5').AsString);


         end; //for
  end //if
  else
  begin
     TabCriticasCcp.ProcessaCritica(qryaux,qryupdate,
                         qryPatroCombo.fieldbyname('IDPESSOA').AsInteger,
                         qryDet.fieldbyname('IDPESSOA').AsInteger,
                         qryDet.fieldbyname('SEQCRITICA').AsInteger,
                         Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2),
                         qryDet.fieldbyname('VALORNAFUNDACAO').AsString,
                         qryDet.fieldbyname('VALORNOINTERFACE').AsString,
                         'DD/MM/YYYY',
                         TabCriticasCcp.TrazTipoCodErro(qryresumo.fieldbyname('CODERRO').AsInteger),
                         True,False,
                         TabCriticasCcp.TrazTipoProcesso(qryDet.fieldbyname('FLGPROCESSADO').AsString),
                         qryDet.fieldbyname('NOME').AsString,
                         qryDet.fieldbyname('AUXILIAR1').AsString ,
                         qryDet.fieldbyname('AUXILIAR2').AsString,
                         qryDet.fieldbyname('AUXILIAR3').AsString,
                         qryDet.fieldbyname('AUXILIAR4').AsString,
                         qryDet.fieldbyname('AUXILIAR5').AsString );
  end;

  AbreDet;

  dbgrddetalhe.UnSelectAll;
  dbgrddetalhebtn.Glyph := SpeedButton2.Glyph;
  dbgrddetalhebtn.Hint := 'Selecionar todos';

end;

procedure TfrmConsCriticasCcp.btnrejeitarClick(Sender: TObject);
var i : integer;
begin
  inherited;
  if qrydet.isempty then exit;

  if not  dtmBaseDados.dbBaseDados.InTransaction then
  begin
     dtmBaseDados.dbBaseDados.StartTransaction;
     bbtnConfirmar.enabled := true;
     bbtnCancelar.enabled := true;
  end;


  if dbgrddetalhe.SelectedList.Count > 0
  then begin
         for i:= 0 to dbgrddetalhe.SelectedList.Count-1 do
         begin
            dbgrddetalhe.datasource.dataset.GotoBookmark(dbgrddetalhe.SelectedList.items[i]);

            TabCriticasCcp.ProcessaCritica(qryaux, qryupdate,
                                  qryPatroCombo.fieldbyname('IDPESSOA').AsInteger,
                                  qryDet.fieldbyname('IDPESSOA').AsInteger,
                                  qryDet.fieldbyname('SEQCRITICA').AsInteger,
                                  Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2),
                                  qryDet.fieldbyname('VALORNAFUNDACAO').AsString,
                                  qryDet.fieldbyname('VALORNOINTERFACE').AsString,
                                  'DD/MM/YYYY',
                                  TabCriticasCcp.TrazTipoCodErro(qryresumo.fieldbyname('CODERRO').AsInteger),
                                  False,False,
                                  TabCriticasCcp.TrazTipoProcesso(qryDet.fieldbyname('FLGPROCESSADO').AsString),
                                  qryDet.fieldbyname('NOME').AsString,
                                  qryDet.fieldbyname('AUXILIAR1').AsString ,
                                  qryDet.fieldbyname('AUXILIAR2').AsString,
                                  qryDet.fieldbyname('AUXILIAR3').AsString,
                                  qryDet.fieldbyname('AUXILIAR4').AsString,
                                  qryDet.fieldbyname('AUXILIAR5').AsString );

         end; //for
  end //if
  else
  begin
     TabCriticasCcp.ProcessaCritica(qryaux, qryupdate,
                      qryPatroCombo.fieldbyname('IDPESSOA').AsInteger,
                      qryDet.fieldbyname('IDPESSOA').AsInteger,
                      qryDet.fieldbyname('SEQCRITICA').AsInteger,
                      Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2),
                      qryDet.fieldbyname('VALORNAFUNDACAO').AsString,
                      qryDet.fieldbyname('VALORNOINTERFACE').AsString,
                      'DD/MM/YYYY',
                      TabCriticasCcp.TrazTipoCodErro(qryresumo.fieldbyname('CODERRO').AsInteger),
                      False,False,
                      TabCriticasCcp.TrazTipoProcesso(qryDet.fieldbyname('FLGPROCESSADO').AsString),
                      qryDet.fieldbyname('NOME').AsString,
                      qryDet.fieldbyname('AUXILIAR1').AsString ,
                      qryDet.fieldbyname('AUXILIAR2').AsString,
                      qryDet.fieldbyname('AUXILIAR3').AsString,
                      qryDet.fieldbyname('AUXILIAR4').AsString,
                      qryDet.fieldbyname('AUXILIAR5').AsString );

  end;

  AbreDet;

  dbgrddetalhe.UnSelectAll;
  dbgrddetalhebtn.Glyph := SpeedButton2.Glyph;
  dbgrddetalhebtn.Hint := 'Selecionar todos';
end;

procedure TfrmConsCriticasCcp.dbgrddetalheCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if (rdgrpvis.itemindex = 0) then
  begin
     if (dbgrddetalhe.datasource.dataset.FieldByName('FLGPROCESSADO').AsInteger = 0)
     then begin // não processado
        ABrush.Color := clWindow;
        AFont.Color  := clWindowText;
        if highlight then begin
           ABrush.Color := clNavy;
           AFont.Color  := clWindow;
        end;
     end
     else if (dbgrddetalhe.datasource.dataset.FieldByName('FLGPROCESSADO').AsInteger = 1)
     then begin //aceito
        ABrush.Color := clSilver;
        AFont.Color  := clWindowText;
        if highlight then begin
           ABrush.Color := clNavy;
           AFont.Color  := clWindow;
        end;
     end
     else if (dbgrddetalhe.datasource.dataset.FieldByName('FLGPROCESSADO').AsInteger = 2)
     then begin //Rejeitado
        ABrush.Color := clRed;
        AFont.Color  := clWindow;
        if highlight then begin
           ABrush.Color := clNavy;
           AFont.Color  := clWindow;
        end;
     end;
  end
  else begin
     ABrush.Color := clWindow;
     AFont.Color  := clWindowText;
  end;
end;

procedure TfrmConsCriticasCcp.rdgrpvisClick(Sender: TObject);
begin
  inherited;

  pnlcores.Visible := (rdgrpvis.itemindex = 0);

  case rdgrpvis.itemindex of
  0:   sFlgProcessado := ' ';
  1:   sFlgProcessado := ' AND NVL(FLGPROCESSADO,0) = 0 ';
  2:   sFlgProcessado := ' AND NVL(FLGPROCESSADO,0) = 1 ';
  3:   sFlgProcessado := ' AND NVL(FLGPROCESSADO,0) = 2 ';
  end;
  AbreDet;
end;

procedure TfrmConsCriticasCcp.dbgrddetalheTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  sOrder := ' ORDER BY '+AFieldName;
  Abredet;
end;

procedure TfrmConsCriticasCcp.bbtnSairClick(Sender: TObject);
begin
  TabCriticasCcp.Free;
  inherited;

end;

procedure TfrmConsCriticasCcp.bbtnCancelarClick(Sender: TObject);
begin
  //inherited;
  if   dtmBaseDados.dbBaseDados.InTransaction then
  begin
     dtmBaseDados.dbBaseDados.Rollback;
  end;
  bbtnConfirmar.enabled := false;
  bbtnCancelar.enabled := false;

  AbreDet;  
end;

procedure TfrmConsCriticasCcp.bbtnConfirmarClick(Sender: TObject);
begin
  //inherited;
  if   dtmBaseDados.dbBaseDados.InTransaction then
  begin
     dtmBaseDados.dbBaseDados.Commit;
  end;
  bbtnConfirmar.enabled := false;
  bbtnCancelar.enabled := false;

  AbreDet;
end;

procedure TfrmConsCriticasCcp.btndesfazClick(Sender: TObject);
var i : Integer;
begin
  inherited;

  if qrydet.isempty then exit;

  if not  dtmBaseDados.dbBaseDados.InTransaction then
  begin
     dtmBaseDados.dbBaseDados.StartTransaction;
     bbtnConfirmar.enabled := true;
     bbtnCancelar.enabled := true;
  end;


  if dbgrddetalhe.SelectedList.Count > 0
  then begin
         for i:= 0 to dbgrddetalhe.SelectedList.Count-1 do
         begin
            dbgrddetalhe.datasource.dataset.GotoBookmark(dbgrddetalhe.SelectedList.items[i]);

            TabCriticasCcp.ProcessaCritica(qryaux, qryupdate,
                                  qryPatroCombo.fieldbyname('IDPESSOA').AsInteger,
                                  qryDet.fieldbyname('IDPESSOA').AsInteger,
                                  qryDet.fieldbyname('SEQCRITICA').AsInteger,
                                  Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2),
                                  qryDet.fieldbyname('VALORNAFUNDACAO').AsString,
                                  qryDet.fieldbyname('VALORNOINTERFACE').AsString,
                                  'DD/MM/YYYY',
                                  TabCriticasCcp.TrazTipoCodErro(qryresumo.fieldbyname('CODERRO').AsInteger),
                                  True,True,
                                  TabCriticasCcp.TrazTipoProcesso(qryDet.fieldbyname('FLGPROCESSADO').AsString),
                                  qryDet.fieldbyname('NOME').AsString ,
                                  qryDet.fieldbyname('AUXILIAR1').AsString ,
                                  qryDet.fieldbyname('AUXILIAR2').AsString,
                                  qryDet.fieldbyname('AUXILIAR3').AsString,
                                  qryDet.fieldbyname('AUXILIAR4').AsString,
                                  qryDet.fieldbyname('AUXILIAR5').AsString);

         end; //for
  end //if
  else
  begin
     TabCriticasCcp.ProcessaCritica(qryaux, qryupdate,
                      qryPatroCombo.fieldbyname('IDPESSOA').AsInteger,
                      qryDet.fieldbyname('IDPESSOA').AsInteger,
                      qryDet.fieldbyname('SEQCRITICA').AsInteger,
                      Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2),
                      qryDet.fieldbyname('VALORNAFUNDACAO').AsString,
                      qryDet.fieldbyname('VALORNOINTERFACE').AsString,
                      'DD/MM/YYYY',
                      TabCriticasCcp.TrazTipoCodErro(qryresumo.fieldbyname('CODERRO').AsInteger),
                      True,True,
                      TabCriticasCcp.TrazTipoProcesso(qryDet.fieldbyname('FLGPROCESSADO').AsString),
                      qryDet.fieldbyname('NOME').AsString,
                      qryDet.fieldbyname('AUXILIAR1').AsString ,
                      qryDet.fieldbyname('AUXILIAR2').AsString,
                      qryDet.fieldbyname('AUXILIAR3').AsString,
                      qryDet.fieldbyname('AUXILIAR4').AsString,
                      qryDet.fieldbyname('AUXILIAR5').AsString );
  end;

  AbreDet;

  dbgrddetalhe.UnSelectAll;
  dbgrddetalhebtn.Glyph := SpeedButton2.Glyph;
  dbgrddetalhebtn.Hint := 'Selecionar todos';
end;

procedure TfrmConsCriticasCcp.cmbMesCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  inherited;
  qryDet.close;
  qryresumo.close;

  bPodeAtualizar :=  (TabCriticasCcp.PegaUltMes(qryaux,
                      qryPatroCombo.fieldbyname('IDPESSOA').AsInteger, Copy(cmbGrupo.text,1,1)) <=
                      Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2));


  if  bPodeAtualizar then
  begin
     btnAceitar.Enabled := true;
     btnDesfaz.Enabled := true;
     btnRejeitar.Enabled := true;
  end;


  AbreDet;
end;

procedure TfrmConsCriticasCcp.cmbMesExit(Sender: TObject);
begin
  inherited;
  qryDet.close;
  qryresumo.close;

  bPodeAtualizar :=  (TabCriticasCcp.PegaUltMes(qryaux,
                      qryPatroCombo.fieldbyname('IDPESSOA').AsInteger, Copy(cmbGrupo.text,1,1)) <=
                      Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2));

  if  bPodeAtualizar then
  begin
     btnAceitar.Enabled := true;
     btnDesfaz.Enabled := true;
     btnRejeitar.Enabled := true;
  end;


  AbreDet;
end;

procedure TfrmConsCriticasCcp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if   dtmBaseDados.dbBaseDados.InTransaction then
  begin
     dtmBaseDados.dbBaseDados.Rollback;
  end;
  inherited;

end;

procedure TfrmConsCriticasCcp.sbtnVoltarClick(Sender: TObject);
begin
  inherited;
  grpResumo.BringToFront;
end;

procedure TfrmConsCriticasCcp.dbgrdResumoDblClick(Sender: TObject);
begin
  inherited;

  bPodeAtualizar :=  (TabCriticasCcp.PegaUltMes(qryaux,
                      qryPatroCombo.fieldbyname('IDPESSOA').AsInteger, Copy(cmbGrupo.text,1,1)) <=
                      Copy(cmbMes.text,4,4)+ Copy(cmbMes.text,0,2));

  if qryResumo.fieldbyname('coderro').AsInteger in [0,1,2,8,10,14,15,16,17,18,
     19,20,21,22,23,24,104, 102, 67, 59, 56, 117, 119, 120]
  then begin
     btnAceitar.Enabled := false;
     btnDesfaz.Enabled := false;
     btnRejeitar.Enabled := false;
  end
  else
  begin
     if  bPodeAtualizar then
     begin
        btnAceitar.Enabled := true;
        btnDesfaz.Enabled := true;
        btnRejeitar.Enabled := true;
     end;
  end;

  grpDet.caption := qryresumo.fieldbyname('DESCERRO').AsString;

  AbreDet;

  grpDet.BringToFront;
end;

procedure TfrmConsCriticasCcp.dblkpcmbSitPartInternoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryDet.close;
  qryResumo.Close;

  AbreDet;
end;

end.
