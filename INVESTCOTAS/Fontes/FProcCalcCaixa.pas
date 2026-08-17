unit FProcCalcCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, uCmSqlParams, Mask, DBCtrls,
  uMensErro, TREdit, wwdblook, PpPrvDlg, PPforms, wwdbdatetimepicker,
  CMDateTimePicker, uCtrlPadroes, uCtrlHistCaixa, uCtrlCarteiraXEvento,
  uCtrlCarteiraInvest, uCtrlParamCotaInvest, uCtrlDiasUteis;

type
  TFrmProcCalcCaixa = class(TFrmCadastroGridMTInv)
    CMSqlParams: TCMSqlParams;
    CdsEventoCaixa: TCMClientDataSet;
    CdsCarteira: TCMClientDataSet;
    LblData: TLabel;
    dbdData: TCMDateTimePicker;
    LblCarteira: TLabel;
    DbLcCarteira: TwwDBLookupCombo;
    LblEvento: TLabel;
    DbLcEventoCaixa: TwwDBLookupCombo;
    LblValor: TLabel;
    DbRValor: TDBRealEdit;
    CdsIDHISTCAIXA: TFloatField;
    CdsIDCARTEIRAXEVENTO: TFloatField;
    CdsIDPLANPREVCTBPATR: TFloatField;
    CdsDATAHISTCAIXA: TDateTimeField;
    CdsVLRHISTCAIXA: TFloatField;
    CdsSLDHISTCAIXA: TFloatField;
    CdsIDOPERACAOINVEST: TFloatField;
    CdsIDCARTEIRAINVEST: TFloatField;
    CdsIDCARTEIRAGERENC: TFloatField;
    CdsIDOPERACAODIREITO: TFloatField;
    CdsDESCINVESTIMENTO: TStringField;
    CdsTIPMOVCAIXA: TStringField;
    CdsIDEVENTOCAIXACOTA: TFloatField;
    CdsDESCCAIXACOTA: TStringField;
    CdsSTASOMADIMINUI: TStringField;
    CdsIDTIPOOPERACAO: TFloatField;
    CdsIDTIPOINVEST: TFloatField;
    CdsIDREGRA: TFloatField;
    CdsIDTIPODESPINVEST: TFloatField;
    CdsDESCCARTINVEST: TStringField;
    CdsFLGMANUALAUT: TStringField;
    Panel1: TPanel;
    DbeData: TDBEdit;
    DbeCarteira: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbGrdDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlHistCaixa : TCtrlHistCaixa;
    CtrlCarteiraXEvento : TCtrlCarteiraXEvento;
    CtrlCarteiraInvest : TCtrlCarteiraInvest;
    CtrlParamCotaInvest : TCtrlParamCotaInvest;
    CtrlDiasUteis : TCtrlDiasUteis;    

    FCarteiraInvest: Integer;
    FDataCalc: TDateTime;

    procedure ControleTela(bControl : Boolean);
    procedure SetCarteiraInvest(const Value: Integer);
    procedure SetDataCalc(const Value: TDateTime);
  public
    { Public declarations }
    property DataCalc : TDateTime read FDataCalc write SetDataCalc;
    property CarteiraInvest : Integer read FCarteiraInvest write SetCarteiraInvest;

    procedure Sel;
  end;

var
  FrmProcCalcCaixa: TFrmProcCalcCaixa;

implementation

uses FSelApuraCaixa;

{$R *.DFM}

procedure TFrmProcCalcCaixa.ControleTela(bControl: Boolean);
begin
   LblData.Enabled := bControl;
   dbdData.Enabled := bControl;
   LblCarteira.Enabled := bControl;
   DbLcCarteira.Enabled := bControl;
   LblEvento.Enabled := bControl;
   DbLcEventoCaixa.Enabled := bControl;

   LblValor.Enabled  := not (Cds.FieldByName('FLGMANUALAUT').AsString = 'A');
   DbRValor.Enabled  := not (Cds.FieldByName('FLGMANUALAUT').AsString = 'A');
   bbtnConfirmar.Enabled  := not (Cds.FieldByName('FLGMANUALAUT').AsString = 'A');   
end;

procedure TFrmProcCalcCaixa.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlHistCaixa := TCtrlHistCaixa.Create;
   CtrlHistCaixa.InitializeAs(Padroes);
   CtrlHistCaixa.CdsHistCaixa := Cds;

   CtrlCarteiraInvest := TCtrlCarteiraInvest.Create;
   CtrlCarteiraInvest.InitializeAs(Padroes);
   CtrlCarteiraInvest.CdsCarteiraInvest := CdsCarteira;

   CtrlCarteiraXEvento := TCtrlCarteiraXEvento.Create;
   CtrlCarteiraXEvento.InitializeAs(Padroes);
   CtrlCarteiraXEvento.CdsCarteiraXEvento := CdsEventoCaixa;

   CtrlParamCotaInvest := TCtrlParamCotaInvest.Create;
   CtrlParamCotaInvest.InitializeAs(Padroes);

   CtrlDiasUteis := TCtrlDiasUteis.Create;
   CtrlDiasUteis.InitializeAs(Padroes);   

end;

procedure TFrmProcCalcCaixa.FormShow(Sender: TObject);
begin
  inherited;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;

   CdsEventoCaixa.Data := CtrlCarteiraXEvento.ListCarteiraXEvento(0,0,0,'S');
end;

procedure TFrmProcCalcCaixa.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   ControleTela(False);

end;

procedure TFrmProcCalcCaixa.dbGrdDblClick(Sender: TObject);
begin
   if Cds.IsEmpty then
      Exit;
      
  inherited;
   ControleTela(False);

end;

procedure TFrmProcCalcCaixa.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := False;

   if DbRValor.Value = 0 then
   begin
      MsgDlg('Informe o Valor.', 'Warning', mtWarning, [mbOk], 0);
      if DbRValor.CanFocus then
         DbRValor.SetFocus;
      Exit;
   end;

   Accept := True;
end;

procedure TFrmProcCalcCaixa.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := CtrlHistCaixa.AplicaAtualHistCaixa;
   if not Accept then
   begin
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlHistCaixa.MessageInfo,'Erro',mtError,[mbOk],0);
      Exit;
   end;
   
   if not CtrlHistCaixa.ApuraCalculoCaixa(FDataCalc,FCarteiraInvest) then
      MsgDlg('Ocorreu um erro na apuração do caixa.' + #13 + 'Motivo: ' + CtrlHistCaixa.MessageInfo,'Erro',mtError,[mbOk],0);

   Cds.Data := CtrlHistCaixa.ListHistCaixa(-1,'',FDataCalc,FCarteiraInvest);
end;

procedure TFrmProcCalcCaixa.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   Cds.Data := CtrlHistCaixa.ListHistCaixa(-1,'',FDataCalc,FCarteiraInvest);
end;

procedure TFrmProcCalcCaixa.SetCarteiraInvest(const Value: Integer);
begin
  FCarteiraInvest := Value;
end;

procedure TFrmProcCalcCaixa.SetDataCalc(const Value: TDateTime);
begin
  FDataCalc := Value;
end;

procedure TFrmProcCalcCaixa.Sel;
var dDataUltDiaAnt : TDateTime;
begin
   try
      Cds.Data := CtrlHistCaixa.ListHistCaixa(-1,'',FDataCalc,FCarteiraInvest);

      if (MsgDlg('Deseja atualizar o caixa?', 'Atualização', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
      begin
         if not CtrlHistCaixa.ApuraCalculoCaixa(FDataCalc, FCarteiraInvest) then
            Raise Exception.Create('Ocorreu um erro na apuração do cálculo de caixa.' + #13 + 'Motivo: ' + CtrlHistCaixa.MessageInfo);

         dDataUltDiaAnt := CtrlDiasUteis.UltDiaUtilAnterior(FDataCalc,-1,1,'',True,False,False);

         CdsAux.Data := CtrlParamCotaInvest.ListParamCotaInvest(-1,FCarteiraInvest);

         if CdsAux.FieldByName('DATAULTFECH').AsDateTime > dDataUltDiaAnt then
         begin
            CdsAux.Close;
            if not CtrlParamCotaInvest.AtualizaDataFech(FCarteiraInvest, dDataUltDiaAnt) then
               Raise Exception.Create('Ocorreu um erro na atualização da data de fechamento.' + #13 +
                                      'Motivo: ' + CtrlParamCotaInvest.MessageInfo);
         end;
         CdsAux.Close;                                      
      end;

      Cds.Data := CtrlHistCaixa.ListHistCaixa(-1,'',FDataCalc,FCarteiraInvest);

   except
      on E:Exception do
         MsgDlg(E.Message,'Erro',mtError,[mbOk],0);
   end;

end;

procedure TFrmProcCalcCaixa.dbGrdDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if not ((gdSelected in State) or (gdFixed in State)) then
  begin
     if Cds.FieldByName('STASOMADIMINUI').AsString = 'S' then
        dbGrd.Canvas.Brush.Color := clAqua
     else if Cds.FieldByName('STASOMADIMINUI').AsString = 'D' then
        dbGrd.Canvas.Brush.Color := clRed
     else
        dbGrd.Canvas.Brush.Color := clWindow;

     dbGrd.DefaultDrawDataCell(Rect, Field, State);
  end
  else if (gdSelected in State) or (gdFocused in State) then
  begin
     if Cds.FieldByName('STASOMADIMINUI').AsString = 'S' then
        dbGrd.Canvas.Brush.Color := clAqua
     else if Cds.FieldByName('STASOMADIMINUI').AsString = 'D' then
        dbGrd.Canvas.Brush.Color := clRed
     else
        dbGrd.Canvas.Brush.Color := clWindow;

     if (State = [gdSelected]) then
        dbGrd.Canvas.Brush.Color := clNavy;

     dbGrd.DefaultDrawDataCell(Rect, Field, State);
  end;
end;

procedure TFrmProcCalcCaixa.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(CtrlHistCaixa);
   FreeAndNil(CtrlCarteiraXEvento);
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlParamCotaInvest);
   FreeAndNil(CtrlDiasUteis);
end;

end.
