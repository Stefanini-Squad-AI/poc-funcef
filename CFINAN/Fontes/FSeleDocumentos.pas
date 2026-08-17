unit FSeleDocumentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Grids,
  Wwdbigrd, Wwdbgrid, DBTables, Db, Wwdatsrc, Wwquery, ComCtrls;

type
  TfrmSeleDocumentos = class(TfrmSairAjuda)
    deDataDisp: TCMDateTimePicker;
    lblDataDisp: TLabel;
    qryLancamento: TwwQuery;
    dsLancamento: TwwDataSource;
    updLancamento: TUpdateSQL;
    wwDBGrid4: TwwDBGrid;
    qryParametros: TwwQuery;
    qryLancamentoDATALANCFINAN: TDateTimeField;
    qryLancamentoNUMCHQBORDERO: TStringField;
    qryLancamentoHISTORICO: TStringField;
    qryLancamentoSTATUSCONCILIA: TStringField;
    qryLancamentoENTRADASAIDA: TStringField;
    qryLancamentoVALORLANCFINAN: TFloatField;
    qryLancamentoCODPORTADOR: TFloatField;
    qryLancamentoDESCRICAO: TStringField;
    qryLancamentoFLGDISP: TStringField;
    qryLancamentoCODLANCFINANC: TFloatField;
    qryLancamentoDATADISPFINANC: TDateTimeField;
    spdTodos: TSpeedButton;
    spdInverter: TSpeedButton;
    qryParametrosDATABLOQDISPFINAN: TDateTimeField;
    sbBloqueiaData: TSpeedButton;
    qryAux: TwwQuery;
    prgBarCalc: TProgressBar;
    procedure deDataDispExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryLancamentoFLGDISPChange(Sender: TField);
    procedure spdTodosClick(Sender: TObject);
    procedure spdInverterClick(Sender: TObject);
    procedure sbBloqueiaDataClick(Sender: TObject);
  private
    { Private declarations }
    procedure FazQueryDisp(sDataDisp : String; idEmpresa : LongInt);
  public
    { Public declarations }
  end;

var
  frmSeleDocumentos: TfrmSeleDocumentos;

implementation

Uses uMensErro, uSistema, uDataBase;

{$R *.DFM}

procedure TfrmSeleDocumentos.FormActivate(Sender: TObject);
begin
  inherited;
  qryParametros.Close;
  qryParametros.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  qryParametros.Open;
  //
  FazQueryDisp('',-1);
  //
  deDataDisp.Date := Date;
  deDataDisp.SetFocus;
end;

procedure TfrmSeleDocumentos.deDataDispExit(Sender: TObject);
begin
  inherited;
  if deDataDisp.Date <= qryParametrosDATABLOQDISPFINAN.AsDateTime then begin
     MsgDlg('Data da Disponibilidade não pode ser menor ou igual a data do último bloqueio','Erro',mtError,[mbOk],0);
     deDataDisp.SetFocus;
     exit;
  end;
  FazQueryDisp(deDataDisp.Text, Sistema.idEmpresa);
end;


procedure TfrmSeleDocumentos.qryLancamentoFLGDISPChange(Sender: TField);
begin
  inherited;
  qryLancamento.Edit;
  if qryLancamentoFLGDISP.AsString = 'S' then
     qryLancamentoDATADISPFINANC.AsDateTime := deDataDisp.Date
  else
     qryLancamentoDATADISPFINANC.Clear;
  qryLancamento.Post;
  qryLancamento.ApplyUpdates;
  qryLancamento.CommitUpdates;
end;

procedure TfrmSeleDocumentos.spdTodosClick(Sender: TObject);
begin
  inherited;
  qryLancamento.DisableControls;
  prgBarCalc.Position := 0;
  prgBarCalc.Max      := qryLancamento.RecordCount;
  qryLancamento.First;
  while not qryLancamento.Eof do begin
     prgBarCalc.Position := prgBarCalc.Position + 1;
     qryLancamento.Edit;
     qryLancamentoDATADISPFINANC.AsDateTime := deDataDisp.Date;
     qryLancamento.Post;
     qryLancamento.Next;
  end;
  qryLancamento.First;
  qryLancamento.EnableControls;
  qryLancamento.ApplyUpdates;
  qryLancamento.CommitUpdates;
  prgBarCalc.Position := 0;
  FazQueryDisp(deDataDisp.Text, Sistema.idEmpresa);
end;

procedure TfrmSeleDocumentos.spdInverterClick(Sender: TObject);
begin
  inherited;
  qryLancamento.DisableControls;
  prgBarCalc.Position := 0;
  prgBarCalc.Max      := qryLancamento.RecordCount;
  qryLancamento.First;
  while not qryLancamento.Eof do begin
     prgBarCalc.Position := prgBarCalc.Position + 1;
     qryLancamento.Edit;
     if qryLancamentoFLGDISP.AsString = 'N' then begin
        qryLancamentoDATADISPFINANC.AsDateTime := deDataDisp.Date;
     end else begin
        qryLancamentoDATADISPFINANC.Clear;
     end;
     qryLancamento.Post;
     qryLancamento.Next;
  end;
  qryLancamento.First;
  qryLancamento.EnableControls;
  qryLancamento.ApplyUpdates;
  qryLancamento.CommitUpdates;
  prgBarCalc.Position := 0;
  FazQueryDisp(deDataDisp.Text, Sistema.idEmpresa);
end;

procedure TfrmSeleDocumentos.sbBloqueiaDataClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Confirma o Bloqueio desta Data? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
     Try
        StartTransacao;
        if not ExecutarQuery(qryAux,'UPDATE PARAMFINANC SET DATABLOQDISPFINAN = TO_DATE('''+deDataDisp.Text+''',''DD/MM/YYYY'') '+
                                    'WHERE IDPESSOA = '+IntToStr(Sistema.idEmpresa)) Then Abort;
        CommitTransacao;
     Except
        RollBackTransacao;
     End;
  end;
end;

procedure TfrmSeleDocumentos.FazQueryDisp(sDataDisp : String; idEmpresa : LongInt);
begin
  inherited;
  //

  qryLancamento.Close;
  If (Trim(sDataDisp) = '') Then
     qryLancamento.ParamByName('DATAREF').AsDateTime   := 0
  Else
     qryLancamento.ParamByName('DATAREF').AsDateTime   := StrToDate(sDataDisp);
     
  qryLancamento.ParamByName('IDPESSOA').AsInteger := idEmpresa;
  qryLancamento.Open;
  //
end;

end.
