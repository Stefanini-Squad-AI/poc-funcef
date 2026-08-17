unit FCadRetirada;

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
  TFrmCadRetirada = class(TFrmCadastroGridMTInv)
    DbDtData: TCMDateTimePicker;
    LblData: TLabel;
    DbLcCarteira: TwwDBLookupCombo;
    LblCarteira: TLabel;
    LblEvento: TLabel;
    dblEvento: TwwDBLookupCombo;
    DbRValor: TDBRealEdit;
    Label4: TLabel;
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
    procedure FormDestroy(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
  private
    { Private declarations }
    CtrlCarteiraInvest : TCtrlCarteiraInvest;
    CtrlCarteiraXEvento : TCtrlCarteiraXEvento;
    CtrlHistCaixa : TCtrlHistCaixa;
    CtrlParamCotaInvest : TCtrlParamCotaInvest;
    CtrlDiasUteis : TCtrlDiasUteis;

    bModif  : Boolean;
    sRegAnt : string;
    
    procedure ControleTela(bControl: Boolean);

  public
    { Public declarations }
  end;

var
  FrmCadRetirada: TFrmCadRetirada;

implementation

{$R *.DFM}

procedure TFrmCadRetirada.FormCreate(Sender: TObject);
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

procedure TFrmCadRetirada.FormShow(Sender: TObject);
begin
   Cds.Data := CtrlHistCaixa.ListHistCaixa(-1,'D');
   Cds.Filter := '(IDEVENTOCAIXACOTA = -7)';
   Cds.Filtered := True;

  inherited;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;
   CdsEvento.Data   := CtrlCarteiraXEvento.ListCarteiraXEvento;
   CdsEvento.Filter := '(IDCARTEIRAXEVENTO = -1)';
   CdsEvento.Filtered := True;
end;

procedure TFrmCadRetirada.DbLcCarteiraCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
var iIdCartXEven : Integer;  
begin
  inherited;
   bModif := modified;
   if ((modified) and (Trim(DbLcCarteira.Text) <> '') ) then
   begin
      CdsEvento.Filter   := '';
      CdsEvento.Filtered := False;
      CdsEvento.Data := CtrlCarteiraXEvento.ListCarteiraXEvento(CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-7, StrToInt(DbLcCarteira.LookupValue)),
                                                                StrToInt(DbLcCarteira.LookupValue),0,'S','','D','','','M');
   end;
end;

procedure TFrmCadRetirada.DbLcCarteiraEnter(Sender: TObject);
begin
  inherited;
   sRegAnt := DbLcCarteira.LookupValue;
end;

procedure TFrmCadRetirada.DbLcCarteiraExit(Sender: TObject);
var iIdCartXEven : Integer;
begin
  inherited;
   if ((Not bModif) and (Trim(DbLcCarteira.Text) <> '') and (sRegAnt <> DbLcCarteira.LookupValue)) then
   begin
      CdsEvento.Filter   := '';
      CdsEvento.Filtered := False;
      CdsEvento.Data := CtrlCarteiraXEvento.ListCarteiraXEvento(CtrlCarteiraXEvento.BuscaIdCarteiraXEvento(-7, StrToInt(DbLcCarteira.LookupValue)),
                                                                StrToInt(DbLcCarteira.LookupValue),0,'S','','D','','','M');
   end;
end;

procedure TFrmCadRetirada.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   Cds.Data := CtrlHistCaixa.ListHistCaixa(-1,'D');
end;

procedure TFrmCadRetirada.CmeCadastroApplyInsert(sender: TObject;  var Accept: Boolean);
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

procedure TFrmCadRetirada.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
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

procedure TFrmCadRetirada.CmeCadastroBeforeConfirma(sender: TObject;
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

   if Trim(dblEvento.Text) = '' then
   begin
      MsgDlg('Informe o Evento.', 'Warning', mtWarning, [mbOk], 0);
      if dblEvento.CanFocus then
         dblEvento.SetFocus;
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

procedure TFrmCadRetirada.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
      Cds.Locate('IDHISTCAIXA',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmCadRetirada.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(CtrlHistCaixa);
   FreeAndNil(CtrlCarteiraXEvento);
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlParamCotaInvest);
   FreeAndNil(CtrlDiasUteis);
end;

procedure TFrmCadRetirada.ControleTela(bControl: Boolean);
begin
   LblData.Enabled := bControl;
   DbDtData.Enabled := bControl;
   LblCarteira.Enabled := bControl;
   DbLcCarteira.Enabled := bControl;
   LblEvento.Enabled := bControl;
   dblEvento.Enabled := bControl;
end;

procedure TFrmCadRetirada.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   ControleTela(False);
end;

procedure TFrmCadRetirada.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   ControleTela(True);
end;

procedure TFrmCadRetirada.dbGrdDblClick(Sender: TObject);
begin
  inherited;
   ControleTela(False);
end;

end.
