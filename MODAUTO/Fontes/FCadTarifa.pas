unit fCadTarifa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, wwdblook, StdCtrls, ExtCtrls, DBCtrls, Mask, wwdbedit,
  CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, TREdit,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCadTarifa = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    dbedCodigo: TwwDBEdit;
    Label2: TLabel;
    dbedDescricao: TwwDBEdit;
    dbrgTipo: TDBRadioGroup;
    Label3: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label4: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    Label5: TLabel;
    dbredValor: TDBRealEdit;
    qryMoeda: TwwQuery;
    qryDetIDDSTTARIFA: TFloatField;
    qryDetDATADSTVALORES: TDateTimeField;
    qryDetVLRDST: TFloatField;
    tbsCargos: TTabSheet;
    Panel1: TPanel;
    sbtnAdicionar: TSpeedButton;
    sbtnRemover: TSpeedButton;
    sbtnAdicionarTudo: TSpeedButton;
    sbtnRemoverTudo: TSpeedButton;
    grdTranf: TwwDBGrid;
    grgEstab: TwwDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    qryCagosSim: TwwQuery;
    qryCagosNao: TwwQuery;
    dsCagosSim: TwwDataSource;
    dsCagosNao: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure AtualizaCargosAssoc;
    procedure sbtnAdicionarTudoClick(Sender: TObject);
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure sbtnRemoverTudoClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    procedure SelecionaDados(ID: integer);
  end;

var
  frmCadTarifa: TfrmCadTarifa;
  sSql: String;

implementation

uses {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF}, uDataBase, dBaseDados, uMensErro;

{$R *.DFM}

procedure TfrmCadTarifa.FormCreate(Sender: TObject);
begin
  inherited;
  qryMoeda.Open;
  qry.Prepare;
  qryDet.Prepare;
  SelecionaDados(-1);
end;

procedure TfrmCadTarifa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryMoeda.Close;
  qry.Close;
  qryDet.Close;

  qry.UnPrepare;
  qryDet.UnPrepare;
end;

procedure TfrmCadTarifa.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    SelecionaDados(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTarifa.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.FieldByName('IDDSTTARIFA').asInteger := LeUltRegistro(nil,'DSTTARIFA');

  qryDet.Close;
  qryDet.ParamByName('IDDSTTARIFA').asInteger := -1;
  qryDet.Open;

  AtualizaCargosAssoc;
end;

procedure TfrmCadTarifa.sbtnApagarClick(Sender: TObject);
begin
  qryDet.First;
  while not(qryDet.EOF) do
    qryDet.Delete;
  inherited;
end;

procedure TfrmCadTarifa.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('IDDSTTARIFA').asInteger := qry.FieldByName('IDDSTTARIFA').asInteger;
end;

procedure TfrmCadTarifa.CmeCadastroConfirma(Sender: TObject);
begin
  try
    if (CmeCadastro.Operacao in [opInserir, opAlterar]) then
      AplicaAlteracoes([qry, qryDet])
    else
    if (CmeCadastro.Operacao in [opApagar]) then
      AplicaAlteracoes([qryDet, qry]);
    inherited;
  except
    raise;
  end;
end;

procedure TfrmCadTarifa.SelecionaDados(ID: integer);
begin
  qry.Close;
  qry.ParamByName('IDDSTTARIFA').asInteger := ID;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDDSTTARIFA').asInteger := ID;
  qryDet.Open;

  AtualizaCargosAssoc;
end;

procedure TfrmCadTarifa.AtualizaCargosAssoc;
begin
  qryCagosSim.Close;
  qryCagosSim.ParamByName('IDTARIFA').asInteger := qry.FieldByName('IDDSTTARIFA').asInteger;
  qryCagosSim.Open;

  qryCagosNao.Close;
  qryCagosNao.Open;

end;

procedure TfrmCadTarifa.sbtnAdicionarTudoClick(Sender: TObject);
begin
  inherited;
  if dbrgTipo.ItemIndex > 0 then
  begin
    MsgDlg('Tarifa Não é de Diária. Não pode haver associação',
           'Informação',mtInformation,[mbOk,mbHelp],0);
    exit;
  end;

  if MsgDlg('Confirma a Associação de Todos os Cargos a Esta Tarifa ?', LerMensagem(4),
             mtConfirmation, [mbYes, mbNo], 0) <> mrYes
  then exit;


  sSQL :=  'UPDATE CARGO SET CODNIVEL = ' +
            qry.FieldByName('IDDSTTARIFA').asString +
            ' WHERE CODNIVEL IS NULL';

  DtmBaseDados.qry.Close;
  DtmBaseDados.qry.SQL.Clear;
  DtmBaseDados.qry.SQL.Add(sSQL);
  try
    DtmBaseDados.qry.ExecSQL;
    AtualizaCargosAssoc;
  except
    MsgDlg('Não foi possível concluir a associação','Erro',mtError,[mbOK],0);
  end;//try
end;

procedure TfrmCadTarifa.sbtnAdicionarClick(Sender: TObject);
begin
  inherited;
  if dbrgTipo.ItemIndex > 0 then
  begin
    MsgDlg('Tarifa Não é de Diária. Não pode haver associação',
           'Informação',mtInformation,[mbOk,mbHelp],0);
    exit;
  end;

  if MsgDlg('Confirma a Associação do Cargo a Esta Tarifa ?', LerMensagem(4),
             mtConfirmation, [mbYes, mbNo], 0) <> mrYes
  then exit;


  sSQL :=  'UPDATE CARGO SET CODNIVEL = ' +
            qry.FieldByName('IDDSTTARIFA').asString +
            ' WHERE IDCARGO = ' + qryCagosNao.FieldByName('IDCARGO').asString;

  DtmBaseDados.qry.Close;
  DtmBaseDados.qry.SQL.Clear;
  DtmBaseDados.qry.SQL.Add(sSQL);
  try
    DtmBaseDados.qry.ExecSQL;
    AtualizaCargosAssoc;
  except
    MsgDlg('Não foi possível concluir a associação','Erro',mtError,[mbOK],0);
  end;//try
end;

procedure TfrmCadTarifa.sbtnRemoverTudoClick(Sender: TObject);
begin
  inherited;
  if dbrgTipo.ItemIndex > 0 then
  begin
    MsgDlg('Tarifa Não é de Diária. Não pode haver Desassociação',
           'Informação',mtInformation,[mbOk,mbHelp],0);
    exit;
  end;

  if MsgDlg('Confirma a Desassociação de Todos os Cargos desta Tarifa ?', LerMensagem(4),
             mtConfirmation, [mbYes, mbNo], 0) <> mrYes
  then exit;


  sSQL :=  'UPDATE CARGO SET CODNIVEL = NULL ' +
            ' WHERE NVL(CODNIVEL,-1) = ' + qry.FieldByName('IDDSTTARIFA').asString;

  DtmBaseDados.qry.Close;
  DtmBaseDados.qry.SQL.Clear;
  DtmBaseDados.qry.SQL.Add(sSQL);
  try
    DtmBaseDados.qry.ExecSQL;
    AtualizaCargosAssoc;
  except
    MsgDlg('Não foi possível concluir a desassociação','Erro',mtError,[mbOK],0);
  end;//try
end;

procedure TfrmCadTarifa.sbtnRemoverClick(Sender: TObject);
begin
  inherited;
  if dbrgTipo.ItemIndex > 0 then
  begin
    MsgDlg('Tarifa Não é de Diária. Não pode haver desassociação',
           'Informação',mtInformation,[mbOk,mbHelp],0);
    exit;
  end;

  if MsgDlg('Confirma a Desassociação do Cargo desta Tarifa ?', LerMensagem(4),
             mtConfirmation, [mbYes, mbNo], 0) <> mrYes
  then exit;


  sSQL :=  'UPDATE CARGO SET CODNIVEL = NULL' +
            ' WHERE IDCARGO = ' + qryCagosSim.FieldByName('IDCARGO').asString;

  DtmBaseDados.qry.Close;
  DtmBaseDados.qry.SQL.Clear;
  DtmBaseDados.qry.SQL.Add(sSQL);
  try
    DtmBaseDados.qry.ExecSQL;
    AtualizaCargosAssoc;
  except
    MsgDlg('Não foi possível concluir a desassociação','Erro',mtError,[mbOK],0);
  end;//try
end;

procedure TfrmCadTarifa.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  AtualizaCargosAssoc;
end;

end.
