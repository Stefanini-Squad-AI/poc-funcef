{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Utilizar a procedure buscaMutuario para procurar se o usuario é
o mutuario do contrato e bloquea-lo.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : qryContratoPadrao
Data      : 13/08/2007
Autor     : Alberto Carvalho
Pendência : 26071
Descrição : alteração da query para buscar tipos de contrato que não possuem
            plano vinculado.
--------------------------------------------------------------------------------
Rotina    : Cadastro de Assinaturas
Data      : 29/08/2006
Autor     : Alberto Carvalho
Pendência : 23186
Descrição : Posicionamento do campo edtSituacao
--------------------------------------------------------------------------------
Rotina    : Cadastro de Assinaturas
Data      : 14/08/2006
Autor     : Alberto Carvalho
Pendência : 23067
Descrição : Acerto na query qryContratoPadrao
--------------------------------------------------------------------------------
Rotina    : CmeCadastroInsert(...)
Data      : 03/04/2006
Autor     : André Pontes
Pendência :
Descrição : Retirada condição de tipo de contrato "ativo" na query de lookup de
            contrato-padrão.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadAssinaturaContrato;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
   DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdbdatetimepicker, wwdblook,
   mMutuario, DBCtrls, UAutorizacao, Mask;

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
      qryIDBENEF: TFloatField;
    lblNumComprova: TLabel;
    edtNumComprova: TDBEdit;
    qryNUMCOMPROVA: TStringField;
    dsContrato: TwwDataSource;
    qryContrato: TwwQuery;
    qryContratoQUANT: TFloatField;

      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure DBcboContratoPadraoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
      procedure CmeCadastroDelete(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

   private  // Private declarations

      iPlanoPrev  : Int64;

      procedure Sel(const IDPessoa           : Extended;
                    const IDBenef            : Extended;
                    const IDContratoPadrao   : Int64;
                    const dDataAssinatura    : TDateTime
                   );

      function  VerificaPreenchimento: Boolean;
      function  ExisteAssinatura: Boolean;


   public   // Public declarations
      // Marchetti - Pendencia 22042
      iPessoa : Integer;
      // Fim Marchetti - Pendencia 22042
   end;



var
  frmAssinaturaContrato: TfrmAssinaturaContrato;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, uFuncoesEmptmo, dLookEmptmo,
   UVerificaPreenchimento, dMS, dEmptmo, FExecBuscaSolicitante, FExecSelecionaMutuario,
   uIntegraModulo;


procedure TfrmAssinaturaContrato.CmeCadastroFind(Sender: TObject);
var
iIdBenef : integer;begin
   inherited;
   // Marchetti - Pendencia 22042
   if Sistema.IdModulo = 15 then
   begin
      if MontaSelect.RetornouValor then
      begin
         Screen.Cursor  := crHourGlass;
         iIdBenef := StrToInt(MontaSelect.ValoresChave[4]);
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);


         Sel(StrToInt (MontaSelect.ValoresChave[0]),
             StrToInt (MontaSelect.ValoresChave[4]),
             StrToInt (MontaSelect.ValoresChave[1]),
             StrToDate(MontaSelect.ValoresChave[2])
            );

         edtNome.text := MontaSelect.ValoresChave[3];

         Screen.Cursor  := crDefault;
      end;
   end
   else
   begin
      Application.CreateForm(TFrmExecSelecionaMutuario, frmExecSelecionaMutuario);
      frmExecSelecionaMutuario.IdPessoa := iPessoa;
      frmExecSelecionaMutuario.ShowModal;
      if frmExecSelecionaMutuario.RetornouValor then
      begin
         Screen.Cursor  := crHourGlass;
         iIdBenef := StrToInt(MontaSelect.ValoresChave[4]);
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);


         Sel(StrToInt (frmExecSelecionaMutuario.ValoresChave[0]),
             StrToInt (frmExecSelecionaMutuario.ValoresChave[1]),
             StrToInt (frmExecSelecionaMutuario.ValoresChave[2]),
             StrToDate(frmExecSelecionaMutuario.ValoresChave[3])
            );

         edtNome.text := frmExecSelecionaMutuario.ValoresChave[4];

         Screen.Cursor  := crDefault;
      end;
      frmExecSelecionaMutuario.Free;
   end;
   // Fim Marchetti - Pendencia 22042
end;



procedure TfrmAssinaturaContrato.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   CmeCadastro.RepetirInsert := False;
end;



procedure TfrmAssinaturaContrato.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;

     if UFuncoesEmptmo.bBuscaMutuario then
      begin
         MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                           'O usuário é o próprio mutuário do '+
                           'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;


   if qry.State = dsInsert then
   begin
      qryIDCONTRATOPADRAO.AsInteger := StrToInt(DBcboContratoPadrao.LookupValue);
   end;

   Accept := VerificaPreenchimento;
end;



procedure TfrmAssinaturaContrato.CmeCadastroInsert(Sender: TObject);
var
iIdBenef : integer;
begin
   qryContratoPadrao.Close;

   Sel(-1, -1, -1, 0);

   CmeCadastro.RepetirInsert := False;

   inherited;

   edtDataInicio.Date := SysDate;

   // Marchetti - Pendencia 22042
   if Sistema.IdModulo = 15 then
   begin
      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         Application.CreateForm(TfrmExecBuscaSolicitante, frmExecBuscaSolicitante);
         frmExecBuscaSolicitante.ShowModal;

         Repaint;

         if (frmExecBuscaSolicitante.RetornouValor) and
            (frmExecBuscaSolicitante.ValoresChave[0] <> '') then
         begin
                     
            iIdBenef := StrToInt(frmExecBuscaSolicitante.ValoresChave[0]);
            UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);

            qryIDBENEF.AsInteger     := StrToInt(frmExecBuscaSolicitante.ValoresChave[0]);
            qryIDPESSOA.AsInteger    := StrToInt(frmExecBuscaSolicitante.ValoresChave[1]);
            qryIDPLANOPREV.AsInteger := StrToInt(frmExecBuscaSolicitante.ValoresChave[12]);

            if frmExecBuscaSolicitante.ValoresChave[13] = '' then
            begin
               edtSituacao.Text          := 'Não Participante';
               bbtnCancelar.Click;
            end
            else
               edtSituacao.Text          := frmExecBuscaSolicitante.ValoresChave[13];

            if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and
               (StrToInt(frmExecBuscaSolicitante.ValoresChave[0]) <> StrToInt(frmExecBuscaSolicitante.ValoresChave[1])) and
               (frmExecBuscaSolicitante.ValoresChave[16] = 'CA')         then
            begin
               edtSituacao.Text := 'Pensionista';
            end;

            if frmExecBuscaSolicitante.ValoresChave[10] = '' then
               edtPlano.Text             := 'Sem Plano'
            else
               edtPlano.Text             := frmExecBuscaSolicitante.ValoresChave[10];

            if frmExecBuscaSolicitante.ValoresChave[9] = '' then
               edtPatro.Text                := 'Sem Patrocinadora'
            else
               edtPatro.Text                := frmExecBuscaSolicitante.ValoresChave[9];

            iPlanoPrev  := -1;
            if frmExecBuscaSolicitante.ValoresChave[12] <> '' then iPlanoPrev := StrToInt(frmExecBuscaSolicitante.ValoresChave[12]);

            edtNome.Text          := frmExecBuscaSolicitante.ValoresChave[2];

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
         end;  // if (frmExecBuscaSolicitante.RetornouValor) and ...
      end
      else  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
      begin
         dtmMS.MS_Solicitante.Executar;

         if dtmMS.MS_Solicitante.RetornouValor then
         begin
            qryIDBENEF.AsInteger     := StrToInt(dtmMS.MS_Solicitante.ValoresChave[0]);
            qryIDPESSOA.AsInteger    := StrToInt(dtmMS.MS_Solicitante.ValoresChave[1]);
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
         end;  // if dtmMS.MS_Solicitante.RetornouValor
      end;  // if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1
   end
   else
   begin
      Application.CreateForm(TFrmExecSelecionaMutuario, frmExecSelecionaMutuario);
      frmExecSelecionaMutuario.IdPessoa := iPessoa;
      frmExecSelecionaMutuario.ShowModal;
      if frmExecSelecionaMutuario.RetornouValor then
      begin
         Screen.Cursor  := crHourGlass;

         IntegraModulo.iEvento := 7;

         qryIDBENEF.AsInteger     := StrToInt(frmExecSelecionaMutuario.ValoresChave[1]);
         qryIDPESSOA.AsInteger    := StrToInt(frmExecSelecionaMutuario.ValoresChave[0]);
         qryIDPLANOPREV.AsInteger := StrToInt(frmExecSelecionaMutuario.ValoresChave[6]);

         if frmExecSelecionaMutuario.ValoresChave[7] = '' then
         begin
            edtSituacao.Text          := 'Não Participante';
            bbtnCancelar.Click;
         end
         else
            edtSituacao.Text          := frmExecSelecionaMutuario.ValoresChave[7];

         if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and
            (StrToInt(frmExecSelecionaMutuario.ValoresChave[0]) <> StrToInt(frmExecSelecionaMutuario.ValoresChave[1])) and
            (frmExecSelecionaMutuario.ValoresChave[7] = 'CA')         then
         begin
            edtSituacao.Text := 'Pensionista';
         end;

         if frmExecSelecionaMutuario.ValoresChave[9] = '' then
            edtPlano.Text             := 'Sem Plano'
         else
            edtPlano.Text             := frmExecSelecionaMutuario.ValoresChave[9];

         if frmExecSelecionaMutuario.ValoresChave[8] = '' then
            edtPatro.Text                := 'Sem Patrocinadora'
         else
            edtPatro.Text                := frmExecSelecionaMutuario.ValoresChave[8];

         iPlanoPrev  := -1;
         if frmExecSelecionaMutuario.ValoresChave[6] <> '' then iPlanoPrev := StrToInt(frmExecSelecionaMutuario.ValoresChave[6]);

         edtNome.Text          := frmExecSelecionaMutuario.ValoresChave[4];

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
         Screen.Cursor  := crDefault;
      end;
      frmExecSelecionaMutuario.Free;
   end;
   // Fim hetti - Pendencia 22042
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



procedure TfrmAssinaturaContrato.Sel(const IDPessoa           : Extended;
                                     const IDBenef            : Extended;
                                     const IDContratoPadrao   : Int64;
                                     const dDataAssinatura    : TDateTime
                                    );
var
   sSQL : String;
begin
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDPESSOA').AsFloat             := IDPessoa;
      ParamByName('PIDBENEF').AsFloat              := IDBenef;
      ParamByName('PIDCONTRATOPADRAO').AsInteger   := IDContratoPadrao;
      ParamByName('PACPDATAASSINAT').AsDateTime    := dDataAssinatura;
      Open;
   end;

   edtSituacao.Text := qryDESCRICAO.AsString;
   edtPatro.Text    := qryNOME_PATRO.AsString;
   edtPlano.Text    := qryNOME_PLANO.AsString;

   //Pendência 27300 - 28/01/2008
   edtNumComprova.Visible := (trim(qryNUMCOMPROVA.AsString) <> '');
   lblNumComprova.Visible := edtNumComprova.Visible;
   //Fim Pendência 27300

   if IDPessoa <> -1 then
   begin
      sSQL :=
      'SELECT '                                                   + #13 +
      '   CTP.IDCONTRATOPADRAO, CTP.CTPDESCRICAO '                + #13 +
      'FROM '                                                     + #13 +
      '   CONTRATOPADRAO CTP '                                    + #13 +
      'WHERE '                                                    + #13 +
      '   CTP.IDCONTRATOPADRAO = ' + IntToStr(IDContratoPadrao)   + #13;

      qryContratoPadrao.Close;
      qryContratoPadrao.SQL.Text := sSQL;
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

      if (ExisteAssinatura) and (qry.State = dsInsert) then
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


//Pendência 27300 - 28/01/2008
procedure TfrmAssinaturaContrato.CmeCadastroDelete(Sender: TObject);
begin

   with qryContrato do
   begin
      LimpaParametros(qryContrato);
      ParamByName('PIDPESSOA').AsInteger           := qryIDPESSOA.AsInteger;
      ParamByName('PIDBENEF').AsInteger            := qryIDBENEF.AsInteger;
      ParamByName('PIDCONTRATOPADRAO').AsInteger   := qryIDCONTRATOPADRAO.AsInteger;
      ParamByName('PACPDATAASSINAT').AsDateTime    := qryACPDATAASSINAT.AsDateTime;

      Open;

      if qryContratoQUANT.AsInteger > 0 then
      begin
		   MsgDlg('Exclusão cancelada. Existem concessões cadastradas após data de assinatura do contrato padrão.', 'Empréstimo', mtWarning, [mbOk], 0);
         Close;
			Repaint;
         exit;
      end
      else
      begin
         Close;
         edtNome.Clear;
         edtSituacao.Clear;
         edtPlano.Clear;
         edtPatro.Clear;
         edtNumComprova.Visible := false;
         lblNumComprova.Visible := edtNumComprova.Visible;
      end;

    end;

   inherited;

end;
//Fim Pendência 27300


procedure TfrmAssinaturaContrato.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   Autorizacao.AutorizarForm(self, afNormal);

   CmeCadastro.AtualizaBotoes(Sender); //Pendência 27300 - 29/01/2008
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
      ParamByName('PIDBENEF').AsInteger            := qryIDBENEF.AsInteger;
      ParamByName('PIDCONTRATOPADRAO').AsInteger   := qryIDCONTRATOPADRAO.AsInteger;

      Open;

      if qryExisteAssinaturaQUANT.AsInteger = 0 then Result := False;

      Close;
   end;

end;



procedure TfrmAssinaturaContrato.bbtnConfirmarClick(Sender: TObject);
begin
   IntegraModulo.iEvento := 7;
   inherited;
end;


procedure TfrmAssinaturaContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   UFuncoesEmptmo.bBuscaMutuario := false;
end;

end.



