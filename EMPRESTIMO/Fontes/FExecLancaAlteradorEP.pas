unit FExecLancaAlteradorEP;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendência :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 20/05/2005
Autor     : André Pontes
Pendência : 17565
Descrição : Rotinas de integração financeira chamando os métodos multicamadas
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, Db, Wwdatsrc, StdCtrls, wwdbdatetimepicker,
   CMDateTimePicker, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
   Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, DBTables, Wwquery,
   Grids, Wwdbigrd, Wwdbgrid, TEdNum, wwdblook, TREdit,
   dbclient, Provider,

   uCMTypes, uCmControlObject, uCmDbObject, ucmClientDataSet,

   uCtrlDocumento, uCtrlPadroes,

   uTypesEmptmo;


type
   TfrmExecLancaAlteradorEP = class(TfrmWizardMTEP)
      Label5: TLabel;
      Label29: TLabel;
      Label21: TLabel;
      Label43: TLabel;
      Label12: TLabel;
      Label17: TLabel;
      Label38: TLabel;
      Label39: TLabel;
      Label3: TLabel;
      Label1: TLabel;
      Label4: TLabel;
      Label6: TLabel;
      Label22: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Label11: TLabel;
      Label10: TLabel;
      DBedtFormaPagto: TDBEdit;
      DBedtNumContrato: TDBEdit;
      btnBuscaContrato: TBitBtn;
      DBedtJuros: TDBEdit;
      DBedtDataInsc: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      DBedtValSolic: TDBEdit;
      DBedtValorParcela: TDBEdit;
      DBedtParcelas: TDBEdit;
      DBedtDataPrimParcela: TCMDateTimePicker;
      DBedtPatro: TDBEdit;
      DBedtPlanoPrev: TDBEdit;
      DBedtSitPart: TDBEdit;
      DBedtBeneficiario: TDBEdit;
      grpTitular: TGroupBox;
      Label9: TLabel;
      Label16: TLabel;
      Label18: TLabel;
      DBedtMtrEmpresa: TDBEdit;
      DBedtCPF: TDBEdit;
      DBedtInscricao: TDBEdit;
      DBedtParticipante: TDBEdit;
      DBEdit1: TDBEdit;
      DBEdit2: TDBEdit;
      DBedtTipoEmptmo: TDBEdit;
      DBEdit3: TDBEdit;
      dts: TwwDataSource;
      qryHistMov: TwwQuery;
      wwDBGrid1: TwwDBGrid;
      dsHistMov: TDataSource;
      qryHistMovCODDOCUMENTO: TFloatField;
      qryHistMovNODOCUMENTO: TFloatField;
      qryHistMovDATAEMISSAO: TDateTimeField;
      qryHistMovDATAVENCTO: TDateTimeField;
      qryHistMovVALOR_DOC: TFloatField;
      DBcboAlterador: TwwDBLookupCombo;
      Label2: TLabel;
      Label13: TLabel;
      edtDataLancamento: TCMDateTimePicker;
      Label14: TLabel;
      edtValor: TRealEdit;

      Label15: TLabel;

      procedure btnBuscaContratoClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure wwDBGrid1TopRowChanged(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);


   private  // Private declarations

   public   // Public declarations

   end;



var
  frmExecLancaAlteradorEP: TfrmExecLancaAlteradorEP;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo,
   DLookEmptmo,
   dEmptmo,
   dMS,
   uIntegraBack,
   uSistema,
   uMensErro,
   uModulo;





procedure TfrmExecLancaAlteradorEP.btnBuscaContratoClick(Sender: TObject);
begin
   inherited;

   ParametrosSistema;
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      if dtmMS.MS_ContratoEmptmo.Text <> '' then dtmMS.MS_ContratoEmptmo.Cancela;
   end;

   dtmMS.MS_ContratoEmptmo.Executar;
   Repaint;

   if dtmMS.MS_ContratoEmptmo.RetornouValor then
   begin
      Screen.Cursor := crHourGlass;
      with dtmEmptmo.qryDadosContrato do
      begin
         LimpaParametros(dtmEmptmo.qryDadosContrato);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat := StrToFloat(dtmMS.MS_ContratoEmptmo.ValoresChave[0]);
         Open;
      end;

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmExecLancaAlteradorEP.bbtnConfirmarClick(Sender: TObject);
var
   fDiferenca        : Currency;

   iNumLancto        : Integer;
   iPlanilha         : Integer;

   sDataLancamento   : String;

   iDocumento        : Int64;
   iAlterador        : Int64;

   CtrlDocumento     : TCtrlDocumento;
begin
   // ----------------------------------------------------------------------------------------------

   // Valor ZERO baixa o documento
   if edtValor.Value = 0 then
   begin
      if MsgDlg('O valor não foi preenchido ou está ZERADO. ' + #13 +
                'Isso acarretará baixa do Documento selecionado. ' + #13 + #13 +
                'Deseja REALMENTE prosseguir? ',
                'Empréstimo', mtWarning, [mbYes, mbNo], 0) = mrNo then
      begin
         Repaint;
         Exit;
      end;
   end;
   Repaint;

   // ----------------------------------------------------------------------------------------------

   // Double-check
   if MsgDlg('Deseja realmente alterar o valor do documento para ' +
             Modulo.sMoedaCorrente + ' ' + FormatFloat('#,#0.00', edtValor.Value) + ' ?',
             'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
   begin
      Repaint;
      Exit;
   end;
   Repaint;

   // ----------------------------------------------------------------------------------------------

   try
      try
         fDiferenca      := qryHistMovVALOR_DOC.AsCurrency - edtValor.Value;

         iDocumento      := qryHistMovCODDOCUMENTO.AsInteger;
         iPlanilha       := 0;
         iAlterador      := dtmLookEmptmo.qryLookAlteradorCODALTERADOR.AsInteger;
         sDataLancamento := FormatDateTime('dd/mm/yyyy', edtDataLancamento.Date);

         // ----------------------------------------------------------------------------------------
         // André Pontes - 20/05/2005 - pendência 17565
         // ----------------------------------------------------------------------------------------

         CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);

         // ----------------------------------------------------------------------------------------

         CtrlDocumento.Lanctodocum.SetValues(edtDataLancamento.Date, // dDataLancto
                                             iDocumento,             // liCodDocumento
                                             0,                      // liNumLancto
                                             fDiferenca,             // rVlrLiquido
                                             0,                      // rValorOM
                                             fDiferenca,             // rValor
                                             -1,                     // liUnidNegoc
                                             iPlanilha,              // liPlnCodigo
                                             0,                      // liNumlotemanual,
                                             Sistema.IDusuario,      // liIdusuarioinclusao,
                                             Sistema.IDEmpresa,      // liIdempresa,
                                             0,                      // liIdnflivro,
                                             0,                      // liEstorno,
                                             0,                      // liCodtipdoc,
                                             0,                      // liCoddocinss,
                                             iAlterador,             // liCodalterador
                                             '4',                    // sOperacao,
                                             '',                     // sNumrecibo,
                                             '',                     // sNumnf,
                                             '',                     // sNumfatura,
                                             '',                     // sHistoricocompl,
                                             '',                     // sFlgtipofatura,
                                             '',                     // sFlgrecebeunf,
                                             '',                     // sFlgfatemitida,
                                             'C',                    // DebCre
                                             15,                     // liIdModulo
                                             IntegraBack.Plano,      // liPlanoConta
                                             True                    // bUsaPlanoPatro
                                            );

         // ----------------------------------------------------------------------------------------

         if not(CtrlDocumento.Insert) then
         begin
            Exception.Create(CtrlDocumento.MessageInfo);
         end;

         // ----------------------------------------------------------------------------------------
         // FIM André Pontes - 20/05/2005 - pendência 17565
         // ----------------------------------------------------------------------------------------

      except
         Raise;
         Repaint;

         MsgDlg('Ocorreu um ERRO ao tentar lançar o Alterador!' + #13 +
                'Operação não efetuada.', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
      end;

      MsgDlg('Operação efetuada.', 'Empréstimo', mtInformation, [mbOk], 0);
      Repaint;

   finally
      inherited;
   end;
end;



procedure TfrmExecLancaAlteradorEP.wwDBGrid1CalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end
         else
         begin
            ABrush.Color := clWhite;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecLancaAlteradorEP.wwDBGrid1TopRowChanged(Sender: TObject);
begin
   inherited;
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecLancaAlteradorEP.btnContinuarClick(Sender: TObject);
begin
   edtDataLancamento.Date := SysDate;

   LimpaParametros(qryHistMov);
   qryHistMov.ParamByName('PIDCONTRATOEMPTMO').AsFloat := StrToFloat(dtmMS.MS_ContratoEmptmo.ValoresChave[0]);
   qryHistMov.Open;

   with dtmLookEmptmo.qryLookAlterador do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookAlterador);
      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.idEmpresa;
      ParamByName('PACRESDECRES').AsString      := 'C';
      ParamByName('PRECPAG').AsString           := 'R';
      Open;
   end;

   inherited;
end;



end.
