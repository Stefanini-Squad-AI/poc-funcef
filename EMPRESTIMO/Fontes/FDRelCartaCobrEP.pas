{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FDRelCartaCobrEP;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FConfigRelatorio, ppCache, ppClass, ppBands, ppProd, ppReport, ppRelatv,
   ppDB, ppDBPipe, ppDBBDE, Db, Menus, ppComm, ppEndUsr, CmEventosCadastro,
   ImgList, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti,
   Wwquery, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, StdCtrls, Buttons, Mask,
   wwdbedit, wwdblook, CMDBLookupCombo, ExtCtrls, ppPrnabl, ppCtrls,
   wwdbdatetimepicker, mContratoEmptmo;

type
   TfrmDesenhoRelCartaCobrEP = class(TFrmConfigRelatorio)
      ppLabel1: TppLabel;
      qryIDCARTACOBRANCA: TFloatField;
      qryMODELOCARTA: TStringField;
      qryIDREPORTS: TFloatField;
      qryORIGEMCM: TFloatField;
      qryFLGTIPOCARTA: TStringField;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      QryDadosIDCONTRATOEMPTMO: TFloatField;
      QryDadosNOME_TITULAR: TStringField;
      QryDadosNOME_BENEF: TStringField;
      QryDadosSIT_PART: TStringField;
      QryDadosMATRICULA: TStringField;
      QryDadosMATRICULA_TIT: TStringField;
      QryDadosINSCRICAONUMERO: TFloatField;
      QryDadosLOGRADOURO: TStringField;
      QryDadosCIDADE: TStringField;
      QryDadosCODESTADO: TStringField;
      QryDadosNUMERO: TStringField;
      QryDadosCOMPLEMENTO: TStringField;
      QryDadosBAIRRO: TStringField;
      QryDadosCEP: TStringField;
      QryDadosHMEDATAATUALIZA: TDateTimeField;
      QryDadosHMESALDODEV: TFloatField;
      QryDadosHMEPARCELA: TFloatField;
      QryDadosHMENUMPARCELAS: TFloatField;
      QryDadosTCEDESCRICAO: TStringField;
      QryDadosDEVE: TFloatField;
      QryDadosTOTAL_DEV: TFloatField;
      ppDBText4: TppDBText;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppLabel11: TppLabel;
      QryDadosDATA_CARTA: TDateTimeField;
      ppDBText13: TppDBText;
      molContratoEmptmo: TmolContratoEmptmo;
      Panel1: TPanel;
      Label3: TLabel;
      edtDataRef: TwwDBDateTimePicker;
      ToolbarSep972: TToolbarSep97;
      ToolbarSep973: TToolbarSep97;
      ToolbarSep974: TToolbarSep97;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppDBText1: TppDBText;
      ppDBText14: TppDBText;
    QryDadosIDPESSOA: TFloatField;
    QryDadosIDBENEF: TFloatField;
    QryDadosIDPATRO: TFloatField;

      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure BtnDesenhoClick(Sender: TObject);
      procedure FormShow(Sender: TObject);


   private  // Private declarations

      function VerificaPreenchimento: Boolean;

      procedure InsereQryPrincipal; override;
      procedure AbreQueryDados; override;


   public   // Public declarations

   end;



var
  frmDesenhoRelCartaCobrEP: TfrmDesenhoRelCartaCobrEP;



implementation
{$R *.DFM}
uses
   uDataBase, dBaseDados, uFuncoesEmptmo, uMensErro, uVerificaPreenchimento, uSistema, uDiasUteis;




procedure TfrmDesenhoRelCartaCobrEP.AbreQueryDados;
begin
   with qryDados do
   begin
      LimpaParametros(qryDados);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := molContratoEmptmo.IDContrato;
      ParamByName('PDATA').AsString             := FormatDateTime('dd/mm/yyyy', edtDataRef.Date);
      Open;
   end;
end;



function TfrmDesenhoRelCartaCobrEP.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try
      if molContratoEmptmo.IDContrato = -1 then
         raise EValidacao.CreateVal('É necessário indicar o Contrato!', molContratoEmptmo);

      if length(trim(edtDataRef.Text))= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Referencia!', edtDataRef);

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TfrmDesenhoRelCartaCobrEP.InsereQryPrincipal;
begin
   Qry.FieldByName('IDCARTACOBRANCA').AsFloat := LeUltRegistro(nil, 'CARTACOBRANCA');
   Qry.FieldByName('IDREPORTS').AsInteger     := LeUltRegistro(nil, 'REPORTS');
   Qry.FieldByName('ORIGEMCM').AsInteger      := 0;
   Qry.FieldByName('FLGTIPOCARTA').AsString   := 'E';
end;



procedure TfrmDesenhoRelCartaCobrEP.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      Screen.Cursor := crHourGlass;

      with qry do
      begin
         LimpaParametros(qry);
         ParamByName('PIDCARTACOBRANCA').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
         Open;
      end;

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmDesenhoRelCartaCobrEP.CmeCadastroInsert(Sender: TObject);
begin
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDCARTACOBRANCA').asInteger := -1;
      Open;
   end;

   inherited;
end;



procedure TfrmDesenhoRelCartaCobrEP.BtnDesenhoClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
{
   begin
      with qryDados do
      begin
         LimpaParametros(qryDados);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := molContratoEmptmo.IDContrato;
         ParamByName('PDATA').AsString                := FormatDateTime('dd/mm/yyyy', edtDataRef.Date);
         Open;
      end;

      if QryDados.IsEmpty then
      begin
         if MsgDlg('Não foram encontrados registros para o filtro escolhido. ' + #13 + #13 + 'Deseja prosseguir?',
                   'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
            inherited;
         end;
      end
      else
      begin
         inherited;
      end;
   end;
}
end;



procedure TfrmDesenhoRelCartaCobrEP.FormShow(Sender: TObject);
begin
   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche a data de referência
   edtDataRef.Date := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(Sysdate), DiasUteis.ExtraiMes(Sysdate));

   inherited;
end;



end.
