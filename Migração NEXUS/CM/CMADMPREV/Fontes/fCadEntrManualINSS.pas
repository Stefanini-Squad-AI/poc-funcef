unit fCadEntrManualINSS;

// Alterações:
{

//--------------------------------------------------------------------------------------------------
Autor     : Darivaldo Alencar
Data      : 26/08/2019
Rotina    : QryDetConc.SQL
SIG       : 90818
Descrição : Excluir não enxerga processo sem IDPESSOA.
--------------------------------------------------------------------------------------------------
Autor     : Fanuel Junior
Data      : 24/09/2010
Rotina    : Confirmar
Pendencia : SOL 144314 Kintana 951122
Descrição : Validação do campo edtCodSinonimo que passou a ser obrigatório.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 131786 KINTANA 753272
Responsável : BRUNO AZEVEDO
Data        : 03/03/2010
Descrição   : Somente salvar o campo DIB (Nas tabelas TEMPCONCINSS e DETCONCINSS)
              NULL ou com data válida.
--------------------------------------------------------------------------------------------------
// Autor(a)       :  Renato Visoni
// Data           :  25/02/2010
// Pendência      :  SOL 123118 Kintana 612606
// Descricao      :  Ajuste na rotina para inserir o campo CODSINONIMO,DTINICIOCRED,DTFIMCRED na
//                   DetConcInss e TempConcInss.
//--------------------------------------------------------------------------------------------------
Autor     : Ádler Souza
Data      : 27/11/2009
Rotina    : Confirmar
Pendencia : SOL 127802 Kintana 679703
Descrição : Inclusão de COMMIT e ROLLBACK no final do processo.
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Data      : 04/04/2007
Rotina    : VerificaPreenchimento, btnExcluiDetConcClick(...),
Pendencia : 22253
Descrição : Não permitir alteração em algum mês fechado, ie, cuja ConcINSS tenha os campos de
            documento CaP ou documento CaR preenchidos
            Criado DataModule dtmReembolsoINSS para centralizar funções e consultas
            Criada funcão VerificaConcINSS(...) no dtmReembolsoINSS
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Data      : 04/04/2007
Rotina    : VerificaPreenchimento
Pendencia : -
Descrição : Uniformização do código de acorco com a uVerificaPreenchimento;
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Data      : 16/01/2007
Rotina    : -
Pendencia : 22787
Descrição : Permitir exclusão de registros incluídos manualmente
            Criado PageControl separando "tela" de inclusão da "tela" de exclusão. Criadas duas
            grids, uma listando a DetConc e a outra a TempConc, para ter certeza de qual tabela se
            deseja excluir.
----------------------------------------------------------------------------------------------------
Autor     : Augusto
Data      : 03/08/2005
Rotina    :
Pendencia : 19894
Descrição : Permitir não informar Plano Previdenciário
----------------------------------------------------------------------------------------------------
Autor     : Augusto
Data      : 12/05/2005
Rotina    :
Pendencia : 19171
Descrição : Novo parametro com Plano Previdenciario
----------------------------------------------------------------------------------------------------
Autor     : Augusto
Data      : 11/01/2005
Rotina    :
Pendencia : 18450
Descrição : Caso não identificados, Informar o Identificador Beneficios
----------------------------------------------------------------------------------------------------
// FDias - 19.11.2004 - pendência 18140 - habilitar combo de benefícios
----------------------------------------------------------------------------------------------------
Autor     : Camille
Data      : 20.10.2004
Rotina    : qryLookEntidadeContabil
Pendencia : 17578
Descrição : Filtrar planos ativos
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdblook, CMDBLookupCombo, Spin, TREdit, ComCtrls, Mask, wwdbedit,
  Wwdbspin, uVerificaPreenchimento,
  {$IFNDEF VER0505} uCMTypes, {$ENDIF}
  CMDateTimePicker, wwdbdatetimepicker;

type
  TTipoTabela = (ttBenef, ttDetConc, ttTempConc);

  TfrmCadEntrManualINSS = class(TfrmCadastroCS)
    qryRubricaXINSS: TwwQuery;
    qryLookMantenedora: TwwQuery;
    qryBenefbfciario: TwwQuery;
    qryInsertTempConc: TwwQuery;
    qryInsertDetConc: TwwQuery;
    qryDIB: TwwQuery;
    qryBenefbfciarioIDPESSOA: TFloatField;
    qryBenefbfciarioIDPLANOPREV: TFloatField;
    qryBenefbfciarioIDBENEFICIO: TFloatField;
    qryBenefbfciarioNOME_PARTICIPANTE: TStringField;
    qryBenefbfciarioNOME_BENEFICIO: TStringField;
    qryBenefbfciarioMATRICULA: TStringField;
    qryBenefbfciarioDATAINICIOINSS: TDateTimeField;
    qryBenefbfciarioCODBENEFICIO: TStringField;
    qryLookMantenedoraCODMANTENEDORA: TStringField;
    qryLookMantenedoraNOME: TStringField;
    qryLookMantenedoraFLGFUNDACAO: TFloatField;
    qryLookMantenedoraIDPLANOPREV: TFloatField;
    qrySequencial: TwwQuery;
    qrySequencialSEQUENCIAL: TFloatField;
    qryRubricaXINSSIDRUBRICA: TFloatField;
    qryRubricaXINSSRUBRICAINSS: TFloatField;
    qryRubricaXINSSFLGRUBCENTRAL: TFloatField;
    qryRubricaXINSSCODPROVDESC: TStringField;
    qryRubricaXINSSDESCRPROVDESC: TStringField;
    qryRubricaXINSSDESCRICAO: TStringField;
    qryLookEntidadeContabil: TwwQuery;
    qryLookEntidadeContabilIDPLANOPREV: TFloatField;
    qryLookEntidadeContabilNOME: TStringField;
    qryLookEntidadeContabilCODORCAMENTO: TStringField;
    qryLookEntidadeContabilSIGLAORCAMENTO: TStringField;
    qryLookEntidadeContabilCODSPC: TStringField;
    qryBenefbfciarioPLAN_PREV_CONTABIL: TStringField;
    qryDIBMATRICULA: TStringField;
    qryDIBIDPESSOA: TFloatField;
    qryDIBNOME: TStringField;
    qryDIBCODMANTENEDORA: TStringField;
    qryDIBDIB: TDateTimeField;
    qryDIBIDBENEFICIO: TFloatField;
    qryDIBIDPLANOPREV: TFloatField;
    qryDIBNOME_MANTENEDORA: TStringField;
    qryDIBPLAN_PREV_CONTABIL: TStringField;
    qryDIBCODBENEFICIO: TStringField;
    qryDIBNOME_BENEFICIO: TStringField;
    qryEntidadeContabil: TwwQuery;
    qryEntidadeContabilIDPARAM: TFloatField;
    qryLookBeneficio: TwwQuery;
    qryLookBeneficioIDBENEFICIO: TFloatField;
    qryLookBeneficioCODBENEFICIO: TStringField;
    qryLookBeneficioNOME: TStringField;
    qryBenefbfciarioNOMEPLANOPREV: TStringField;
    qryBenefbfciarioIDPLANPREVCONTAB: TFloatField;
    qryDIBIDPLANOPREVPREV: TFloatField;
    qryDIBNOMEPLANOPREV: TStringField;
    qryLookPLANO: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    pgcFundo: TPageControl;
    tbsInsert: TTabSheet;
    tbsDelete: TTabSheet;
    Label4: TLabel;
    Label7: TLabel;
    lblMes: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    rdgIdentificado: TRadioGroup;
    EdBeneficio: TEdit;
    edtNumProcINSS: TEdit;
    memObs: TRichEdit;
    cboMesCobranca: TComboBox;
    DBspnAnoReferencia: TwwDBSpinEdit;
    cboMesReferencia: TComboBox;
    DBspnAnoCobranca: TwwDBSpinEdit;
    edtValor: TDBRealEdit;
    edtRubricaINSS: TEdit;
    edtNome: TEdit;
    lblBeneficio: TStaticText;
    edtDIB: TCMDateTimePicker;
    edtMatricula: TEdit;
    edtRMREAJ: TDBRealEdit;
    edtAPREAJ: TDBRealEdit;
    lblRubrica: TStaticText;
    lblIDRubrica: TStaticText;
    rdgEntradaManual: TRadioGroup;
    DBcboBeneficio: TwwDBLookupCombo;
    DBcboMantenedor: TwwDBLookupCombo;
    DBcboEntidadeContabil: TwwDBLookupCombo;
    LkcPlanoPrevidenciario: TwwDBLookupCombo;
    Panel2: TPanel;
    DBgrdTempConc: TwwDBGrid;
    Panel1: TPanel;
    edtNumProcessoBusca: TEdit;
    Label3: TLabel;
    btnProcurar: TBitBtn;
    btnExcluiDetConc: TBitBtn;
    btnExcluiTempConc: TBitBtn;
    qryDeleteTempConc: TwwQuery;
    qryDeleteDetConc: TwwQuery;
    qryTempConc: TwwQuery;
    qryDetConc: TwwQuery;
    DBgrdDetConc: TwwDBGrid;
    dtsTempConc: TwwDataSource;
    dtsDetConc: TwwDataSource;
    qryDetConcIDPESSOA: TFloatField;
    qryDetConcMESREFERENCIA: TStringField;
    qryDetConcMESCOBRANCA: TStringField;
    qryDetConcNUMPROCINSS: TStringField;
    qryDetConcDIB: TDateTimeField;
    qryDetConcIDRUBRICA: TFloatField;
    qryDetConcVALORINSS: TFloatField;
    qryDetConcRMREAJ: TFloatField;
    qryDetConcAPREAJ: TFloatField;
    qryDetConcFLGMANUAL: TFloatField;
    qryDetConcFLGTRATADO: TFloatField;
    qryDetConcESPECIE: TStringField;
    qryDetConcOBSERVACAO: TStringField;
    qryDetConcCODCONCESSORINSS: TStringField;
    qryDetConcCODMANTENEDORINSS: TStringField;
    qryDetConcRUBRICAINSS: TFloatField;
    qryDetConcNOME: TStringField;
    qryDetConcCODPROVDESC: TStringField;
    qryTempConcNUMPROCINSS: TStringField;
    qryTempConcNOME: TStringField;
    qryTempConcCODRUBRICA1: TFloatField;
    qryTempConcVLRRUBRICA1: TFloatField;
    qryTempConcMESPROCESSAMENTO: TStringField;
    qryTempConcMESREFERENCIA: TStringField;
    qryTempConcESPECIE: TStringField;
    qryTempConcMATRICULA: TStringField;
    qryTempConcRMREAJ: TFloatField;
    qryTempConcAPREAJ: TFloatField;
    qryTempConcOBS: TStringField;
    qryTempConcFLGMANUAL: TFloatField;
    edtCodSinonimo: TEdit;
    Label17: TLabel;
    qryTempConcCODSINONIMO: TFloatField;
    qryTempConcDTINICIOCRED: TDateTimeField;
    qryTempConcDTFIMCRED: TDateTimeField;
    qryDetConcCODSINONIMO: TFloatField;
    qryDetConcDTINICIOCRED: TDateTimeField;
    qryDetConcDTFIMCRED: TDateTimeField;

    procedure FormShow(Sender: TObject);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure edtRubricaINSSExit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure edtNumProcINSSExit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure rdgIdentificadoExit(Sender: TObject);
    procedure rdgIdentificadoClick(Sender: TObject);
    procedure DBcboBeneficioChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnExcluiDetConcClick(Sender: TObject);
    procedure btnExcluiTempConcClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


   private  // Private declarations

      TipoTabela        : TTipoTabela;

      IDPessoa          : Extended;
      IDRubrica         : Extended;

      function  VerificaPreenchimento: Boolean;

      procedure Sel(const ID: Extended);

      procedure LimpaCampos;
      procedure PreencheCampos;

      function  PegaSequencial: Integer;

      procedure TratarParametro(qryParam, sNmParam: string); //SIG90818

   public   // Public declarations


   end;



var
  frmCadEntrManualINSS: TfrmCadEntrManualINSS;



implementation
{$R *.DFM}
uses
   uDatabase, uSistema, uDiasUteis, uMensErro, uAdmPrev, dReembolsoINSS;




function  TfrmCadEntrManualINSS.VerificaPreenchimento: Boolean;
var
  sAnoMesCobranca : string;
begin
  Result := False;

  sAnoMesCobranca := FormatFloat('0000', DBspnAnoCobranca.Value) + '/' + FormatFloat('00', cboMesCobranca.ItemIndex + 1);

  try
    // ---------------------------------------------------------------------------------------------

    if length(trim(edtRubricaINSS.Text)) = 0 then
      raise EValidacao.CreateVal('É necessário indicar a Rubrica do INSS!', edtRubricaINSS);

    if cboMesCobranca.ItemIndex < 0 then
      raise EValidacao.CreateVal('É necessário indicar o Mês de Cobrança!', cboMesCobranca);

    if cboMesReferencia.ItemIndex < 0 then
      raise EValidacao.CreateVal('É necessário indicar o Mês de Referência!', cboMesReferencia);

    if edtValor.Value <= 0 then
      raise EValidacao.CreateVal('É necessário indicar o Valor!', edtValor);

    if not(dtmReembolsoINSS.VerificaConcINSS(sAnoMesCobranca)) then
      raise EValidacao.CreateVal('Não é possível inserir registros em meses fechados!', cboMesCobranca);

    if edtCodSinonimo.Text = '' then
      raise EValidacao.CreateVal('É necessário indicar o Código Sinônimo!', edtCodSinonimo);


    // ---------------------------------------------------------------------------------------------

  except
    on ev : EValidacao do
    begin
      Screen.Cursor := crDefault;
      if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;




procedure TfrmCadEntrManualINSS.Sel(const ID: Extended);
begin
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDPESSOA').AsFloat := ID;
      Open;
   end;
end;




procedure TfrmCadEntrManualINSS.LimpaCampos;
begin
   edtDIB.Clear;
   edtNome.Clear;
   edtMatricula.Clear;

   DBcboEntidadeContabil.LookupValue  := '';
   DBcboEntidadeContabil.Text         := '';

   LkcPlanoPrevidenciario.LookupValue := '';
   LkcPlanoPrevidenciario.Text        := '';

   DBcboBeneficio.LookupValue         := '';
   DBcboBeneficio.Text                := '';

   lblBeneficio.Caption               := '';

   DBcboMantenedor.LookupValue        := '';
   DBcboMantenedor.Text               := '';

   edtRubricaINSS.Clear;
   lblIDRubrica.Caption               := '';
   lblRubrica.Caption                 := '';

   cboMesCobranca.ItemIndex           := -1;
   DBspnAnoCobranca.Value             := DiasUteis.ExtraiAno(Date);

   cboMesReferencia.ItemIndex         := -1;
   DBspnAnoReferencia.Value           := DiasUteis.ExtraiAno(Date);

   edtValor.Value                     := 0;
   edtRMREAJ.Value                    := 0;
   edtAPREAJ.Value                    := 0;

   EdBeneficio.Text                   := ''; { Augusto 11/01/2005 }

   memObs.Lines.Clear;
   edtCodSinonimo.Text               :=''; //Renato Visoni SOL 123118 Kintana 612606
end;



procedure TfrmCadEntrManualINSS.PreencheCampos;
var
   sPlano  : String;
   IDParam : Integer;
begin
   IDParam  := 0;
   IDPessoa := 0;
   sPlano   := '';

   LimpaCampos;

   case TipoTabela of

      ttBenef:
      begin
         IDPessoa                            := qryBenefbfciarioIDPESSOA.AsFloat;

         edtDIB.Date                         := qryBenefbfciarioDATAINICIOINSS.AsDateTime;

         edtNome.Text                        := qryBenefbfciarioNOME_PARTICIPANTE.AsString;
         edtMatricula.Text                   := qryBenefbfciarioMATRICULA.AsString;

         DBcboBeneficio.LookupValue          := qryBenefbfciarioIDBENEFICIO.AsString;
         DBcboBeneficio.Text                 := qryBenefbfciarioCODBENEFICIO.AsString;

         DBcboBeneficio.Enabled              := False;

         if DBcboBeneficio.Text = '' Then
            DBcboBeneficio.Enabled           := True;

         lblBeneficio.Caption                := qryBenefbfciarioNOME_BENEFICIO.AsString;

         sPlano                              := qryBenefbfciarioIDPLANPREVCONTAB.AsString;
         DBcboEntidadeContabil.LookupValue   := sPlano;
         DBcboEntidadeContabil.Text          := qryBenefbfciarioPLAN_PREV_CONTABIL.AsString;

         sPlano                              := qryBenefbfciarioIDPLANOPREV.AsString;
         LkcPlanoPrevidenciario.LookupValue  := sPlano;
         LkcPlanoPrevidenciario.Text         := qryBenefbfciarioNOMEPLANOPREV.AsString;

         DBcboMantenedor.LookupValue         := '';
         DBcboMantenedor.Text                := '';

      end;

      ttDetConc:
      begin
         IDPessoa                            := qryDIBIDPESSOA.AsFloat;

         edtDIB.Date                         := qryDIBDIB.AsDateTime;

         edtNome.Text                        := qryDIBNOME.AsString;
         edtMatricula.Text                   := qryDIBMATRICULA.AsString;

         DBcboBeneficio.LookupValue          := qryDIBIDBENEFICIO.AsString;
         DBcboBeneficio.Text                 := qryDIBCODBENEFICIO.AsString;

         DBcboBeneficio.Enabled              := False;
         if DBcboBeneficio.Text = '' Then
            DBcboBeneficio.Enabled           := True;

         lblBeneficio.Caption                := qryDIBNOME_BENEFICIO.AsString;

         DBcboMantenedor.LookupValue         := qryDIBCODMANTENEDORA.AsString;
         DBcboMantenedor.Text                := qryDIBNOME_MANTENEDORA.AsString;

         sPlano                              := qryDIBIDPLANOPREV.AsString;
         DBcboEntidadeContabil.LookupValue   := sPlano;
         DBcboEntidadeContabil.Text          := qryDIBPLAN_PREV_CONTABIL.AsString;
         { Augusto 12/05/2005 }

         sPlano                              := qryDIBIDPLANOPREVPREV.AsString;
         LkcPlanoPrevidenciario.LookupValue  := sPlano;
         LkcPlanoPrevidenciario.Text         := qryDIBNOMEPLANOPREV.AsString;

      end;
   end;

   if (IDPessoa > 0) and (sPlano <> '') then
   begin
      if TipoTabela in [ttBenef, ttDetConc] then
      begin
         with qryEntidadeContabil do
         begin
            LimpaParametros(qryEntidadeContabil);
            ParamByName('PIDPESSOA').AsFloat := IDPessoa;
            Open;

            if not(isEmpty) then IDParam := qryEntidadeContabilIDPARAM.AsInteger;
            Close;
         end;  // with qryEntidadeContabil

         if IDParam > 0 then
         begin
            if (sPlano = '66') and (IDParam = 1) then sPlano := '1';
            if (sPlano = ' 2') and (IDParam = 1) then sPlano := '22';
            if (sPlano = '66') and (IDParam = 9) then sPlano := '24';

            DBcboEntidadeContabil.LookupValue := sPlano;
         end;  // if IDParam > 0
      end;  // if TipoTabela in [...
   end;  // if IDPessoa > 0
end;



procedure TfrmCadEntrManualINSS.FormShow(Sender: TObject);
begin
  inherited;

  pnlFundo.Enabled          := True;
  pgcFundo.ActivePageIndex  := 0;

  LimpaParametros(qry);

  qryLookBeneficio.Open;
  qryLookMantenedora.Open;
  qryLookEntidadeContabil.Open;
  qryLookPlano.Open;
end;



procedure TfrmCadEntrManualINSS.wwDBGrid1DblClick(Sender: TObject);
begin
   inherited;

   pnlFundo.BringToFront;

   sbtnAlterar.OnClick(Sender);
   sbtnAlterar.Down := True;
end;



procedure TfrmCadEntrManualINSS.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  pnlFundo.Enabled := True;
end;



procedure TfrmCadEntrManualINSS.edtRubricaINSSExit(Sender: TObject);
begin
   inherited;

   if length(trim(edtRubricaINSS.Text)) = 0 then Exit;

   if length(trim(edtRubricaINSS.Text)) > 4 then
   begin
      MsgDlg('O Código digitado para a rubrica do INSS está incorreto. ' + #13 +
             'Favor verificar: deve possuir 4 dígitos. ',
             'Administração Previdenciária', mtWarning, [mbOk], 0);
      Repaint;

      if edtRubricaINSS.CanFocus then edtRubricaINSS.SetFocus;
   end;


   if (copy(edtRubricaINSS.Text, 1, 2) <> '10') and (copy(edtRubricaINSS.Text, 1, 2) <> '30') then
   begin
      MsgDlg('O Código digitado para a rubrica do INSS está incorreto. ' + #13 +
             'Favor verificar: deve iniciar com "10" ou "30". ',
             'Administração Previdenciária', mtWarning, [mbOk], 0);
      Repaint;

      if edtRubricaINSS.CanFocus then edtRubricaINSS.SetFocus;
   end;

   // Procura o IDRubrica referente à rubrica do INSS na tabela
   with qryRubricaXINSS do
   begin
      LimpaParametros(qryRubricaXINSS);
      ParamByName('PRUBRICAINSS').AsString := edtRubricaINSS.Text;
      Open;

      if not(isEmpty) then
      begin
         lblIDRubrica.Caption := qryRubricaXINSSCODPROVDESC.AsString;
         lblRubrica.Caption   := qryRubricaXINSSDESCRICAO.AsString;
         IDRubrica            := qryRubricaXINSSIDRUBRICA.AsFloat;
      end
      else
      begin
         lblIDRubrica.Caption := '';
         lblRubrica.Caption   := '';
         IDRubrica            := -1;
      end;

      Close;
   end;
end;



procedure TfrmCadEntrManualINSS.CmeCadastroConfirma(Sender: TObject);
begin
   // Aqui é onde ocorreria o ApplyUpdates: deve estar comentado mesmo -----------------------------
   // inherited;
   // ----------------------------------------------------------------------------------------------

   case rdgIdentificado.ItemIndex of
      0: TipoTabela := ttDetConc;
      1: TipoTabela := ttTempConc;
   end;

   try //SOL127802 - Ádler Souza
     StartTransacao;
     case CmeCadastro.Operacao of

        opInserir:
        begin
           case TipoTabela of

              ttDetConc:
              begin
                 with qryInsertDetConc do
                 begin
                    LimpaParametros(qryInsertDetConc);

                    ParamByName('PNUMPROCINSS').AsString      := edtNumProcINSS.Text;
                    //BRUNO AZEVEDO SOL 131786 KINTANA 753272
                    if (edtDIB.Date > 0) then begin
                      ParamByName('PDIB').AsDateTime            := edtDIB.Date;
                    end else begin
                      ParamByName('PDIB').Clear;
                    end;
                    //BRUNO AZEVEDO SOL 131786 KINTANA 753272

                    ParamByName('PIDPLANOPREV').AsString      := DBcboEntidadeContabil.LookupValue;
                    ParamByName('PIDPLANOPREVPREV').AsString  := LkcPlanoPrevidenciario.LookupValue;

                    if IDPessoa > 0 then
                      ParamByName('PIDPESSOA').AsFloat        := IDPessoa;

                    ParamByName('PNOME').AsString             := edtNome.Text;

                    ParamByName('PMATRICULA').AsString        := edtMatricula.Text;
                    ParamByName('PCODMANTENEDORA').AsString   := DBcboMantenedor.LookupValue;
                    ParamByName('PRUBRICAINSS').AsString      := edtRubricaINSS.Text;

                    ParamByName('PFLGMANUAL').AsInteger       := (rdgEntradaManual.ItemIndex + 1);

                    Case rdgIdentificado.ItemIndex Of
                        0: begin { Identificado }
                             ParamByName('PESPECIE').AsString := DBcboBeneficio.Text;
                           end;
                        1: begin { Não Identificado }
                             ParamByName('PESPECIE').AsString := EdBeneficio.Text;
                           end;
                    end;

                    ParamByName('PMESREFERENCIA').AsString    := FormatFloat('0000', DBspnAnoReferencia.Value) + '/' + FormatFloat('00', cboMesReferencia.ItemIndex + 1);
                    ParamByName('PMESCOBRANCA').AsString      := FormatFloat('0000', DBspnAnoCobranca.Value) + '/' + FormatFloat('00', cboMesCobranca.ItemIndex + 1);

                    ParamByName('PIDBENEFICIO').AsInteger     := StrToInt(DBcboBeneficio.LookupValue);

                    ParamByName('PSEQUENCIAL').AsInteger      := PegaSequencial;

                    if IDRubrica > 0 then
                       ParamByName('PIDRUBRICA').AsFloat      := IDRubrica;

                    ParamByName('PVALORINSS').AsCurrency      := edtValor.Value;
                    ParamByName('PRMREAJ').AsCurrency         := edtRMREAJ.Value;
                    ParamByName('PAPREAJ').AsCurrency         := edtAPREAJ.Value;

                    ParamByName('POBSERVACAO').AsString       := memObs.Text;

                    ParamByName('PCODSINONIMO').AsString       := edtCodSinonimo.Text; //Renato Visoni SOL 123118 Kintana 612606


                    ExecSQL;
                 end;
              end;

              ttTempConc:
              begin
                 with qryInsertTempConc do
                 begin
                    LimpaParametros(qryInsertTempConc);

                    ParamByName('PNUMPROCINSS').AsString         := edtNumProcINSS.Text;

                    //BRUNO AZEVEDO SOL 131786 KINTANA 753272
                    if (edtDIB.Date > 0) then begin
                      ParamByName('PDIB').AsDateTime            := edtDIB.Date;
                    end else begin
                      ParamByName('PDIB').Clear;
                    end;
                    //BRUNO AZEVEDO SOL 131786 KINTANA 753272

                    ParamByName('PNOME').AsString                := edtNome.Text;
                    ParamByName('PMATRICULA').AsString           := edtMatricula.Text;

                    ParamByName('PCODRUBRICA1').AsString         := edtRubricaINSS.Text;
                    ParamByName('PVLRRUBRICA1').AsCurrency       := edtValor.Value;
                    ParamByName('PDATALEITURA').AsDateTime       := Date;

                    Case rdgIdentificado.ItemIndex Of
                        0: begin { Identificado }
                             ParamByName('PESPECIE').AsString := DBcboBeneficio.Text;
                           end;
                        1: begin { Não Identificado }
                             ParamByName('PESPECIE').AsString := EdBeneficio.Text;
                           end;
                    end;

                    ParamByName('PMESPROCESSAMENTO').AsString    := FormatFloat('0000', DBspnAnoCobranca.Value) + '/' + FormatFloat('00', cboMesCobranca.ItemIndex + 1);
                    ParamByName('PMESREFERENCIA').AsString       := FormatFloat('0000', DBspnAnoReferencia.Value) + '/' + FormatFloat('00', cboMesReferencia.ItemIndex + 1);

                    ParamByName('PCODMANTENEDORINSS').Clear;

                    ParamByName('PFLGMANUAL').AsInteger          := (rdgEntradaManual.ItemIndex + 1);

                    ParamByName('PRMREAJ').AsCurrency            := edtRMREAJ.Value;
                    ParamByName('PAPREAJ').AsCurrency            := edtAPREAJ.Value;

                    ParamByName('POBS').AsString                 := memObs.Text;

                    ParamByName('PCODSINONIMO').AsString       := edtCodSinonimo.Text; //Renato Visoni SOL 123118 Kintana 612606

                    ExecSQL;
                 end;
              end;

           end;
        end;
     end;
     CommitTransacao;//SOL127802 - Ádler Souza
   except
     RollBackTransacao;//SOL127802 - Ádler Souza
   end; //Fim - SOL127802 - Ádler Souza

end;



procedure TfrmCadEntrManualINSS.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;



procedure TfrmCadEntrManualINSS.edtNumProcINSSExit(Sender: TObject);
begin
   inherited;

   if (edtNumProcINSS.text <> '') then
   begin
      if not ValidaNumProcesso(edtNumProcINSS.Text) then
      begin
         if MsgDlg('O Número do Processo não foi digitado corretamente. '+
                   'Deseja continuar assim mesmo?', Caption, mtError , [mbNo, mbYes,mbHelp], 0) = mrNo then
         begin
            if edtNumProcINSS.CanFocus then edtNumProcINSS.setfocus;
            exit;
         end;
      end;
   end;

   if (ActiveControl = bbtnCancelar) or (ActiveControl = bbtnSair) then Exit;
   if (length(trim(edtNumProcINSS.Text)) = 0) or (CmeCadastro.Operacao <> opInserir) then Exit;

   // ----------------------------------------------------------------------------------------------
   // 1º - procura na BenefBFCiario
   // ----------------------------------------------------------------------------------------------
   with qryBenefbfciario do
   begin
      LimpaParametros(qryBenefbfciario);
      ParamByName('PNUMPROCINSS').AsString := edtNumProcINSS.Text;
      Open;

      if not(isEmpty) then
      begin
         rdgIdentificado.ItemIndex := 0;
         TipoTabela := ttBenef;
         PreencheCampos;
         Close;
         Exit;
      end;
      Close;
   end;
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // 2º - procura na própria DetConcINSS
   // ----------------------------------------------------------------------------------------------
   with qryDIB do
   begin
      LimpaParametros(qryDIB);
      ParamByName('PNUMPROCINSS').AsString := edtNumProcINSS.Text;
      qryDIB.Open;
      if not(isEmpty) then
      begin
         rdgIdentificado.ItemIndex := 0;
         TipoTabela := ttDetConc;
         PreencheCampos;
         Close;
         Exit;
      end;
      Close;
   end;
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // 3º - Não tendo encontrado em nenhuma das duas, faz insert
   // ----------------------------------------------------------------------------------------------
   MsgDlg('O Nº do Benefício indicado não foi localizado.' + #13 + #13 +
          'Será inserido um registro não identificado', 'Administração Previdenciária', mtInformation, [mbOk], 0);
   Repaint;

   rdgIdentificado.ItemIndex := 1;
   TipoTabela := ttTempConc;

   LimpaCampos;
end;



procedure TfrmCadEntrManualINSS.CmeCadastroInsert(Sender: TObject);
begin
   LimpaCampos;

   // Aqui é onde ocorreria o qry.Insert: deve estar comentado mesmo -------------------------------
   // inherited;
   // ----------------------------------------------------------------------------------------------

   if edtNumProcINSS.CanFocus then edtNumProcINSS.SetFocus;
end;



procedure TfrmCadEntrManualINSS.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   if edtNumProcINSS.CanFocus then edtNumProcINSS.SetFocus;
end;



function TfrmCadEntrManualINSS.PegaSequencial: Integer;
begin
   with qrySequencial do
   begin
      LimpaParametros(qrySequencial);
      ParamByName('PIDPESSOA').AsFloat       := IDPessoa;
      ParamByName('PMESCOBRANCA').AsString   := FormatFloat('0000', DBspnAnoCobranca.Value) + '/' + FormatFloat('00', cboMesCobranca.ItemIndex + 1);

      Open;
      Result := qrySequencialSEQUENCIAL.AsInteger + 1;
      Close;
   end;
end;



procedure TfrmCadEntrManualINSS.rdgIdentificadoExit(Sender: TObject);
begin
  inherited;

  case rdgIdentificado.ItemIndex of

    0:
    begin
      DBcboMantenedor.Enabled := True;
    end;

    1:
    begin { Não Identificado }
      DBcboMantenedor.Enabled       := False;
      DBcboMantenedor.LookupValue   := '';
      DBcboMantenedor.Text          := '';
    end;

  end;
end;



procedure TfrmCadEntrManualINSS.rdgIdentificadoClick(Sender: TObject);
begin
  inherited;

  case rdgIdentificado.ItemIndex of

    0:
    begin { Identificado }
      DBcboBeneficio.Visible := True;
      EdBeneficio.Visible    := False;
    end;

    1:
    begin { Não Identificado }
      lblBeneficio.Caption   := ' ';
      EdBeneficio.Visible    := True;
      DBcboBeneficio.Visible := False;
    end;

  end;

  DBcboBeneficio.Enabled := True;
end;



procedure TfrmCadEntrManualINSS.DBcboBeneficioChange(Sender: TObject);
begin
  inherited;
  lblBeneficio.Caption := ' '+qryLookBeneficio.FieldByName('NOME').AsString;
end;



procedure TfrmCadEntrManualINSS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryLookPLANO.CLOSE;
  inherited;
end;



procedure TfrmCadEntrManualINSS.btnProcurarClick(Sender: TObject);
begin
  inherited;
  if length(trim(edtNumProcessoBusca.Text)) = 0 then Exit;
                                                                    
  with qryDetConc do
  begin
    LimpaParametros(qryDetConc);
    ParamByName('PNUMPROCINSS').AsString := trim(edtNumProcessoBusca.Text);
    Open;
    First;
  end;

  with qryTempConc do
  begin
    LimpaParametros(qryTempConc);
    ParamByName('PNUMPROCINSS').AsString := trim(edtNumProcessoBusca.Text);
    Open;
    First;
  end;
end;



procedure TfrmCadEntrManualINSS.btnExcluiDetConcClick(Sender: TObject);
var
  sMsg : String;
begin
  inherited;

  // -----------------------------------------------------------------------------------------------

  if qryDetConc.IsEmpty then Exit;

  if not(dtmReembolsoINSS.VerificaConcINSS(qryDetConcMESCOBRANCA.AsString)) then
  begin
    sMsg := 'Não é possível excluir registros de meses fechados!';
    MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
    Repaint;
    Exit;
  end;

  // -----------------------------------------------------------------------------------------------

  try
    StartTransacao;

    with qryDeleteDetConc do
    begin
      TratarParametro(qryDeleteDetConc.Name,'PIDPESSOA'); //SIG90818
      LimpaParametros(qryDeleteDetConc);

      ParamByName('PNUMPROCINSS').AsString    := qryDetConcNUMPROCINSS.AsString;
          
       if (qryDetConcIDPESSOA.AsInteger <> 0) then //SIG90818
          ParamByName('PIDPESSOA').AsInteger      := qryDetConcIDPESSOA.AsInteger;
          
      ParamByName('PIDRUBRICA').AsInteger     := qryDetConcIDRUBRICA.AsInteger;
      ParamByName('PMESCOBRANCA').AsString    := qryDetConcMESCOBRANCA.AsString;
      ParamByName('PMESREFERENCIA').AsString  := qryDetConcMESREFERENCIA.AsString;
      ParamByName('PVALOR').AsCurrency        := qryDetConcVALORINSS.AsCurrency;
      try
        ExecSQL;
      except
        RollbackTransacao;

        sMsg := 'Erro ao excuir registro da DetConc. ' + #13 + #13 + 'Operação abortada. ';

        MsgDlg(sMsg, Sistema.NomeModulo, mtError, [mbOk], 0);
        Repaint;

        Exit;
      end;
    end;

    if qryDeleteDetConc.RowsAffected = 1 then
    begin
      CommitTransacao;

      MsgDlg('Registro excluído.', Sistema.NomeModulo, mtInformation, [mbOk], 0);
      Repaint;
    end
    else
    begin
      RollbackTransacao;

      if qryDeleteDetConc.RowsAffected = 0 then
        sMsg := 'Não foi encontrado registro a excluir na DetConc. ' + #13 + #13 + 'Operação abortada. ';

      if qryDeleteDetConc.RowsAffected > 1 then
        sMsg := 'Foi encontrado mais de um registro a excluir na DetConc. ' + #13 + #13 + 'Operação abortada. ';

      MsgDlg(sMsg, Sistema.NomeModulo, mtError, [mbOk], 0);
      Repaint;
    end;

  finally
    btnProcurarClick(self);
  end;
end;



procedure TfrmCadEntrManualINSS.btnExcluiTempConcClick(Sender: TObject);
var
  sMsg : String;
begin
  inherited;

  if qryTempConc.IsEmpty then Exit;

  try
    StartTransacao;

    with qryDeleteTempConc do
    begin
      LimpaParametros(qryDeleteTempConc);

      ParamByName('PNUMPROCINSS').AsString      := qryTempConcNUMPROCINSS.AsString;
      ParamByName('PCODRUBRICA1').AsString      := qryTempConcCODRUBRICA1.AsString;
      ParamByName('PMESPROCESSAMENTO').AsString := qryTempConcMESPROCESSAMENTO.AsString;
      ParamByName('PMESREFERENCIA').AsString    := qryTempConcMESREFERENCIA.AsString;
      ParamByName('PVLRRUBRICA1').AsCurrency    := qryTempConcVLRRUBRICA1.AsCurrency;

      try
        ExecSQL;
      except
        RollbackTransacao;

        sMsg := 'Erro ao excuir registro da TempConc. ' + #13 + #13 + 'Operação abortada. ';

        MsgDlg(sMsg, Sistema.NomeModulo, mtError, [mbOk], 0);
        Repaint;

        Exit;
      end;
    end;

    if qryDeleteTempConc.RowsAffected = 1 then
    begin
      CommitTransacao;

      MsgDlg('Registro excluído.', Sistema.NomeModulo, mtInformation, [mbOk], 0);
      Repaint;
    end
    else
    begin
      RollbackTransacao;

      if qryDeleteTempConc.RowsAffected = 0 then
        sMsg := 'Não foi encontrado registro a excluir na TempConc. ' + #13 + #13 + 'Operação abortada. ';

      if qryDeleteTempConc.RowsAffected > 1 then
        sMsg := 'Foi encontrado mais de um registro a excluir na TempConc. ' + #13 + #13 + 'Operação abortada. ';

      MsgDlg(sMsg, Sistema.NomeModulo, mtError, [mbOk], 0);
      Repaint;
    end;

  finally
    btnProcurarClick(self);
  end;
end;



procedure TfrmCadEntrManualINSS.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled := True;
end;



procedure TfrmCadEntrManualINSS.FormCreate(Sender: TObject);
begin
  inherited;
  if  dtmReembolsoINSS = nil then
    Application.CreateForm(TdtmReembolsoINSS, dtmReembolsoINSS);
end;

//SIG90818 -Inicio
procedure TfrmCadEntrManualINSS.TratarParametro(qryParam, sNmParam: String);
const cPessoa ='AND DCI.IDPESSOA      =:PIDPESSOA';
var
  x: Integer;
  bAchou: Boolean;
begin
  bAchou:= False;
  if (qryParam = qryDeleteDetConc.Name) then
    begin
      for x:= qryDeleteDetConc.ParamCount-1 downto 0  do
        begin
           if (qryDeleteDetConc.Params[x].DisplayName = sNmParam)or
              (qryDeleteDetConc.Params[x].Name = sNmParam)then
           begin
             bAchou:= True;
             if (qryDetConcIDPESSOA.AsInteger = 0) then
               begin
                 qryDeleteDetConc.Params.RemoveParam(qryDeleteDetConc.Params[x]);
                 qryDeleteDetConc.SQL.Text:= StringReplace(qryDeleteDetConc.SQL.Text, cPessoa, EmptyStr, [rfReplaceAll, rfIgnoreCase]);
               end;
           end;
        end;

      if not(bAchou) then
        begin
         if (qryDetConcIDPESSOA.AsInteger <> 0) then
            begin
              qryDeleteDetConc.Params.CreateParam(ftInteger, sNmParam, ptinput);
              qryDeleteDetConc.SQL.Add(cPessoa);
            end;
        end;
    end;
end;
//SIG90818 -Fim


end.
