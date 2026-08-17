unit FAjustaConv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, Wwdatsrc, DBTables,
  Wwquery, Grids, Wwdbigrd, Wwdbgrid, Gauges, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TFrmAjustaConv = class(TfrmSairAjuda)
    Label1: TLabel;
    edData: TCMDateTimePicker;
    btnAjusta: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    qryNF: TwwQuery;
    dsNF: TwwDataSource;
    qryNFIDITENSRECDEV: TFloatField;
    qryNFCODARTIGO: TStringField;
    qryNFCODMEDIDA: TStringField;
    qryNFIDMOV: TFloatField;
    qryNFIDNFRECEBDEVOL: TFloatField;
    qryNFQTDERECEBDEVOL: TFloatField;
    qryNFVLRUNITARIO: TFloatField;
    qryMov: TwwQuery;
    qryMovIDMOV: TFloatField;
    qryMovCODARTIGO: TStringField;
    qryMovDATAMOV: TDateTimeField;
    qryMovQTDEMOV: TFloatField;
    qryMovVALORMOV: TFloatField;
    qryMovCUSTOMEDIOMOV: TFloatField;
    qryMovSALDOQTDEMOV: TFloatField;
    dsMov: TwwDataSource;
    qryConver: TwwQuery;
    qryConverFATOR: TFloatField;
    updMov: TUpdateSQL;
    pBar: TProgressBar;
    Label3: TLabel;
    Label2: TLabel;
    LbTot: TLabel;
    LbAtual: TLabel;
    RgAjuste: TRadioGroup;
    qryReq: TwwQuery;
    dsReq: TwwDataSource;
    qryMovReq: TwwQuery;
    dsMovReq: TwwDataSource;
    updMovReq: TUpdateSQL;
    qryReqIDITEMENTREGA: TFloatField;
    qryReqCODARTIGO: TStringField;
    qryReqQTDEENTREGA: TFloatField;
    qryReqCODMEDIDA: TStringField;
    qryReqDATAENTREGA: TDateTimeField;
    qryMovReqIDMOV: TFloatField;
    qryMovReqQTDEMOV: TFloatField;
    qryReqNUMREQUISICAO: TFloatField;
    qryMovReqCODTIPOMOV: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAjustaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure FazAjusteEnt(d : TDateTime);
    Procedure FazAjusteReq(d : TDateTime);
    Procedure Converte( sCodArt,sUnid,sUnidCusto : String; Var Fator : Double );
  public
    { Public declarations }
  end;

var
  FrmAjustaConv: TFrmAjustaConv;

implementation

{$R *.DFM}
Uses uModulo, uSistema, uDataBase, DBaseDados,
     uString, uFuncaoGeral, uMensErro;

Procedure TFrmAjustaConv.FazAjusteEnt(d : TDateTime);
Var
   rFator : Double;
   sUnid  : String;
   sSql   : String;
Begin
   qryNF.Close;
   If Not qryNF.Prepared Then qryNF.Prepare;
   qryNF.ParamByName('pDATA').AsDateTime    := d;
   qryNF.ParamByName('pIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryNF.Open;
   qryMov.Close;
   If Not qryMov.Prepared Then qryMov.Prepare;
   qryMov.Open;
   //
   LbAtual.Visible := True;
   LbTot.Visible   := True;
   pBar.Visible    := True;
   pBar.Min        := 0;
   LbTot.Caption   := IntToStr(qryNF.RecordCount);
   pBar.Max        := StrToInt(LbTot.Caption);
   Try
        StartTransacao;
        qryNF.First;
        While Not qryNF.Eof Do
          Begin
              sUnid := Modulo.LeUnidade(qryNFCODARTIGO.AsString);
              If (qryNFCODMEDIDA.AsString <> sUnid) Then
                Begin
                      converte(qryNFCODARTIGO.AsString,qryNFCODMEDIDA.AsString,sUnid,rFator);
                      qryMov.Edit;
                      qryMovSALDOQTDEMOV.AsFloat := qryMovSALDOQTDEMOV.AsFloat - qryMovQTDEMOV.AsFloat;
                      qryMovQTDEMOV.AsFloat      := qryNFQTDERECEBDEVOL.AsFloat * rFator;
                      qryMovSALDOQTDEMOV.AsFloat := qryMovSALDOQTDEMOV.AsFloat + qryMovQTDEMOV.AsFloat;
                      qryMov.Post;
                      sSql := 'UPDATE MOVIMENT SET QTDEMOV = '+FuncaoGeral.OraNumero(qryMovQTDEMOV.AsFloat)+',SALDOQTDEMOV = '+FuncaoGeral.OraNumero(qryMovSALDOQTDEMOV.AsFloat);
                      sSql := sSql +' WHERE (IDMOV = '+IntToStr(qryNFIDMOV.AsInteger)+')';
                      If Not ExecutarQuery(DtmbaseDados.qry,sSql) Then
                         Abort;
                End;
              pBar.Position   := pBar.Position + 1;
              lbAtual.Caption := intToStr(pBar.Position);
              Application.ProcessMessages;
              qryNF.Next;
          End;
          sSql:= 'UPDATE PARALMOX SET DATAREPRESA = TO_DATE('''+DateToStr((edData.Date-1))+''',''DD/MM/YYYY'') ';
          sSql:= sSql+' WHERE (IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')';
          if not ExecutarQuery(DtmbaseDados.qry,sSql) then
             Abort;
          CommitTransacao;
          MsgDlg('Acerto Efetuado com Sucesso. Retorne a Data Represa para a data que se encontrava','Informação',MtInformation,[mbOk],0);
   Except
       RollBackTransacao;
       Raise;
      MsgDlg('Acerto não Efetuada ','Erro',MtError,[mbOk],0);       
   End;
End;

Procedure TFrmAjustaConv.FazAjusteReq(d : TDateTime);
Var
   rFator   : Double;
   sUnid    : String;
   sSql     : String;
   cTipoMov : Array [0..1] of Char;
Begin
   qryReq.Close;
   If Not qryReq.Prepared Then qryReq.Prepare;
   qryReq.ParamByName('pDATA').AsDateTime    := d;
   qryReq.ParamByName('pIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryReq.Open;
   qryMovReq.Close;
   If Not qryMovReq.Prepared Then qryMovReq.Prepare;
   //
   LbAtual.Visible := True;
   LbTot.Visible   := True;
   pBar.Visible    := True;
   pBar.Min        := 0;
   LbTot.Caption   := IntToStr(qryReq.RecordCount);
   pBar.Max        := StrToInt(LbTot.Caption);
   Try
        StartTransacao;
        qryReq.First;
        While Not qryReq.Eof Do
          Begin
              sUnid := Modulo.LeUnidade(qryReqCODARTIGO.AsString);
              If (Trim(qryReqCODMEDIDA.AsString) <> Trim(sUnid)) Then
                Begin
                      Converte(qryReqCODARTIGO.AsString,qryReqCODMEDIDA.AsString,sUnid,rFator);
                      qryMovReq.Close;
                      qryMovReq.ParamByName('pCODARTIGO').AsString := Espaco(Trim(qryReqCODARTIGO.AsString),14);
                      qryMovReq.ParamByName('pNUMDOC').AsString    := IntToStr(qryReqNUMREQUISICAO.AsInteger);
                      qryMovReq.ParamByName('pDATA').AsDateTime    := qryReqDATAENTREGA.AsDateTime;
                      qryMovReq.Open;
                      qryMovReq.First;
                      While Not qryMovReq.EOF Do
                         Begin
                             qryMovReq.Edit;
                             StrPCopy(cTipoMov,qryMovReqCODTIPOMOV.AsString);
                             If  cTipoMov[0] in ['E','F','G','H','I','J','L','M','N','O','Q','R','U','Y','T']  Then
                                 qryMovReqQTDEMOV.AsFloat := (qryReqQTDEENTREGA.AsFloat * rFator) * -1
                             Else
                                 qryMovReqQTDEMOV.AsFloat := qryReqQTDEENTREGA.AsFloat * rFator;
                             qryMovReq.Post;
                             sSql := 'UPDATE MOVIMENT SET QTDEMOV = '+FuncaoGeral.OraNumero(qryMovReqQTDEMOV.AsFloat)+' WHERE (IDMOV = '+IntToStr(qryMovReqIDMOV.AsInteger)+')';
                             If Not ExecutarQuery(DtmbaseDados.qry,sSql) Then
                                Abort;
                             qryMovReq.Next;
                         End;
                End;
              pBar.Position   := pBar.Position + 1;
              lbAtual.Caption := intToStr(pBar.Position);
              Application.ProcessMessages;
              qryReq.Next;
          End;
          sSql:= 'UPDATE PARALMOX SET DATAREPRESA = TO_DATE('''+DateToStr((edData.Date-1))+''',''DD/MM/YYYY'') ';
          sSql:= sSql+' WHERE (IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')';
          if not ExecutarQuery(DtmbaseDados.qry,sSql) then
             Abort;
          CommitTransacao;    
          MsgDlg('Acerto Efetuado com Sucesso. Retorne a Data Represa para a data que se encontrava','Informação',MtInformation,[mbOk],0);
   Except
       RollBackTransacao;
       Raise;
      MsgDlg('Acerto não Efetuada ','Erro',MtError,[mbOk],0);       
   End;
End;

Procedure TFrmAjustaConv.Converte( sCodArt,sUnid,sUnidCusto : String; Var Fator : Double );
Begin
    qryConver.Close;
    qryConver.ParamByName('pCODART').asString     := Trim( Copy(sCodArt,1,6) );
    qryConver.ParamByName('pCODUNVELHA').asString := Trim( sUnid );
    qryConver.ParamByName('pCODUNNOVA').asString  := Trim( sUnidCusto );
    qryConver.Open;
    Fator := qryConver.fieldByName('FATOR').asFloat;
End;

procedure TFrmAjustaConv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryNF.Close;
  If qryNF.Prepared Then qryNF.UnPrepare;
  qryMov.Close;
  If qryMov.Prepared Then qryMov.UnPrepare;
  qryReq.Close;
  If qryReq.Prepared Then qryReq.UnPrepare;
  qryMovReq.Close;
  If qryMovReq.Prepared Then qryMovReq.UnPrepare;
end;

procedure TFrmAjustaConv.btnAjustaClick(Sender: TObject);
begin
  inherited;
  Case RgAjuste.ItemIndex Of
     0 : FazAjusteEnt(edData.Date);
     1 : FazAjusteReq(edData.Date);
  End;  
  btnAjusta.Enabled := True;
end;

procedure TFrmAjustaConv.FormCreate(Sender: TObject);
begin
  inherited;
  edData.Date       := Date;
  pBar.Visible      := False;
  LbAtual.Visible   := False;
  LbTot.Visible     := False;
  btnAjusta.Enabled := True;
end;

end.
