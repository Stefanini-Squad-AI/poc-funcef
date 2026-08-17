unit FCadNatRendimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmseldlg, wwidlg, Db, Wwdatsrc, TB97, MAHlpBtn, DBCtrls,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBTables, Wwquery,
  Mask, wwdbedit, TB97Ctls, TB97Tlbr, FCadastroGridCS, MontaSelect,
  IvDictio, IvMulti, IvEMulti, wwdblook, CMProcuraSubTipo,
  CmEventosCadastro, ImgList, Wwdotdot, Wwdbcomb;

type
  TfrmCadNatRendimento = class(TFrmCadastroGridCS)
    Label1: TLabel;
    dbedHistorico: TwwDBEdit;
    dbedCodigo: TwwDBEdit;
    lblCodigo: TLabel;
    qryAux: TwwQuery;
    gbDarf: TGroupBox;
    qryDesembolso: TwwQuery;
    cmfcFornDarf: TCMProcuraSubTipo;
    Label2: TLabel;
    dblcTipoDesemb: TwwDBLookupCombo;
    dblcFormaPG: TwwDBLookupCombo;
    Label3: TLabel;
    qryFormaPG: TwwQuery;
    rgTributo: TLabel;
    cbTributo: TComboBox;
    cbPeriodicidade: TComboBox;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadNatRendimento: TfrmCadNatRendimento;

implementation

Uses USistema, UMensErro, UDatabase, DBaseDados;

{$R *.DFM}

procedure TfrmCadNatRendimento.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.SQL.Clear;
  qry.SQl.Text := 'SELECT * FROM '+ Sistema.PrefixoServidor+'NATURENDIMENTO ORDER BY CODNATUREZA';
  try
    qry.Open;
  Except
    MsgDlg('Problema na abertura da tabela NATURENDIMENTO','Erro',mtError,[mbOK],0);
    exit;
  end;
  //
  qryDesembolso.close;
  qryDesembolso.PARAMBYNAME('IDPESSOA').ASinteger := sistema.idempresa;
  qryDesembolso.open;
  //
  qryFormaPG.close;
  qryFormaPG.PARAMBYNAME('IDPESSOA').ASinteger := sistema.idempresa;
  qryFormaPG.open;
  //
end;
procedure TfrmCadNatRendimento.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cbTributo.ItemIndex := -1;
  cbPeriodicidade.ItemIndex := -1;
  dbedCodigo.Enabled:=True;
  dbedCodigo.SetFocus;
end;

procedure TfrmCadNatRendimento.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if trim(qry.fieldByname('GRUPOTRIBUTO').Asstring) <> '' then
     cbTributo.ItemIndex := qry.fieldByname('GRUPOTRIBUTO').Asinteger - 1
  else
     cbTributo.ItemIndex := - 1;

  if trim(qry.fieldByname('PERIODICIDADE').Asstring) <> '' then
     Begin
       if qry.fieldByname('PERIODICIDADE').Asstring = 'D' then
          cbPeriodicidade.ItemIndex := 0
       else if qry.fieldByname('PERIODICIDADE').Asstring = 'S' then
          cbPeriodicidade.ItemIndex := 1
       else if qry.fieldByname('PERIODICIDADE').Asstring = 'X' then
          cbPeriodicidade.ItemIndex := 2
       else if qry.fieldByname('PERIODICIDADE').Asstring = 'Q' then
          cbPeriodicidade.ItemIndex := 3
       else if qry.fieldByname('PERIODICIDADE').Asstring = 'M' then
          cbPeriodicidade.ItemIndex := 4
       else if qry.fieldByname('PERIODICIDADE').Asstring = 'T' then
          cbPeriodicidade.ItemIndex := 5
       else if qry.fieldByname('PERIODICIDADE').Asstring = 'A' then
          cbPeriodicidade.ItemIndex := 6;
     end
  else
     cbPeriodicidade.ItemIndex := - 1;

  dbedCodigo.Enabled:=False;
  dbedHistorico.SetFocus;
end;

procedure TfrmCadNatRendimento.bbtnConfirmarClick(Sender: TObject);
begin
  if Length(Trim(dbedCodigo.Text)) < 4 then
  Begin
    MsgDlg('Obrigatório preencher os 4 dígitos do Código','Erro',mtError,[mbOK],0);
    dbedCodigo.SetFocus;
    exit;
  End;
  if Trim(dbedHistorico.Text) = '' then
  Begin
    MsgDlg('Obrigatório preencher a Descrição','Erro',mtError,[mbOK],0);
    dbedHistorico.SetFocus;
    exit;
  End;

  if (sbtnInserir.Down = True) then
  Begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQl.Text := 'SELECT CODNATUREZA FROM '+ Sistema.PrefixoServidor+'NATURENDIMENTO WHERE CODNATUREZA = '''+dbedCodigo.Text+'''';
     try
       qryAux.Open;
     Except
       MsgDlg('Problema na abertura da tabela NATURENDIMENTO','Erro',mtError,[mbOK],0);
       exit;
     end;
     if not qryAux.IsEmpty  then
     Begin
       MsgDlg('Natureza de Rendimento Já Cadastrada','Erro',mtError,[mbOK],0);
       dbedCodigo.SetFocus;
       exit;
     end;
  end;
  qry.FieldByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  qry.FieldByName('RECPAG').AsString    := 'P';
  inherited;
end;

procedure TfrmCadNatRendimento.CmeCadastroConfirma(Sender: TObject);
begin
  if (qry.state in [dsInsert, DsEdit]) and (Trim(cbTributo.Text) <> '') then
     qry.fieldByname('GRUPOTRIBUTO').Asstring := '0' + intTostr(cbTributo.itemIndex + 1);

  if (qry.state in [dsInsert, DsEdit]) and (Trim(cbPeriodicidade.Text) <> '') then
     qry.fieldByname('PERIODICIDADE').Asstring := copy(cbPeriodicidade.text, 1, 1);

  inherited;

end;

end.
