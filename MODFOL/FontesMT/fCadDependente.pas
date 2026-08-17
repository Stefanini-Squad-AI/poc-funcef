// ATUALIZAÇÕES

{-------------------------------------------------------------------------------
Nº WO............: 19270 
Data da Alteração: 05/03/2025
Responsável......: Paulo Nobre
Descrição........: Ajustando a obrigatoriedade do percentual de Pensão
                   Alimentícia para permitir a inclusão sem fornecer um %. 
--------------------------------------------------------------------------------
Nº WO............: 18761
Data da Alteração: 14/02/2025
Responsável......: Paulo Nobre
Descrição........: Incluindo na atualização da DEPENTIT, a gravação do campo
                   percentual de Pensão Alimentícia.  
--------------------------------------------------------------------------------
Rotina...........: VerificaCessacaoIR
Nº WO............: 7470
Data da Alteração: 31/01/2024
Responsável......: Paulo Nobre
Descrição........: Trocado o nome do Everson pelo André no cabeçalho abaixo 
                   Alteração essa autorizada pelo Everson  
--------------------------------------------------------------------------------
Nº SIG...........: 84676
Data da Alteração: 19/02/2021
Responsável......: Andre Imakawa
Descrição........: Rotina para verificar Cessação do IR.
--------------------------------------------------------------------------------
Nº SIG...........: 40873
Data da Alteração: 24/04/2019
Responsável......: Everson Cunha
Descrição........: Campo CPF obrigatório para dependentes de Plano de Saúde
                   e/ou Plano Odontológico
--------------------------------------------------------------------------------
Nº SIG...........: 33695
Data da Alteração:  17/11/2016
Responsável......: Darivaldo Alencar
Descrição........: Habilitar e exibir documentos de acordo com permissões no
                   globalcm
--------------------------------------------------------------------------------
Nº SIG...........: 20673
Data da Alteração: 08/06/2016
Responsável......: Michelle Mota/Darivaldo Alencar
Descrição........: ER180 e ER141 - Inclusão da flag "Ativo" - exclusão lógica.
--------------------------------------------------------------------------------
Nº SOL: 229874/16589
Nº PPM: 1235881
Data da Alteração: 19/02/2016
Alteração Form: ER141 - Alteração na aba de dados pessoais e dados titular
Responsável: Michelle Suellyn Mota
Descrição: Inclusão de novos campos, alteração de leiaute e consultas.
--------------------------------------------------------------------------------
Nº SOL......: 267694
Nº PPM......: 1237783
Data........: 19/01/2016
Responsavel.: William Santana
Descrição...: Correção erro no cadastro de dependentes
--------------------------------------------------------------------------------
Nº SOL......: 267692
Nº PPM......: 1237782
Data........: 20/01/2016
Responsavel.: William Santana
Descrição...: flags Plano de Saude e Plano Odontológico e Plano Medicamento
              desmarcam ao mudar de aba
Alteração...: Troca dos componentes de Plano de Saude, odonto e medicamento
              de TdbCheckBox por TdxCheckEdit
--------------------------------------------------------------------------------
Nº SOL......: 229881/16645
Nº PPM......: 565995
Data........: 11/02/2015
Responsavel.: William Santana
Descrição...: Criação do campo UniaoEstavel
--------------------------------------------------------------------------------
Nº SOL......: 211661/15807
Nº KINTANA..: 2060908
Data........: 26/09/2014
Responsavel.: William Santana
Descrição...: Padronização da nomenclatura quanto as opções de classificação de
              estado civíl.
--------------------------------------------------------------------------------
Nº SOL......: 213815
Nº KINTANA..: 2045998
Data........: 20/09/2013
Responsavel.: Thiago Melo
Descrição...: Ao inserir o dependente o campo matricula está sendo com CPF
              (Retirar inserção)
--------------------------------------------------------------------------------
Nº SOL......: 201273
Nº KINTANA..: 1953716
Data........: 21/06/2013
Responsavel.: Higor Nayde
Descrição...: Solicitamos incluir na tela de "Procura" da funcionalidade de
              cadastro de dependentes o campo "matrícula do titular".
              Caminho Planus: ModFol / Cadastros / Dependentes
--------------------------------------------------------------------------------
Nº SOL......: 205371
Nº KINTANA..: 2013313
Data........: 31/05/2013
Responsavel.: Fernando Xavier
Descrição...: Matricula não estava sendo passada para o update na Depentit
--------------------------------------------------------------------------------
Nº SOL......: 188203
Nº KINTANA..: 1786979
Data........: 17/12/2012
Responsavel.: André Oliveira
Descrição...: Inclusão no cadastro de dependentes a informação de participação
              no Plano Medicamento e no cadastro de pessoal um campo indicando
              a quantidade de dependentes no Plano Medicamento.
              A quantidade de dependentes cadastrados no Plano Medicamento
              será a soma dos dependentes de determinado funcionário que estejam
              com a flag marcada em seus cadastros.
--------------------------------------------------------------------------------
Nº SOL......: 184808
Nº KINTANA..: 1731587
Data........: 13/08/2012
Responsavel.: William Moreira
Descrição...: Inclusão das opções de data de inclusão e exclusão dos dependentes
              no plano de saúde e odontológico
              em Cadastro/Dependentes/Dados Pessoais.
--------------------------------------------------------------------------------}
unit fCadDependente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fPessoa, Menus,
  MontaSelect, DBTables, Db, Wwquery, Wwdatsrc, Pessoa, TB97, MAHlpBtn, StdCtrls, Buttons,
  Grids, Wwdbigrd, Wwdbgrid, CheckLst, ComCtrls, TabControlDetalhe, wwdblook, DBCtrls, Mask,
  ExtCtrls, Spin, ExtDlgs, Wwtable, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, wwdbedit, Wwdbspin, CmEventosCadastro, wwdbdatetimepicker, ImgList,
  CMDateTimePicker, TREdit, Wwdotdot, Wwdbcomb, fpessoaMT, DBClient, uCMClientDataSet,
  CMProcura, TB97Tlwn, uCtrlListTerceirosRH, DBGrids, dxCntner, dxExEdtr,
  dxEdLib;

type
  TfrmCadDependente = class(TFrmPessoaMT)
    tbsTitular: TTabSheet;
    dsDepenTit: TwwDataSource;
    pnlTitular: TPanel;
    dbgTitular: TwwDBGrid;
    GroupBoxTitular: TGroupBox;
    Label28: TLabel;
    Label31: TLabel;
    tbsPessFis: TTabSheet;
    pnlPessFis: TPanel;
    dsPaises: TwwDataSource;
    MontaSelectTitular: TMontaSelect;
    edNomeTitular: TEdit;
    edCPFTitular: TEdit;
    bbtnAssocEndTit: TBitBtn;
    MontaSelectEndTit: TMontaSelect;
    gbxFiliacao: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    Bevel4: TBevel;
    dbchkContaImpostoRenda: TDBCheckBox;
    dbchkContaSalarioFamilia: TDBCheckBox;
    dbtxtNumSequencia: TDBText;
    CdsTipoDepend: TCMClientDataSet;
    CdsDepenTit: TCMClientDataSet;
    CdsSitDepend: TCMClientDataSet;
    CdsPaises: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    CdsEstadoNasc: TCMClientDataSet;
    CdsCidadeNasc: TCMClientDataSet;
    Label2: TLabel;
    dbdtInclusao: TCMDateTimePicker;
    Label5: TLabel;
    dbdtFimIR: TCMDateTimePicker;// SOl 188203 KINTANA..: 1786979
    CdsLogContrDepenIncSaud: TCMClientDataSet;
    DsLogContrDepenIncSaud: TwwDataSource;
    CdsLogContrDepenIncOdont: TCMClientDataSet;
    DsLogContrDepenIncOdont: TwwDataSource;
    CdsLogContrDepenExcSaud: TCMClientDataSet;
    CdsLogContrDepenExcOdont: TCMClientDataSet;
    DsLogContrDepenExcSaud: TwwDataSource;
    DsLogContrDepenExcOdont: TwwDataSource;
	// Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
    lblEstCivil: TLabel;
    cmbEstCivil: TwwDBLookupCombo;
    CdsEstCivil: TCMClientDataSet;
    dsEstCivil: TwwDataSource;
    dbrgUniaoEstavel: TDBRadioGroup;
	//Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881
    grpPlanoODonto: TGroupBox;
    lblDataInclusaoOdont: TLabel;
    lblDataExclusaoOdonto: TLabel;
    grpPlanoSaude: TGroupBox;//Michelle Mota - SOL: 229874.16589 PPM: 1235881
    lblDataInclusaoSaude: TLabel;
    lblDataExclusaoSaude: TLabel;
    dbdtInclusaoSaud: TCMDateTimePicker;
    dbdtExclusaoSaud: TCMDateTimePicker;
    dbdtInclusaoOdont: TCMDateTimePicker;
    dbdtExclusaoOdont: TCMDateTimePicker;
    Label66: TLabel;
    dbcmbTipoSang: TwwDBComboBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    dbrgrpSexo: TDBRadioGroup;
    Label17: TLabel;
    dbdtNasc: TCMDateTimePicker;
    Panel4: TPanel;
    Label3: TLabel;
    dblcNacional: TwwDBLookupCombo;
    gbxNaturalidade: TGroupBox;
    Label4: TLabel;
    Label65: TLabel;
    wwDBLookupCombo6: TwwDBLookupCombo;
    dblcNatural: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dbdtInclusaoAlimen: TCMDateTimePicker;
    dbdtExclusaoAlimen: TCMDateTimePicker;
    lblPercentual: TLabel;
    lblDependente: TLabel;
    dblkcmbDependente: TwwDBLookupCombo;
    Label30: TLabel;
    bvNumSequencia: TBevel;
    Label24: TLabel;
    dblkcmbSitDependente: TwwDBLookupCombo;
    bbtnProcurar: TBitBtn;
    Label10: TLabel;
    DsLogContrDepenExcAlimen: TwwDataSource;
    CdsLogContrDepenExcAlimen: TCMClientDataSet;
    DsLogContrDepenIncAlimen: TwwDataSource;
    CdsLogContrDepenIncAlimen: TCMClientDataSet;
    CdsTipoDepenLegal: TCMClientDataSet;
    dsTipoDepenLegal: TwwDataSource;
    dblkpcmbTipoDepenLegal: TwwDBLookupCombo;
    CdsLogContrDepenPercAlimen: TCMClientDataSet;
    dbPlanoOdonto: TdxCheckEdit;
    dbPlanoSaude: TdxCheckEdit;
    dbFLGPLMEDICAMENTO: TdxCheckEdit;
    dbPensaoAliment: TdxCheckEdit;
    dbchkTelFLGATIVO: TDBCheckBox;
    dbchkConttFLGATIVO: TDBCheckBox;
    CdsContatoNOME: TStringField;
    CdsContatoCARGO: TStringField;
    CdsContatoSETOR: TStringField;
    CdsContatoFLGATIVO: TStringField;
    CdsContatoIDCONTATO: TFloatField;
    CdsContatoIDPESSOA: TFloatField;
    CdsContatoIDENDERECO: TFloatField;
    CdsContatoEMAIL: TStringField;
    CdsContatoNASCIMENTO: TDateTimeField;
    CdsContatoOBS: TMemoField;
    CdsEnderecoFLGATIVO: TStringField;
    CdsTelefoneFLGATIVO: TStringField;
    dbchkEnderecoFLGATIVO: TDBCheckBox;
    cbxDepenAtivo: TCheckBox;
    CdsTipoDocumento: TCMClientDataSet;
    pnlTipoDocumento: TPanel;
    LbTpDocumento: TLabel;
    dbcmbTipoDocumento: TCMDBLookupCombo;
    dbPercAlimen: TRealEdit;

    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure bbtnAssocEndTitClick(Sender: TObject);
    procedure dblcNacionalChange(Sender: TObject);
    procedure CdsPessoaFisicaAfterInsert(DataSet: TDataSet);
    procedure CdsDepenTitAfterInsert(DataSet: TDataSet);
    procedure CdsDepenTitBeforePost(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblkcmbDependenteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbchkContaImpostoRendaClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure cmbEstCivilChange(Sender: TObject);
    procedure dblkcmbDependenteChange(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure CdsEnderecoFLGATIVOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CdsTelefoneFLGATIVOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CdsContatoFLGATIVOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CmpCidadesApertouBotao(Sender: TObject);
    procedure CmpCidadesValidaDados(Sender: TObject);
    procedure dbcmbTipoDocumentoChange(Sender: TObject);

  protected
    procedure SelSubtipo(IdPessoa: double); override;
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    iPaisAntigo: integer;
    sIdPessoa: string;
    sDepAtivo: char;//Darivaldo Alencar SIG 20673
    //sMatricula: string; // SOL 205371 KINTANA 2013313 //Thiago Melo SOL 213815 Kintana 2045998

    procedure AtivaFlagAtivo;//Darivaldo Alencar SIG 20673
    Function VerificaEnderecoAtivo(iContaSim: Integer): Boolean; // Darivaldo Alencar  - SIG 20673
    function  VerificaDependente: boolean;
    procedure MostraListaTitular(ListaIdPessoa: string);
    function SoNumero(fField : String): String; //Darivaldo Alencar SIG 33695

  public
    iIDdependente: integer;
    valorflgativo : string;// Michelle Mota - SIG 20673
  end;

var
  frmCadDependente: TfrmCadDependente;
  flgOdonto, flgSaude,  //William Moreira da Silva - SOL 184808 KINTANA - 1731587
  flgAlimen, TipoDepenLegalRequerido : Boolean; //Michelle Mota - SOL: 229874.16589 PPM: 1235881
  incOdontoOld ,excOdontoOld, incSaudeOld, excSaudeOld,  //William Moreira da Silva - SOL 184808 KINTANA - 1731587
  incAlimenOld, excAlimenOld, percAlimentOld : String; //Michelle Mota - SOL: 229874.16589 PPM: 1235881

implementation

uses uCMTypes, uMensErro, uCtrlPadroes, uSistema, fListaTitular, uCtrlPessoaDependente,
  uCtrlFuncoesRH, uCtrlUsoGeralRH, DBaseDados;

{$R *.DFM}

procedure TfrmCadDependente.FormCreate(Sender: TObject);
begin
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
  CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  Pessoa := TCtrlPessoaDependente.Create;
  Pessoa.InitializeAs(Padroes);
  Pessoa.SubTipo := stDependente;
  Pessoa.TipoPessoa := tpFisica;
  Pessoa.MostraFoto := true;
  Pessoa.SaveModuloRespon := false;
  Pessoa.MudaCaption := false;
  Pessoa.FormCaption := Self.Caption;
  Pessoa.ObrigaDocumento := false;

  TCtrlPessoaDependente(Pessoa).CdsDepenTit := CdsDepenTit;

  //William Moreira da Silva - SOL 184808 KINTANA - 1731587
  TCtrlPessoaDependente(Pessoa).CdsLogcontrdepenIncodont := CdsLogcontrdepenIncodont;
  TCtrlPessoaDependente(Pessoa).CdsLogcontrdepenExcodont := CdsLogcontrdepenExcodont;

  TCtrlPessoaDependente(Pessoa).CdsLogcontrdepenIncsaud := CdsLogcontrdepenIncsaud;
  TCtrlPessoaDependente(Pessoa).CdsLogcontrdepenExcsaud := CdsLogcontrdepenExcsaud;
  //William Moreira da Silva - SOL 184808 KINTANA - 1731587

  // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
  TCtrlPessoaDependente(Pessoa).CdsLogContrDepenIncAlimen := CdsLogcontrdepenIncAlimen;
  TCtrlPessoaDependente(Pessoa).CdsLogContrDepenExcAlimen := CdsLogcontrdepenExcAlimen;
  TCtrlPessoaDependente(Pessoa).CdsLogContrDepenPercAlimen := CdsLogcontrdepenPercAlimen;
  dblkpcmbTipoDepenLegal.Enabled := False;
  TipoDepenLegalRequerido := False;
  // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881

  pessoa.CdsTipoDocumento := CdsTipoDocumento;//Darivaldo Alencar SIG 33695
  
  inherited;

  with (MontaSelectTitular.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
  end;

  CdsTipoDepend.Data := CtrlListTerceirosRH.ListTipoDependencia;
  CdsSitDepend.Data := CtrlListTerceirosRH.ListSitDepen;
  CdsPaises.Data := CtrlListTerceirosRH.ListPaises;
  dblcNacionalChange(Sender);

  //William Moreira da Silva - SOL 184808 KINTANA - 1731587
  //Término - William Santana - SOL 267692 PPM 1237782
  //dbPlanoOdonto.Enabled := false;
  //dbPlanoSaude.Enabled := false;
  dbPlanoOdonto.ReadOnly := true;
  dbPlanoSaude.ReadOnly := true;
  dbFLGPLMEDICAMENTO.ReadOnly := true;
  //Término - William Santana - SOL 267692 PPM 1237782
  //William Moreira da Silva - SOL 184808 KINTANA - 1731587
  dbPensaoAliment.ReadOnly := true; //Michelle Mota - SOL: 229874.16589 PPM: 1235881

  CdsEstCivil.Data := TCtrlPessoaDependente(Pessoa).ListEstCivil; //William Santana - SOL 211661/15807 - KIN 2060908
//  inherited;
end;

procedure TfrmCadDependente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Pessoa);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmCadDependente.SelSubtipo(IdPessoa: double);
begin
  CdsSubTipo.Data := TCtrlPessoaDependente(Pessoa).SelDependente(IdPessoa);
  CdsDepenTit.Data := TCtrlPessoaDependente(Pessoa).SelDepenTit(IdPessoa);

  //William Moreira da Silva - SOL 184808 KINTANA - 1731587
  //Inicio
  CdsLogContrDepenIncOdont.Data := TCtrlPessoaDependente(Pessoa).SelLogContrDepenIncOdont(IdPessoa);
  CdsLogContrDepenExcOdont.Data := TCtrlPessoaDependente(Pessoa).SelLogContrDepenExcOdont(IdPessoa);

  if CdsDepenTit.FieldByName('FLGPLODONTO').asInteger = 1 then
  begin
       dbPlanoOdonto.Checked := true;
       //  dbdtExclusaoOdont.Text := ''; // William Santana - SOL 267694 PPM 1237783
  end
  else
  begin
       dbPlanoOdonto.Checked := false;
     //  dbdtInclusaoOdont.Text := ''; // William Santana - SOL 267694 PPM 1237783
     //  dbdtExclusaoOdont.Text := ''; // William Santana - SOL 267694 PPM 1237783
  end;

  CdsLogContrDepenIncSaud.Data := TCtrlPessoaDependente(Pessoa).SelLogContrDepenIncSaud(IdPessoa);
  CdsLogContrDepenExcSaud.Data := TCtrlPessoaDependente(Pessoa).SelLogContrDepenExcSaud(IdPessoa);

  if CdsDepenTit.FieldByName('FLGPLSAUDE').asInteger = 1 then
  begin
       dbPlanoSaude.Checked := true;
       // dbdtExclusaoSaud.Text := '';  // William Santana - SOL 267694 PPM 1237783
  end
  else
  begin
       dbPlanoSaude.Checked := false;
     //  dbdtInclusaoSaud.Text := '';  // William Santana - SOL 267694 PPM 1237783
     //  dbdtExclusaoSaud.Text := '';  // William Santana - SOL 267694 PPM 1237783
  end;

  //Início - William Santana - SOL 267692 PPM 1237782
  if (CdsDepenTit.fieldByName('FLGPLMEDIC').asInteger = 1) then
   dbFLGPLMEDICAMENTO.Checked := true
  else
   dbFLGPLMEDICAMENTO.Checked := false;
  //Término - William Santana - SOL 267692 PPM 1237782

  incOdontoOld := dbdtInclusaoOdont.Text;
  excOdontoOld := dbdtExclusaoOdont.Text;
  incSaudeOld  := dbdtInclusaoSaud.Text;
  excSaudeOld  := dbdtExclusaoSaud.Text;

  flgSaude := dbPlanoSaude.Checked;
  flgOdonto := dbPlanoOdonto.Checked;

  //Fim
  //William Moreira da Silva - SOL 184808 KINTANA - 1731587

  // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
  CdsLogContrDepenIncAlimen.Data := TCtrlPessoaDependente(Pessoa).SelLogContrDepenIncAlimen(IdPessoa);
  CdsLogContrDepenExcAlimen.Data := TCtrlPessoaDependente(Pessoa).SelLogContrDepenExcAlimen(IdPessoa);
  CdsLogContrDepenPercAlimen.Data := TCtrlPessoaDependente(Pessoa).SelLogContrDepenPercAlimen(IdPessoa);

  if CdsDepenTit.FieldByName('FLGPENSAOALIMENT').asInteger = 1 then
    dbPensaoAliment.Checked := true
  else
   dbPensaoAliment.Checked := false;

  // Paulo Nobre - WO18761 - Inicio
  if CdsDepenTit.FieldByName('PERCALIMENTIC').asInteger <> 0 then
    dbPercAlimen.Value := CdsDepenTit.FieldByName('PERCALIMENTIC').asFloat;
  // Paulo Nobre - WO18761 - Fim

  incAlimenOld := dbdtInclusaoAlimen.Text;
  excAlimenOld := dbdtExclusaoAlimen.Text;
  dbPercAlimen.Text := CdsLogContrDepenPercAlimen.FieldByName('VALOR').AsString;
  percAlimentOld := dbPercAlimen.Text;
  
  flgAlimen := dbPensaoAliment.Checked;
  // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881

  if (dbedPaiDetalhe.DataField = 'TITULAR') then
    dbedPaiDetalhe.DataField := '';

  //Início - William Santana - SOL 211661/15807 - KIN 2060908
  cmbEstCivil.text := TCtrlPessoaDependente(Pessoa).MostraEstCivil(CdsPessoaFisica.FieldByName('ESTCIVIL').AsString);
  //Término - William Santana - SOL 211661/15807 - KIN 2060908

  // Início - Michelle Mota - SIG 20673
  CdsDepenTit.First;
  cbxDepenAtivo.Checked := False;
  while not(CdsDepenTit.EOF) do
  begin
    if CdsDepenTit.FieldByName('FLGATIVO').AsString = 'S' then
      begin cbxDepenAtivo.Checked := True; Exit; end;

    CdsDepenTit.Next;
  end;
  // Término - Michelle Mota - SIG 20673
end;

procedure TfrmCadDependente.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (pgCtrlDetalhe.ActivePage = tbsTitular) then
  begin
    GroupBoxTitular.Enabled := true;
    bbtnProcurar.Enabled := true;
    // Guarda o Dependente
    CdsDepenTit.FieldByName('IDPESSOA').asString := Cds.FieldByName('IDPESSOA').asString;
    CdsDepenTit.FieldByName('DATACADASTRO').asDateTime := Date;
    bbtnProcurar.SetFocus;
  end;
end;

procedure TfrmCadDependente.CdsPessoaFisicaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CdsPessoaFisica.FieldByName('FLGISENTOIRRF').asInteger := 0;

end;

procedure TfrmCadDependente.CdsDepenTitAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if (dbchkContaImpostoRenda.Checked) then
    CdsDepenTit.FieldByName('FLGCONTAIMPOSTOR').asString := '1'
  else
    CdsDepenTit.FieldByName('FLGCONTAIMPOSTOR').asString := '0';

  if (dbchkContaSalarioFamilia.Checked) then
    CdsDepenTit.FieldByName('FLGCONTASALARIOF').asString := '1'
  else
    CdsDepenTit.FieldByName('FLGCONTASALARIOF').asString := '0';

  CdsDepenTit.FieldByName('FLGBENEFICIARIO').asString := '0';

  //Darivaldo Alencar SIG 20673 -inicio
  //  if chkDepenAtivo.Checked then
  //     CdsDepenTit.FieldByName('FLGATIVO').asString := 'S'
  //  else
  //     CdsDepenTit.FieldByName('FLGATIVO').asString := 'N';
  if cbxDepenAtivo.Checked then
     CdsDepenTit.FieldByName('FLGATIVO').asString := 'S'
  else
     CdsDepenTit.FieldByName('FLGATIVO').asString := 'N';
  //Darivaldo Alencar SIG 20673 -fim
end;

procedure TfrmCadDependente.CdsDepenTitBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (sIdPessoa <> '') then
    CdsDepenTit.FieldByName('IDTITULAR').asString := sIdPessoa;

    // Thiago Melo SOL 213815 Kintana 2045998
{  if (trim(sMatricula) <> '') then      // Xaveir
    CdsDepenTit.FieldByName('MATRICULA').asString := sMatricula;} // SOL 205371 KINTANA 2013313
    // Thiago Melo SOL 213815 Kintana 2045998
end;

procedure TfrmCadDependente.dblcNacionalChange(Sender: TObject);
begin
  if (CdsPaises.Active) then
  begin
    gbxNaturalidade.Enabled := (Trim(dblcNacional.Text) <> '') or
      (CdsPessoaFisica.FieldByName('IDPESSOA').IsNull);

    if (iPaisAntigo <> CdsPaises.FieldByName('IDPAIS').asInteger) or
       (gbxNaturalidade.Enabled) then
    begin
      iPaisAntigo := CdsPaises.FieldByName('IDPAIS').asInteger;
      CdsEstadoNasc.Data := CtrlListTerceirosRH.ListEstado(
        CdsPaises.FieldByName('IdPais').asInteger);
      CdsCidadeNasc.Data := CtrlListTerceirosRH.ListCidadeNasc(
        CdsPaises.FieldByName('IdPais').asInteger);

      if (CdsPessoaFisica.State in [dsInsert, dsEdit]) then
      begin
        CdsPessoaFisica.FieldByName('CODESTADO').Clear;
        CdsPessoaFisica.FieldByName('IDCIDADES').Clear;
      end;
    end;
  end;
end;

procedure TfrmCadDependente.sbtnInsDetClick(Sender: TObject);
begin
  //if chkDepenAtivo.Checked then sDepAtivo := 'S' else sDepAtivo := 'N';//Darivaldo Alencar SIG 20673
  if cbxDepenAtivo.Checked then sDepAtivo := 'S' else sDepAtivo := 'N';//Darivaldo Alencar SIG 20673

  inherited;

  if (pgCtrlDetalhe.ActivePage = tbsTitular) then
  begin
    GroupBoxTitular.Enabled := true;
    bbtnProcurar.Enabled := true;
    edNomeTitular.Text := '';
    edCPFTitular.Text := '';
    dbchkContaImpostoRenda.Checked := false;
    dbchkContaSalarioFamilia.Checked := false;
  end
  else
  if (pgCtrlDetalhe.ActivePage = tbsDet) then
    bbtnAssocEndTit.Enabled := not(CdsDepenTit.IsEmpty);

  AtivaFlagAtivo;//Darivaldo Alencar SIG 20673
end;

procedure TfrmCadDependente.sbtnAltDetClick(Sender: TObject);
begin
  inherited;

  if (pgCtrlDetalhe.ActivePage = tbsTitular) then
  begin
    // Carrega o Titular
    CdsAux.Data := TCtrlPessoaDependente(Pessoa).SelTitular(
      CdsDepenTit.FieldByName('IDTITULAR').asFloat);
    sIdPessoa := CdsDepenTit.FieldByName('IDTITULAR').asString;
    // Thiago Melo SOL 213815 Kintana 2045998
    //sMatricula := CdsDepenTit.FieldByName('MATRICULA').asString; // SOL 205371 KINTANA 2013313
    // Thiago Melo SOL 213815 Kintana 2045998

    edNomeTitular.Text := '  '+CdsAux.FieldByName('NOME').asString;
    edCPFTitular.Text := CdsAux.FieldByName('NUMDOCUMENTO').asString;

    // Carrega Situação do Dependente
    dblkcmbSitDependente.Text := CdsSubTipo.FieldByName('SITUACAODEPENDENTE').asString;
    dblkcmbSitDependente.PerformSearch;

    // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
    dblkpcmbTipoDepenLegal.Enabled := True;
    CdsTipoDepenLegal.Data := CtrlListTerceirosRH.ListTipoDependLegal(CdsTipoDepend.FieldByName('IDDEPENDENCIA').AsString);
    // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881

    GroupBoxTitular.Enabled := false;
    bbtnProcurar.Enabled := false;
    dblkcmbDependente.SetFocus;
  end
  else
  if (pgCtrlDetalhe.ActivePage = tbsDet) then
    bbtnAssocEndTit.Enabled := false;

 if (pgCtrlDetalhe.ActivePage <> tbsTitular) then  AtivaFlagAtivo; // Darivaldo Alencar - SIG 20673
end;

//Darivaldo Alencar SIG 20673 inicio
procedure TfrmCadDependente.AtivaFlagAtivo;
begin
  If (pgctrlDetalhe.ActivePage= tbsDet) then
    begin
      if (CdsEndereco.State in [dsInsert]) then
        begin
          CdsEnderecoFLGATIVO.asString := 'S';
          dbchkEnderecoFLGATIVO.Checked := True;
        End
      else if (CdsEndereco.State in [dsEdit]) then
        begin
            dbchkEnderecoFLGATIVO.Checked := CdsEnderecoFLGATIVO.AsString = 'S';
        end;
    end
  else
  if (pgctrlDetalhe.ActivePage= tbsTelefone) then
    begin
      if ( CdsTelefone.State in [dsInsert]) then
        begin
          CdsTelefoneFLGATIVO.asString := 'S';
          dbchkTelFLGATIVO.Checked := True;
        End
      else if ( CdsTelefone.State in [dsEdit]) then
        begin
          dbchkTelFLGATIVO.Checked :=  CdsTelefoneFLGATIVO.AsString = 'S';
        end;
    end
  else
  if (pgctrlDetalhe.ActivePage= tbsContato) then
    begin
      if (CdsContato.State in [dsInsert]) then
        begin
          CdsContato.FieldByName('FLGATIVO').asString := 'S';
          dbchkConttFLGATIVO.Checked := True;
        End
      else if (CdsContato.State in [dsEdit]) then
        begin
          dbchkConttFLGATIVO.Checked := CdsContato.FieldByName('FLGATIVO').AsString = 'S';
        end;
    end
  else
  if (pgctrlDetalhe.ActivePage = tbsTitular) then
    begin
      if (CdsDepenTit.State in [dsInsert]) then
        begin
          CdsDepenTit.FieldByName('FLGATIVO').asString := sDepAtivo;
          //chkDepenAtivo.Checked := sDepAtivo = 'S';
          cbxDepenAtivo.Checked := sDepAtivo = 'S';
        End
      else if (CdsDepenTit.State in [dsEdit]) then
        begin
          //chkDepenAtivo.Checked := CdsDepenTit.FieldByName('FLGATIVO').AsString = 'S';
          cbxDepenAtivo.Checked := CdsDepenTit.FieldByName('FLGATIVO').AsString = 'S';
        end;
    end;
end;
//Darivaldo Alencar SIG 20673 -fim

procedure TfrmCadDependente.bbtnProcurarClick(Sender: TObject);
begin
  if (edNomeTitular.Text <> '') and (edCPFTitular.Text <> '') then
  begin
    edNomeTitular.Text := '';
    edCPFTitular.Text := '';
  end;

  MontaSelectTitular.Executar;

  if (MontaSelectTitular.RetornouValor) then
  begin
    edNomeTitular.Text := '  '+MontaSelectTitular.ValoresChave[2];
    edCPFTitular.Text := '  '+MontaSelectTitular.ValoresChave[1];
    sIdPessoa := MontaSelectTitular.ValoresChave[0];

    // Thiago Melo SOL 213815 Kintana 2045998
    //sMatricula := MontaSelectTitular.ValoresChave[1]; // SOL 205371 KINTANA 2013313
    //sMatricula := MontaSelectTitular.ValoresChave[3] (Correto seria ValoresChave[3]) // Thiago Melo SOL 213815 Kintana 2045998
    // Thiago Melo SOL 213815 Kintana 2045998

    CdsDepenTit.FieldByName('TITULAR').asString := Trim(edNomeTitular.Text);
    CdsDepenTit.FieldByName('TIPODEPENDENCIA').asString := Trim(dblkcmbDependente.Text);
    CdsDepenTit.FieldByName('NUMSEQUENCIA').asInteger :=
      TCtrlPessoaDependente(Pessoa).GetProxNumSeq(StrToFloat(sIdPessoa));
  end;

  dblkcmbDependente.Enabled := (edNomeTitular.Text <> '');
  dblkcmbDependente.SetFocus;
end;

procedure TfrmCadDependente.bbtnOkDetClick(Sender: TObject);
begin
  //if chkDepenAtivo.Checked then sDepAtivo := 'S' else sDepAtivo := 'N';//Darivaldo Alencar SIG 20673
  if cbxDepenAtivo.Checked then sDepAtivo := 'S' else sDepAtivo := 'N';//Darivaldo Alencar SIG 20673
  // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
  if ((TipoDepenLegalRequerido) and (dblkpcmbTipoDepenLegal.text = '')) then
  begin
    MsgDlg('É obrigatório o preenchimento do campo "Tipo de Dependente Legal".', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    tbcDetalhe.TabIndex:= 6;//Darivaldo Alencar SIG 20673
    pgctrlDetalhe.ActivePageIndex:= tbcDetalhe.TabIndex;//Darivaldo Alencar SIG 20673
    dblkpcmbTipoDepenLegal.SetFocus;
    Exit;
  end;

  if (pgctrlDetalhe.ActivePage = tbsTitular) then
    begin
      if not(VerificaDependente) then
        exit;
      CdsDepenTit.FieldByName('TIPODEPENDENCIA').AsString := dblkcmbDependente.Text;
      CdsDepenTit.FieldByName('TIPODEPENDENTELEGAL').AsString := dblkpcmbTipoDepenLegal.Text;
    end;
  // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881

  try
    inherited;
  except
    exit;
  end;

  // Limpa campos do Titular
  edNomeTitular.Text := '';
  edCPFTitular.Text := '';
  dblkcmbDependente.Text := '';
  dblkcmbSitDependente.Text := '';
  dbchkContaImpostoRenda.Checked := false;
  dbchkContaSalarioFamilia.Checked := false;

  AtivaFlagAtivo;//Darivaldo Alencar SIG 20673

  // Início - Michelle Mota - SIG 20673
  if (CdsEndereco.Filtered) then
      CdsEndereco.Filtered := False;
  // Término - Michelle Mota - SIG 20673
end;

procedure TfrmCadDependente.bbtnAssocEndTitClick(Sender: TObject);
var
  sAux: string;
begin
  MontaSelectEndTit.Filtro.Clear;

  // Monta o Filtro com todos os titulares
  if (CdsDepenTit.RecordCount = 1) then
    MontaSelectEndTit.Filtro.Add('ENDPESS.IDPESSOA = '+
      CdsDepenTit.FieldByName('IDTITULAR').asString)
  else
  begin
    sAux := '';
    CdsDepenTit.First;
    repeat
      if (sAux = '') then
        sAux := 'ENDPESS.IDPESSOA IN ('+CdsDepenTit.FieldByName('IDTITULAR').asString
      else
        sAux := sAux +','+ CdsDepenTit.FieldByName('IDTITULAR').asString;

      CdsDepenTit.Next;
    until (CdsDepenTit.EOF);
    CdsDepenTit.First;
    MontaSelectEndTit.Filtro.Add(sAux + ')');
  end;

  // Executar o Filtro para a seleção do endereço
  MontaSelectEndTit.Filtro.Add('ENDPESS.IDPESSOA = PESSOA.IDPESSOA');
  MontaSelectEndTit.Executar;

  if (MontaSelectEndTit.RetornouValor) then
  begin
    // Atribuição do endereço
    CdsEndereco.FieldByName('NOME').asString := MontaSelectEndTit.ValoresChave[0];
    CdsEndereco.FieldByName('LOGRADOURO').asString := MontaSelectEndTit.ValoresChave[1];
    CdsEndereco.FieldByName('NUMERO').asString := MontaSelectEndTit.ValoresChave[2];
    CdsEndereco.FieldByName('COMPLEMENTO').asString := MontaSelectEndTit.ValoresChave[3];
    CdsEndereco.FieldByName('BAIRRO').asString := MontaSelectEndTit.ValoresChave[4];
    CdsEndereco.FieldByName('CEP').asString := MontaSelectEndTit.ValoresChave[5];
    CdsEndereco.FieldByName('IDCIDADES').asString := MontaSelectEndTit.ValoresChave[6];

    chkTipoEndereco.Checked[0] := (MontaSelectEndTit.ValoresChave[07] <> '');
    chkTipoEndereco.Checked[1] := (MontaSelectEndTit.ValoresChave[08] <> '');
    chkTipoEndereco.Checked[2] := (MontaSelectEndTit.ValoresChave[09] <> '');
    chkTipoEndereco.Checked[3] := (MontaSelectEndTit.ValoresChave[10] <> '');
    chkTipoEndereco.Checked[4] := (MontaSelectEndTit.ValoresChave[11] <> '');

    if (chkTipoEndereco.Checked[0]) then
      Cds.FieldByName('IdEndComercial').asFloat := CdsEndereco.FieldByName('IDENDERECO').asFloat;
    if (chkTipoEndereco.Checked[1]) then
      Cds.FieldByName('IdEndResidencial').asFloat := CdsEndereco.FieldByName('IDENDERECO').asFloat;
    if (chkTipoEndereco.Checked[2]) then
      Cds.FieldByName('IdEndEntrega').asFloat := CdsEndereco.FieldByName('IDENDERECO').asFloat;
    if (chkTipoEndereco.Checked[3]) then
      Cds.FieldByName('IdEndCobranca').asFloat := CdsEndereco.FieldByName('IDENDERECO').asFloat;
    if (chkTipoEndereco.Checked[4]) then
      Cds.FieldByName('IdEndCorresp').asFloat := CdsEndereco.FieldByName('IDENDERECO').asFloat;
  end;
end;

procedure TfrmCadDependente.sbtnApagarClick(Sender: TObject);
begin
  CdsDepenTit.First;
  while (CdsDepenTit.EOF) do
    CdsDepenTit.Delete;
  inherited;
end;

procedure TfrmCadDependente.bbtnConfirmarClick(Sender: TObject);
var
  K: integer;
  sIdTitular: string;
begin
  if not (ValidaEntrada) then Abort; // Darivaldo Alencar - SIG 33695
  
  if not(VerificaEnderecoAtivo(0)) then Abort; //Darivaldo Alencar SIG 20673
  
  //William Moreira da Silva - SOL 184808 KINTANA - 1731587

  // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
  // inclusão da rotina para pensão alimentícia
  // mudei a ordem das mensagens de verificação para que sejam
  // apresentadas na ordem de prioridade - dados cadastrais primeiro
  // depois os outros itens
  // teste: clique no botão inserir do cadastro e depois no botão ok
  // solicitará o nome do dependente primeiro ao invés do preenchimento
  // das informações da aba Dados Pessoais

  {if (not(dbPlanoOdonto.Checked) and ((Trim(dbdtInclusaoOdont.Text)) = '')) and (Trim(dbdtExclusaoOdont.Text) <> '') Then
  begin
       messagedlg('Marque a opção do Plano de Odontológico, para incluir uma data de inclusão',mtInformation,[mbOk,mbHelp],0);
       exit;
  end;

  }

  {if (not(dbPlanoSaude.Checked) and ((Trim(dbdtInclusaoSaud.Text)) = '')) and (Trim(dbdtExclusaoSaud.Text) <> '') Then
  begin
       messagedlg('Para incluir uma data de exclusão do plano de saúde, desmarque o campo do plano de saúde',mtInformation,[mbOk,mbHelp],0);
       exit;
  end;}

  {if (dbPlanoOdonto.Checked) and (Trim(dbdtInclusaoOdont.Text) = '') then
  begin
       messagedlg('Indique a data de inclusão do plano odontológico',mtInformation,[mbOk,mbHelp],0);
       exit;
  end;}

  {if (not(dbPlanoOdonto.Checked) and (Trim(dbdtInclusaoOdont.Text) <> '')) and (Trim(dbdtExclusaoOdont.Text) = '') then
  begin
       messagedlg('Indique a data da exclusão do plano odontológico',mtInformation,[mbOk,mbHelp],0);
       exit;
  end;}

  //Everson Cunha - SIG40873 - Início
  if (((dbPlanoOdonto.Checked) or (dbPlanoSaude.Checked)) and (dbedDocumento.Text = '')) then
  begin
    MsgDlg('O preenchimento do campo CPF é obrigatório para dependentes de Plano de Saúde e/ou Plano Odontológico', 'Aviso', mtWarning, [mbOk], 0);
    pgctrlDetalhe.ActivePageIndex := 5;
    if dbedDocumento.CanFocus then
      dbedDocumento.SetFocus;
      Exit;
  end;
  //Everson Cunha - SIG40873 - Fim

  if dbdtInclusaoSaud.Text <> incSaudeOld then
  begin
     // if(incSaudeOld = '') then
      //begin
          CdsLogContrDepenIncSaud.edit;
    //  end
     // else
    //  begin
     //     CdsLogContrDepenIncSaud.edit;
      //end;
      //CdsLogContrDepenIncSaud.FieldByName('IDPESSOA').asString := CdsDepenTit.FieldByName('IDPESSOA').asstring;//Michelle Mota - SOL: 229874.16589 PPM: 1235881
      CdsLogContrDepenIncSaud.FieldByName('TIPO').asString     := 'SAUDE';
      CdsLogContrDepenIncSaud.FieldByName('CAMPO').asString    := 'INCLUSAO';
      CdsLogContrDepenIncSaud.FieldByName('DATA').asString    := dbdtInclusaoSaud.Text; //Michelle Mota - SOL: 229874.16589 PPM: 1235881
  end;

  if dbdtExclusaoSaud.Text <> excSaudeOld then
  begin
     // if(excSaudeOld = '') then
    //  begin
           CdsLogContrDepenExcSaud.edit;
    //  end
    //  else
     // begin
      //    CdsLogContrDepenExcSaud.edit;
     //end;
      //CdsLogContrDepenExcSaud.FieldByName('IDPESSOA').asString := CdsDepenTit.FieldByName('IDPESSOA').asstring;//Michelle Mota - SOL: 229874.16589 PPM: 1235881
      CdsLogContrDepenExcSaud.FieldByName('TIPO').asString     := 'SAUDE';
      CdsLogContrDepenExcSaud.FieldByName('CAMPO').asString    := 'EXCLUSAO';
      CdsLogContrDepenExcSaud.FieldByName('DATA').asString    := dbdtExclusaoSaud.Text; //Michelle Mota - SOL: 229874.16589 PPM: 1235881
  end;

  if dbdtInclusaoOdont.Text <> incOdontoOld then
  begin
      //if(incOdontoOld = '') then
      //begin
           CdsLogContrDepenIncOdont.edit;
      //end
      //else
      //begin
      //    CdsLogContrDepenIncOdont.edit;
      //end;
       //CdsLogContrDepenIncOdont.FieldByName('IDPESSOA').asString := CdsDepenTit.FieldByName('IDPESSOA').asstring;//Michelle Mota - SOL: 229874.16589 PPM: 1235881
       CdsLogContrDepenIncOdont.FieldByName('TIPO').asString     := 'ODONT';
       CdsLogContrDepenIncOdont.FieldByName('CAMPO').asString    := 'INCLUSAO';
       CdsLogContrDepenIncOdont.FieldByName('DATA').asString    := dbdtInclusaoOdont.Text; //Michelle Mota - SOL: 229874.16589 PPM: 1235881
  end;

  if excOdontoOld <> dbdtExclusaoOdont.Text then
  begin
      // if(excOdontoOld = '') then
      //begin
           CdsLogContrDepenExcOdont.edit;
      {end
      else
      begin
          CdsLogContrDepenExcOdont.edit;
      end;}
       //CdsLogContrDepenExcOdont.FieldByName('IDPESSOA').asString := CdsDepenTit.FieldByName('IDPESSOA').asstring;//Michelle Mota - SOL: 229874.16589 PPM: 1235881
       CdsLogContrDepenExcOdont.FieldByName('TIPO').asString     := 'ODONT';
       CdsLogContrDepenExcOdont.FieldByName('CAMPO').asString    := 'EXCLUSAO';
       CdsLogContrDepenExcOdont.FieldByName('DATA').asString     := dbdtExclusaoOdont.Text; //Michelle Mota - SOL: 229874.16589 PPM: 1235881
  end;
  //William Moreira da Silva - SOL 184808 KINTANA - 1731587

  if dbdtInclusaoAlimen.Text <> incAlimenOld then
  begin
       CdsLogContrDepenIncAlimen.edit;
       CdsLogContrDepenIncAlimen.FieldByName('TIPO').asString     := 'ALIME';
       CdsLogContrDepenIncAlimen.FieldByName('CAMPO').asString    := 'INCLUSAO';
       CdsLogContrDepenIncAlimen.FieldByName('DATA').asString     := dbdtInclusaoAlimen.Text;
  end;

  if excAlimenOld <> dbdtExclusaoAlimen.Text then
  begin
       CdsLogContrDepenExcAlimen.edit;
       CdsLogContrDepenExcAlimen.FieldByName('TIPO').asString     := 'ALIME';
       CdsLogContrDepenExcAlimen.FieldByName('CAMPO').asString    := 'EXCLUSAO';
       CdsLogContrDepenExcAlimen.FieldByName('DATA').asString     := dbdtExclusaoAlimen.Text;
  end;

  if percAlimentOld <> dbPercAlimen.Text then
  begin
       CdsLogContrDepenPercAlimen.Edit;
       CdsLogContrDepenPercAlimen.FieldByName('TIPO').asString     := 'ALIME';
       CdsLogContrDepenPercAlimen.FieldByName('CAMPO').asString    := 'PERCENT';
       CdsLogContrDepenPercAlimen.FieldByName('VALOR').asString    := dbPercAlimen.Text;
  end;

  if (Trim(dbedNomeFantasia.Text) = '') then
  begin
    MsgDlg('O Nome deve ser informado.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  if (dbrgrpSexo.ItemIndex < 0) then
  begin
    MsgDlg('Sexo deve ser informado.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  if (Trim(dbdtNasc.Text) = '') then
  begin
    MsgDlg('Data de Nascimento deve ser informada.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  // Criar a lista de IDs dos titulares
  sIdTitular := '';
  K := 1;
  CdsDepenTit.First;
  while not(CdsDepenTit.EOF) do
  begin
    if (K = 1) then
    begin
      sIdTitular := sIdTitular + CdsDepenTit.FieldByName('IDTITULAR').asString;
      Inc(K);
    end
    else
      sIdTitular := sIdTitular +','+ CdsDepenTit.FieldByName('IDTITULAR').asString;

    CdsDepenTit.Next;
  end;

  //Início - William Santana - SOL 211661/15807 - KIN 2060908
  if (cdsPessoaFisica.FieldByName('ESTCIVIL').AsString = EmptyStr) then
  begin
   MsgDlg('O estado civil deve ser selecionado.', 'Erro', mtError, [mbOk], 0);
   tbcDetalhe.TabIndex := 5;
   pgctrlDetalhe.ActivePageIndex := 5;
   cmbEstCivil.SetFocus;
   exit;
  end;
  //Término -  William Santana - SOL 211661/15807 - KIN 2060908

  //Início - William Santana - SOL 267692 PPM 1237782
  CdsDepenTit.First;
  while not(CdsDepenTit.EOF) do
  begin
    CdsDepenTit.Edit;

    CdsDepenTit.fieldByName('FLGPLSAUDE').AsInteger := FU.iff(dbPlanoSaude.Checked,1,0) ;
    CdsDepenTit.fieldByName('FLGPLODONTO').AsInteger := FU.iff(dbPlanoOdonto.Checked,1,0);
    CdsDepenTit.fieldByName('FLGPLMEDIC').AsInteger := FU.iff(dbFLGPLMEDICAMENTO.Checked,1,0);
    CdsDepenTit.fieldByName('FLGPENSAOALIMENT').AsInteger := FU.iff(dbPensaoAliment.Checked,1,0); // Michelle Mota - SOL: 229874.16589 PPM: 1235881

    // Paulo Nobre - WO18761 - Inicio
    if dbPensaoAliment.Checked Then
      CdsDepenTit.fieldByName('PERCALIMENTIC').AsFloat := dbPercAlimen.value;
    // Paulo Nobre - WO18761 - Fim

    CdsDepenTit.Next;
  end;
  //Término - William Santana - SOL 267692 PPM 1237782

  if (CdsDepenTit.FieldByName('IDTITULAR').asString = '') then
  begin
    MsgDlg('O Titular deve ser informado.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    tbcDetalhe.TabIndex := 6;
    tbcDetalheChange(tbcDetalhe);
    exit;
  end;

  if ((dbPlanoSaude.Checked) and ((Trim(dbdtInclusaoSaud.Text)) = '') or ((dbPlanoOdonto.Checked) and (Trim(dbdtInclusaoOdont.Text) = ''))) then
  begin
       MsgDlg('É obrigatório o preenchimento do campo "Data de Inclusão".', 'Aviso',mtInformation,[mbOk,mbHelp],0);
       tbcDetalhe.TabIndex := 5;
       tbcDetalheChange(tbcDetalhe);
       exit;
  end;

  if (dbPlanoSaude.Checked) and ((Trim(dbdtExclusaoSaud.Text)) <> '') then
  begin
       MsgDlg('Para incluir uma data de exclusão do Plano de Saúde, desmarque o campo do Plano de Saúde.', 'Aviso',mtInformation,[mbOk,mbHelp],0);
       tbcDetalhe.TabIndex := 5;
       tbcDetalheChange(tbcDetalhe);
       exit;
  end;

  if (dbPlanoOdonto.Checked) and ((Trim(dbdtExclusaoOdont.Text)) <> '') then
  begin
       MsgDlg('Para incluir uma data de exclusão do Plano Odontológico, desmarque o campo do Plano Odontológico.', 'Aviso',mtInformation,[mbOk,mbHelp],0);
       exit;
  end;

  if ((not(dbPlanoSaude.Checked) and ((Trim(dbdtInclusaoSaud.Text)) <> '')) and (Trim(dbdtExclusaoSaud.Text) = '')) or
     ((not(dbPlanoOdonto.Checked) and (Trim(dbdtInclusaoOdont.Text) <> '')) and (Trim(dbdtExclusaoOdont.Text) = '')) Then
  begin
       MsgDlg('É obrigatório o preenchimento do campo "Data de Exclusão".', 'Aviso',mtInformation,[mbOk,mbHelp],0);
       tbcDetalhe.TabIndex := 5;
       tbcDetalheChange(tbcDetalhe);
       exit;
  end;

  if ((dbPensaoAliment.Checked) and (Trim(dbdtInclusaoAlimen.Text) = '')) then
  begin
       MsgDlg('É obrigatório o preenchimento do campo "Data de Inclusão".', 'Aviso',mtInformation,[mbOk,mbHelp],0);
       tbcDetalhe.TabIndex := 5;
       tbcDetalheChange(tbcDetalhe);
       dbdtInclusaoAlimen.SetFocus;
       exit;
  end;

  // Paulo Nobre - WO18761 - Inicio
  if (dbPensaoAliment.Checked) and (dbPercAlimen.value = 0) then
  begin
       MsgDlg('É obrigatório o preenchimento do campo "Percentual".', 'Aviso',mtInformation,[mbOk,mbHelp],0);
       tbcDetalhe.TabIndex := 5;
       tbcDetalheChange(tbcDetalhe);
       dbPercAlimen.SetFocus;
       exit;
  end;

  if (not dbPensaoAliment.Checked) and (dbPercAlimen.value > 0) then     // Paulo Nobre - WO19270
  begin
       MsgDlg('Para incluir um percentual, marque o check da Pensão Alimentícia.', 'Aviso',mtInformation,[mbOk,mbHelp],0);
       tbcDetalhe.TabIndex := 5;
       tbcDetalheChange(tbcDetalhe);
       dbPercAlimen.SetFocus;
       exit;
  end;     
  // Paulo Nobre - WO18761 - Fim

  if ((dbPensaoAliment.Checked = false) and (Trim(dbdtInclusaoAlimen.Text) <> '') and (Trim(dbdtExclusaoAlimen.Text) = '')) then
  begin
       MsgDlg('É obrigatório o preenchimento do campo "Data de Exclusão".', 'Aviso',mtInformation,[mbOk,mbHelp],0);
       tbcDetalhe.TabIndex := 5;
       tbcDetalheChange(tbcDetalhe);
       dbdtExclusaoAlimen.SetFocus;
       exit;
  end;
  if (dbdtInclusaoAlimen.Date > dbdtExclusaoAlimen.Date) and (dbdtExclusaoAlimen.Text <> '') then
  begin
       MsgDlg('A Data de Exclusão deve ser maior ou igual a Data de Inclusão, verifique.', 'Aviso',mtInformation,[mbOk,mbHelp],0);
       tbcDetalhe.TabIndex := 5;
       tbcDetalheChange(tbcDetalhe);
       dbdtExclusaoAlimen.SetFocus;
       exit;
  end;

  // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881

   // Início - Michelle Mota - SIG 20673
  CdsDepenTit.First;
  while not(CdsDepenTit.EOF) do
    begin
      CdsDepenTit.Edit;
      if (cbxDepenAtivo.Checked) then
        CdsDepenTit.FieldByName('FLGATIVO').AsString := 'S'
      else
        CdsDepenTit.FieldByName('FLGATIVO').AsString := 'N';
      CdsDepenTit.Next;
    end;
  // Término - Michelle Mota - SIG 20673

      //Darivaldo Alencar SIG 33695 inicio
      //Remove os documentos que estão sendo excluídos
      CdsDocumento.First;
      while not CdsDocumento.Eof do
         begin
            if (CdsDocumento.FieldByName('NUMDOCUMENTO').AsString = EmptyStr)  then
		    	      CdsDocumento.Delete;
            CdsDocumento.Next;
         end;
      //Darivaldo Alencar SIG 33695 fim


  inherited;

  // Andre Imakawa - SIG 84676 - Inicio
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  FU.VerificaCessacaoIR(CdsPessoaFisica.FieldByName('IDPESSOA').AsInteger,'');

  if dtmBaseDados.dbBaseDados.InTransaction  then
    dtmBaseDados.dbBaseDados.Commit;
  // Andre Imakawa - SIG 84676 - Fim

  if (sIdTitular <> '') then
  begin
    sIdTitular := TCtrlPessoaDependente(Pessoa).GetListaIdTitularInconsistente(sIdTitular);
    if (sIdTitular <> '') then
      MostraListaTitular(sIdTitular);
  end;

  //Início William Santana - SOL 267692 PPM 1237782
  // dbPlanoOdonto.Enabled := false;
  // dbPlanoSaude.Enabled := false;

  dbPlanoOdonto.ReadOnly := true;
  dbPlanoSaude.ReadOnly := true;
  dbFLGPLMEDICAMENTO.ReadOnly := true;
  dbPensaoAliment.ReadOnly := true; //Michelle Mota - SOL: 229874.16589 PPM: 1235881
  dblkpcmbTipoDepenLegal.Enabled := False;//Michelle Mota - SOL: 229874.16589 PPM: 1235881
  SelSubtipo(CdsPessoaFisica.FieldByName('IDPESSOA').AsFloat);
  //Término - William Santana - SOL 267692 PPM 1237782
end;

procedure TfrmCadDependente.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if (Assigned(Self.ActiveControl)) and
     (TComponent(Self.ActiveControl).Name = 'bbtnCancelar') and
     (Cds.FieldByName('IDPESSOA').asFloat > 0) then
    CmeCadastroFind(Sender);

  //Início - William Santana - SOL 267692 PPM 1237782
  SelSubtipo(CdsPessoaFisica.FieldByName('IDPESSOA').AsFloat);

  dbPlanoOdonto.ReadOnly := true;
  dbPlanoSaude.ReadOnly := true;
  dbFLGPLMEDICAMENTO.ReadOnly := true;
  dbPensaoAliment.ReadOnly := true; //Michelle Mota - SOL: 229874.16589 PPM: 1235881
  //Término - William Santana - SOL 267692 PPM 1237782
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

function TfrmCadDependente.VerificaDependente: boolean;
begin
  Result := false;
  // Verificar campos obrigatórios do Dependente
  if (Trim(edNomeTitular.Text) = '') then
  begin
    MsgDlg('O Titular deve ser informado.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    bbtnProcurar.SetFocus;
  end
  else
  if (Trim(dblkcmbDependente.Text) = '') then
  begin
    MsgDlg('O Tipo do Dependente deve ser informado.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dblkcmbDependente.SetFocus;
  end
  else
    Result := true;
end;

procedure TfrmCadDependente.MostraListaTitular(ListaIdPessoa: string);
begin
  frmListaTitular := TfrmListaTitular.Create(Application);

  frmListaTitular.Sel(ListaIdPessoa);
  frmListaTitular.ShowModal;

  FreeAndNil(frmListaTitular);
end;

procedure TfrmCadDependente.dblkcmbDependenteCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (dsDepenTit.State = dsInsert) and (dblkcmbDependente.LookupValue = 'FIL') and
     (dbchkContaImpostoRenda.Checked) and (dbdtNasc.Text <> '') and
     (dbdtFimIR.Text = '') then
    CdsDepenTit.FieldByName('FIMIMPOSTOR').asDateTime :=
      StrToDate(FU.IncData(dbdtNasc.Text, 0, 0, 21));
end;

procedure TfrmCadDependente.dbchkContaImpostoRendaClick(Sender: TObject);
begin
  inherited;
  if (dsDepenTit.State = dsInsert) and (dblkcmbDependente.LookupValue = 'FIL') and
     (dbchkContaImpostoRenda.Checked) and (dbdtNasc.Text <> '') and
     (dbdtFimIR.Text = '') then
    CdsDepenTit.FieldByName('FIMIMPOSTOR').asDateTime :=
      StrToDate(FU.IncData(dbdtNasc.Text, 0, 0, 21));
end;

procedure TfrmCadDependente.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  //William Moreira da Silva - SOL 184808 KINTANA - 1731587
  //Início - William Santana - SOL 267692 PPM 1237782
  //dbPlanoOdonto.Enabled := true;
  //dbPlanoSaude.Enabled := true;
  dbPlanoOdonto.ReadOnly := false;
  dbPlanoSaude.ReadOnly := false;
  dbFLGPLMEDICAMENTO.ReadOnly := false;
  //Término - William Santana - SOL 267692 PPM 1237782
  //William Moreira da Silva - SOL 184808 KINTANA - 1731587
  dbPensaoAliment.ReadOnly := false; // Michelle Mota - SOL: 229874.16589 PPM: 1235881

end;

procedure TfrmCadDependente.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  //Início - William Santana - SOL 267692 PPM 1237782
  //dbPlanoOdonto.Enabled := true;
  //dbPlanoSaude.Enabled := true;
  dbPlanoOdonto.ReadOnly := false;
  dbPlanoSaude.ReadOnly := false;
  dbFLGPLMEDICAMENTO.ReadOnly := false;
  //William Santana - SOL 267692 PPM 1237782
  // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
  dbPensaoAliment.ReadOnly := false;
  // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881

  cmbEstCivilChange(self);  // William Santana - SOL 229881/16645 PPM: 565995

  //chkDepenAtivo.Checked := True; //Michelle Mota - SIG 20673
  cbxDepenAtivo.Checked := True; //Darivaldo Alencar - SIG 20673
end;

//Início - William Santana - SOL 229881/16645 PPM: 565995
procedure TfrmCadDependente.cmbEstCivilChange(Sender: TObject);
begin
  inherited;
  if (cmbEstCivil.LookUpValue <> 'S') and (CdsPessoaFisica.State in [dsInsert, dsEdit]) then
  begin
    dbrgUniaoEstavel.Value := '';
    CdsPessoaFisica.FieldByName('UNIAOESTAVEL').AsString := '';
  end;

  //dbrgUniaoEstavel.visible := (cmbEstCivil.LookUpValue = 'S'); //Everson Cunha - SIG40873
  dbrgUniaoEstavel.Enabled := (cmbEstCivil.LookUpValue = 'S');   //Everson Cunha - SIG40873
end;
//Término - William Santana - SOL 229881/16645 PPM: 565995

procedure TfrmCadDependente.dblkcmbDependenteChange(Sender: TObject);
begin
  inherited;
  // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
  dblkpcmbTipoDepenLegal.Enabled := True;
  CdsTipoDepenLegal.Data := CtrlListTerceirosRH.ListTipoDependLegal(CdsTipoDepend.FieldByName('IDDEPENDENCIA').AsString);
  if not CdsTipoDepenLegal.IsEmpty then
  begin
    TipoDepenLegalRequerido := True;
  end
  else
    TipoDepenLegalRequerido := False;
  // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881

end;

//Darivaldo Alencar  SIG 20673 -inicio
Function TfrmCadDependente.VerificaEnderecoAtivo(iContaSim: Integer): Boolean;
var
   CdsAux: TCmClientDataSet;
begin
  Result := True;
  CdsAux:= TCmClientDataSet.create(nil);
  CdsAux.CloneCursor(CdsEndereco, true, true);

  CdsAux.first;
  while not(CdsAux.eof) do
     begin
       if (CdsAux.FieldByName('FLGATIVO').AsString = 'S') then
          iContaSim := iContaSim + 1;
       CdsAux.next;
     end;

    if (iContaSim > 1) then
      begin
            MsgDlg('Existe mais de um endereço ativo cadastrado para o dependente.'+#13+
                   'Verifique!','Aviso',mtWarning, [mbOK],0);
            Result := False
      end
  else
    Result := True;

  FreeAndNil(CdsAux);
end;
//Darivaldo Alencar  SIG 20673 -fim

procedure TfrmCadDependente.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  CdsEndereco.Filtered := False;
end;

procedure TfrmCadDependente.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  CdsEndereco.Filtered := False;
end;

procedure TfrmCadDependente.CdsEnderecoFLGATIVOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.value = 'S' then
    Text := 'Sim'
  else if Sender.value = 'N' then
    Text := 'Não'
  else
    Text := '-';
end;

procedure TfrmCadDependente.CdsTelefoneFLGATIVOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.value = 'S' then
    Text := 'Sim'
  else if Sender.value = 'N' then
    Text := 'Não'
  else
    Text := '';
end;

procedure TfrmCadDependente.CdsContatoFLGATIVOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.value = 'S' then
    Text := 'Sim'
  else if Sender.value = 'N' then
    Text := 'Não'
  else
    Text := '';
end;                    

procedure TfrmCadDependente.CmpCidadesApertouBotao(Sender: TObject);
begin
  inherited;
  //Darivaldo Alencar SIG 20673 -inicio
  if (dbchkEnderecoFLGATIVO.checked) then
     valorflgativo := 'S'
  else valorflgativo := 'N';
  //Darivaldo Alencar SIG 20673 -fim
end;
      
procedure TfrmCadDependente.CmpCidadesValidaDados(Sender: TObject);
begin
  inherited;
  CdsEnderecoFLGATIVO.Value := valorflgativo;
  dbchkEnderecoFLGATIVO.Checked := (valorflgativo = 'S');
end;
// Término - Michelle Mota - SIG 20673

//Darivaldo Alencar SIG 33695 inicio
procedure TfrmCadDependente.dbcmbTipoDocumentoChange(Sender: TObject);
var
  sText, sNumDocumentoAntigo, sMask: String;
  iQtdMask: Integer;
begin
  inherited;
  dbcmbTipoDocumento.OnChange := Nil;
  sText := dbcmbTipoDocumento.Text;
  with CdsDocumento do
      if not (State in [dsInactive,dsBrowse]) then
      begin
        FieldByname('NUMDOCUMENTO').EditMask := StringReplace(Pessoa.MaskField(Pessoa.SelMascara(FieldByname('IDDOCUMENTO').asString,CdsTipoDocumento.FieldByName('IDTIPODOCPESSOAXMASC').asString)), '#', 'a', [rfReplaceAll]);
      end;
      if sText <>'' then
      begin
          if (CdsTipodocumento.fieldbyname('idtipodocpessoaxmasc').asstring<>'') and (CdsDocumento.state <> dsBrowse)  then
          begin
              if (CdsDocumento.FieldByName('idtipodocpessoaxmasc').asString <> CdsTipodocumento.fieldbyname('idtipodocpessoaxmasc').asstring) then
              begin
                sNumDocumentoAntigo := CdsDocumento.FieldByName('NUMDOCUMENTO').asString;
                CdsDocumento.FieldByname('NUMDOCUMENTO').clear;
                sMask := CdsDocumento.FieldByName('NUMDOCUMENTO').EditMask;
                iQtdMask := Length(SoNumero(sMask)) - 1;
                CdsDocumento.FieldByName('NUMDOCUMENTO').asString := Copy(sNumDocumentoAntigo,1,iQtdMask);
                edDocNumDocumentoExit(self);
              end;
          CdsDocumento.Edit;
          CdsDocumento.FieldByName('idtipodocpessoaxmasc').asString := CdsTipodocumento.fieldbyname('idtipodocpessoaxmasc').asstring;
          CdsDocumento.Post;
          end;
      end;
    Pessoa.CarregaTipoDocumento(CdsDocumento.FieldByName('IDDOCUMENTO').asString);  //Carrega novamente os itens do Cds
    dbcmbTipoDocumento.Text := sText;      //Carrega novamente a exibição dos itens
    dbcmbTipoDocumento.OnChange := dbcmbTipoDocumentoChange;
end;

function TfrmCadDependente.SoNumero(fField : String): String;
var
  I : Byte;
begin
  Result := '';
  for I := 1 To Length(fField) do
     if ((fField [I] In ['0'..'9']) or (fField [I] = '#')) Then
       Result := Result + fField [I];
end;
//Darivaldo Alencar SIG 33695 fim

end.
