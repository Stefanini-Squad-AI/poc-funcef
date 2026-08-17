unit FCadLanctoCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, uCmSqlParams, uCtrlPadroes,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, TREdit, uMensErro,  
  uCtrlHistCota, uCtrlCarteiraXEvento, uCtrlCarteiraInvest, uCtrlParamCotaInvest,
  uCtrlDiasUteis;

type
  TFrmCadLanctoCota = class(TFrmCadastroGridMTInv)
    CMSqlParams: TCMSqlParams;
    dbdData: TCMDateTimePicker;
    LblData: TLabel;
    DbLcEventoCota: TwwDBLookupCombo;
    LblEvento: TLabel;
    CdsEventoCota: TCMClientDataSet;
    DbLcCarteira: TwwDBLookupCombo;
    LblCarteira: TLabel;
    CdsCarteira: TCMClientDataSet;
    LblValor: TLabel;
    DbRValor: TDBRealEdit;
    CdsIDHISTCOTA: TFloatField;
    CdsIDCARTEIRAXEVENTO: TFloatField;
    CdsIDPLANPREVCTBPATR: TFloatField;
    CdsDATAHISTCOTA: TDateTimeField;
    CdsVLRHISTCOTA: TFloatField;
    CdsIDCARTEIRAINVEST: TFloatField;
    CdsIDCARTEIRAGERENC: TFloatField;
    CdsDESCCAIXACOTA: TStringField;
    CdsSTAATIVOPASSIVO: TStringField;
    CdsIDTIPOOPERACAO: TFloatField;
    CdsIDTIPOINVEST: TFloatField;
    CdsIDREGRA: TFloatField;
    CdsIDTIPODESPINVEST: TFloatField;
    CdsDESCCARTINVEST: TStringField;
    CdsFLGMANUALAUT: TStringField;
    CdsIDEVENTOCAIXACOTA: TFloatField;
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
    procedure DbLcEventoCotaExit(Sender: TObject);
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
    CtrlHistCota : TCtrlHistCota;
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
  FrmCadLanctoCota: TFrmCadLanctoCota;

implementation

{$R *.DFM}

procedure TFrmCadLanctoCota.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlHistCota := TCtrlHistCota.Create;
   CtrlHistCota.InitializeAs(Padroes);
   CtrlHistCota.CdsHistCota := Cds;

   CtrlCarteiraInvest := TCtrlCarteiraInvest.Create;
   CtrlCarteiraInvest.InitializeAs(Padroes);
   CtrlCarteiraInvest.CdsCarteiraInvest := CdsCarteira;

   CtrlCarteiraXEvento := TCtrlCarteiraXEvento.Create;
   CtrlCarteiraXEvento.InitializeAs(Padroes);
   CtrlCarteiraXEvento.CdsCarteiraXEvento := CdsEventoCota;

   CtrlParamCotaInvest := TCtrlParamCotaInvest.Create;
   CtrlParamCotaInvest.InitializeAs(Padroes);

   CtrlDiasUteis := TCtrlDiasUteis.Create;
   CtrlDiasUteis.InitializeAs(Padroes);

end;

procedure TFrmCadLanctoCota.FormShow(Sender: TObject);
begin
   Cds.Data := CtrlHistCota.ListHistCota;
  inherited;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;
   CdsEventoCota.Data := CtrlCarteiraXEvento.ListCarteiraXEvento(0,0,0,'','S');

   Cds.Filter := '(IDEVENTOCAIXACOTA <> -3 AND IDEVENTOCAIXACOTA <> -4 AND IDEVENTOCAIXACOTA <> -5)';
   Cds.Filtered := True;

   CdsEventoCota.Filter := '(IDCARTEIRAXEVENTO = -1)';
   CdsEventoCota.Filtered := True;

end;

procedure TFrmCadLanctoCota.DbLcCarteiraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bModif := modified;
   if ((modified) and (Trim(DbLcCarteira.Text) <> '') ) then
   begin
      CdsEventoCota.Filter   := '';
      CdsEventoCota.Filtered := False;
      CdsEventoCota.Data     := CtrlCarteiraXEvento.ListCarteiraXEvento(0, StrToInt(DbLcCarteira.LookupValue),0,'','S');
      CdsEventoCota.Filter   := '(IDEVENTOCAIXACOTA <> -3 AND IDEVENTOCAIXACOTA <> -4 AND IDEVENTOCAIXACOTA <> -5)';
      CdsEventoCota.Filtered := True;
   end;
end;

procedure TFrmCadLanctoCota.DbLcCarteiraEnter(Sender: TObject);
begin
  inherited;
   sRegAnt := DbLcCarteira.LookupValue;
end;

procedure TFrmCadLanctoCota.DbLcCarteiraExit(Sender: TObject);
begin
  inherited;
   if ((Not bModif) and (Trim(DbLcCarteira.Text) <> '') and (sRegAnt <> DbLcCarteira.LookupValue)) then
   begin
      CdsEventoCota.Filter   := '';
      CdsEventoCota.Filtered := False;
      CdsEventoCota.Data     := CtrlCarteiraXEvento.ListCarteiraXEvento(0, StrToInt(DbLcCarteira.LookupValue),0,'','S');
      CdsEventoCota.Filter   := '(IDEVENTOCAIXACOTA <> -3 AND IDEVENTOCAIXACOTA <> -4 AND IDEVENTOCAIXACOTA <> -5)';
      CdsEventoCota.Filtered := True;
   end;   
end;

procedure TFrmCadLanctoCota.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
var dData, dDataUltDiaAnt : TDateTime;
    iCarteira : Integer;  
begin
   dData := dbdData.Date;
   iCarteira := StrToInt(DbLcCarteira.LookupValue);
  inherited;
   Accept := CtrlHistCota.AplicaAtualHistCota;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlHistCota.MessageInfo,'Erro',mtError,[mbOk],0)
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

procedure TFrmCadLanctoCota.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
var dData, dDataUltDiaAnt : TDateTime;
    iCarteira : Integer;  
begin
   dData := dbdData.Date;
   iCarteira := StrToInt(DbLcCarteira.LookupValue);
  inherited;
   Accept := CtrlHistCota.AplicaAtualHistCota;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlHistCota.MessageInfo,'Erro',mtError,[mbOk],0)
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
   Cds.Data := CtrlHistCota.ListHistCota;
end;

procedure TFrmCadLanctoCota.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
var dData, dDataUltDiaAnt : TDateTime;
    iCarteira : Integer;  
begin
   dData := dbdData.Date;

   if DbLcCarteira.Text <> '' then
      iCarteira := StrToInt(DbLcCarteira.LookupValue);
      
  inherited;
   Accept := CtrlHistCota.AplicaAtualHistCota;
   if not Accept then
      MsgDlg('Ocorreu um erro na exclusão do Registro.' + #13 +
             'Motivo: ' + CtrlHistCota.MessageInfo,'Erro',mtError,[mbOk],0)
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

procedure TFrmCadLanctoCota.CmeCadastroBeforeConfirma(sender: TObject;
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

   if Trim(DbLcEventoCota.Text) = '' then
   begin
      MsgDlg('Informe o Evento Cota.', 'Warning', mtWarning, [mbOk], 0);
      if DbLcEventoCota.CanFocus then
         DbLcEventoCota.SetFocus;
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

procedure TFrmCadLanctoCota.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   Cds.Data := CtrlHistCota.ListHistCota;
end;

procedure TFrmCadLanctoCota.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
      Cds.Locate('IDHISTCOTA',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmCadLanctoCota.DbLcEventoCotaExit(Sender: TObject);
begin
  inherited;
   if CdsEventoCota.FieldByName('STAATIVOPASSIVO').AsString = 'A' then
      DbRValor.Color := clAqua
   else if CdsEventoCota.FieldByName('STAATIVOPASSIVO').AsString = 'P' then
      DbRValor.Color := clRed
   else
      DbRValor.Color := clWindow;
end;

procedure TFrmCadLanctoCota.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   if Cds.FieldByName('STAATIVOPASSIVO').AsString = 'A' then
      DbRValor.Color := clAqua
   else if Cds.FieldByName('STAATIVOPASSIVO').AsString = 'P' then
      DbRValor.Color := clRed
   else
      DbRValor.Color := clWindow;
end;

procedure TFrmCadLanctoCota.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
   DbRValor.Color := clWindow;
   ControleTela(True);
end;

procedure TFrmCadLanctoCota.dbGrdDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if not ((gdSelected in State) or (gdFixed in State)) then
  begin
     if Cds.FieldByName('STAATIVOPASSIVO').AsString = 'A' then
        dbGrd.Canvas.Brush.Color := clAqua
     else if Cds.FieldByName('STAATIVOPASSIVO').AsString = 'P' then
        dbGrd.Canvas.Brush.Color := clRed
     else
        dbGrd.Canvas.Brush.Color := clWindow;

     dbGrd.DefaultDrawDataCell(Rect, Field, State);
  end
  else if (gdSelected in State) or (gdFocused in State) then
  begin
     if Cds.FieldByName('STAATIVOPASSIVO').AsString = 'A' then
        dbGrd.Canvas.Brush.Color := clAqua
     else if Cds.FieldByName('STAATIVOPASSIVO').AsString = 'P' then
        dbGrd.Canvas.Brush.Color := clRed
     else
        dbGrd.Canvas.Brush.Color := clWindow;

     if (State = [gdSelected]) then
        dbGrd.Canvas.Brush.Color := clNavy;

     dbGrd.DefaultDrawDataCell(Rect, Field, State);
  end;
end;

procedure TFrmCadLanctoCota.dbGrdCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
//  inherited;

end;

procedure TFrmCadLanctoCota.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(CtrlHistCota);
   FreeAndNil(CtrlCarteiraXEvento);
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlParamCotaInvest);
   FreeAndNil(CtrlDiasUteis);
end;

procedure TFrmCadLanctoCota.ControleTela(bControl: Boolean);
begin
   LblData.Enabled := bControl;
   dbdData.Enabled := bControl;
   LblCarteira.Enabled := bControl;
   DbLcCarteira.Enabled := bControl;
   LblEvento.Enabled := bControl;
   DbLcEventoCota.Enabled := bControl;

   LblValor.Enabled  := not (Cds.FieldByName('FLGMANUALAUT').AsString = 'A');
   DbRValor.Enabled  := not (Cds.FieldByName('FLGMANUALAUT').AsString = 'A');
   bbtnConfirmar.Enabled  := not (Cds.FieldByName('FLGMANUALAUT').AsString = 'A');
end;

procedure TFrmCadLanctoCota.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   ControleTela(False);
end;

procedure TFrmCadLanctoCota.dbGrdDblClick(Sender: TObject);
begin
  inherited;
   ControleTela(False);
end;

end.
