unit FConsCaixaPeq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery, Mask, TREdit;

type
  TFrmConsCaixaPeq = class(TfrmSairAjuda)
    qryLanc: TwwQuery;
    qryLancIDLANCCXPEQ: TFloatField;
    qryLancNODOCUMENTO: TStringField;
    qryLancDATALANC: TDateTimeField;
    qryLancVLRLANC: TFloatField;
    qryLancPLACONTA: TStringField;
    qryLancCODSUBCONTA: TFloatField;
    qryLancCODCENTRORESPON: TStringField;
    qryLancUNIDNEGOC: TFloatField;
    qryLancIDEMPRESA: TFloatField;
    qryLancCODCENTROCUSTO: TStringField;
    qryLancIDPESSOA2: TFloatField;
    qryLancPLANO: TFloatField;
    qryLancRECPAG: TStringField;
    qryLancCODTIPRECDES: TStringField;
    qryLancHISTLANCAMENTO: TStringField;
    qryLancIDBORDEROCXPEQ: TFloatField;
    dsLanc: TwwDataSource;
    qryTot: TwwQuery;
    qryTotTOTAL: TFloatField;
    dsTot: TwwDataSource;
    qryCP: TwwQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Grdlanc: TwwDBGrid;
    Panel4: TPanel;
    Panel3: TPanel;
    memHist: TDBMemo;
    Label1: TLabel;
    dblcCaixaPeq: TCMDBLookupCombo;
    Label2: TLabel;
    edValTot: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edDataEfet: TDBEdit;
    qryCPIDCAIXAPEQUENO: TFloatField;
    qryCPDESCCAIXAPEQ: TStringField;
    qryCPRAZAOSOCIAL: TStringField;
    BtnSel: TBitBtn;
    edNumBord: TRealEdit;
    qryBord: TwwQuery;
    qryBordIDCAIXAPEQUENO: TFloatField;
    qryBordDATAEFETBORDERO: TDateTimeField;
    qryCPVLRTOTCAIXAPEQ: TFloatField;
    dsCP: TwwDataSource;
    dsBord: TwwDataSource;
    edSaldo: TRealEdit;
    btnLimpar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    edForn: TEdit;
    qryLancIDITEMSOLI: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure dblcCaixaPeqCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    Procedure Sel;
  public
    { Public declarations }
  end;

var
  FrmConsCaixaPeq : TFrmConsCaixaPeq;
  iIdCaixaPeq     : LongInt;
implementation

{$R *.DFM}
Uses uSistema, uMensErro;

Procedure TFrmConsCaixaPeq.Sel;
Begin
  If edNumBord.Value > 0 Then
     Begin
        qryBord.Close;
        qryBord.ParamByName('pIDBORD').AsFloat      := edNumBord.Value;
        qryBord.ParamByName('pIDPESSOA').AsInteger  := Sistema.IdEmpresa;
        qryBord.ParamByName('pIDUSUARIO').AsInteger := Sistema.IdUsuario;
        qryBord.Open;
        If Not qryBord.IsEmpty Then
           Begin
               iIdCaixaPeq := qryBord.FieldByName('IDCAIXAPEQUENO').AsInteger;
               dblcCaixaPeq.LookupValue := IntToStr(iIdCaixaPeq);
           End
        Else
           Begin
              iIdCaixaPeq := -1;
              MsgDlg('Nº de Borderô não existe ou pertence a um caixa pequeno que você não esta habilitado','Erro',mtError,[mbOk],0);
           End;
         qryLanc.DisableControls;
         qryLanc.Close;
         qryLanc.SQL.Delete(21);
         qryLanc.SQL.Insert(21,'(IDBORDEROCXPEQ ='+FloatToStr(edNumBord.Value)+')');
         qryLanc.Params[0].AsInteger := iIdCaixaPeq;
         qryLanc.Open;
         qryLanc.EnableControls;
         //
         qryTot.Close;
         qryTot.SQL.Delete(5);
         qryTot.SQL.Insert(5,'(IDBORDEROCXPEQ ='+FloatToStr(edNumBord.Value)+')');
         qryTot.Params[0].AsInteger := iIdCaixaPeq;
         qryTot.Open;
     End
  Else
     Begin
         iIdCaixaPeq := StrToInt(dblcCaixaPeq.LookupValue);
         qryLanc.DisableControls;
         qryLanc.Close;
         qryLanc.SQL.Delete(21);
         qryLanc.SQL.Insert(21,'(IDBORDEROCXPEQ IS NULL)');
         qryLanc.Params[0].AsInteger := iIdCaixaPeq;
         qryLanc.Open;
         qryLanc.EnableControls;
         //
         qryTot.Close;
         qryTot.SQL.Delete(5);
         qryTot.SQL.Insert(5,'(IDBORDEROCXPEQ IS NULL)');
         qryTot.Params[0].AsInteger := iIdCaixaPeq;
         qryTot.Open;
     End;
  edForn.Text   := qryCP.FieldByName('RAZAOSOCIAL').asString;
  edSaldo.Value := (qryCP.FieldByName('VLRTOTCAIXAPEQ').asFloat - qryTot.FieldByName('TOTAL').asFloat);
End;
procedure TFrmConsCaixaPeq.FormCreate(Sender: TObject);
begin
  inherited;
  qryCP.Close;
  qryCP.ParamByName('pIDPESSOA').AsInteger  := Sistema.IdEmpresa;
  qryCP.ParamByName('pIDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryCP.Open;
  //
  qryLanc.DisableControls;
  qryLanc.Close;
  qryLanc.Params[0].AsInteger := -1;
  qryLanc.Open;
  qryLanc.EnableControls;
  //
  qryTot.Close;
  qryTot.Params[0].AsInteger := -1;
  qryTot.Open;

end;

procedure TFrmConsCaixaPeq.BtnSelClick(Sender: TObject);
begin
  inherited;
  if (Trim(dblcCaixaPeq.Text) ='')  And (edNumBord.Value <= 0 ) Then
    Begin
        MsgDlg('Selecione o caixa pequeno ou o Nº do borderô','Erro',mtError,[mbOk],0);
    End
  Else
      Sel;
end;

procedure TFrmConsCaixaPeq.btnLimparClick(Sender: TObject);
begin
  inherited;
   edForn.Clear;
   edNumBord.Value := 0;
   dblcCaixaPeq.Text := '';
   //
   qryBord.Close;
   qryBord.ParamByName('pIDBORD').Clear;
   qryBord.ParamByName('pIDPESSOA').Clear;
   qryBord.ParamByName('pIDUSUARIO').Clear;
   qryBord.Open;
   //
   qryLanc.DisableControls;
   qryLanc.Close;
   qryLanc.SQL.Delete(21);
   qryLanc.SQL.Insert(21,'(IDBORDEROCXPEQ IS NULL)');
   qryLanc.Params[0].AsInteger := -1;
   qryLanc.Open;
   qryLanc.EnableControls;
   //
   qryTot.Close;
   qryTot.SQL.Delete(5);
   qryTot.SQL.Insert(5,'(IDBORDEROCXPEQ IS NULL)');
   qryTot.Params[0].AsInteger := -1;
   qryTot.Open;
   edSaldo.Value := 0;
end;

procedure TFrmConsCaixaPeq.dblcCaixaPeqCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If ( modified ) And ( Trim(dblcCaixaPeq.Text) <> '' ) Then
      Begin
          edForn.Text := qryCP.FieldByName('RAZAOSOCIAL').asString;
          edNumBord.Value := 0;
          qryBord.Close;
          qryBord.ParamByName('pIDBORD').Clear;
          qryBord.ParamByName('pIDPESSOA').Clear;
          qryBord.ParamByName('pIDUSUARIO').Clear;
          qryBord.Open;
      End
  Else
      edForn.Clear;
end;

end.
