unit fCadGrau;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadMestreDetCS,
  StdCtrls, wwdbedit, wwdblook, Mask, DBCtrls, CmEventosCadastro, ImgList, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr, Buttons,
  TB97Ctls, TB97, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Grids;

type
  TfrmCadGrau = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label6: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dbedCodCargo: TDBEdit;
    dbedTitulo: TDBEdit;
    dblcFaixa: TwwDBLookupCombo;
    dbedGrupo: TwwDBEdit;
    edPontos: TEdit;
    qryParamRH: TwwQuery;
    qryFaixa: TwwQuery;
    qryAval: TwwQuery;
    Label3: TLabel;
    dblckFator: TwwDBLookupCombo;
    Label5: TLabel;
    wwDBEdit1: TwwDBEdit;
    qryDetIDCARGO: TFloatField;
    qryDetIDFATORAVAL: TFloatField;
    qryDetGRAU: TFloatField;
    qryDetDESCRFATORAVAL: TStringField;
    qryDetPESO: TIntegerField;
    qryDetNOTA: TFloatField;
    qryRelav: TwwQuery;
    qryClasse: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure qryDetCalcFields(DataSet: TDataSet);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure qryDetAfterDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dblckFatorChange(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
  private
    SvPonto, iTotPontos: integer;
    SvChave, S: string;
    bTirei: boolean;

    procedure AbreQuerys (ID: real);
    procedure AlteraFaixa;
  end;

var
  frmCadGrau: TfrmCadGrau;

implementation

uses uMensErro, uDataBase;

{$R *.DFM}

procedure TfrmCadGrau.FormCreate(Sender: TObject);
var
  c: byte;
begin
  inherited;
  iTotPontos := 0;

  sbtnProcurarClick(Sender);

  qryParamRH.Open;
  qryAval.Open;
  qryClasse.Open;

  dblcFaixa.Selected.Clear;
  dblcFaixa.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
  dblcFaixa.Selected.Add('DATAEFETIV'      +#9+'15'+#9+ 'Data Efetivação');
  for c:=1 to qryParamRH.FieldByName('NUMSTEPS').asInteger do
    dblcFaixa.Selected.Add('STEP' +IntToStr(c) +#9+'15'+#9+
      qryParamRH.FieldByName('TITSTEP' +IntToStr(c)).asString);
end;

procedure TfrmCadGrau.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  qryDet.Close;
  qry.UnPrepare;  
  qryDet.UnPrepare;
  inherited;
end;

procedure TfrmCadGrau.sbtnProcurarClick(Sender: TObject);
begin
  if (qry.Active) then
    SvChave := qry.FieldByName('IDCARGO').asString
  else
    SvChave := '-1';
    
  SvPonto       := iTotPontos;
  edPontos.Text := '';
  iTotPontos    := 0;
  inherited;
  if (qry.Active) and (qry.FieldByName('IDCARGO').asString = SvChave) then
  begin
    iTotPontos := SvPonto;
    Str(iTotPontos, S);
    edPontos.Text := S;
  end;
end;

procedure TfrmCadGrau.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
    AbreQuerys (StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadGrau.dblckFatorChange(Sender: TObject);
begin
  if (qryDet.State in [dsInsert, dsEdit]) then
    qryDet.FieldByName('DESCRFATORAVAL').asString := dblckFator.Text;
end;

procedure TfrmCadGrau.qryDetCalcFields(DataSet: TDataSet);
begin
  inherited;
  if (qryDet.State = dsCalcFields) and (qry.FieldByName('CODGRPFUNC').asString <> '') then
  begin
    qryRelav.Close;
    qryRelav.ParamByName('CODGRPFUNC').asString := qry.FieldByName('CODGRPFUNC').asString;
    qryRelav.ParamByName('IDFATORAVAL').asFloat := qryDet.FieldByName('IDFATORAVAL').asFloat;
    qryRelav.Open;
    
    if not(qryRelav.IsEmpty) then
      qryDetPESO.Value := qryRelav.FieldByName('PESO').asInteger
    else
      qryDetPESO.Value := 0;

    qryDetNOTA.asInteger := qryDetPESO.asInteger * qryDetGRAU.asInteger;
    iTotPontos := iTotPontos + qryDetNOTA.asInteger;
    Str(iTotPontos, S);
    edPontos.Text := S;
  end;
end;

procedure TfrmCadGrau.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('IDCARGO').asFloat := qry.FieldByName('IDCARGO').asFloat;
  qryDet.FieldByName('GRAU').asInteger  := 0;
end;

procedure TfrmCadGrau.CmeDetalheConfirma(Sender: TObject);
begin
  iTotPontos := 0;
  inherited;
end;

procedure TfrmCadGrau.CmeDetalheEdit(Sender: TObject);
begin
  iTotPontos := iTotPontos - qryDetNOTA.asInteger;
  inherited;
end;

procedure TfrmCadGrau.CmeDetalheCancel(Sender: TObject);
begin
  iTotPontos := 0;
  inherited;
end;

procedure TfrmCadGrau.qryDetAfterDelete(DataSet: TDataSet);
begin
  inherited;
  bTirei := true;
end;

procedure TfrmCadGrau.CmeDetalheDelete(Sender: TObject);
begin
  iTotPontos := 0;
  bTirei  := false;
  inherited;
  if (bTirei) then
    AlteraFaixa;
end;

procedure TfrmCadGrau.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblckFator.Text) = '') then
  begin
    MsgDlg('Por favor selecione um Fator de Avaliação !','Aviso', mtInformation,[mbOk,mbHelp],0);
    dblckFator.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmCadGrau.CmeCadastroConfirma(Sender: TObject);
begin
  iTotPontos := 0;
  inherited;
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
  AlteraFaixa;
end;

procedure TfrmCadGrau.AbreQuerys (Id: real);
begin
  if not(qry.Prepared) then
    qry.Prepare;
  if not(qryDet.Prepared) then
    qryDet.Prepare;
  if not(qryFaixa.Prepared) then
    qryFaixa.Prepare;

  qry.Close;
  qry.ParamByName('IDCARGO').asFloat := Id;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDCARGO').asFloat := Id;
  qryDet.Open;

  qryFaixa.Close;
  qryFaixa.ParamByName('IDFAIXASALARIAL').asFloat := qry.FieldByName('IDFAIXASALARIAL').asFloat;
  qryFaixa.Open;
end;

procedure TfrmCadGrau.AlteraFaixa;
begin
  if not(qryClasse.Active) or not(qryClasse.Locate('CODGRPFUNC',
    qry.FieldByName('CODGRPFUNC').asString,[])) then
    exit;

  while (qry.FieldByName('CODGRPFUNC').asString =
         qryClasse.FieldByName('CODGRPFUNC').asString) and not(qryDet.EOF) do
  begin
    if (iTotPontos >= qryClasse.FieldByName('MINIMO').asInteger) and
       (iTotPontos <= qryClasse.FieldByName('MAXIMO').asInteger) and
       (qry.FieldByName('IDFAIXASALARIAL').asInteger <>
        qryClasse.FieldByName('IDFAIXASALARIAL').asInteger) then
    begin
      qry.Edit;
      qry.FieldByName('IDFAIXASALARIAL').asInteger :=
        qryClasse.FieldByName('IDFAIXASALARIAL').asInteger;
      qry.Post;
      break;
    end;
    qryClasse.Next;
  end;
  qryClasse.First;
end;

end.
