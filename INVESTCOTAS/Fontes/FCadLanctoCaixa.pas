unit FCadLanctoCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, uCmSqlParams, uCtrlPadroes,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, TREdit, uMensErro,
  uCtrlHistCaixa, uCtrlCarteiraXEvento, uCtrlCarteiraInvest, uCtrlParamCotaInvest,
  uCtrlDiasUteis;

type
  TFrmCadLanctoCaixa = class(TFrmCadastroGridMTInv)
    CMSqlParams: TCMSqlParams;
    dbdData: TCMDateTimePicker;
    LblData: TLabel;
    DbLcEventoCaixa: TwwDBLookupCombo;
    LblEvento: TLabel;
    CdsEventoCaixa: TCMClientDataSet;
    DbLcCarteira: TwwDBLookupCombo;
    LblCarteira: TLabel;
    CdsCarteira: TCMClientDataSet;
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
    CdsDESCCAIXACOTA: TStringField;
    CdsSTASOMADIMINUI: TStringField;
    CdsIDTIPOOPERACAO: TFloatField;
    CdsIDTIPOINVEST: TFloatField;
    CdsIDREGRA: TFloatField;
    CdsIDTIPODESPINVEST: TFloatField;
    CdsDESCCARTINVEST: TStringField;
    CdsIDEVENTOCAIXACOTA: TFloatField;
    CdsFLGMANUALAUT: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DbLcCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLcCarteiraEnter(Sender: TObject);
    procedure DbLcCarteiraExit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure DbLcEventoCaixaExit(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dbGrdDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure dbGrdCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormDestroy(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
  private
    { Private declarations }
    CtrlHistCaixa : TCtrlHistCaixa;
    CtrlCarteiraXEvento : TCtrlCarteiraXEvento;
    CtrlCarteiraInvest : TCtrlCarteiraInvest;
    CtrlParamCotaInvest : TCtrlParamCotaInvest;
    CtrlDiasUteis : TCtrlDiasUteis;

    bModif  : Boolean;
    sRegAnt : string;

    procedure ControleTela(bControl : Boolean);
  public
    { Public declarations }
  end;

var
  FrmCadLanctoCaixa: TFrmCadLanctoCaixa;

implementation

{$R *.DFM}

procedure TFrmCadLanctoCaixa.FormCreate(Sender: TObject);
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

procedure TFrmCadLanctoCaixa.FormShow(Sender: TObject);
begin
   Cds.Data := CtrlHistCaixa.ListHistCaixa;
  inherited;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;
   CdsEventoCaixa.Data := CtrlCarteiraXEvento.ListCarteiraXEvento(0,0,0,'S');

   Cds.Filter := '(IDEVENTOCAIXACOTA <> -6 AND IDEVENTOCAIXACOTA <> -7)';
   Cds.Filtered := True;

   CdsEventoCaixa.Filter := '(IDCARTEIRAXEVENTO = -1)';
   CdsEventoCaixa.Filtered := True;

end;

procedure TFrmCadLanctoCaixa.DbLcCarteiraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bModif := modified;
   if ((modified) and (Trim(DbLcCarteira.Text) <> '') ) then
   begin
      CdsEventoCaixa.Filter   := '';
      CdsEventoCaixa.Filtered := False;
      CdsEventoCaixa.Data     := CtrlCarteiraXEvento.ListCarteiraXEvento(0, StrToInt(DbLcCarteira.LookupValue),0,'S');
      CdsEventoCaixa.Filter   := '(IDEVENTOCAIXACOTA <> -6 AND IDEVENTOCAIXACOTA <> -7)';
      CdsEventoCaixa.Filtered := True;
   end;
end;

procedure TFrmCadLanctoCaixa.DbLcCarteiraEnter(Sender: TObject);
begin
  inherited;
   sRegAnt := DbLcCarteira.LookupValue;
end;

procedure TFrmCadLanctoCaixa.DbLcCarteiraExit(Sender: TObject);
begin
  inherited;
   if ((Not bModif) and (Trim(DbLcCarteira.Text) <> '') and (sRegAnt <> DbLcCarteira.LookupValue)) then
   begin
      CdsEventoCaixa.Filter   := '';
      CdsEventoCaixa.Filtered := False;
      CdsEventoCaixa.Data     := CtrlCarteiraXEvento.ListCarteiraXEvento(0, StrToInt(DbLcCarteira.LookupValue),0,'S');
      CdsEventoCaixa.Filter   := '(IDEVENTOCAIXACOTA <> -6 AND IDEVENTOCAIXACOTA <> -7)';
      CdsEventoCaixa.Filtered := True;
   end;
end;

procedure TFrmCadLanctoCaixa.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
var dData, dDataUltDiaAnt : TDateTime;
    iCarteira : Integer;
begin
   dData := dbdData.Date;
   iCarteira := StrToInt(DbLcCarteira.LookupValue);
  inherited;
   Accept := CtrlHistCaixa.AplicaAtualHistCaixa;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlHistCaixa.MessageInfo,'Erro',mtError,[mbOk],0)
   else
   begin
      dDataUltDiaAnt := CtrlDiasUteis.UltDiaUtilAnterior(dData,-1,1,'',True,False,False);

      CdsAux.Data := CtrlParamCotaInvest.ListParamCotaInvest(-1,iCarteira);

      if CdsAux.FieldByName('DATAULTFECH').AsDateTime > dDataUltDiaAnt then
      begin
         CdsAux.Close;
         if not CtrlParamCotaInvest.AtualizaDataFech(iCarteira, dDataUltDiaAnt) then
            Raise Exception.Create('Ocorreu um erro na atualização da data de fechamento.' + #13 +
                                   'Motivo: ' + CtrlParamCotaInvest.MessageInfo);
      end;
      CdsAux.Close;
   end;
end;

procedure TFrmCadLanctoCaixa.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
var dData, dDataUltDiaAnt : TDateTime;
    iCarteira : Integer;  
begin
   dData := dbdData.Date;
   iCarteira := StrToInt(DbLcCarteira.LookupValue);
  inherited;
   Accept := CtrlHistCaixa.AplicaAtualHistCaixa;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlHistCaixa.MessageInfo,'Erro',mtError,[mbOk],0)
   else
   begin
      dDataUltDiaAnt := CtrlDiasUteis.UltDiaUtilAnterior(dData,-1,1,'',True,False,False);

      CdsAux.Data := CtrlParamCotaInvest.ListParamCotaInvest(-1,iCarteira);

      if CdsAux.FieldByName('DATAULTFECH').AsDateTime > dDataUltDiaAnt then
      begin
         CdsAux.Close;
         if not CtrlParamCotaInvest.AtualizaDataFech(iCarteira, dDataUltDiaAnt) then
            Raise Exception.Create('Ocorreu um erro na atualização da data de fechamento.' + #13 +
                                   'Motivo: ' + CtrlParamCotaInvest.MessageInfo);
      end;
      CdsAux.Close;
   end;
   Cds.Data := CtrlHistCaixa.ListHistCaixa;
end;

procedure TFrmCadLanctoCaixa.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
var dData, dDataUltDiaAnt : TDateTime;
    iCarteira : Integer;
begin
   dData := dbdData.Date;

   if DbLcCarteira.Text <> '' then
      iCarteira := StrToInt(DbLcCarteira.LookupValue);
  inherited;
   Accept := CtrlHistCaixa.AplicaAtualHistCaixa;
   if not Accept then
      MsgDlg('Ocorreu um erro na exclusão do Registro.' + #13 +
             'Motivo: ' + CtrlHistCaixa.MessageInfo,'Erro',mtError,[mbOk],0)
   else if not Cds.IsEmpty then
   begin
      dDataUltDiaAnt := CtrlDiasUteis.UltDiaUtilAnterior(dData,-1,1,'',True,False,False);

      CdsAux.Data := CtrlParamCotaInvest.ListParamCotaInvest(-1,iCarteira);

      if CdsAux.FieldByName('DATAULTFECH').AsDateTime > dDataUltDiaAnt then
      begin
         CdsAux.Close;
         if not CtrlParamCotaInvest.AtualizaDataFech(iCarteira, dDataUltDiaAnt) then
            Raise Exception.Create('Ocorreu um erro na atualização da data de fechamento.' + #13 +
                                   'Motivo: ' + CtrlParamCotaInvest.MessageInfo);
      end;
      CdsAux.Close;
   end;
end;

procedure TFrmCadLanctoCaixa.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := False;

   if Trim(dbdData.Text) = '' then
   begin
      MsgDlg('Informe a Data.', 'Warning', mtWarning, [mbOk], 0);
      if dbdData.CanFocus then
         dbdData.SetFocus;
      Exit;
   end;

   if Trim(DbLcCarteira.Text) = '' then
   begin
      MsgDlg('Informe a Carteira.', 'Warning', mtWarning, [mbOk], 0);
      if DbLcCarteira.CanFocus then
         DbLcCarteira.SetFocus;
      Exit;
   end;

   if Trim(DbLcEventoCaixa.Text) = '' then
   begin
      MsgDlg('Informe o Evento Caixa.', 'Warning', mtWarning, [mbOk], 0);
      if DbLcEventoCaixa.CanFocus then
         DbLcEventoCaixa.SetFocus;
      Exit;
   end;

   if DbRValor.Value = 0 then
   begin
      MsgDlg('Informe o Valor.', 'Warning', mtWarning, [mbOk], 0);
      if DbRValor.CanFocus then
         DbRValor.SetFocus;
      Exit;
   end;

   Accept := True;
end;

procedure TFrmCadLanctoCaixa.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   Cds.Data := CtrlHistCaixa.ListHistCaixa;
end;

procedure TFrmCadLanctoCaixa.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
      Cds.Locate('IDHISTCAIXA',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmCadLanctoCaixa.DbLcEventoCaixaExit(Sender: TObject);
begin
  inherited;
   if CdsEventoCaixa.FieldByName('STASOMADIMINUI').AsString = 'S' then
      DbRValor.Color := clAqua
   else if CdsEventoCaixa.FieldByName('STASOMADIMINUI').AsString = 'D' then
      DbRValor.Color := clRed
   else
      DbRValor.Color := clWindow;
end;

procedure TFrmCadLanctoCaixa.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   if Cds.FieldByName('STASOMADIMINUI').AsString = 'S' then
      DbRValor.Color := clAqua
   else if Cds.FieldByName('STASOMADIMINUI').AsString = 'D' then
      DbRValor.Color := clRed
   else
      DbRValor.Color := clWindow;
end;

procedure TFrmCadLanctoCaixa.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
   DbRValor.Color := clWindow;
   ControleTela(True);
end;

procedure TFrmCadLanctoCaixa.dbGrdDrawDataCell(Sender: TObject;
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

procedure TFrmCadLanctoCaixa.dbGrdCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
//  inherited;

end;

procedure TFrmCadLanctoCaixa.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(CtrlHistCaixa);
   FreeAndNil(CtrlCarteiraXEvento);
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlParamCotaInvest);
   FreeAndNil(CtrlDiasUteis);
end;

procedure TFrmCadLanctoCaixa.ControleTela(bControl: Boolean);
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

procedure TFrmCadLanctoCaixa.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   ControleTela(False);
end;

procedure TFrmCadLanctoCaixa.dbGrdDblClick(Sender: TObject);
begin
  inherited;
   ControleTela(False);
end;

end.
