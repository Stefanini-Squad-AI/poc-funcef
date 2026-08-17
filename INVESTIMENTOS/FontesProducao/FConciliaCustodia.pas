//********************************************************************************************************
//Data	     : 12/09/2006
//Codigo     : AL_1
//Pendência : 22967
//Função     : Segregação de Planos
//********************************************************************************************************
unit FConciliaCustodia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Grids, Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, TREdit, Db, DBTables, Wwquery, wwdblook,
  Wwdatsrc;

type
  TFrmConciliaCustodia = class(TfrmOkCancelar)
    dbgConsulta: TwwDBGrid;
    pnlConsulta: TPanel;
    Label3: TLabel;
    edData: TCMDateTimePicker;
    pnlTotal: TPanel;
    dbQtd: TDBRealEdit;
    dbQtdConciiacao: TDBRealEdit;
    dbQtdDivergencia: TDBRealEdit;
    Label1: TLabel;
    Panel11: TPanel;
    bt_Imprime: TBitBtn;
    bbtnGravar: TBitBtn;
    QryUpdConcilaCustodia: TwwQuery;
    rgMostra: TRadioGroup;
    qryConsCarteira: TwwQuery;
    qryConsCarteiraDESCCARTINVEST: TStringField;
    qryConsCarteiraIDCARTEIRAINVEST: TFloatField;
    dtsConsCarteira: TwwDataSource;
    dblConsCarteira: TwwDBLookupCombo;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnGravarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgMostraClick(Sender: TObject);
    procedure dblConsCarteiraExit(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQuery;
  public
    { Public declarations }
  end;

var
  FrmConciliaCustodia: TFrmConciliaCustodia;

implementation

uses FDmRelatorio, UOperComum, UDiasUteisInvest, DBasedados, UOperacaoInvest,
     dOperacaoInvest, UMensErro, FDmRelConsCartRenVar;

{$R *.DFM}

Procedure TFrmConciliaCustodia.FazQuery;
begin
   //AL_1
   DmRelConsCartRenVar.qryConsCartRendVar.Filtered := False;
   DmRelConsCartRenVar.qryConsCartRendVar.Filter   := '';
   If (dblConsCarteira.LookupValue <> '') and (Trim(edData.Text) <> '') Then
   Begin
      dtmRelatorio.QryConciliacaoCustodia.DisableControls;
      Try
        dtmRelatorio.QryConciliacaoCustodia.Close;

        dtmRelatorio.QryConciliacaoCustodia.ParamByName('DATAMOVCARTINV').AsDateTime  :=
                                                                StrToDate(edData.Text);
        dtmRelatorio.QryConciliacaoCustodia.ParamByName('IDCARTEIRAINVEST').AsString :=
                                                                dblConsCarteira.LookupValue;
        dtmRelatorio.QryConciliacaoCustodia.ParamByName('TIPO').AsInteger            :=
                                                                rgMostra.ItemIndex;
        dtmRelatorio.QryConciliacaoCustodia.Open;

        If rgMostra.ItemIndex = 1 Then
           dtmRelatorio.QryConciliacaoCustodia.Filter   := ''
        Else
           dtmRelatorio.QryConciliacaoCustodia.Filter   := '(QTDEDIVERGENTE <> 0)';
        dtmRelatorio.QryConciliacaoCustodia.Filtered    := True;

        dtmRelatorio.QryConciliacaoCustodia.Edit;
      Finally;
        dtmRelatorio.QryConciliacaoCustodia.EnableControls;
      End;
   End
   Else
   Begin
     ShowMessage('Falta preencher o campo!            ');
     If (trim(edData.Text) = '') Then
         edData.SetFocus
     Else
         dblConsCarteira.SetFocus;
   End;      
end;

procedure TFrmConciliaCustodia.FormCreate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState := wsMaximized;
end;

procedure TFrmConciliaCustodia.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   dtmRelatorio.QryConciliacaoCustodia.DisableControls;
   dtmRelatorio.ppLDataConcilia.Caption    := edData.Text;
   dtmRelatorio.RpConciliacaoCustodia.Print;
   dtmRelatorio.QryConciliacaoCustodia.EnableControls;
end;

procedure TFrmConciliaCustodia.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   FazQuery;
end;

procedure TFrmConciliaCustodia.bbtnGravarClick(Sender: TObject);
Var
   iIdInv : Integer;
begin
  inherited;
    dtmRelatorio.QryConciliacaoCustodia.Post;
    iIdInv :=  dtmRelatorio.QryConciliacaoCustodia.FieldByName('IDINVESTIMENTO').AsInteger;
    Try
       If Not DtmBaseDados.dbBaseDados.InTransaction Then Begin
          DtmBaseDados.dbBaseDados.StartTransaction;
       With dtmRelatorio.QryConciliacaoCustodia Do
       begin
          DisableControls;
          First;
          While Not EOF Do
          begin
             QryUpdConcilaCustodia.ParamByName('OBSERVACAO').AsString :=
                                   FieldByName('OBSERVACAO').AsString;
             QryUpdConcilaCustodia.ParamByName('IDCONCILIACUSTODIA').AsInteger :=
                                   FieldByName('IDCONCILIACUSTODIA').AsInteger;
             QryUpdConcilaCustodia.ExecSQL;
             Next;
          end;
          Locate('IDINVESTIMENTO',iIdInv,[loPartialKey]);
          EnableControls;
       End;
       DtmBaseDados.dbBaseDados.Commit;
    End;
    Except;
       dtmRelatorio.QryConciliacaoCustodia.EnableControls;
       DtmBaseDados.dbBaseDados.Rollback;
       MsgDlg('Não foi possível gravar a Observação.','Erro',
              MtError,[MbOk],0);
    End;
    dtmRelatorio.QryConciliacaoCustodia.Cancel;
end;

procedure TFrmConciliaCustodia.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
    FazQuery;
end;

procedure TFrmConciliaCustodia.FormShow(Sender: TObject);
begin
  inherited;
   qryConsCarteira.Open;
   dblConsCarteira.Text        := qryConsCarteiraDESCCARTINVEST.AsString;
   dblConsCarteira.LookupValue := qryConsCarteiraIDCARTEIRAINVEST.AsString;
end;

procedure TFrmConciliaCustodia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryConsCarteira.Close;
    dtmRelatorio.QryConciliacaoCustodia.Close;
end;

procedure TFrmConciliaCustodia.rgMostraClick(Sender: TObject);
begin
  inherited;
   bbtnConfirmar.Click;   
end;

procedure TFrmConciliaCustodia.dblConsCarteiraExit(Sender: TObject);
begin
  inherited;
   bbtnConfirmar.Click;
end;

end.
