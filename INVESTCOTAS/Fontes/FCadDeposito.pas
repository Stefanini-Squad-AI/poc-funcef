unit FCadDeposito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, StdCtrls, TREdit, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, uCmSqlParams, uCtrlPadroes, uMensErro,
  uCtrlCarteiraInvest, uCtrlCarteiraXEvento, uCtrlHistCaixa, uCtrlParamCotaInvest,
  uCtrlDiasUteis;

type
  TFrmCadDeposito = class(TFrmCadastroGridMTInv)
    DbDtData: TCMDateTimePicker;
    LblData: TLabel;
    DbLcCarteira: TwwDBLookupCombo;
    LblCarteira: TLabel;
    LblEvento: TLabel;
    DbLcEvento: TwwDBLookupCombo;
    DbRValor: TDBRealEdit;
    LblValor: TLabel;
    CdsCarteira: TCMClientDataSet;
    CdsEvento: TCMClientDataSet;
    CMSqlParams: TCMSqlParams;
    CdsIDHISTCAIXA: TFloatField;
    CdsIDCARTEIRAINVEST: TFloatField;
    CdsIDCARTEIRAXEVENTO: TFloatField;
    CdsDATAHISTCAIXA: TDateTimeField;
    CdsVLRHISTCAIXA: TFloatField;
    CdsTIPMOVCAIXA: TStringField;
    CdsIDEVENTOCAIXACOTA: TFloatField;
    CdsDESCCAIXACOTA: TStringField;
    CdsDESCCARTINVEST: TStringField;
    CdsFLGMANUALAUT: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DbLcCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLcCarteiraEnter(Sender: TObject);
    procedure DbLcCarteiraExit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlCarteiraInvest : TCtrlCarteiraInvest;
    CtrlCarteiraXEvento : TCtrlCarteiraXEvento;
    CtrlHistCaixa : TCtrlHistCaixa;
    CtrlParamCotaInvest : TCtrlParamCotaInvest;
    CtrlDiasUteis : TCtrlDiasUteis;

    bModif  : Boolean;
    sRegAnt : string;

    procedure ControleTela(bControl : Boolean);    
  public
    { Public declarations }
  end;

var
  FrmCadDeposito: TFrmCadDeposito;

implementation

{$R *.DFM}

procedure TFrmCadDeposito.FormCreate(Sender: TObject);
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
   CtrlCarteiraXEvento.CdsCarteiraXEvento := CdsEvento;

   CtrlParamCotaInvest := TCtrlParamCotaInvest.Create;
   CtrlParamCotaInvest.InitializeAs(Padroes);

   CtrlDiasUteis := TCtrlDiasUteis.Create;
   CtrlDiasUteis.InitializeAs(Padroes);

end;

procedure TFrmCadDeposito.FormShow(Sender: TObject);
begin
   Cds.Data := CtrlHistCaixa.ListHistCaixa(-1,'',0,-1,-6);
  inherited;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;
   CdsEvento.Data   := CtrlCarteiraXEvento.ListCarteiraXEvento(0,0,0,'S','','S','','','A');
   CdsEvento.Filter := '(IDCARTEIRAXEVENTO = -1)';
   CdsEvento.Filtered := True;   
end;

procedure TFrmCadDeposito.DbLcCarteiraCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bModif := modified;
   if ((modified) and (Trim(DbLcCarteira.Text) <> '') ) then
   begin
      CdsEvento.Filter   := '';
      CdsEvento.Filtered := False;
      CdsEvento.Data := CtrlCarteiraXEvento.ListCarteiraXEvento(CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-6, StrToInt(DbLcCarteira.LookupValue)),
                                                                StrToInt(DbLcCarteira.LookupValue),0,'S','','S','','','A');
   end;
end;

procedure TFrmCadDeposito.DbLcCarteiraEnter(Sender: TObject);
begin
  inherited;
   sRegAnt := DbLcCarteira.LookupValue;
end;

procedure TFrmCadDeposito.DbLcCarteiraExit(Sender: TObject);
var iIdCartXEven : Integer;
begin
  inherited;
   if ((Not bModif) and (Trim(DbLcCarteira.Text) <> '') and (sRegAnt <> DbLcCarteira.LookupValue)) then
   begin
      CdsEvento.Filter   := '';
      CdsEvento.Filtered := False;
      CdsEvento.Data := CtrlCarteiraXEvento.ListCarteiraXEvento(CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-6, StrToInt(DbLcCarteira.LookupValue)),
                                                                StrToInt(DbLcCarteira.LookupValue),0,'S','','S','','','A');
   end;
end;

procedure TFrmCadDeposito.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   Cds.Data := CtrlHistCaixa.ListHistCaixa(-1,'',0,-1,-6);
end;

procedure TFrmCadDeposito.CmeCadastroApplyInsert(sender: TObject;  var Accept: Boolean);
var dDataUltDiaAnt, dData : TDateTime;
    iCarteira : Integer;
begin
   dData := DbDtData.Date;
   iCarteira := StrToInt(DbLcCarteira.LookupValue);

  inherited;

   Cds.FieldByName('IDCARTEIRAXEVENTO').AsInteger := CdsEvento.FieldByName('IDCARTEIRAXEVENTO').AsInteger;
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

procedure TFrmCadDeposito.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
var dDataUltDiaAnt, dData : TDateTime;
    iCarteira : Integer;
begin
   dData := DbDtData.Date;
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

procedure TFrmCadDeposito.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := False;

   if Trim(DbDtData.Text) = '' then
   begin
      MsgDlg('Informe a Data.', 'Warning', mtWarning, [mbOk], 0);
      if DbDtData.CanFocus then
         DbDtData.SetFocus;
      Exit;
   end;

   if Trim(DbLcCarteira.Text) = '' then
   begin
      MsgDlg('Informe a Carteira.', 'Warning', mtWarning, [mbOk], 0);
      if DbLcCarteira.CanFocus then
         DbLcCarteira.SetFocus;
      Exit;
   end;

   if Trim(DbLcEvento.Text) = '' then
   begin
      MsgDlg('Informe o Evento.', 'Warning', mtWarning, [mbOk], 0);
      if DbLcEvento.CanFocus then
         DbLcEvento.SetFocus;
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

procedure TFrmCadDeposito.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
      Cds.Locate('IDHISTCAIXA',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmCadDeposito.ControleTela(bControl: Boolean);
begin
   LblData.Enabled := bControl;
   DbDtData.Enabled := bControl;
   LblCarteira.Enabled := bControl;
   DbLcCarteira.Enabled := bControl;
   LblEvento.Enabled := bControl;
   DbLcEvento.Enabled := bControl;
end;

procedure TFrmCadDeposito.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   ControleTela(False);
end;

procedure TFrmCadDeposito.dbGrdDblClick(Sender: TObject);
begin
  inherited;
   ControleTela(False);
end;

procedure TFrmCadDeposito.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
   ControleTela(True);
end;

procedure TFrmCadDeposito.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(CtrlHistCaixa);
   FreeAndNil(CtrlCarteiraXEvento);
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlParamCotaInvest);
   FreeAndNil(CtrlDiasUteis);
end;

end.
