//******************************************************************************
// Data      : 17/05/2006
// Código    : AL_2
// Pendencia :
// SOL       :
// Motivo    : Implementação para permitir distinção do processo, permitido a alteração
//******************************************************************************
// Data      : 17/05/2006
// Código    : AL_1
// Pendencia :
// SOL       :
// Motivo    : Acerto na função "Seleciona", para identificar por codigo de classificação
//******************************************************************************
// Data      :
// Código    : AL_0
// Pendencia :
// SOL       : 
// Motivo    : Implementação
//******************************************************************************

unit FCadClassifAnbidMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInvFMD, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  DBaseDados, uMensErro, uSistema, uCMTypes, uCtrlFundos, uCtrlPadroes,
  uCmSqlParams, DBCtrls, Mask, UBibliotecaInvest, uCtrlParamInvest,
  uInvestimento, Menus, faMensagem;

type
  TFrmCadClassifAnbidMT = class(TFrmCadastroGridMTInvFMD)
    lblDtVigencia: TLabel;
    dtDtVigencia: TCMDateTimePicker;
    CMSqlParams1: TCMSqlParams;
    lblCodAnbid: TLabel;
    lblDesAnbid: TLabel;
    dbeDesAnbid: TDBEdit;
    dbrgpAnalitica: TDBRadioGroup;
    mskedCodAnbid: TMaskEdit;
    CdsParamInvest: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlFundos     : TCtrlFundos;
    CtrlParamInvest   : TCtrlParamInvest;

    //Al_1
    procedure Seleciona(dDtVigencia : TDateTime; sCodClassifAnbid : String = '');

  public
    { Public declarations }
  end;

var
  FrmCadClassifAnbidMT: TFrmCadClassifAnbidMT;
  sMask : String;

implementation

{$R *.DFM}

procedure TFrmCadClassifAnbidMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlFundos := TCtrlFundos.Create;
   CtrlParamInvest   := TCtrlParamInvest.Create;

   CtrlFundos.InitializeAs(Padroes);
   CtrlParamInvest.InitializeAs(Padroes);

   CtrlFundos.CdsClassifAnbid := cds;
   CdsParamInvest.Data := CtrlParamInvest.ListParamInvest(Investimentos.IDEmpresa);
   if CdsParamInvest.FieldByName('MASCSCLASSIFANBID').AsString = '' then
      sMask := '9.9.9.9'+';0;_'
   else
      sMask := CdsParamInvest.FieldByName('MASCSCLASSIFANBID').AsString +';0;_';
   Seleciona(Now);
end;

procedure TFrmCadClassifAnbidMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlFundos);
   FreeAndNil(CtrlParamInvest);
end;

//Al_1
procedure TFrmCadClassifAnbidMT.Seleciona(dDtVigencia : TDateTime; sCodClassifAnbid : String = '');
begin
   Cds.Data := CtrlFundos.ListClassifAnbid(dDtVigencia, sCodClassifAnbid);
   if not Cds.IsEmpty then
   begin
      dtDtVigencia.Text := DateToStr(Cds.FieldByName('DATAVIGENCIA').AsDateTime);
      Cds.FieldByName('CODCLASSIFANBID').EditMask := sMask;
   end;
end;

procedure TFrmCadClassifAnbidMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   if CmeCadastro.Operacao in [OpInserir,OpAlterar] then
   begin
      Cds.FieldByName('DATAVIGENCIA').AsDateTime  := StrToDate(dtDtVigencia.Text);
      Cds.FieldByName('CODCLASSIFANBID').AsString := Trim(uBibliotecaInvest.StrTran(mskedCodAnbid.Text,'.','',True));
   end;
   Accept := CtrlFundos.AplicaAtualClassifAnbid;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlFundos.MessageInfo,'Erro',mtError,[mbOk],0);
  inherited;
  if not Cds.IsEmpty then
  begin
     if Trim(dtDtVigencia.Text) <> '' then
        Seleciona(StrToDate(dtDtVigencia.Text))
     else
        Seleciona(Now);
  end
  else
     Seleciona(Now);
end;

procedure TFrmCadClassifAnbidMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
      Seleciona(StrToDate(MontaSelect.ValoresChave[0]))
   else
      Seleciona(Now);
end;

procedure TFrmCadClassifAnbidMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;

   dbrgpAnalitica.ItemIndex := 0;

   mskedCodAnbid.Clear;

   dtDtVigencia.Enabled := True;
   if dtDtVigencia.CanFocus then
      dtDtVigencia.SetFocus;

end;

procedure TFrmCadClassifAnbidMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := True;
   if Trim(dtDtVigencia.Text) = '' then
   begin
      MsgDlg('Data de Vigência não Informada.','Atenção' ,MtWarning,[mbok],0);
      if dtDtVigencia.CanFocus then
         dtDtVigencia.SetFocus;
      Accept := False;
   end
   else if Trim(mskedCodAnbid.Text) = '' then
   begin
      MsgDlg('Código ANBID não Informado.','Atenção' ,MtWarning,[mbok],0);
      if mskedCodAnbid.CanFocus then
         mskedCodAnbid.SetFocus;
      Accept := False;
   end
   else if Trim(dbeDesAnbid.Text) = ''then
   begin
      MsgDlg('Descrição não Informada.','Atenção' ,MtWarning,[mbok],0);
      if dbeDesAnbid.CanFocus then
         dbeDesAnbid.SetFocus;
      Accept := False;
   end;

   //Al_2
   if Cds.State = dsInsert then
   begin
      CdsAux.Data := CtrlFundos.ListClassifAnbid(StrToDate(dtDtVigencia.Text), mskedCodAnbid.Text);
      if not CdsAux.IsEmpty then
      begin
         MsgDlg('O Código ANBID informado já está cadastrado.','Atenção' ,MtWarning,[mbok],0);
         if mskedCodAnbid.CanFocus then
            mskedCodAnbid.SetFocus;
         Accept := False;
      end;
   end;
end;

procedure TFrmCadClassifAnbidMT.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
  inherited;
  if Trim(dtDtVigencia.Text) <> '' then
     Seleciona(StrToDate(dtDtVigencia.Text))
  else
     Seleciona(Now);
  dtDtVigencia.Enabled := False;
end;

procedure TFrmCadClassifAnbidMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   dtDtVigencia.Enabled := False;
   mskedCodAnbid.Text := Cds.FieldByName('CODCLASSIFANBID').AsString;
end;

procedure TFrmCadClassifAnbidMT.FormShow(Sender: TObject);
begin
  inherited;
   dtDtVigencia.Enabled   := False;
   mskedCodAnbid.EditMask := sMask;
end;

procedure TFrmCadClassifAnbidMT.sbtnApagarClick(Sender: TObject);
  var Accept: Boolean;
begin
  inherited;
   if not Cds.IsEmpty then
   begin
      if (MsgDlg('Deseja excluir todos os registros da Vigência', 'Aviso', mtWarning, [mbYes,mbNo],0) = mrYes) then
      begin
         Try
            while not Cds.Eof do
              Cds.Delete;
            Accept := True;
            CmeCadastroApplyInsert(Sender,Accept);
         except
            MsgDlg('Ocorreu um problema na exclusão.','Atenção' ,MtWarning,[mbok],0);
         end;
      end;
   end;
end;

end.
