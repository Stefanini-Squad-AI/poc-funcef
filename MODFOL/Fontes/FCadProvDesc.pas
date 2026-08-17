//Atualizações
//SOL 127030 KINTANA : 670177
//Responsável: Henrique Massão
//Data: 13/11/2009
//Modificação : Foi incluído o campo "Sequência de Cálculo" como opção de filtro
//na tela de procura
unit fCadProvDesc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadMestreDetCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, Mask,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ImgList,
  TabControlDetalhe, ExtCtrls, wwdblook, Wwdbspin, DBCtrls, wwdbedit, Wwtable,
  CmEventosCadastro;

type
  TfrmCadProvDesc = class(TfrmCadMestreDetalheCS)
    Label2: TLabel;
    Label4: TLabel;
    lblRegraNormal: TLabel;
    Label6: TLabel;
    dbedDescricao: TwwDBEdit;
    gbxOpcoes: TGroupBox;
    dbchkObrigaFavorecido: TDBCheckBox;
    dbchkConstaFolha: TDBCheckBox;
    dbchkEspecial: TDBCheckBox;
    gbxTipoRub: TDBRadioGroup;
    gbxSeqCalc: TGroupBox;
    dbedSeqCalc: TwwDBSpinEdit;
    dblcRegraNormal: TwwDBLookupCombo;
    dblcInforme: TwwDBLookupCombo;
    dblkcmbRubCLT: TwwDBLookupCombo;
    tbsIncidEv: TTabSheet;
    tbsIncidDeOutRub: TTabSheet;
    tbsIncidAfast: TTabSheet;
    qryRegra: TwwQuery;
    qryRubCLT: TwwQuery;
    qryInforme: TwwQuery;
    dbrgNormal: TDBRadioGroup;
    dbrgFerias: TDBRadioGroup;
    dbrg13: TDBRadioGroup;
    dbrgRescisao: TDBRadioGroup;
    dblcRegraFerias: TwwDBLookupCombo;
    dblcRegra13: TwwDBLookupCombo;
    lblRegra13: TLabel;
    lblRegraFerias: TLabel;
    lblRegraResc: TLabel;
    dblcRegraResc: TwwDBLookupCombo;
    Label5: TLabel;
    Label3: TLabel;
    dbclkcmbRubIncid1: TwwDBLookupCombo;
    dbrgFlg: TDBRadioGroup;
    dbrgFlgTipoFolha: TDBRadioGroup;
    dbspPeriodo1: TwwDBSpinEdit;
    dbrgTipoAcao: TDBRadioGroup;
    dsRubxRub2: TwwDataSource;
    qryRubxRub2: TwwQuery;
    updRubxRub2: TUpdateSQL;
    Panel1: TPanel;
    Label1: TLabel;
    Label7: TLabel;
    dbclkcmbRubIncid2: TwwDBLookupCombo;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    dbspPeriodo2: TwwDBSpinEdit;
    DBRadioGroup3: TDBRadioGroup;
    Panel2: TPanel;
    Label10: TLabel;
    dblcSitFunc: TwwDBLookupCombo;
    dsRubxRub: TwwDataSource;
    qryRubxRub: TwwQuery;
    updRubxRub: TUpdateSQL;
    dbgrdIncidAfast: TwwDBGrid;
    qryRubSit: TwwQuery;
    updRubSit: TUpdateSQL;
    dbgrdIncidDeOutRub: TwwDBGrid;
    qryRub: TwwQuery;
    qryNaturOper: TwwQuery;
    Label8: TLabel;
    dblcNaturOper: TwwDBLookupCombo;
    qrySituacao: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbrgFeriasChange(Sender: TObject);
    procedure dbrg13Change(Sender: TObject);
    procedure dbrgRescisaoChange(Sender: TObject);
    procedure qryRubSitAfterInsert(DataSet: TDataSet);
    procedure qryRubxRub2AfterInsert(DataSet: TDataSet);
    procedure qryRubxRubAfterInsert(DataSet: TDataSet);
    procedure dblcSitFuncCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dbclkcmbRubIncid1CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dbclkcmbRubIncid2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    procedure AtualizarDetalhe (IDProvento:integer; qryPrincipal:boolean);
    function  VerificaCamposChave: boolean;
  end;

var
  frmCadProvDesc: TfrmCadProvDesc;

implementation

uses {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF},
  uMensErro, uDataBase, uSistema, uFuncoesUteis;

{$R *.DFM}

procedure TfrmCadProvDesc.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('(RUBRICAXPESS.IDRUBRICA IS NULL OR RUBRICAXPESS.IDPESSOA = '+
    IntToStr(Sistema.IdEmpresa) + ')');

  pgctrlDetalhe.ActivePage := tbsIncidEv;
  dbgrdDet.BringToFront;
  dbgrdIncidDeOutRub.BringToFront;
  dbgrdIncidAfast.BringToFront;

  qryRegra.Open;
  qryRubCLT.Open;
  qryInforme.Open;
  qrySituacao.Open;
  qryRub.Open;
  qryNaturOper.Open;

  AtualizarDetalhe (-1,true);

  dbrgFeriasChange(Sender);
  dbrg13Change(Sender);
  dbrgRescisaoChange(Sender);
end;

procedure TfrmCadProvDesc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryRegra.Close;
  qryRubCLT.Close;
  qryInforme.Close;
  qry.Close;
  qryRubxRub.Close;
  qryRubxRub2.Close;
  qryRubSit.Close;
  qrySituacao.Close;
  qryRub.Close;
  qryNaturOper.Close;
  inherited;  
end;

function TfrmCadProvDesc.VerificaCamposChave: boolean;
begin
  Result := true;

  if (pgctrlDetalhe.ActivePage = tbsDet) and (Trim(dbclkcmbRubIncid1.Text) = '') then
  begin
    MsgDlg ('Informe a Rubrica em que incide esta rubrica !','Aviso', mtInformation, [mbOK,mbHelp], 0);
    dbclkcmbRubIncid1.SetFocus;
    Result := false;
  end
  else
  if (pgctrlDetalhe.ActivePage = tbsIncidDeOutRub) and (Trim(dbclkcmbRubIncid2.Text) = '') then
  begin
    MsgDlg ('Informe a Rubrica que incide nesta rubrica !','Aviso', mtInformation, [mbOK,mbHelp], 0);
    dbclkcmbRubIncid2.SetFocus;
    Result := false;
  end
  else
  if (pgctrlDetalhe.ActivePage = tbsIncidAfast) and (Trim(dblcSitFunc.Text) = '') then
  begin
    MsgDlg ('Informe a situação !','Aviso', mtInformation, [mbOK,mbHelp], 0);
    dblcSitFunc.SetFocus;
    Result := false;
  end;
end;

procedure TfrmCadProvDesc.bbtnOkDetClick(Sender: TObject);
begin
  if (VerificaCamposChave) then
    inherited;
end;

procedure TfrmCadProvDesc.dbrgFeriasChange(Sender: TObject);
begin
  inherited;
  lblRegraFerias.Visible  := (dbrgFerias.ItemIndex = 0);
  dblcRegraFerias.Visible := (dbrgFerias.ItemIndex = 0);
end;

procedure TfrmCadProvDesc.dbrg13Change(Sender: TObject);
begin
  inherited;
  lblRegra13.Visible  := (dbrg13.ItemIndex = 0);
  dblcRegra13.Visible := (dbrg13.ItemIndex = 0);
end;

procedure TfrmCadProvDesc.dbrgRescisaoChange(Sender: TObject);
begin
  inherited;
  lblRegraResc.Visible  := (dbrgRescisao.ItemIndex = 0);
  dblcRegraResc.Visible := (dbrgRescisao.ItemIndex = 0);
end;

procedure TfrmCadProvDesc.qryRubxRubAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryRubxRub.FieldByName('IDRUBPRINC').Value   := qry.FieldByName('IDPROVENTO').Value;
  qryRubxRub.FieldByName('FLGBASECALC').Value  := 0;
  qryRubxRub.FieldByName('FLGTIPOFOLHA').Value := 0;
  qryRubxRub.FieldByName('INDPERIODO').Value   := 0;
  qryRubxRub.FieldByName('FLGACAOINCIDE').Value:= 0;
end;

procedure TfrmCadProvDesc.qryRubxRub2AfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryRubxRub2.FieldByName('IDRUBSECUND').Value  := qry.FieldByName('IDPROVENTO').Value;
  qryRubxRub2.FieldByName('FLGBASECALC').Value  := 0;
  qryRubxRub2.FieldByName('FLGTIPOFOLHA').Value := 0;
  qryRubxRub2.FieldByName('INDPERIODO').Value   := 0;
  qryRubxRub2.FieldByName('FLGACAOINCIDE').Value:= 0;
end;

procedure TfrmCadProvDesc.qryRubSitAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryRubSit.FieldByName('IDPROVENTO').Value := qry.FieldByName('IDPROVENTO').Value;
end;

procedure TfrmCadProvDesc.dbclkcmbRubIncid1CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryRubxRub.FieldByName('DESCRICAO').asString := dbclkcmbRubIncid1.Text;
end;

procedure TfrmCadProvDesc.dbclkcmbRubIncid2CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryRubxRub2.FieldByName('DESCRICAO').asString := dbclkcmbRubIncid2.Text;
end;

procedure TfrmCadProvDesc.dblcSitFuncCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryRubSit.FieldByName('DESCRICAO').asString := dblcSitFunc.Text;
end;

procedure TfrmCadProvDesc.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    AtualizarDetalhe (StrToInt(MontaSelect.ValoresChave[0]),true);
end;

procedure TfrmCadProvDesc.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.FieldByName('IDPROVENTO').asFloat          := LeUltRegistro(nil,'PROVDESC');
  qry.FieldByName('FLGFERIAS').asInteger         := 0;
  qry.FieldByName('FLGDECIMOTERCEIRO').asInteger := 0;
  qry.FieldByName('FLGRESCISAO').asInteger       := 0;
  qry.FieldByName('FLGSALFAMILIA').asInteger     := 1;
  qry.FieldByName('FLGTPRUBRICA').asString       := 'F';  

  dbedDescricao.SetFocus;
  AtualizarDetalhe (-1,false);
end;

procedure TfrmCadProvDesc.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedDescricao.SetFocus;
end;

procedure TfrmCadProvDesc.AtualizarDetalhe (IDProvento:integer; qryPrincipal:boolean);
begin
  if (qryPrincipal) then
  begin
    qry.Close;
    qry.ParamByName('IDPROVENTO').asInteger := IDProvento;
    qry.Open;
  end;

  qryRubxRub.Close;
  qryRubxRub.ParamByName('IDPROVENTO').asInteger := IDProvento;
  qryRubxRub.Open;

  qryRubxRub2.Close;
  qryRubxRub2.ParamByName('IDPROVENTO').asInteger := IDProvento;
  qryRubxRub2.Open;

  qryRubSit.Close;
  qryRubSit.ParamByName('IDPROVENTO').asInteger := IDProvento;
  qryRubSit.Open;
end;

procedure TfrmCadProvDesc.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
    qryRubxRub.FieldByName('INDPERIODO').asInteger := 0
  else
  if (pgctrlDetalhe.ActivePage = tbsIncidDeOutRub) then
    qryRubxRub2.FieldByName('INDPERIODO').asInteger := 0;
end;

procedure TfrmCadProvDesc.CmeDetalheDelete(Sender: TObject);
begin
  if (MsgDlg ('Deseja realmente apagar este registro ?','Aviso', mtInformation, [mbYes,mbNo],0) = mrYes) then
    inherited;
end;

procedure TfrmCadProvDesc.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao = opInserir) then
    AtualizarDetalhe (qry.ParamByName('IDPROVENTO').asInteger,false);
end;

procedure TfrmCadProvDesc.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
  if (qryRubxRub.State in [dsInsert,dsEdit]) or (qryRubxRub2.State in [dsInsert,dsEdit]) or
     (qryRubSit.State in [dsInsert,dsEdit]) then
    Accept := VerificaCamposChave
  else
    Accept := true;

{  Accept := VerificaLinhaGrid(qryRubxRub ,1,1,'Incidência em Outras Rubricas',false) and
            VerificaLinhaGrid(qryRubxRub2,1,1,'Incidência de Outras Rubricas',false) and
            VerificaLinhaGrid(qryRubSit  ,1,1,'Incidência em Afastamentos'   ,false);}
end;

procedure TfrmCadProvDesc.CmeCadastroConfirma(Sender: TObject);
begin
  if (CmeCadastro.Operacao in [OpInserir, OpAlterar]) then
    AplicaAlteracoes([qry, qryRubxRub, qryRubxRub2, qryRubSit])
  else
  begin
    // opDelete apaga Qry's Detalhe
    qryRubxRub2.First;
    while not(qryRubxRub2.EOF) do
      qryRubxRub2.Delete;

          qryRubSit.First;
    while not(qryRubSit.EOF) do
      qryRubSit.Delete;

    qryRubSit.First;
    while not(qryRubSit.EOF) do
      qryRubSit.Delete;

    AplicaAlteracoes([qryRubxRub, qryRubxRub2, qryRubSit, qry]);
  end;
  inherited;
end;

end.
