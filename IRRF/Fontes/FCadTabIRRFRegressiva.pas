unit FCadTabIRRFRegressiva;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 28/09/2006
Autor     : André Pontes
Pendência : 18950
Descrição : Criação do form
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
   uCtrlIRRFPF,
   {$IFDEF VERSAO0505} uComum, {$ELSE} uCMTypes, TREdit,
   wwdbdatetimepicker, CMDateTimePicker, Mask, DBCtrls {$ENDIF};


type
   TfrmCadTabIRRFRegressiva = class(TFrmCadastroMT)
      lblDtIniVid: TLabel;
      DBedtDataVigencia: TCMDateTimePicker;
      lblFaixaIni: TLabel;
      lblAliq: TLabel;
      CdsIDIRRF: TFloatField;
      cdsDATAVIGENCIA: TDateTimeField;
      cdsPRAZOACUM: TFloatField;
      CdsALIQUOTA: TFloatField;
      DBedtAliquota: TDBEdit;
      DBedtPrazoAcum: TDBEdit;

      procedure FormCreate(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);


   private  // Private declarations

      CtrlIRRF: TCtrlIRRFPF;

      function  VerificaPreenchimento: Boolean;


   public   // Public declarations


   end;



var
  frmCadTabIRRFRegressiva: TfrmCadTabIRRFRegressiva;



implementation
{$R *.DFM}
uses
   dBaseDados, uDatabase, uSistema, uVerificaPreenchimento, uMensErro;



procedure TfrmCadTabIRRFRegressiva.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlIRRF := TCtrlIRRFPF.Create;
   CtrlIRRF.Initialize(dtmBaseDados.dbBaseDados,
                       True,
                       Sistema.ConnectionType,
                       Sistema.ConnectionSide,
                       Sistema.AppRemoteServer,
                       True,
                       nil,
                       nil,
                       False
                      );

   cds.Data := CtrlIRRF.ProcuraIRRFRegressiva(-1);
   CtrlIRRF.CdsIRRFRegressiva := cds;
end;



function TfrmCadTabIRRFRegressiva.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try
      // -------------------------------------------------------------------------------------------

      if (length(trim(DBedtDataVigencia.Text)) = 0) or (cdsDATAVIGENCIA.isNULL) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Início de Vigência!', DBedtDataVigencia);

      // -------------------------------------------------------------------------------------------

      if (length(trim(DBedtPrazoAcum.Text)) = 0) or (cdsPRAZOACUM.isNULL) or (cdsPRAZOACUM.AsFloat <= 0) then
         raise EValidacao.CreateVal('É necessário indicar o Prazo de Acumulação!', DBedtPrazoAcum);

      // -------------------------------------------------------------------------------------------

      if (length(trim(DBedtAliquota.Text)) = 0) or (cdsALIQUOTA.isNULL) or (cdsALIQUOTA.AsFloat <= 0) then
         raise EValidacao.CreateVal('É necessário indicar a Alíquota do IR!', DBedtAliquota);

      // -------------------------------------------------------------------------------------------

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Folha de Benefícios', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TfrmCadTabIRRFRegressiva.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      cds.Data := CtrlIRRF.ProcuraIRRFRegressiva(StrToInt(MontaSelect.ValoresChave[0]));
      CtrlIRRF.CdsIRRFRegressiva := cds;
   end;
end;



procedure TfrmCadTabIRRFRegressiva.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;



procedure TfrmCadTabIRRFRegressiva.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;

   if not(CtrlIRRF.GravaTabIRRegressiva) then
   begin
      MsgDlg(CtrlIRRF.MessageInfo, 'IFFR', mtError, [mbOk], 0);
      Repaint;
   end;
   Repaint;
end;



procedure TfrmCadTabIRRFRegressiva.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   if DBedtDataVigencia.CanFocus then DBedtDataVigencia.SetFocus;
end;



procedure TfrmCadTabIRRFRegressiva.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   if DBedtDataVigencia.CanFocus then DBedtDataVigencia.SetFocus;
end;



procedure TfrmCadTabIRRFRegressiva.CmeCadastroDelete(Sender: TObject);
begin
   if MsgDlg('Deseja realmente EXCLUIR a faixa de IR selecionada?', 'IRRF',
             mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;
      inherited;
   end;
   Repaint;
end;



end.

