//******************************************************************************
// Data     : 20/09/2004
// Linha(s) : Alt_1
// Motivo   : Inclusão da nova concepção para apuração de CPMF sobre as operações de
//            resgate
//******************************************************************************

unit FProcResgates;

interface
                                                                             
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Db, Wwdatsrc, DBTables, Wwquery, wwdblook;

type
  TfrmProcResgates = class(TfrmSairAjuda)
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    bbtnConfirmar: TBitBtn;
    QryPedidoResg: TwwQuery;
    QryPedidoResgSTATUS: TStringField;
    QryPedidoResgDESCFUNDOINVEST: TStringField;
    QryPedidoResgDATAPEDIDO: TDateTimeField;
    QryPedidoResgDATALIQUIDACAO: TDateTimeField;
    QryPedidoResgVLRPEDIDO: TFloatField;
    QryPedidoResgIDPEDIDOFUNDO: TFloatField;
    QryPedidoResgCODFUNCETIP: TStringField;
    QryPedidoResgIDTIPOINVEST: TFloatField;
    QryPedidoResgIDTIPOOPERACAO: TFloatField;
    QryPedidoResgIDFUNDOINVEST: TFloatField;
    QryPedidoResgIDFUNDOINVEST_1: TFloatField;
    QryPedidoResgIDGESTORCARTEIRA: TFloatField;
    QryPedidoResgTRGDTINCLUSAO: TDateTimeField;
    QryPedidoResgTRGUSERINCLUSAO: TStringField;
    QryPedidoResgMOECODIGO: TFloatField;
    QryPedidoResgIDCARTEIRAINVEST: TFloatField;
    QryPedidoResgIDTIPOFUNDOINVEST: TFloatField;
    QryPedidoResgCNPJFUNDO: TStringField;
    QryPedidoResgSTAEXCLUSIVO: TStringField;
    QryPedidoResgPZOCARENCIA: TFloatField;
    QryPedidoResgPZOANIVERSARIO: TFloatField;
    QryPedidoResgPZOLIQAPLIC: TFloatField;
    QryPedidoResgPZOLIQRESG: TFloatField;
    QryPedidoResgQTDDECQTD: TFloatField;
    QryPedidoResgQTDDECVALOR: TFloatField;
    QryPedidoResgSTAFUNDO: TStringField;
    QryPedidoResgPZOAMORTIZACAO: TFloatField;
    QryPedidoResgPERCTXPERFORM: TFloatField;
    QryPedidoResgPERCTXADM: TFloatField;
    QryPedidoResgSTAPROVISIONAIR: TStringField;
    QryPedidoResgSTAPROVISIONAIOF: TStringField;
    QryPedidoResgCONTRCETIP: TStringField;
    QryPedidoResgIDTIPOINVEST_1: TFloatField;
    QryPedidoResgIDTIPOOPERACAO_1: TFloatField;
    QryPedidoResgDESCTIPOOPERACAO: TStringField;
    QryPedidoResgNATUREZAOPERACAO: TStringField;
    QryPedidoResgSTACONFIRMA: TStringField;
    lbResgate: TPanel;
    QryDatePedido: TwwQuery;
    edDataRef: TwwDBLookupCombo;
    dsDatePedido: TwwDataSource;
    QryPedidoResgIDPLANPREVCTBPATR: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcResgates: TfrmProcResgates;

implementation

{$R *.DFM}

Uses UDataBase, DBaseDados, UMensErro, UFundoComum;

procedure TfrmProcResgates.bbtnConfirmarClick(Sender: TObject);
var
   fVlrCustoAcoes, fVlrVarAcoes : Currency;
begin
  inherited;
  If Length(edDataRef.Text) = 0 Then
     Exit;

  Try
    With QryPedidoResg Do
    Begin
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;

       Close;
       ParamByName('DATAOPERACAO').AsString := edDataRef.Text;
       Open;
       ProgressBar1.Min  := 0;
       ProgressBar1.Max  := RecordCount;
       ProgressBar1.Step := 1;
       While Not EOF Do
       Begin
          ProgressBar1.Stepit;
          lbResgate.Caption := FieldByName('DESCFUNDOINVEST').AsString;
          lbResgate.Repaint;
          //Alt_1
          If Not ResgateFACFIF(FieldByName('IDTIPOINVEST').AsInteger,
                               FieldByName('IDPEDIDOFUNDO').AsInteger,     
                               FieldByName('IDTIPOOPERACAO').AsInteger,
                               FieldByName('IDCARTEIRAINVEST').AsInteger,
                               FieldByName('IDFUNDOINVEST').AsInteger, -1,
                               FieldByName('IDPLANPREVCTBPATR').AsInteger
                               FieldByName('DATACOTIZACAO').AsDateTime,                               
                               FieldByName('DATAPEDIDO').AsDateTime,
                               FieldByName('DATALIQUIDACAO').AsDateTime, 0,                            
                               FieldByName('VLRPEDIDO').AsFloat, 0,
                               fVlrCustoAcoes, fVlrVarAcoes) Then
          Begin
            If (MsgDlg('Ocorreu um problema no resgate do Fundo : '+#13+
                    FieldByName('DESCFUNDOINVEST').AsString+#13+'Deseja continuar ?',
                    'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then 
            Begin
               Close;
               If dtmBaseDados.dbBaseDados.InTransaction Then
                  DtmBaseDados.dbBaseDados.Rollback;
               ProgressBar1.Min  := 0;
               ProgressBar1.Max  := 0;
               ProgressBar1.Step := 0;
               lbResgate.Caption := ' ';
               lbResgate.Repaint;               
               Exit;
            End;
          End;
          Next;
       End;
       DtmBaseDados.dbBaseDados.Commit;
       ProgressBar1.Min  := 0;
       ProgressBar1.Max  := 0;
       ProgressBar1.Step := 0;
       lbResgate.Caption := ' ';
       lbResgate.Repaint;
       If RecordCount > 0 Then
          MsgDlg('Processamento dos Resgates OK ! ', 'Mensagem do Sistema', MtWarning, [mbOk],0)
       Else
          MsgDlg('Não há Pedidos de Resgate para essa data ou já executados! ', 'Mensagem do Sistema', MtWarning, [mbOk],0);
       Close;          
    End;
  Except
    MsgDlg( 'O processo será cancelado. ',
            'Mensagem do Sistema ', MtError,[MbOk],0);
    If dtmBaseDados.dbBaseDados.InTransaction Then
       DtmBaseDados.dbBaseDados.Rollback;
    ProgressBar1.Min  := 0;
    ProgressBar1.Max  := 0;
    ProgressBar1.Step := 0;
    lbResgate.Caption := ' ';
    lbResgate.Repaint;    
    Close;
    Exit;
  End;
end;

procedure TfrmProcResgates.FormShow(Sender: TObject);
begin
  inherited;
   lbResgate.Caption := ' ';
   lbResgate.Repaint;   
   QryDatePedido.Open;
end;

procedure TfrmProcResgates.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryDatePedido.Close;
  QryPedidoResg.Close;
  WindowState := wsMaximized;
end;

procedure TfrmProcResgates.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsNormal;
end;

end.
