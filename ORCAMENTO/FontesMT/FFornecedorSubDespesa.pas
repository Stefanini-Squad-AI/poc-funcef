// Alterações:
{----------------------------------------------------------------------------------------------
Nº SOL......: 190498
Nº KINTANA..: 1969004
Data........: 22/11/2013
Responsável.: Felipe A. Santos
Descrição...: Adicionado o campo Código da sub-despesa, também adicionado no procurar.
{----------------------------------------------------------------------------------------------
Nº SOL......: 172383-7761
Nº KINTANA..: 1556947
Data........: 24/02/2012
Responsável.: Edilaine Ferraresi
Descrição...: Adicionado novo item de menu  -> Cadastros ->  Fornecedores/Sub-Despesas
----------------------------------------------------------------------------------------------}

unit FFornecedorSubDespesa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCmSqlParams, ComCtrls, ToolWin, Grids, Wwdbigrd, Wwdbgrid, DBCtrls,
  wwdblook, CMDBLookupCombo, Mask, wwdbedit, Wwdotdot, Wwdbcomb, UMensErro,
  uCtrlDespesaOrcamentaria, uCtrlPadroes, uSistema;

type
  TFrmFornecedorSubDespesa = class(TFrmCadastroMT)
    edtFornecedor: TEdit;
    btBuscFornecedor: TSpeedButton;
    lblFornecedor: TLabel;
    lblNatureza: TLabel;
    lblSubDespesa: TLabel;
    lblAcao: TLabel;
    dbmAcao: TDBMemo;
    lblDescricao: TLabel;
    dbmDescricao: TDBMemo;
    dbrgStatus: TDBRadioGroup;
    pnlCCustos: TPanel;
    pnlCCDisp: TPanel;
    lblCCustoDisp: TLabel;
    GridCCustoDisp: TwwDBGrid;
    pnlBotoes: TToolBar;
    btnCCDisponiveis: TToolButton;
    btnCCSelecionados: TToolButton;
    btnCCDisponiveisTodos: TToolButton;
    btnCCSelecionadosTodos: TToolButton;
    pnlCCSel: TPanel;
    lblCCustoSel: TLabel;
    GridCCustoSel: TwwDBGrid;
    imgBotoes: TImageList;
    qryCCusto: TCMSqlParams;
    cdsCCustoDisp: TCMClientDataSet;
    dsCCustoSel: TDataSource;
    cdsCCustoSel: TCMClientDataSet;
    dsCCustoDisp: TDataSource;
    dbedSubDespesa: TDBEdit;
    MontaSelectFornec: TMontaSelect;
    dbcmbNatureza: TwwDBComboBox;
    cdsGravaSel: TCMClientDataSet;
    edtGrupoOrc: TEdit;
    Label1: TLabel;
    btBuscGrupoOrc: TSpeedButton;
    msGrupoOrc: TMontaSelect;
    Label2: TLabel;
    edtCodSubDepesa: TEdit;
    procedure btnCCDisponiveisTodosClick(Sender: TObject);
    procedure btnCCSelecionadosTodosClick(Sender: TObject);
    procedure btnCCDisponiveisClick(Sender: TObject);
    procedure btnCCSelecionadosClick(Sender: TObject);
    procedure btBuscFornecedorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dbcmbNaturezaChange(Sender: TObject);
    procedure dbrgStatusChange(Sender: TObject);
    procedure btBuscGrupoOrcClick(Sender: TObject);
  private
    { Private declarations }
    CtrlDespesaOrc : TCtrlDespesaOrcamentaria;
    iIdDespesaOrc  : integer;
    iIdFornecedor  : integer;
    iIdGrupoOrc    : integer;
    sFlgStatusOriginal : string;

    procedure InsereCentro;
    procedure ExcluiCentro;
    procedure LimpaControles;
    procedure HabilitaBotoesTroca;
    function  ValidaDados : boolean;
    procedure CarregaDados(iIdOperacao : integer);
    procedure CarregaCentroCustoSelecionado;

  public
    { Public declarations }
  end;

var
  FrmFornecedorSubDespesa: TFrmFornecedorSubDespesa;

implementation

{$R *.DFM}

function PosEx(Substr, Texto : string; posIni : integer): integer;
var
  iPos : integer;
begin
  texto := copy(texto, posIni, length(texto));
  iPos  := Pos(Substr, texto);
  if iPos <> 0 then
     iPos := iPos + posini;

  Result := iPos;
end;

function RightStr(texto : string; nPos : integer) : string;
var
  sTxt : string;
  i : integer;
begin
  sTxt := '';
  if length(trim(texto)) >= nPos then
  begin
    for i := 1 to nPos do
       sTxt := copy(texto, length(trim(texto)) - (i-1), 1) + sTxt;
  end;
  result := sTxt;
end;


procedure TFrmFornecedorSubDespesa.btnCCDisponiveisTodosClick(
  Sender: TObject);
Begin
  CdsCCustoSel.DisableControls;
  CdsCCustoDisp.DisableControls;
  CdsCCustoDisp.First;
  while not CdsCCustoDisp.Eof do begin
    InsereCentro;
    CdsCCustoDisp.Delete;
  end;
  CdsCCustoDisp.First;
  CdsCCustoSel.First;
  CdsCCustoSel.EnableControls;
  CdsCCustoDisp.EnableControls;
  HabilitaBotoesTroca;
end;

procedure TFrmFornecedorSubDespesa.btnCCSelecionadosTodosClick(
  Sender: TObject);
Begin
  CdsCCustoSel.DisableControls;
  CdsCCustoDisp.DisableControls;
  CdsCCustoSel.First;
  while not CdsCCustoSel.Eof do begin
    ExcluiCentro;
    CdsCCustoSel.Delete;
  end;
  CdsCCustoDisp.First;
  CdsCCustoSel.First;
  CdsCCustoSel.EnableControls;
  CdsCCustoDisp.EnableControls;
  HabilitaBotoesTroca;
end;

procedure TFrmFornecedorSubDespesa.btnCCDisponiveisClick(Sender: TObject);
begin
  if not cdsCCustoDisp.IsEmpty then
  begin
    InsereCentro;
    CdsCCustoDisp.Delete;
  end;
  HabilitaBotoesTroca;
end;

procedure TFrmFornecedorSubDespesa.btnCCSelecionadosClick(Sender: TObject);
begin
  if not CdsCCustoSel.isEmpty then
  begin
    ExcluiCentro;
    CdsCCustoSel.Delete;
  end;
  HabilitaBotoesTroca;
end;

procedure TFrmFornecedorSubDespesa.ExcluiCentro;
begin
  CdsCCustoDisp.Insert;
  CdsCCustoDisp.FieldByName('NOME').AsString           := CdsCCustoSel.FieldByName('NOME').AsString;
  CdsCCustoDisp.FieldByName('IDEMPRESA').AsInteger     := CdsCCustoSel.FieldByName('IDEMPRESA').AsInteger;
  CdsCCustoDisp.FieldByName('CODCENTROCUSTO').AsString := CdsCCustoSel.FieldByName('CODCENTROCUSTO').AsString;
  CdsCCustoDisp.Post;
  if GridCCustoDisp.CanFocus then
     GridCCustoDisp.SetFocus;

end;

procedure TFrmFornecedorSubDespesa.InsereCentro;
begin
  CdsCCustoSel.Append;
  CdsCCustoSel.FieldByName('IDDESPESAORC').AsInteger  := iIdDespesaOrc;
  CdsCCustoSel.FieldByName('NOME').AsString           := CdsCCustoDisp.FieldByName('NOME').AsString;
  CdsCCustoSel.FieldByName('IDEMPRESA').AsInteger     := CdsCCustoDisp.FieldByName('IDEMPRESA').AsInteger;
  CdsCCustoSel.FieldByName('CODCENTROCUSTO').AsString := CdsCCustoDisp.FieldByName('CODCENTROCUSTO').AsString;
  CdsCCustoSel.Post;
  if GridCCustoSel.CanFocus then
     GridCCustoSel.SetFocus
end;

procedure TFrmFornecedorSubDespesa.btBuscFornecedorClick(Sender: TObject);
begin

  MontaSelectFornec.Executar;
  Repaint;

  If MontaSelectFornec.RetornouValor Then
  begin
    iIdFornecedor := StrToInt(MontaSelectFornec.ValoresChave[0]);
    edtFornecedor.text := MontaSelectFornec.ValoresChave[1];
  end
  else
  begin
    iIdFornecedor := -1;
    edtFornecedor.text := '';
  end;
end;

procedure TFrmFornecedorSubDespesa.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlDespesaOrc := TCtrlDespesaOrcamentaria.Create;
  CtrlDespesaOrc.InitializeAs(Padroes);

  CtrlDespesaOrc.CdsDespesaOrc := cds;
  CtrlDespesaOrc.CdsDespesaxCC := cdsCCustoSel;

  CarregaDados(-1);

  HabilitaBotoesTroca;
end;

procedure TFrmFornecedorSubDespesa.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

  LimpaControles;

  iIdDespesaOrc := CtrlDespesaOrc.IdDespesaOrc; // Alterado por Felipe A. Santos SOL 190498 KTN 1969004
  iIdFornecedor := -1;

  Cds.Cancel;
  CdsCCustoSel.EmptyDataSet;
  CdsCCustoSel.Insert;

  CdsCCustoDisp.data := CtrlDespesaOrc.ListaCentroCusto(-1);
  HabilitaBotoesTroca;

  dbcmbNatureza.Enabled    := true;
  btBuscFornecedor.Enabled := true;
  btBuscGrupoOrc.Enabled   := true;
  pnlBotoes.Enabled        := true;
  dbmAcao.Enabled          := true;
  dbmDescricao.Enabled     := true;
  dbedSubDespesa.enabled   := true;

  dbedSubDespesa.setFocus;
  edtCodSubDepesa.Text := IntToStr(iIdDespesaOrc);// Felipe A. Santos SOL 190498 KTN 1969004
end;

procedure TFrmFornecedorSubDespesa.LimpaControles;
begin
  TRY
    edtFornecedor.text :=  '';
    edtGrupoOrc.text   :=  '';
    edtCodSubDepesa.Text := ''; // Felipe A. Santos SOL 190498 KTN 1969004
    dbcmbNatureza.Clear;
    dbmAcao.Lines.Clear;
    dbmDescricao.lines.Clear;
    dbrgStatus.ItemIndex := -1;
    dbcmbNatureza.ItemIndex := -1;
  FINALLY
    Application.ProcessMessages;
  END;

end;

procedure TFrmFornecedorSubDespesa.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  LimpaControles;
  Cds.EmptyDataSet;
  CdsCCustoDisp.EmptyDataSet;
  CdsCCustoSel.EmptyDataSet;
end;

procedure TFrmFornecedorSubDespesa.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  Accept := ValidaDados();
  if not Accept then
     exit;

  Inherited;
end;

procedure TFrmFornecedorSubDespesa.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  CdsCCustoSel.Edit;
  CdsCCustoDisp.data := CtrlDespesaOrc.ListaCentroCusto( iIdDespesaOrc );

  dbcmbNatureza.Enabled  := false;
  HabilitaBotoesTroca;

  btBuscFornecedor.Enabled := (sFlgStatusOriginal <> 'I');
  btBuscGrupoOrc.Enabled   := (sFlgStatusOriginal <> 'I');
  pnlBotoes.Enabled        := (sFlgStatusOriginal <> 'I');
  dbmAcao.Enabled          := (sFlgStatusOriginal <> 'I') and (dbcmbNatureza.itemIndex = 0);
  dbmDescricao.Enabled     := (sFlgStatusOriginal <> 'I') and (dbcmbNatureza.itemIndex = 0);

  dbedSubDespesa.setFocus;
  dbedSubDespesa.SelStart := length(dbedSubDespesa.text)+1;
end;

procedure TFrmFornecedorSubDespesa.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
  begin
    CarregaDados( StrToInt(MontaSelect.ValoresChave[0]) );

    // Edilaine - SOL 191939 / KTN 1820654 - comentado
    {edtFornecedor.text := cds.FieldByName('NOME').AsString;
    edtGrupoOrc.text   := cds.FieldByName('NOMEGRUPOORCAMEN').AsString;
    iIdFornecedor      := cds.FieldByName('IDFORNECEDOR').AsInteger;
    iIdGrupoOrc        := cds.FieldByName('IDGRUPOORCAMEN').AsInteger;

    sFlgStatusOriginal := cds.FieldByName('FlgStatusDespesa').AsString;
    } // Edilaine - SOL 191939 / KTN 1820654 - fim
  end;
end;

procedure TFrmFornecedorSubDespesa.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  cds.FieldByName('IDFornecedor').AsInteger   := iIdFornecedor;
  cds.FieldByName('IDGrupoOrcamen').AsInteger := iIdGrupoOrc;

  Accept := CtrlDespesaOrc.GravaDespesaOrcamentaria(iIdDespesaOrc, Sistema.IdEmpresa);
  if not Accept then
     MsgDlg('Não foi possível inserir a despesa orçamentária.' + #13 +
            'Motivo: ' + CtrlDespesaOrc.MessageInfo,'Erro',mtError,[mbOk],0)
  else
  begin
    MsgDlg('Despesa armazenada com sucesso','Informação', mtInformation,[mbOk],0);
    CarregaDados( -1 );
  end;
end;


procedure TFrmFornecedorSubDespesa.CarregaCentroCustoSelecionado;
begin
  CdsCCustoSel.DisableControls;
  CdsCCustoSel.EmptyDataSet;
  CdsCCustoSel.Insert;
  while not CdsGravaSel.eof do
  begin
    CdsCCustoSel.Append;
    CdsCCustoSel.FieldByName('IDDESPESAORC').AsInteger  := iIdDespesaOrc;
    CdsCCustoSel.FieldByName('NOME').AsString           := CdsGravaSel.FieldByName('NOME').AsString;
    CdsCCustoSel.FieldByName('IDEMPRESA').AsInteger     := CdsGravaSel.FieldByName('IDEMPRESA').AsInteger;
    CdsCCustoSel.FieldByName('CODCENTROCUSTO').AsString := CdsGravaSel.FieldByName('CODCENTROCUSTO').AsString;
    CdsCCustoSel.Post;

    CdsGravaSel.next;
  end;
  CdsCCustoSel.First;
  CdsCCustoSel.EnableControls;
end;


procedure TFrmFornecedorSubDespesa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlDespesaOrc);

  cdsCCustoDisp.Close;
  cdsCCustoSel.Close;

  inherited;

end;

procedure TFrmFornecedorSubDespesa.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  cds.FieldByName('IDFornecedor').AsInteger   := iIdFornecedor;
  cds.FieldByName('IDGrupoOrcamen').AsInteger := iIdGrupoOrc;

  Accept := CtrlDespesaOrc.GravaDespesaOrcamentaria(iIdDespesaOrc, Sistema.IdEmpresa);
  if not Accept then
     MsgDlg('Não foi possível alterar a despesa orçamentária.' + #13 +
            'Motivo: ' + CtrlDespesaOrc.MessageInfo,'Erro',mtError,[mbOk],0)
  else
  begin
    MsgDlg('Despesa alterada com sucesso','Informação', mtInformation,[mbOk],0);
    CarregaDados( iIdDespesaOrc );
  end;
end;

procedure TFrmFornecedorSubDespesa.HabilitaBotoesTroca;
begin
  btnCCDisponiveis.Enabled  := not cdsCCustoDisp.isEmpty;
  btnCCSelecionados.Enabled := not cdsCCustoSel.isEmpty;

  btnCCDisponiveisTodos.enabled  := not cdsCCustoDisp.isEmpty;
  btnCCSelecionadosTodos.enabled := not cdsCCustoSel.isEmpty;
end;

function TFrmFornecedorSubDespesa.ValidaDados: boolean;
begin
  Result := true;

  If (Trim(dbedSubDespesa.text) = '')  Then Begin
    MsgDlg( 'Campo Sub-Despesa não preenchido', 'Aviso', mtWarning, [ mbOk ], 0 );
    dbedSubDespesa.SetFocus;
    Result := false;
  End;

  If (Result) and( dbrgStatus.ItemIndex = -1 ) Then Begin
    MsgDlg( 'Campo Status não preenchido', 'Aviso', mtWarning, [ mbOk ], 0 );
    dbrgStatus.SetFocus;
    Result := false;
  End;

  If (Result) and( Trim(edtGrupoOrc.text) = '' ) Then Begin
    MsgDlg( 'Campo Grupo Orçamentário não preenchido', 'Aviso', mtWarning, [ mbOk ], 0 );
    edtGrupoOrc.setFocus;
    Result := false;
  End;

  If (Result) and (dbcmbNatureza.itemindex = -1)  Then Begin
    MsgDlg( 'Campo Natureza não preenchido', 'Aviso', mtWarning, [ mbOk ], 0 );
    dbcmbNatureza.SetFocus;
    Result := false;
  End;

  If (Result) and ( dbcmbNatureza.ItemIndex = 0 ) and (dbmAcao.Lines.Count = 0) Then Begin
    MsgDlg( 'Campo Ação não preenchido', 'Aviso', mtWarning, [ mbOk ], 0 );
    dbmAcao.setFocus;
    Result := false;
  End;

  If (Result) and( dbcmbNatureza.ItemIndex = 0 ) and (dbmDescricao.Lines.Count = 0) Then Begin
    MsgDlg( 'Campo Descrição não preenchido', 'Aviso', mtWarning, [ mbOk ], 0 );
    dbmDescricao.setFocus;
    Result := false;
  End;

  if (Result) then
     dbcmbNaturezaChange(dbcmbNatureza);
end;

procedure TFrmFornecedorSubDespesa.CarregaDados(iIdOperacao: integer);
begin

  Cds.Data           := CtrlDespesaOrc.ListaDespesa(iIdOperacao);
  CdsCCustoSel.data  := CtrlDespesaOrc.ListaDespesaxCC(iIdOperacao);
  CdsCCustoDisp.data := CtrlDespesaOrc.ListaCentroCusto(iIdOperacao);

  if iIdOperacao <> -1 then
  begin
    CdsGravaSel.data := CtrlDespesaOrc.ListaDespesaxCC(iIdOperacao);
    CarregaCentroCustoSelecionado();

    // Edilaine - SOL 191939 / KTN 1820654
    edtFornecedor.text := cds.FieldByName('NOME').AsString;
    edtGrupoOrc.text   := cds.FieldByName('NOMEGRUPOORCAMEN').AsString;
    iIdFornecedor      := cds.FieldByName('IDFORNECEDOR').AsInteger;
    iIdGrupoOrc        := cds.FieldByName('IDGRUPOORCAMEN').AsInteger;
    sFlgStatusOriginal := cds.FieldByName('FlgStatusDespesa').AsString;
    // Edilaine - SOL 191939 / KTN 1820654 - fim

    edtCodSubDepesa.Text := IntToStr(iIdOperacao); // Felipe A. Santos SOL 190498 KTN 1969004
  end;

  iIdDespesaOrc := iIdOperacao;

end;


procedure TFrmFornecedorSubDespesa.dbcmbNaturezaChange(Sender: TObject);
var
  iPos : integer;
  sNat : string;
  sAux : string;
begin
  case (dbcmbNatureza.ItemIndex) of
     0 : sNat := 'ND';
     1 : sNat := 'OP';
    else sNat := '';
  end;

  if (cds.State In [DsInsert,DsEdit]) then
  begin
    dbmAcao.Enabled      := (dbcmbNatureza.ItemIndex = 0);
    dbmDescricao.Enabled := (dbcmbNatureza.ItemIndex = 0);

    // acrescentando o tipo de natureza no nome da subdespesa
    if (dbcmbNatureza.ItemIndex <> -1) and (Trim(dbedSubDespesa.text) <> '') then
    begin
      sAux := dbedSubDespesa.text;
      if (RightStr(dbedSubDespesa.text, 5) = ' - ND') or
         (RightStr(dbedSubDespesa.text, 5) = ' - OP') then
         sAux := copy(sAux, 1, length(trim(sAux))-5);

      cds.FieldByName('SUBDESPESA').AsString := sAux + ' - ' + sNat;

      if (dbcmbNatureza.ItemIndex <> 0) then
      begin
        dbmAcao.Clear;
        dbmDescricao.Clear;
      end;

    end;
  end;
end;


procedure TFrmFornecedorSubDespesa.dbrgStatusChange(Sender: TObject);
begin
  if (cds.State In [DsEdit]) and (sFlgStatusOriginal = 'I') then
  begin
    btBuscFornecedor.Enabled := (dbrgStatus.ItemIndex = 0);
    btBuscGrupoOrc.Enabled   := (dbrgStatus.ItemIndex = 0);
    pnlBotoes.Enabled        := (dbrgStatus.ItemIndex = 0);
    dbmAcao.Enabled          := (dbrgStatus.ItemIndex = 0) and (dbcmbNatureza.itemIndex = 0);
    dbmDescricao.Enabled     := (dbrgStatus.ItemIndex = 0) and (dbcmbNatureza.itemIndex = 0);
  end;
end;


procedure TFrmFornecedorSubDespesa.btBuscGrupoOrcClick(Sender: TObject);
begin
  inherited;

  msGrupoOrc.Executar;
  Repaint;

  If msGrupoOrc.RetornouValor Then
  begin
    iIdGrupoOrc := StrToInt(msGrupoOrc.ValoresChave[0]);
    edtGrupoOrc.text := msGrupoOrc.ValoresChave[1]
  end
  else
  begin
    iIdGrupoOrc := -1;
    edtGrupoOrc.text := '';
  end;
end;

end.
