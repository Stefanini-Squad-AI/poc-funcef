unit FCadTipoContratoEmptmo;

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------------------------
SIG..........: 27879
Data.........: 29/08/2015
Responsável..: William Moreira da Silva
Descrição....: Cadastro da regra de taxa de juros de correção monetária (.dfm)
--------------------------------------------------------------------------------------------------
SIG..........: 27207
Data.........: 11/08/2015
Responsável..: Andre Imakawa
Descrição....: Ao inserir uma nova modalidade e os parâmetros o sistema exibe o erro "Falta vírgula"
Alteração....: Alterado o objeto upd na propriedade InsertSQL, removido espaço entre dois pontos e o
               campo FLGOBRIGANUMPROTOCOLO.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 172525 KINTANA 1553886
Responsável : Monica Gonzaga
Data        : 09/04/2012
Descrição   : Criado um novo campo "PNUMPROTOCOLO", para gravar o valor no NUP. 
--------------------------------------------------------------------------------------------------
Rotina    : Resultado MontaSelect e Tela
Data      : 19/08/2011
Autor     : Otacilio Aquino
SOL       : 163410
Kintana   : 1396257
Descrição : Exibir o código da modalidade de empréstimo na tela
---------------------------------------------------------------------------------------------------
Rotina    : qry e upd
Data      : 16/04/2008
Autor     : Alberto
Pendência : 27749
Descrição : Inclusão da coluna FLGNAOVERIFICAMRGPCL e seus respectivos
            TFloatField e TDBCheckBox na aba Tratamentos
---------------------------------------------------------------------------------------------------
Rotina    : qry e upd
Data      : 16/04/2008
Autor     : Alberto
Pendência : 27232
Descrição : Inclusão das colunas FLGVERIFICAITEMABERTO e seus respectivos
            TFloatField e TDBCheckBox na aba Tratamentos
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : -
Data      : 25/09/2007
Autor     : Marchetti
Pendencia : 26402
Descrição : Criados mais 3 parâmetros de regra em Outros Processos:
            Regra de margem alternativa
            Regra de Margem de Avalista
            Regra de Elegibilidade de Avalista
--------------------------------------------------------------------------------
Rotina    : -
Data      : 28/09/2005
Autor     : André Pontes
Pendencia : -
Descrição : DBchkPermiteParcela teve texto alterado ("PRIMEIRA parcela") e passa
            a ser visível apenas para FUNCEF
--------------------------------------------------------------------------------
Rotina    : -
Data      : 21/09/2004
Autor     : Marchetti
Pendencia : 17456
Descrição : Colocação do campo IDCARTEIRASPC
--------------------------------------------------------------------------------
Rotina    : -
Data      : 21/09/2004
Autor     : Marchetti
Pendencia : 17545
Descrição : Colocação dos campos para valores máximos de inscriçào e contratos
            por participante
--------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     : André Pontes
Descrição : Redesenho do form, em função da necessidade de "encaixar" mais
            regras
--------------------------------------------------------------------------------
Rotina    : -
Data      : 22/11/2002
Autor     : André Pontes
Descrição : Mudança no caption do chkBox de Seguro.
            Obs.: Esse flg passa a indicar quais tipos de contrato comportam
                  quitação por morte.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

interface

uses
   {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
   DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, DBCtrls, ComCtrls,
   wwdblook, mRegraDB, fcLabel, wwdbedit, Wwdbspin;

type
   TfrmCadTipoContratoEmptmo = class(TfrmCadastroCSImob)
      pgcParametros: TPageControl;
      tbsConcessao: TTabSheet;
      tbsRegraCalc: TTabSheet;
      tbsImpressao: TTabSheet;
      lblRelatorio2: TfcLabel;
      lblRelatorio1: TfcLabel;
      lblRelatorio: TfcLabel;
      Label66: TLabel;
      DBcboRelatorio: TwwDBLookupCombo;
      tbsRegraControle: TTabSheet;
      molRegraDB4: TmolRegraDB;
      molRegraDB7: TmolRegraDB;
      tbsTratamento: TTabSheet;
      molRegraDB10: TmolRegraDB;
      pnlTopo: TPanel;
      Label1: TLabel;
      DBedtDescricao: TDBEdit;
      Label2: TLabel;
      DBcboEmprest: TwwDBLookupCombo;
      dbrgSituacao: TDBRadioGroup;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryIDTIPOEMPTMO: TFloatField;
      qryTCEDESCRICAO: TStringField;
      qryIDREGRAJURCONC: TFloatField;
      qryIDREGRALIMITES: TFloatField;
      qryIDREGRASUSPCOBR: TFloatField;
      qryIDREGRASLDDIA: TFloatField;
      qryIDREGRAJURANTCONC: TFloatField;
      qryIDREGRAELEG: TFloatField;
      qryIDREGRARESERVA: TFloatField;
      qryIDREGRAMARGEM: TFloatField;
      qryIDREGRAPRAZOSCONC: TFloatField;
      qryIDREPORTS: TFloatField;
      qryORIGEMCM: TFloatField;
      qryFLGSITUACAO: TStringField;
      qryFLGSUSPENSAO: TStringField;
      qryFLGSEGURO: TStringField;
      qryTCEMAXCONTRATO: TFloatField;
      qryTCEMAXINSCR: TFloatField;
      qryTCEMAXPARC: TFloatField;
      qryTCEMINPARC: TFloatField;
      qryTCEMINQUIT: TFloatField;
      qryTCETRATAPARCATRAS: TStringField;
      qryTCETRATAPARCPARC: TStringField;
      qryNOMEREGRAJURCONC: TStringField;
      qryNOMEREGRALIMITES: TStringField;
      qryNOMEREGRASUSPCOBR: TStringField;
      qryNOMEREGRAVLRQUIT: TStringField;
      qryNOMEREGRASLDDIA: TStringField;
      qryNOMEREGRAJURANTCONC: TStringField;
      qryNOMEREGRAELEG: TStringField;
      qryNOMEREGRARESERVA: TStringField;
      qryNOMEREGRAMARGEM: TStringField;
      qryNOMEREGRAPRAZOSCONC: TStringField;
      GroupBox3: TGroupBox;
      Label4: TLabel;
      Label5: TLabel;
      Label8: TLabel;
      DBspeMinParcelas: TwwDBSpinEdit;
      DBspeMaxParcelas: TwwDBSpinEdit;
      DBMinRenova: TwwDBSpinEdit;
      DBRadioGroup1: TDBRadioGroup;
      DBRadioGroup4: TDBRadioGroup;
      DBCheckBox1: TDBCheckBox;
      qryFLGSUSPENSAOAUTO: TFloatField;
      qryFLGOBRIGBENEF: TFloatField;
      qryIDREGRASALBAS: TFloatField;
      qryNOMEREGRASALBASE: TStringField;
      molRegraDB5: TmolRegraDB;
      molRegraDB6: TmolRegraDB;
      molRegraLimiteValorConc: TmolRegraDB;
      molRegraDB1: TmolRegraDB;
      qryMOECODIGO: TFloatField;
      qryFLGCONCESSAOZERO: TFloatField;
      dbcboMoeda: TwwDBLookupCombo;
      Label3: TLabel;
      Label9: TLabel;
      DBMinQuitacao: TwwDBSpinEdit;
      qryTCEMINRENOVA: TFloatField;
      qryIDREGRADATACRED: TFloatField;
      qryNOMEREGRADATACRED: TStringField;
      molRegraDB3: TmolRegraDB;
      qryFLGUSOINTERNET: TFloatField;
      molRegraDB8: TmolRegraDB;
      qryIDREGRAQUITADO: TFloatField;
      qryNOMEREGRAQUITADO: TStringField;
      GroupBox1: TGroupBox;
      Label10: TLabel;
      dbspnMaxMesDeb: TwwDBSpinEdit;
      chkCobrJudic: TDBCheckBox;
      qryFLGCOBRJUDIC: TFloatField;
      qryTCEMAXMESDEB: TFloatField;
      molRegraDB9: TmolRegraDB;
      qryIDREGRAVLRMAX: TFloatField;
      qryNOMEREGRAVLRMAX: TStringField;
      molRegraDB11: TmolRegraDB;
      qryIDREGRAPRAZOMAX: TFloatField;
      qryNOMEREGRAPRAZOMAX: TStringField;
      qryNUMPARCDESCONTO: TFloatField;
      Label12: TLabel;
      DBcboPlano: TwwDBLookupCombo;
      qryIDPLANOPREV: TFloatField;
      GroupBox4: TGroupBox;
      DBCheckBox5: TDBCheckBox;
      DBCheckBox6: TDBCheckBox;
      Label14: TLabel;
      wwDBSpinEdit2: TwwDBSpinEdit;
      qryTCENUMPARCSIM: TFloatField;
      Bevel1: TBevel;
      Bevel2: TBevel;
      tbsFlags: TTabSheet;
      DBchkSeguro: TDBCheckBox;
      DBCheckBox2: TDBCheckBox;
      DBCheckBox3: TDBCheckBox;
      DBCheckBox4: TDBCheckBox;
      DBCheckBox7: TDBCheckBox;
      DBchkPermiteParcela: TDBCheckBox;
      lblPermiteParcela: TLabel;
      qryFLGPERMITEPARCELA: TFloatField;
      qryFLGNAOREFINANCIA: TFloatField;
      molRegraDB12: TmolRegraDB;
      qryIDREGRAPRIMPARC: TFloatField;
      qryNOMEREGRAPRIMPARC: TStringField;
      qryIDCARTEIRASPC: TFloatField;
      dsCarteiraSPC: TDataSource;
      qryCarteiraSPC: TwwQuery;
      qryCarteiraSPCDESCARTEIRASPC: TStringField;
      qryCarteiraSPCIDCARTEIRASPC: TFloatField;
      qryCarteiraSPCCODSEGMENTO: TFloatField;
      qryCarteiraSPCCODTIPOCART: TStringField;
      GroupBox6: TGroupBox;
      molRegraDB2: TmolRegraDB;
      molRegraDB13: TmolRegraDB;
      DBEdit1: TDBEdit;
      DBEdit2: TDBEdit;
      Label17: TLabel;
      Regra: TLabel;
      qryTCELEGENDACALC: TStringField;
      qryTCELEGENDAEXIBE: TStringField;
      qryIDREGRAJUREXIBE: TFloatField;
      qryNOMEREGRAJUREXIBE: TStringField;
      GroupBox2: TGroupBox;
      Label6: TLabel;
      Label7: TLabel;
      DBspeNumCtr: TwwDBSpinEdit;
      DBspeMaxInscricao: TwwDBSpinEdit;
      Label15: TLabel;
      wwDBLookupCombo1: TwwDBLookupCombo;
      Label16: TLabel;
      GroupBox5: TGroupBox;
      Label11: TLabel;
      wwDBSpinEdit1: TwwDBSpinEdit;
      DBCheckBox10: TDBCheckBox;
      DBCheckBox9: TDBCheckBox;
      qryFLGENVIAPARCMES: TFloatField;
      qryIDPROVENTOVLMAX: TFloatField;
      tbsOutros: TTabSheet;
      grpRubricas: TGroupBox;
      Label13: TLabel;
      DBcboRubVlMax: TwwDBLookupCombo;
      edtRubVlMax: TEdit;
      btnLimpaRubN: TBitBtn;
      edtProvDescVlMax: TEdit;
      qryIDPROVENTOVLDEV: TFloatField;
      Label18: TLabel;
      DBcboRubVlDev: TwwDBLookupCombo;
      edtRubVlDev: TEdit;
      BitBtn1: TBitBtn;
      edtProvDescVlDev: TEdit;
      DBCheckBox11: TDBCheckBox;
      qryFLGOBRIGACONCZERO: TFloatField;
      qryFLGUSOCENTRAL: TFloatField;
      qryFLGVERPRAZOTIPOQUIT: TFloatField;
      cbChkVerPrazo: TDBCheckBox;
      qryFLGFORMAPAG: TStringField;
      qryFLGFORMAREC: TStringField;
      DBRadioGroup2: TDBRadioGroup;
      DBRadioGroup3: TDBRadioGroup;
      Label19: TLabel;
      Bevel3: TBevel;
    btnLimpaFormaPag: TBitBtn;
    btnLimpaFormaRec: TBitBtn;
    Label20: TLabel;
    rdgVerificaContrato: TDBRadioGroup;
    qryFLGVERIFICACONTRATO: TFloatField;
    qryFLGUSOAUTOEMP: TFloatField;
    molRegraDB14: TmolRegraDB;
    molRegraDB15: TmolRegraDB;
    molRegraDB16: TmolRegraDB;
    qryIDREGRAMARGEMALT: TFloatField;
    qryIDREGRAMARGEMAVAL: TFloatField;
    qryIDREGRAELEGAVAL: TFloatField;
    qryNOMEREGRAMARGELALT: TStringField;
    qryNOMEREGRAMARGEMAVAL: TStringField;
    qryNOMEREGRAELEGAVAL: TStringField;
    qryIDREGRAVENCPARC: TFloatField;
    qryNOMEREGRAVENCPARC: TStringField;
    molRegraDB17: TmolRegraDB;
    GroupBox7: TGroupBox;
    chkEmprestimo: TDBCheckBox;
    chkAutoAtend: TDBCheckBox;
    chkAutoEmp: TDBCheckBox;
    chkCentral: TDBCheckBox;
    qryFLGUSOEMPTMO: TFloatField;
    qryFLGEXCLUIALT: TFloatField;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    qryFLGNAOVERIFICAMRGPCL: TFloatField;
    qryFLGVERIFICAITEMABERTO: TFloatField;
    Label21: TLabel;
    lblCodigoContrato: TLabel;
    qryFLGOBRIGANUMPROTOCOLO: TFloatField;//Monica - SOL172525
    //William Moreira da Silva - SIG 27879
    molREGRATXCORRMONET: TmolRegraDB;
    qryIDREGRATXCORRMONET: TFloatField;
    qryNOMEREGRATXCORRMONET: TStringField; 
    //William Moreira da Silva - SIG 27879

      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);

      procedure DBcboEmprestCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure FormShow(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure DBcboRubVlMaxChange(Sender: TObject);
      procedure DBcboRubVlDevChange(Sender: TObject);
    procedure btnLimpaFormaPagClick(Sender: TObject);
    procedure btnLimpaFormaRecClick(Sender: TObject);

   private  // Private declarations

      procedure Sel(const iTipoContrato, iTipoEmptmo: int64);

      procedure PreencheDefaults;
      procedure PreencheDefaultsTipoEmptmo;
      function VerificaPreenchimento: boolean;

      procedure AbreQueries;


   public   // Public declarations


  end;



var
  frmCadTipoContratoEmptmo: TfrmCadTipoContratoEmptmo;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UModulo, uFuncoesEmptmo, dLookEmptmo,
   UVerificaPreenchimento, dEmptmo;



procedure TfrmCadTipoContratoEmptmo.Sel(const iTipoContrato, iTipoEmptmo: int64);
begin
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := iTipoContrato;
      ParamByName('PIDTIPOEMPTMO').AsInteger       := iTipoEmptmo;
      Open;
   end;

   if qryIDPROVENTOVLMAX.IsNull then
   begin
      edtRubVlMax.Clear;
      edtProvDescVlMax.Clear;
   end;

   if qryIDPROVENTOVLDEV.IsNull then
   begin
      edtRubVlDev.Clear;
      edtProvDescVlDev.Clear;
   end;
end;



procedure TfrmCadTipoContratoEmptmo.PreencheDefaults;
begin
   if qry.State in dsEditModes then
   begin

      if qryFLGOBRIGANUMPROTOCOLO.IsNull then qryFLGOBRIGANUMPROTOCOLO.AsInteger := 0;       // MONICA - SOL 172525
      if qryFLGSITUACAO.IsNull       then qryFLGSITUACAO.AsString       := 'A';
      if qryFLGSEGURO.IsNull         then qryFLGSEGURO.AsString         := 'T';
      if qryTCETRATAPARCATRAS.IsNull then qryTCETRATAPARCATRAS.AsString := 'T';
      if qryTCETRATAPARCPARC.IsNull  then qryTCETRATAPARCPARC.AsString  := 'R';
      if qryFLGSUSPENSAO.IsNull      then qryFLGSUSPENSAO.AsInteger     := 0;
      if qryFLGSUSPENSAOAUTO.IsNull  then qryFLGSUSPENSAOAUTO.AsInteger := 0;
      if qryFLGOBRIGBENEF.IsNull     then qryFLGOBRIGBENEF.AsInteger    := 0;
      if qryFLGCONCESSAOZERO.IsNull  then qryFLGCONCESSAOZERO.AsInteger := 0;
      if qryFLGUSOINTERNET.IsNull    then qryFLGUSOINTERNET.AsInteger   := 0;

      // Início Pendencia - 23052 - Marcoa Topini - 10/08/2006
      if qryFLGOBRIGACONCZERO.IsNull then qryFLGOBRIGACONCZERO.AsInteger := 0;
      if qryFLGUSOCENTRAL.IsNull     then qryFLGUSOCENTRAL.AsInteger     := 0;

      if qryFLGVERPRAZOTIPOQUIT.IsNull then qryFLGVERPRAZOTIPOQUIT.AsInteger := 0;

      // Marchetti - Pendencia 23066
      if qryFLGFORMAPAG.IsNull then qryFLGFORMAPAG.AsString := dtmEmptmo.qryParamEmptmoFLGFORMAPAG.AsString;
      if qryFLGFORMAREC.IsNull then qryFLGFORMAREC.AsString := dtmEmptmo.qryParamEmptmoFLGFORMAREC.AsString;

      // Marchetti - Pendencia 23407
      if qryFLGVERIFICACONTRATO.IsNull then qryFLGVERIFICACONTRATO.AsInteger := 2;

      if qryFLGUSOEMPTMO.IsNull        then qryFLGUSOEMPTMO.AsInteger := 1;
   end;
end;



procedure TfrmCadTipoContratoEmptmo.PreencheDefaultsTipoEmptmo;
var
   iRegraEleg     : Int64;
   iRegraReserva  : Int64;
   iRegraMargem   : Int64;
   iMaxContrato   : Integer;
   iMaxInscr      : Integer;
   iMinParc       : Integer;
   iMaxArc        : Integer;
   iMinQuit       : Integer;
   iMinRenova     : Integer;
begin
   if qry.State in dsEditModes then
   begin
      // pega os valores default na tabela de Tipos de Empréstimo
      iRegraEleg     := dtmLookEmptmo.qryLookTipoEmptmoIDREGRAELEG.AsInteger;
      iRegraReserva  := dtmLookEmptmo.qryLookTipoEmptmoIDREGRARESERVA.AsInteger;
      iRegraMargem   := dtmLookEmptmo.qryLookTipoEmptmoIDREGRAMARGEM.AsInteger;

      iMaxContrato   := dtmLookEmptmo.qryLookTipoEmptmoTEPMAXCONTRATO.AsInteger;
      iMaxInscr      := dtmLookEmptmo.qryLookTipoEmptmoTEPMAXINSCR.AsInteger;
      iMinParc       := dtmLookEmptmo.qryLookTipoEmptmoTEPMINPARC.AsInteger;
      iMaxArc        := dtmLookEmptmo.qryLookTipoEmptmoTEPMAXPARC.AsInteger;
      iMinQuit       := dtmLookEmptmo.qryLookTipoEmptmoTEPMINQUIT.AsInteger;
      iMinRenova     := dtmLookEmptmo.qryLookTipoEmptmoTEPMINRENOVA.AsInteger;

      // atribui ao Tipo de Contrato os valores default da tabela de Tipos de Empréstimo
      if ( (qryIDREGRAELEG.IsNull)    and (iRegraEleg > 0) )      then qryIDREGRAELEG.AsInteger    := iRegraEleg;
      if ( (qryIDREGRARESERVA.IsNull) and (iRegraReserva > 0) )   then qryIDREGRARESERVA.AsInteger := iRegraReserva;
      if ( (qryIDREGRAMARGEM.IsNull)  and (iRegraMargem > 0 ) )   then qryIDREGRAMARGEM.AsInteger  := iRegraMargem;

      if qryTCEMAXCONTRATO.IsNull      then qryTCEMAXCONTRATO.AsInteger      := iMaxContrato;
      if qryTCEMAXINSCR.IsNull         then qryTCEMAXINSCR.AsInteger         := iMaxInscr;
      if qryTCEMINPARC.IsNull          then qryTCEMINPARC.AsInteger          := iMinParc;
      if qryTCEMAXPARC.IsNull          then qryTCEMAXPARC.AsInteger          := iMaxArc;
      if qryTCEMINQUIT.IsNull          then qryTCEMINQUIT.AsInteger          := iMinQuit;
      if qryTCEMINRENOVA.IsNull        then qryTCEMINRENOVA.AsInteger        := iMinRenova;
      if qryFLGOBRIGBENEF.IsNull       then qryFLGOBRIGBENEF.AsInteger       := 0;
      if qryFLGCONCESSAOZERO.IsNull    then qryFLGCONCESSAOZERO.AsInteger    := 0;
      if qryFLGUSOINTERNET.IsNull      then qryFLGUSOINTERNET.AsInteger      := 0;
      if qryFLGVERPRAZOTIPOQUIT.IsNull then qryFLGVERPRAZOTIPOQUIT.AsInteger := 0;
      if qryFLGOBRIGANUMPROTOCOLO.IsNull then qryFLGOBRIGANUMPROTOCOLO.AsInteger := 0;  //Moncia - SOL172525

      // Marchetti - Pendencia 23407
      if qryFLGVERIFICACONTRATO.IsNull then qryFLGVERIFICACONTRATO.AsInteger := 2;
   end;
end;



function TfrmCadTipoContratoEmptmo.VerificaPreenchimento: boolean;
begin
	Result := False;

	try
      if qryTCEDESCRICAO.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Descrição do Tipo de Contrato!', DBedtDescricao);

      if qryMOECODIGO.isNULL then
         raise EValidacao.CreateVal('É necessário indicar o Indexador Padrão!', DBcboMoeda);

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



procedure TfrmCadTipoContratoEmptmo.CmeCadastroConfirma(Sender: TObject);
begin
   try
      if (qry.State = dsInsert) then qryIDTIPOCONTREMPTMO.asInteger := LeUltRegistro(nil, 'TIPOCONTREMPTMO');

      inherited;

   except;
      Raise;
      Repaint;
   end;
end;



procedure TfrmCadTipoContratoEmptmo.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;

   // habilita o painel de fundo (que contém o PageControl - orelhas)
   pnlFundo.Enabled := True;

   pnlTopo.Enabled            := False;
   tbsConcessao.Enabled       := False;
   tbsRegraControle.Enabled   := False;
   tbsRegraCalc.Enabled       := False;
   tbsTratamento.Enabled      := False;
   tbsImpressao.Enabled       := False;

   if CmeCadastro.Operacao in [opInserir, opAlterar] then
   begin
      pnlTopo.Enabled            := True;
      tbsConcessao.Enabled       := True;
      tbsRegraControle.Enabled   := True;
      tbsRegraCalc.Enabled       := True;
      tbsTratamento.Enabled      := True;
      tbsImpressao.Enabled       := True;
   end;
end;



procedure TfrmCadTipoContratoEmptmo.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;

   if Accept then
   begin
      case CmeCadastro.Operacao of
         opInserir:  Accept := Sistema.GravaLogOperacoes('Cadastro de Tipo de Contrato de Empréstimo. Inserção.');
         opAlterar:  Accept := Sistema.GravaLogOperacoes('Cadastro de Tipo de Contrato de Empréstimo. Alteração.');
         opApagar:   Accept := Sistema.GravaLogOperacoes('Cadastro de Tipo de Contrato de Empréstimo. Exclusão.');
      end;
   end;

   //William Moreira da Silva - SIG
   //if not(Accept) then Raise Exception.Create('Falha na gravação do Log da operação.');
   if not(Accept) then Exit;
   //William Moreira da Silva - SIG
end;



procedure TfrmCadTipoContratoEmptmo.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   PreencheDefaults;

   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadTipoContratoEmptmo.CmeCadastroInsert(Sender: TObject);
begin
   AbreQueries;

   Sel(-1, -1);

   inherited;

   PreencheDefaults;

   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadTipoContratoEmptmo.DBcboEmprestCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   PreencheDefaultsTipoEmptmo;
end;



procedure TfrmCadTipoContratoEmptmo.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   DBchkPermiteParcela.Visible   := (Sistema.TipoCliente = 19991);
   lblPermiteParcela.Visible     := (Sistema.TipoCliente = 19991);

   pgcParametros.ActivePage := tbsConcessao;

   // Adiciona o filtro por EmpresaProp ao MontaSelect
   MontaSelect.Filtro.Add('( TE.IDEMPRESAPROP = ' + IntToStr(Sistema.IDEmpresa) + ' )');
end;



procedure TfrmCadTipoContratoEmptmo.AbreQueries;
begin
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   dtmLookEmptmo.qryLookPlanPrev.Open;

   with dtmLookEmptmo.qryLookReports do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookReports);
      ParamByName('PIDMODULO').AsInteger := Sistema.IDModulo;
      ParamByName('PORIGEMCM').AsInteger := 0;
      Open;
   end;

   dtmLookEmptmo.qryLookMoeda.Open;

   dtmLookEmptmo.qryLookRubricaInforma.Close;
   dtmLookEmptmo.qryLookRubricaInforma.Open;

   qryCarteiraSPC.Open;
end;



procedure TfrmCadTipoContratoEmptmo.CmeCadastroFind(Sender: TObject);
var
   iTipoContrato, iTipoEmptmo : int64;
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      iTipoContrato  := StrToInt(MontaSelect.ValoresChave[0]);
      iTipoEmptmo    := StrToInt(MontaSelect.ValoresChave[1]);

      // SOL 163410 Kintana 1396257 - Otacilio Aquino
      lblCodigoContrato.Caption := MontaSelect.ValoresChave[0];

      Screen.Cursor  := crHourGlass;

      AbreQueries;

      Sel(iTipoContrato, iTipoEmptmo);

      Screen.Cursor  := crDefault;
   end;
end;



procedure TfrmCadTipoContratoEmptmo.DBcboRubVlMaxChange(Sender: TObject);
begin
   inherited;

   edtRubVlMax.Clear;
   edtProvDescVlMax.Clear;

   if DBcboRubVlMax.LookupValue <> '' then
   begin
      edtRubVlMax.Text      := DBcboRubVlMax.LookupValue;
      edtProvDescVlMax.Text := DBcboRubVlMax.LookupTable.FieldByName('CODPROVDESC').AsString;
   end;
end;



procedure TfrmCadTipoContratoEmptmo.DBcboRubVlDevChange(Sender: TObject);
begin
  inherited;
   edtRubVlDev.Clear;
   edtProvDescVlDev.Clear;

   if DBcboRubVlDev.LookupValue <> '' then
   begin
      edtRubVlDev.Text      := DBcboRubVlDev.LookupValue;
      edtProvDescVlDev.Text := DBcboRubVlDev.LookupTable.FieldByName('CODPROVDESC').AsString;
   end;
end;



procedure TfrmCadTipoContratoEmptmo.btnLimpaFormaPagClick(Sender: TObject);
begin
   inherited;
   qryFLGFORMAPAG.Clear;
end;



procedure TfrmCadTipoContratoEmptmo.btnLimpaFormaRecClick(Sender: TObject);
begin
   inherited;
   qryFLGFORMAREC.Clear;
end;

end.
