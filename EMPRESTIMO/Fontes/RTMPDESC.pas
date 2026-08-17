{
 Data       : 07.08.2015
 Sol        : 148922/8841
 PPM        : 1628565
 Autor      : Jonas Otavio
 Rotina     : Botão Ajuda
 Descrição  : Confeccionar documentação do módulo de Empréstimo
------------------------------------------------------------------------------- }

unit RTMPDESC;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, Mask, wwdbedit, Wwdbspin,
   mContratoEmptmo, fcButton, fcImgBtn, fcShapeBtn, Grids, Wwdbigrd,
   Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, mMutuario, DBCtrls;

type
   TfrmRelTMPDESC = class(TfrmWizardMTEP)
      GroupBox1: TGroupBox;
      chkFolhaPatro: TCheckBox;
      chkFolhaBenef: TCheckBox;
      Panel3: TPanel;
      chkCobranca: TCheckBox;
      DBspnAnoCobranca: TwwDBSpinEdit;
      cboMesCobranca: TComboBox;
      Panel5: TPanel;
      Label4: TLabel;
      chkReferencia: TCheckBox;
      DBspnAnoReferencia: TwwDBSpinEdit;
      cboMesReferencia: TComboBox;
      Label1: TLabel;
      molContratoEmptmo: TmolContratoEmptmo;
      Image1: TImage;
      pnlBaca: TPanel;
      btnAltera: TfcShapeBtn;
      btnNovo: TfcShapeBtn;
      btnExcluir: TfcShapeBtn;
      qryTmpDesc: TwwQuery;
      Panel4: TPanel;
      DBgrdHistMov: TwwDBGrid;
      dtsTMPDESC: TwwDataSource;
      rdgSitEnvio: TRadioGroup;
      rdgOrdenacao: TRadioGroup;
      qryTmpDescIDMODULO: TFloatField;
      qryTmpDescIDDESCONTO: TFloatField;
      qryTmpDescORDEM: TFloatField;
      qryTmpDescMESCOBRANCA: TStringField;
      qryTmpDescMESREFERENCIA: TStringField;
      qryTmpDescIDEMPRESAPROP: TFloatField;
      qryTmpDescIDPESSOA: TFloatField;
      qryTmpDescFLGTIPODESC: TStringField;
      qryTmpDescIDTITULAR: TFloatField;
      qryTmpDescDATARECEBIMENTO: TDateTimeField;
      qryTmpDescIDPESSJUR: TFloatField;
      qryTmpDescIDPROVENTO: TFloatField;
      qryTmpDescIDPLANOPREV: TFloatField;
      qryTmpDescMATRICULA: TStringField;
      qryTmpDescINSCRICAONUMERO: TFloatField;
      qryTmpDescCODPROVDESC: TStringField;
      qryTmpDescFLGDESCFOLHA: TStringField;
      qryTmpDescDATAREFERENCIA: TDateTimeField;
      qryTmpDescREFERENCIA: TStringField;
      qryTmpDescFLGATRASODEVOL: TStringField;
      qryTmpDescDATACOBRANCA: TDateTimeField;
      qryTmpDescIDLOTE: TFloatField;
      qryTmpDescTRGDTINCLUSAO: TDateTimeField;
      qryTmpDescTRGUSERINCLUSAO: TStringField;
      qryTmpDescLOTEPREVIA: TFloatField;
      qryTmpDescVALORINFO: TFloatField;
      qryTmpDescNOME: TStringField;
      qryTmpDescFLGSITUACAO: TStringField;
      qryTmpDescIDTIPOCONTREMPTMO: TFloatField;
      qryTmpDescVALOR: TFloatField;
      qryTmpDescVALORRECEBIDO: TFloatField;
      qryTmpDescSITENVIO: TStringField;
      qryTmpDescIDTMPDESC: TFloatField;
      qryTmpDescIDHISTMOVEMPTMO: TFloatField;
      qryTmpDescNUMSITENVIO: TStringField;
      qryTmpDescPARCELA: TFloatField;
      qryTmpDescNUMPARCELAS: TFloatField;
      qryTmpDescPARC: TStringField;

      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure btnAlteraClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
    procedure bbtnAjudaClick(Sender: TObject);


   private  // Private declarations

      function VerificaPreenchimento: Boolean;

      function AbreTMPDESC: Boolean;


   public   // Public declarations

   end;



var
  frmRelTMPDESC: TfrmRelTMPDESC;



implementation
{$R *.DFM}
uses
   FCadTMPDESC, uFuncoesEmptmo, FCadHistMovEmptmo, uSistema, uVerificaPreenchimento, uMensErro,
  DIntegraEmptmo;




function TfrmRelTMPDESC.VerificaPreenchimento: Boolean;
begin
	Result := False;
   try
      if molContratoEmptmo.IDContrato <= 0 then
         raise EValidacao.CreateVal('É necessário indicar o Contrato!', molContratoEmptmo);

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



function TfrmRelTMPDESC.AbreTMPDESC: Boolean;
var
   sTipoFolha  : String;
   iTipoFolha  : integer;
begin
   Result := True;
   // ----------------------------------------------------------------------------------------------
   // Filtro por tipo de Folha (Benefícios / Patrocinadora)

   sTipoFolha := '';

   if chkFolhaPatro.Checked then
   begin
      if chkFolhaBenef.Checked then
      begin
         sTipoFolha := QuotedStr('B') + ',' + QuotedStr('P');
         iTipoFolha := -1;
      end
      else
      begin
         sTipoFolha := QuotedStr('P');
         iTipoFolha := 1;
      end;
   end
   else
   begin
      if chkFolhaBenef.Checked then sTipoFolha := QuotedStr('B');
      iTipoFolha := 2;
   end;

   // ----------------------------------------------------------------------------------------------

   MostraEspera('Selecionando...');

   try
      try
         with qryTmpDesc do
         begin
            LimpaParametros(qryTmpDesc);

            if molContratoEmptmo.IDContrato > 0 then
               ParamByName('PIDDESCONTO').AsFloat     := molContratoEmptmo.IDContrato;

            if chkReferencia.Checked then
               ParamByName('PMESREFERENCIA').AsString := FormatFloat('0000', DBspnAnoReferencia.Value) + '/' +
                                                         FormatFloat('00', cboMesReferencia.ItemIndex + 1);

            if chkCobranca.Checked then
               ParamByName('PMESCOBRANCA').AsString   := FormatFloat('0000', DBspnAnoCobranca.Value) + '/' +
                                                         FormatFloat('00', cboMesCobranca.ItemIndex + 1);

            if iTipoFolha > 0 then
               ParamByName('PFLGDESCFOLHA').AsInteger := iTipoFolha;

            ParamByName('PSITENVIO').AsInteger        := rdgSitEnvio.ItemIndex;
            ParamByName('PORDENACAO').AsInteger       := rdgOrdenacao.ItemIndex;

            qryTmpDesc.Open;

            EscondeEspera;
         end; // with qryTmpDesc
      except;
         Raise;
         Repaint;
         Result := False;
      end;
   finally
      EscondeEspera;
   end;
end;



procedure TfrmRelTMPDESC.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TfrmRelTMPDESC.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TfrmRelTMPDESC.btnContinuarClick(Sender: TObject);
begin
   if VerificaPreenchimento then if AbreTMPDESC then inherited;
end;



procedure TfrmRelTMPDESC.btnAlteraClick(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TfrmCadTMPDESC, frmCadTMPDESC);

   try
      frmCadTMPDESC.qry.Close;
      frmCadTMPDESC.qry.ParamByName('PIDTMPDESC').AsInteger    := qryTmpDescIDTMPDESC.AsInteger;

      frmCadTMPDESC.qry.Open;

      frmCadTMPDESC.ShowModal;

   finally
      frmCadTMPDESC.Release;

      qryTmpDesc.Close;
      qryTmpDesc.Open;
   end;
end;



procedure TfrmRelTMPDESC.FormShow(Sender: TObject);
begin
   inherited;

   cboMesReferencia.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAnoReferencia.Value   := DiasUteis.ExtraiAno(Date);

   cboMesCobranca.ItemIndex   := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAnoCobranca.Value     := DiasUteis.ExtraiAno(Date);
end;



procedure TfrmRelTMPDESC.btnExcluirClick(Sender: TObject);
var
   IDTmpDesc : Extended;
begin
   IDTmpDesc := qryTmpDescIDTMPDESC.AsFloat;

   try
      with dtmIntegraEmptmo.qryLimpaIDTmpDescPorTmp do
      begin
         LimpaParametros(dtmIntegraEmptmo.qryLimpaIDTmpDescPorTmp);
         ParamByName('PIDTMPDESC').AsFloat := IDTmpDesc;
         ExecSQL;
      end;

      with dtmIntegraEmptmo.qryDeleteTMPDESCporTmp do
      begin
         LimpaParametros(dtmIntegraEmptmo.qryDeleteTMPDESCporTmp);
         ParamByName('PIDTMPDESC').AsFloat := IDTmpDesc;
         ExecSQL;
      end;

   finally
      qryTmpDesc.Close;
      qryTmpDesc.Open;
   end;
end;



procedure TfrmRelTMPDESC.bbtnAjudaClick(Sender: TObject);
begin
  inherited;
  //SOL 148922/8841 - Jonas
  if  (Sistema.IdModulo        = 15)  then
      begin
           Application.HelpContext(230030)
      end;
end;

end.
