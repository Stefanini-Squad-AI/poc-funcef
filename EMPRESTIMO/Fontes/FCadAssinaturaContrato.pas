unit FCadAssinaturaContrato;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
   DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdbdatetimepicker, wwdblook,
   mMutuario, DBCtrls;

type
   TfrmAssinaturaContrato = class(TfrmCadastroCSImob)
      Label4: TLabel;
      edtNome: TEdit;
      qryContratoPadrao: TwwQuery;
      dsContratoPadrao: TwwDataSource;
      qryContratoPadraoIDCONTRATOPADRAO: TFloatField;
      qryContratoPadraoCTPDESCRICAO: TStringField;
      qryIDPESSOA: TFloatField;
      qryIDCONTRATOPADRAO: TFloatField;
      qryACPDATAASSINAT: TDateTimeField;
      Label50: TLabel;
      edtSituacao: TEdit;
      Label3: TLabel;
      edtPlano: TEdit;
      Label5: TLabel;
      edtPatro: TEdit;
      qryDESCRICAO: TStringField;
      qryNOME_PATRO: TStringField;
      qryNOME_PLANO: TStringField;
      pnlSelecao: TPanel;
      Label1: TLabel;
      DBcboContratoPadrao: TwwDBLookupCombo;
      edtDataInicio: TwwDBDateTimePicker;
      Label2: TLabel;
      qryIDPLANOPREV: TFloatField;
      qryMaxContratoObrig: TwwQuery;
      qryMaxContratoObrigIDCONTRATOPADRAO: TFloatField;
      qryMaxContratoObrigCTPDATAINICIO: TDateTimeField;
      Label6: TLabel;
      qryOBS: TMemoField;
      qryFLGBLOQUEIO: TFloatField;
      DBMemo1: TDBMemo;
      DBchkBloqueio: TDBCheckBox;
      qryExisteAssinatura: TwwQuery;
      qryExisteAssinaturaQUANT: TFloatField;

      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure DBcboContratoPadraoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);


   private  // Private declarations

      iPlanoPrev  : Int64;

      procedure Sel(const iIdPessoa, iIdContratoPadrao: int64; dDataAssinatura : TDateTime);

      function  VerificaPreenchimento: Boolean;
      function  ExisteAssinatura: Boolean;


   public   // Public declarations

   end;



var
  frmAssinaturaContrato: TfrmAssinaturaContrato;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UModulo, uFuncoesEmptmo, dLookEmptmo,
   UVerificaPreenchimento, dMS, dEmptmo;



procedure TfrmAssinaturaContrato.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      Screen.Cursor  := crHourGlass;

      Sel(StrToInt (MontaSelect.ValoresChave[0]),
          StrToInt (MontaSelect.ValoresChave[1]),
          StrToDate(MontaSelect.ValoresChave[2])
         );

      edtNome.text := MontaSelect.ValoresChave[3];

      Screen.Cursor  := crDefault;
   end;
end;



procedure TfrmAssinaturaContrato.CmeCadastroConfirma(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;

   inherited;
end;



procedure TfrmAssinaturaContrato.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;

   if qry.State = dsInsert then
   begin
      qryIDCONTRATOPADRAO.AsInteger := StrToInt(DBcboContratoPadrao.LookupValue);
   end;

   Accept := VerificaPreenchimento;
end;



procedure TfrmAssinaturaContrato.CmeCadastroInsert(Sender: TObject);
var
   sSql : String;
begin
   sSql :=
   'SELECT '                                                   + #13 +
   '   CTP.IDCONTRATOPADRAO, CTP.CTPDESCRICAO '                + #13 +
   'FROM '                                                     + #13 +
   '   CONTRATOPADRAO  CTP, '                                  + #13 +
   '   TIPOCONTREMPTMO TCE '                                   + #13 +
   'WHERE '                                                    + #13 +
   '       TCE.IDPLANOPREV       = :PIDPLANOPREV '             + #13 +
   '   AND TCE.FLGSITUACAO       = ''A'''                      + #13 +
   '   AND CTP.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '     + #13 +
   '   AND CTP.CTPDATAINICIO     = '                           + #13 +
   '       ( '                                                 + #13 +
   '       SELECT '                                            + #13 +
   '          MAX(CTPDATAINICIO) AS CTPDATAINICIO '            + #13 +
   '       FROM '                                              + #13 +
   '          CONTRATOPADRAO '                                 + #13 +
   '       WHERE '                                             + #13 +
   '              IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '  + #13 +
   '          AND CTPDATAINICIO    <= SYSDATE '                + #13 +
   '       ) ';

   qryContratoPadrao.Close;
   qryContratoPadrao.Sql.Text := sSql;

   Sel(-1, -1, 0);

   CmeCadastro.RepetirInsert := False;

   inherited;

   edtDataInicio.Date := SysDate;

   dtmMS.MS_Solicitante.Executar;

   if dtmMS.MS_Solicitante.RetornouValor then
   begin
      qryIDPESSOA.AsInteger    := StrToInt(dtmMS.MS_Solicitante.ValoresChave[0]);
      qryIDPLANOPREV.AsInteger := StrToInt(dtmMS.MS_Solicitante.ValoresChave[12]);

      if dtmMS.MS_Solicitante.ValoresChave[13] = '' then
      begin
         edtSituacao.Text          := 'Não Participante';
         bbtnCancelar.Click;
      end
      else
         edtSituacao.Text          := dtmMS.MS_Solicitante.ValoresChave[13];

      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and
         (StrToInt(dtmMS.MS_Solicitante.ValoresChave[0]) <> StrToInt(dtmMS.MS_Solicitante.ValoresChave[1]))        and
         (dtmMS.MS_Solicitante.ValoresChave[16] = 'CA')         then
      begin
         edtSituacao.Text := 'Pensionista';
      end;

      if dtmMS.MS_Solicitante.ValoresChave[10] = '' then
         edtPlano.Text             := 'Sem Plano'
      else
         edtPlano.Text             := dtmMS.MS_Solicitante.ValoresChave[10];

      if dtmMS.MS_Solicitante.ValoresChave[9] = '' then
         edtPatro.Text                := 'Sem Patrocinadora'
      else
         edtPatro.Text                := dtmMS.MS_Solicitante.ValoresChave[9];

      iPlanoPrev  := -1;
      if dtmMS.MS_Solicitante.ValoresChave[12] <> '' then iPlanoPrev := StrToInt(dtmMS.MS_Solicitante.ValoresChave[12]);

      edtNome.Text          := dtmMS.MS_Solicitante.ValoresChave[17];

      pnlSelecao.Enabled    := (edtSituacao.Text <> 'Não Participante');

      LimpaParametros(qryContratoPadrao);
      qryContratoPadrao.ParamByName('PIDPLANOPREV').AsInteger := qryIDPLANOPREV.AsInteger;
      qryContratoPadrao.Open;

      LimpaParametros(qryMaxContratoObrig);
      qryMaxContratoObrig.ParamByName('PIDPLANOPREV').AsInteger := qryIDPLANOPREV.AsInteger;
      qryMaxContratoObrig.Open;

      DBcboContratoPadrao.LookupValue := IntToStr(qryMaxContratoObrigIDCONTRATOPADRAO.AsInteger);

      qryIDCONTRATOPADRAO.AsInteger  := qryMaxContratoObrigIDCONTRATOPADRAO.AsInteger;
      qryFLGBLOQUEIO.AsInteger       := 0;
   end;
end;



procedure TfrmAssinaturaContrato.FormActivate(Sender: TObject);
begin
   inherited;
   if qry.State = dsInsert then
   begin
      edtNome.text := dtmMS.MS_Solicitante.ValoresChave[5];

      if dtmMS.MS_Solicitante.ValoresChave[13] = '' then
         edtSituacao.Text          := 'Não Participante'
      else
         edtSituacao.Text          := dtmMS.MS_Solicitante.ValoresChave[13];

      if dtmMS.MS_Solicitante.ValoresChave[10] = '' then
         edtPlano.Text             := 'Sem Plano'
      else
         edtPlano.Text             := dtmMS.MS_Solicitante.ValoresChave[10];

      if dtmMS.MS_Solicitante.ValoresChave[9] = '' then
         edtPatro.Text                := 'Sem Patrocinadora'
      else
         edtPatro.Text                := dtmMS.MS_Solicitante.ValoresChave[9];
   end;
end;



procedure TfrmAssinaturaContrato.Sel(const iIdPessoa, iIdContratoPadrao: int64; dDataAssinatura : TDateTime);
var
   sSql : String;
begin
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDPESSOA').AsInteger          := iIdPessoa;
      ParamByName('PIDCONTRATOPADRAO').AsInteger  := iIdContratoPadrao;
      ParamByName('PACPDATAASSINAT').AsDateTime   := dDataAssinatura;
      Open;
   end;

   edtSituacao.Text := qryDESCRICAO.AsString;
   edtPatro.Text    := qryNOME_PATRO.AsString;
   edtPlano.Text    := qryNOME_PLANO.AsString;

   if iIdPessoa <> -1 then
   begin
      sSql :=
      'SELECT '                                                                             + #13 +
      '   CTP.IDCONTRATOPADRAO, CTP.CTPDESCRICAO '                                          + #13 +
      'FROM '                                                                               + #13 +
      '   CONTRATOPADRAO CTP '                                                              + #13 +
      'WHERE '                                                                              + #13 +
      '   CTP.IDCONTRATOPADRAO = ' + IntToStr(iIdContratoPadrao)                            + #13;

      qryContratoPadrao.Close;
      qryContratoPadrao.Sql.Text := sSql;
      qryContratoPadrao.Open;
   end
   else
   begin

      LimpaParametros(qryContratoPadrao);
      qryContratoPadrao.ParamByName('PIDPLANOPREV').AsInteger := qryIDPLANOPREV.AsInteger;
      qryContratoPadrao.Open;
   end;
end;



function  TfrmAssinaturaContrato.VerificaPreenchimento: boolean;
begin
   Result := False;

   try

      if edtSituacao.Text = 'Não Participante' then
         raise EValidacao.CreateVal('Solicitante não pode ter assinatura de contrato!', DBcboContratoPadrao);

      if DBcboContratoPadrao.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Contrato Padrão!', DBcboContratoPadrao);

      if qryACPDATAASSINAT.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Data da Assinatura!', edtDataInicio);

      if ExisteAssinatura then
         raise EValidacao.CreateVal('Participante já possui assinatura para o Contrato Padrão selecionado!', DBcboContratoPadrao);

   except

      on ev : EValidacao do
      begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmAssinaturaContrato.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   LimpaParametros(qryMaxContratoObrig);
   qryMaxContratoObrig.ParamByName('PIDPLANOPREV').AsInteger := qryIDPLANOPREV.AsInteger;
   qryMaxContratoObrig.Open;

   DBcboContratoPadrao.LookupValue := IntToStr(qryMaxContratoObrigIDCONTRATOPADRAO.AsInteger);
end;



procedure TfrmAssinaturaContrato.FormShow(Sender: TObject);
begin
   inherited;
   ParametrosSistema;
end;



procedure TfrmAssinaturaContrato.DBcboContratoPadraoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if ExisteAssinatura then
   begin
      MsgDlg('Participante já possui assinatura para o Contrato Padrão selecionado!', 'Empréstimo',
             mtWarning, [mbOK], 0);
      Repaint;
   end;
end;



function TfrmAssinaturaContrato.ExisteAssinatura: Boolean;
begin
   Result := True;

   with qryExisteAssinatura do
   begin
      LimpaParametros(qryExisteAssinatura);
      ParamByName('PIDPESSOA').AsInteger           := qryIDPESSOA.AsInteger;
      ParamByName('PIDCONTRATOPADRAO').AsInteger   := qryIDCONTRATOPADRAO.AsInteger;

      Open;

      if qryExisteAssinaturaQUANT.AsInteger = 0 then Result := False;

      Close;
   end;

end;



end.
