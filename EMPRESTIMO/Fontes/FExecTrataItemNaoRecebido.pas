{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
-------------------------------- ALTERAÇÕES -------------------------------------
N. Chamado....: MIGRACAO-ORACLE-2025 (TAS000000007127)
Dt Alterações.: 11/11/2025
Responsável...: Paulo Nobre
Descrição.....: Ajuste na qry: qryHistMovVirtual para inclusão do CAST.
---------------------------------------------------------------------------------
N. WO..............: 19000
Data da Alteração..: 08/04/2025
Responsável........: Luis Ferrarfi 
Descrição..........: Inclusão de rotina para validar e atualizar parcelas incluídas 
                     manualmente, com alteração na procedure e código.
--------------------------------------------------------------------------------
Rotina.............: ExecutaDesvio
N. WO..............: 11481
Data da Alteração..: 21/06/2024
Responsável........: Leandro Pocebon
Descrição..........: Parametro para informr se trata parcelas enviadas
--------------------------------------------------------------------------------
N. Atender.........: WO2970
Data da Alteração..: 18/09/2023
Responsável........: Luis Ferrari
Descrição..........: Verificado a funcionalidade de seleção de retorno para que realize o tratamento apenas dos itens selecionados previamente
--------------------------------------------------------------------------------
N. SIG.............: 127944
Data da Alteração..: 31/10/2022
Responsável........: Luis Ferrari
Descrição..........: visualização da Quantidade Total e da Soma do Valor Previsto dos itens que serão tratados
--------------------------------------------------------------------------------
N. SIG.............: 119034
Data da Alteração..: 10/09/2021
Responsável........: Ewerton Beltramini
Descrição..........: Alteração da consulta do MontaSQLItens.
--------------------------------------------------------------------------------
N. SIG.............: 117733
Data da Alteração..: 04/08/2021
Responsável........: Ewerton Beltramini
Descrição..........: Implementar filtro de contratosAD.
--------------------------------------------------------------------------------
N. SIG.............: 90665
Data da Alteração..: 07/06/2021
Responsável........: Ewerton Beltramini
Descrição..........: Immplementar filtro de codigos CNAB.
--------------------------------------------------------------------------------
Rotina.............: btnContinuarClick, MontaSQLItens
N. SIG.............: 80302
Data da Alteração..: 02/01/2019
Responsável........: Andre Imakawa
Descrição..........: Desfazer SIG 76900 e criado a rotina VerificaDocumento no
                     próprio fonte.
--------------------------------------------------------------------------------
Rotina.............: btnContinuarClick, MontaSQLItens
N. SIG.............: 76900
Data da Alteração..: 18/10/2018
Alteração Form.....: fExecTrataItemNaoRecebido
Responsável........: Cássio Florencio Rovaroto
Descrição..........: Correção na forma com recuperar as parcelas que necessitam de tratamento.
--------------------------------------------------------------------------------
Pendência   : SOL 269984 PPM 1314930
Responsável : William Santana
Data        : 25/08/2015
Descrição   : Correção da forma de extração da data de vencimento para procedure
--------------------------------------------------------------------------------
Pendência   : SOL 260658 PPM 1039277
Responsável : William Moreira da Silva
Data        : 25/08/2015
Descrição   : Adequação a segregação da HISTMOVEMPTMO
--------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 03/07/2015
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO
--------------------------------------------------------------------------------
Pendência   : SOL 244322 PPM 603448.
Responsável : William Santana
Data        : 08/12/2014
Descrição   : Corrigir data passa para a procedure. Deve ser sempre YYYYMM.
--------------------------------------------------------------------------------
Pendência   : SOL 219419/15902 Kintana 2062272
Responsável : William Santana
Data        : 20/05/2014
Descrição   : Alteração de filtros para parcela e cálculo de encargos via stored procedure.
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
--------------------------------------------------------------------------------
Pendência   : SOL 187308 KINTANA 1770880
Responsável : Fernando Xavier
Data        : 22/08/2012
Descrição   : Para os mutuários falecidos, não devem ser listados na funcionalidade
              os respectivos contratos
--------------------------------------------------------------------------------
Pendência   : SOL 185074 KINTANA 1738438
Responsável : Otacilio Aquino
Data        : 18/07/2012
Descrição   : Implemetado na Query Principal a condicao HME.IDTIPOSUSPEMPTMO = 3
              para considerar os itens que possuem suspensão de 50%
--------------------------------------------------------------------------------
Pendência   : SOL 184103 KINTANA 1719989
Responsável : Otacilio Aquino
Data        : 04/07/2012
Descrição   : Implemetado para considerar somente os itens (13, 99)
--------------------------------------------------------------------------------
Pendência   : SOL 168745 Kintana 1492479
Responsável : Vander Campos
Data        : 09/05/2012
Descrição   : Ajustar a funcionalidade de tratamento de itens não recebidos
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior                                 
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : MontaSelectCAPCAR
Data      : 13/07/2007
Pendência : 26189
Autor     : Alberto
Descrição : Inclusão do combo Conta-Caixa x Forma Recebimento
            (DBcboFormaRecebimento)
--------------------------------------------------------------------------------
Rotina    : MontaSelectCAPCAR
Data      : 03/08/2004
Pendência :
Autor     : André Pontes
Descrição : Passagem do campo "MATRICULA"
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecTrataItemNaoRecebido;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, mListaPlano, mListaPatro,
   mContratoEmptmo, wwdblook, Wwdbigrd, Grids, Wwdbgrid, Mask, wwdbedit,
   Wwdbspin, Db, DBTables, Wwquery, Wwdatsrc, wwdbdatetimepicker,
   uTypesEmptmo, wwstorep, CheckLst, mListaCodigosCNAB; //Ewerton Beltramini - Sig 90665 - 07/06/2021.

type
   TTipoTratamento = (ttDesvioFolha, ttDesvioCAR);

   TfrmExecTrataItemNaoRecebido = class(TfrmWizardMTEP)
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      molContratoEmptmo: TmolContratoEmptmo;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      DBgrdHistMov: TwwDBGrid;
      DBgrdHistMovIButton: TwwIButton;
      Panel4: TPanel;
      btnInverteSelecao: TBitBtn;
      btnMarcaTodos: TBitBtn;
      qryHistMov: TwwQuery;
      dsDesvio: TDataSource;
      TabSheet3: TTabSheet;
      dtsHistMovVirtual: TwwDataSource;
      updHistMovVirtual: TUpdateSQL;
      qryHistMovVirtual: TwwQuery;
      DBgrdHistMovVirtual: TwwDBGrid;
      pnlInformaFinal: TPanel;
      UpdHistMov: TUpdateSQL;
      rdgFormaCobranca: TRadioGroup;
      Panel2: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      GroupBox1: TGroupBox;
      chkBenef: TCheckBox;
      chkPatro: TCheckBox;
      Panel3: TPanel;
      edtDataVencto: TwwDBDateTimePicker;
      Label3: TLabel;
      chkEnvio: TCheckBox;
      qryHistMovVERIFICADOCUMENTO: TFloatField;
      qryHistMovIDHISTMOVEMPTMO: TFloatField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      qryHistMovITEDESCRICAO: TStringField;
      qryHistMovMATRICULA: TStringField;
      qryHistMovANOMES: TStringField;
      qryHistMovEVENTO: TStringField;
      qryUpdateForma: TwwQuery;
      pnlCAR: TPanel;
      Label30: TLabel;
      Bevel1: TBevel;
      DBcboFormaRecebimento: TwwDBLookupCombo;
    btnAtribuiParametro: TSpeedButton;
    chkFinanceiro: TCheckBox;
    pnlCompetencia: TPanel;
    lblCompetencia: TLabel;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    pnlDataVencimentoCompetencia: TPanel;
    lblDataVencimento: TLabel;
    edtDataVenctoCompetencia: TwwDBDateTimePicker;
    qryHistMovFLGESCOLHA: TFloatField;
    qryHistMovCODDOCUMENTO: TFloatField;
    cboMesCompetenciaFim: TComboBox;
    DBspnAnoCompetenciaFim: TwwDBSpinEdit;
    lblE: TLabel;
    //Início - William Santana - SOL 219419/15902 KIN 2062272
    chkCompetencia: TCheckBox;
    chkCobranca: TCheckBox;
    sprcTratParcAtraso: TwwStoredProc;
    chkCalcEncargo: TCheckBox;
    qryUpdateParcela: TwwQuery;
    qryHistMovSTATUS: TStringField;
    qryHistMovSITENVIO: TStringField;
    qryHistMovDOCBAIXADOeRECEBIDO: TFloatField;
    qryHistMovVirtualCONTRATO: TFloatField;
    qryHistMovVirtualMATRICULA: TStringField;
    qryHistMovVirtualPAR: TFloatField;
    qryHistMovVirtualCE: TFloatField;
    qryHistMovVirtualLAS: TFloatField;
    qryHistMovVirtualMESCOBRANCA: TStringField;
    qryHistMovVirtualITEM: TStringField;
    qryHistMovVirtualVALOR: TFloatField;
    qryHistMovVirtualNOVOVENCTO: TDateTimeField;
    qryHistMovSEQCOBRANCA: TFloatField;
    qryMovVLRPREVISTO: TFloatField;
    qryHistMovDATAVENCTO: TDateTimeField;
    qryHistMovPARCELA: TFloatField;
    qryHistMovPARCELAALT: TFloatField;
    qryHistMovNUMPARCELAS: TFloatField;
    molListaCodigosCNAB: TmolListaCodigosCNAB;
    chkInArquivo: TCheckBox;
    chkNotInArquivo: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    edtQtdeContrato: TEdit;
    edtVlrTotContrato: TEdit;
    fltfldMovtot_previsto: TFloatField;
    fltfldHistMovNVL_ENCARGOS: TFloatField;
    Label6: TLabel;
    edtTotItens: TEdit;
    fltfldHistMovTOT_ITENS: TFloatField;
    qryEncargos: TwwQuery;
    qryCalculos: TwwQuery;
    qryHistMovDATAPREVISTA: TDateTimeField;
    qryHistMovTXJUROS: TFloatField;
    qryHistMovFLGENTRADAMANUAL: TFloatField;
    UpdEncargos: TUpdateSQL;    //Ewerton Beltramini - Sig 90665 - 07/06/2021.

    Procedure abreTabelaVirtual();
    function VerificaItemNaoPodeTratar(): boolean;
    function Padleft(const Str, Caracter: string; const Tamanho: Integer): string;
    //Término - William Santana - SOL 219419/15902 KIN 2062272

      procedure btnContinuarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnInverteSelecaoClick(Sender: TObject);
      procedure btnMarcaTodosClick(Sender: TObject);
      procedure DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      //Pendência 26189 - 17/09/2007 - Alberto
      procedure rdgFormaCobrancaClick(Sender: TObject);
      procedure AbreQueriesDebito;
      procedure FormCreate(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure DBcboTipoEmptmoChange(Sender: TObject);
      procedure DBcboTipoContratoChange(Sender: TObject);
      procedure DeterminaFormaCobranca(
                   idContrato: Double;                       
                   idTipoContrEmptmo: String);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure btnAtribuiParametroClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);

      function VerificaDocumento(const fDocumento : Extended; var sMsg : String): Integer;
    procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
    procedure btnInvertePatroClick(Sender: TObject);
    procedure molListaCodigosCNABClick(Sender: TObject);   //Ewerton Beltramini - Sig 90665 - 07/06/2021.
    procedure molListaCodigosCNABbtnMarcaTodosCodigosCNABClick( Sender: TObject); //Ewerton Beltramini - Sig 90665 - 07/06/2021.
    procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
    procedure chkInArquivoClick(Sender: TObject);
    procedure chkNotInArquivoClick(Sender: TObject);
       
      //Fim Pendência 26189

   private  // Private declarations

      function  VerificaPreenchimento: Boolean;

      function  ExecutaDesvio: Boolean;
      function  MontaSQLItens : String;
      procedure PreencheTabelaVirtual(bAbreTabela : Boolean);

      function  MontaSelectCAPCAR(const sRecPag: String): String;
      function  MontaWhereComum: String;
      function  MontaWhereCAPCAR(const sRecPag: String): String;
      function CalculoAtualizacao(DataPrevista : String ;Valor_Parcela : string ;Data_atualizada : string ;ItemParcela :Integer ;Taxa_Juros :string) : string; // WO10891 Ferrari
      function CalculoAtualizacaoIOF(DataPrevista : String ;DataCredito : string ;NumParcela : Integer ;ParcRestantes : Integer ;Taxa_Juros :string ;Valor_Parcela : string ;Data_atualizada : string ;SistemaAmort : string) : string;  // WO10891 Ferrari


   public   // Public declarations

   end;



var
  frmExecTrataItemNaoRecebido : TfrmExecTrataItemNaoRecebido;

  contratoeparcela : TStringList; //William Santana - SOL 219419/15902 KIN 2062272
  
implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, // LimpaParametros, AtualizaConjunto
   uCalcEmptmo,
   UMensErro,      // MsgDlg
   USistema,       // Sistema
   dBaseDados,
   UIntegraEmptmo, // IntegraEmptmo
   dEmptmo,        // qryParamEmptmo
   DLookEmptmo,    // qryLookPortadorFormaR
   FProgresso,     // FrmProgresso
   uDatabase,
   uModulo,
   uDiasUteis,
   uVerificaPreenchimento,
   dMS,
   fAguarde;



function TfrmExecTrataItemNaoRecebido.ExecutaDesvio: Boolean;
var
   sFormaCobranca : String;
   rLogTotalPrev  : TLogTotalPrev;     
   sPAno, sPMes : String; //Início - William Santana - SOL 244322 PPM 603448.
   fVlrCorrecao      : Currency;     // WO19000 Ferrari
   fVlrJurosRemunera : Currency;     // WO19000 Ferrari
   fVlrMulta         : Currency;     // WO19000 Ferrari
   fVlrJurosMora     : Currency;     // WO19000 Ferrari
   fVlrEncargo       : Currency;     // WO19000 Ferrari
   fVlrOrig          : Currency;     // WO19000 Ferrari
   dDataParcela      : string;       // WO19000 Ferrari
   itaxa             : Currency;     // WO19000 Ferrari
begin
   Result := True;

   case rdgFormaCobranca.ItemIndex of
      0: sFormaCobranca := 'C';
      1: sFormaCobranca := 'F';
   end;


   //Início - William Santana - SOL 219419/15902 KIN 2062272
   if (qryHistMovIDITEMEMPTMO.AsInteger <> 99) then
   begin
{     // Inicio WO19000 Ferrari
     if (qryHistMov.FieldByName('FLGENTRADAMANUAL').AsInteger = 1) then
     begin
       qryEncargos.Close;
       qryEncargos.ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryHistMovIDCONTRATOEMPTMO.AsFloat;
       qryEncargos.ParamByName('PIDPARCELA').AsInteger       := qryHistMovPARCELA.AsInteger;
       qryEncargos.open;
       While Not (qryEncargos.EOF) and (qryHistMov.FieldByName('FLGENTRADAMANUAL').AsInteger = 1) do
         Begin
           dDataParcela := DateToStr(qryEncargos.FieldByName('DATAPREVISTA').AsDateTime);
           fVlrOrig     := qryHistMov.FieldByName('VLRPREVISTO').AsCurrency;
           itaxa        := StrToCurr(qryHistMov.FieldByName('TXJUROS').AsString);
           case qryEncargos.FieldByName('IDITEMEMPTMO').AsInteger of
              42: fVlrCorrecao      := fVlrCorrecao + StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.text,qryEncargos.FieldByName('IDITEMEMPTMO').AsInteger,CurrToStr(itaxa)));
              43: fVlrJurosRemunera := fVlrJurosRemunera + StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryEncargos.FieldByName('IDITEMEMPTMO').AsInteger,CurrToStr(itaxa)));
              44: fVlrMulta         := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryEncargos.FieldByName('IDITEMEMPTMO').AsInteger,CurrToStr(itaxa)));
              46: fVlrJurosMora     := fVlrJurosMora + StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryEncargos.FieldByName('IDITEMEMPTMO').AsInteger,CurrToStr(itaxa)));
     //        121: fVlrIoFComp       := fVlrIoFComp + StrToCurr(CalculoAtualizacaoIOF(dDataParcela,dDataCredito,iParcelaAtu,iParcelaRestante,CurrToStr(itaxa),qryContratos.FieldByName('VLRCONTRATO').AsString,edtDataVencto.Text,sAmortizacao))+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;  // WO14093 Ferrari      // WO15857 Ferrari  // WO16298 Ferrari
           end;
           qryEncargos.Insert;
           qryEncargos.FieldByName('DATAPREVISTA').AsDateTime := edtDataVencto.DateTime;
           qryEncargos.FieldByName('DATAVENCTO').AsDateTime := edtDataVencto.DateTime;
           qryEncargos.FieldByName('VLRPREVISTO').AsCurrency := edtDataVencto.DateTime;
           qryEncargos.post;
           qryEncargos.Next;
         end;
     end;
}
     if (chkCalcEncargo.checked) then
     begin
       with sprcTratParcAtraso do
       begin
         //Início - William Santana - SOL 244322 PPM 603448.
         //William Moreira da Silva - SOL 253185 PPM 771995 - Inicio
         //Início - William Santana - SOL 269984 PPM 1314930
         //if (DiasUteis.ExtraiMes(qryHistMovHMEDATAVENCTO.AsDateTime+30) in [0..9]) then
         //if (DiasUteis.ExtraiMes(qryHistMovDATAVENCTO.AsDateTime+30) in [0..9]) then
//           sPMes :='0'+ intToStr(DiasUteis.ExtraiMes(qryHistMovDATAVENCTO.AsDateTime+30))
//         else
//           sPMes := intToStr(DiasUteis.ExtraiMes(qryHistMovDATAVENCTO.AsDateTime+30)) ;
//
//         sPAno := IntToStr(DiasUteis.ExtraiAno(qryHistMovDATAVENCTO.AsDateTime+30));
         //Término - William Santana - SOL 244322 PPM 603448

         sPMes := IntToStr(DiasUteis.ExtraiMes(IncMonth(qryHistMovDATAVENCTO.AsDateTime,1)));
         if (strToint(sPMes) in [0..9]) then
           sPMes :='0'+ sPMes;

         sPAno := IntToStr(DiasUteis.ExtraiAno(IncMonth(qryHistMovDATAVENCTO.AsDateTime,1)));

         //Término - William Santana - SOL 269984 PPM 1314930
         //William Moreira da Silva - SOL 253185 PPM 771995 - Inicio

         ParamByName('pNumContrato').AsFloat        := qryHistMovIDCONTRATOEMPTMO.AsFloat;
         ParamByName('pInArquivo').AsFloat          := 0;
         ParamByName('pNotInArquivo').AsFloat       := 0;
         //Início - William Santana - SOL 244322 PPM 603448.
         //  ParamByName('pAnoMes').AsString            := IntToStr(DiasUteis.ExtraiAno(qryHistMovHMEDATAVENCTO.AsDateTime+30))+IntToStr(DiasUteis.ExtraiMes(qryHistMovHMEDATAVENCTO.AsDateTime+30));
         ParamByName('pAnoMes').AsString            := sPAno+ sPMes;
         //Término - William Santana - SOL 244322 PPM 603448.
         ParamByName('pAnoMesCobranca').AsString    := '-1';
         ParamByName('pAnoMesCompetencia').AsString := '-1';
         ParamByName('pDataCalculo').AsDate         := edtDataVencto.DateTime;
         ParamByName('pNumParcela').AsFloat         := qryHistMovPARCELA.AsFloat;//William Moreira da Silva - SOL 253185 PPM 771995
         ParamByName('pTrataParcelaEnviada').AsFloat:= 0; //Leandro WO114811
         ParamByName('pFlgEntradaManual').AsFloat:= qryHistMov.FieldByName('FLGENTRADAMANUAL').AsInteger;  // WO19000 Ferrari

         if not(Prepared) then Prepare;
         ExecProc;
       end;
     end
     else
     begin
        LimpaParametros(qryUpdateParcela);

        qryUpdateParcela.ParamByName('PHMEANOCOBRANCA').AsInteger  := DiasUteis.ExtraiAno(edtDataVencto.DateTime);
        qryUpdateParcela.ParamByName('PHMEMESCOBRANCA').AsInteger  := DiasUteis.ExtraiMes(edtDataVencto.DateTime);
        qryUpdateParcela.ParamByName('PHMEDATAVENCTO').AsDate      := edtDataVencto.DateTime;
        qryUpdateParcela.ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryHistMovIDCONTRATOEMPTMO.AsFloat;
        qryUpdateParcela.ParamByName('PIDPARCELA').AsInteger       := qryHistMovPARCELA.AsInteger;//William Moreira da Silva - SOL 253185 PPM 771995 - Inicio

        try
          if (edtDataVenctoCompetencia.Date < edtDataVencto.Date) then
          qryUpdateParcela.ExecSQL;
        except
          Result := False;
        end;

     end;
   end;
   //Término - William Santana - SOL 219419/15902 KIN 2062272

     with qryUpdateForma do
     begin
        LimpaParametros(qryUpdateForma);

        ParamByName('PHMEFORMACOBRANCA').AsString := sFormaCobranca;
        ParamByName('PHMEANOCOBRANCA').AsInteger  := DiasUteis.ExtraiAno(edtDataVencto.Date);
        ParamByName('PHMEMESCOBRANCA').AsInteger  := DiasUteis.ExtraiMes(edtDataVencto.Date);
        ParamByName('PHMEDATAVENCTO').AsDate      := edtDataVencto.Date;
        ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryHistMovIDCONTRATOEMPTMO.AsFloat;
        ParamByName('PIDHISTMOVEMPTMO').AsFloat   := qryHistMovIDHISTMOVEMPTMO.AsFloat;

        try
           ExecSQL;
        except
           Result := False;
        end;

        // -------------------------------------------------------------------------------------------
        // André Pontes - 11/01/2006 - LogDocumento - OK

        LimpaRegistroLog(rLogTotalPrev);

        rLogTotalPrev.IDModulo   := Sistema.IDModulo;
        rLogTotalPrev.IDContrato := qryHistMovIDCONTRATOEMPTMO.AsFloat;
        rLogTotalPrev.IDHistMov  := qryHistMovIDHISTMOVEMPTMO.AsFloat;
        rLogTotalPrev.CodPlanDoc := -1;
        rLogTotalPrev.Origem     := 20;
        rLogTotalPrev.Operacao   := 'Limpa CodDocumento - ExecutaDesvio (qryUpdateForma)';
        rLogTotalPrev.Data       := SysDate;
        rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
        rLogTotalPrev.Versao     := Sistema.Versao;

        GravaLogTotalPrev(rLogTotalPrev);

        // -------------------------------------------------------------------------------------------
     end;

end;



procedure TfrmExecTrataItemNaoRecebido.PreencheTabelaVirtual(bAbreTabela : Boolean);
begin
  //William Santana - SOL 219419/15902 KIN 2062272

  // troquei o preechimento da tabela virtual pelo preenchimento dos parametros para usar na query
  // pois agora o resultado final exibirá o valor total das parcelas tratadas calculando os encargos
  {
   if bAbreTabela or not(qryHistMovVirtual.Active) then
   begin
      qryHistMovVirtual.Close;
      qryHistMovVirtual.Open;
   end;

   qryHistMovVirtual.Insert;

   qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat    := qryHistMovIDCONTRATOEMPTMO.AsFloat;
   qryHistMovVirtualMATRICULA.AsString          := qryHistMovMATRICULA.AsString;
   qryHistMovVirtualANOMES.AsString             := FormatFloat('0000', DBspnAno.Value) + '/' + FormatFloat('00', cboMes.ItemIndex + 1);
   qryHistMovVirtualHMEDATAVENCTO.AsDateTime    := edtDataVencto.Date;

   if not(qryHistMovVirtualHMEPARCELAALT.IsNull) then
   begin
      qryHistMovVirtualHMEPARCELAALT.AsInteger  := qryHistMovHMEPARCELAALT.AsInteger;
   end;

   qryHistMovVirtualHMEPARCELA.AsInteger        := qryHistMovHMEPARCELA.AsInteger;
   qryHistMovVirtualHMENUMPARCELAS.AsInteger    := qryHistMovHMENUMPARCELAS.AsInteger;
   qryHistMovVirtualVALOR.AsCurrency            := qryHistMovHMEVLRPREVISTO.AsCurrency;
   qryHistMovVirtualDESCRICAO.AsString          := qryHistMovITEDESCRICAO.AsString;

   qryHistMovVirtual.Post;
   }

   contratoeparcela.Add('('+quotedStr(qryHistMovIDCONTRATOEMPTMO.AsString)+','+qryHistMovPARCELA.AsString+'),');//William Moreira da Silva - SOL 253185 PPM 771995 - Inicio
   //William Santana - SOL 219419/15902 KIN 2062272

end;



procedure TfrmExecTrataItemNaoRecebido.btnContinuarClick(Sender: TObject);
var
   sResult     : TStringList;
   sErro       : TStringList;
   iPlanilha   : Integer;
   sMensagem   : String;

   // VANDER - SOL: 168745 - KTN: 1492479
   IntEmptmo   : TIntegraEmptmo;
   StatusDOC   : ShortInt;
   sQtdeContrato: Integer;    // Sig 127944 Ferrari
   sTotItens   : Double;     // Sig 127944 Ferrari
   sVlrContrato : Currency;
   sIdcontratoemptmo : string;  // Sig 127944 Ferrari

begin
   // ----------------------------------------------------------------------------------------------
   // Selecão dos Itens
   // ----------------------------------------------------------------------------------------------

    if UFuncoesEmptmo.bBuscaMutuario then
      begin
         MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                           'O usuário é o próprio mutuário do '+
                           'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;

    contratoeparcela.Clear; //William Santana - SOL 219419/15902 KIN 2062272

   if pgcControle.ActivePageIndex = 0 then
   begin
      if not(VerificaPreenchimento) then Exit;

      qryHistMov.Close;
      qryHistMov.SQL.Clear;
      qryHistMov.SQL.Text := MontaSQLItens;
      qryHistMov.SQL.SaveToFile(Sistema.TempDir + 'parcelas.txt');
      qryHistMov.Open;

      sQtdeContrato := 0;  // Sig 127944 Ferrari
      sTotItens := 0;      // Sig 127944 Ferrari
      sVlrContrato := 0; // Sig 127944 Ferrari
      sIdcontratoemptmo := qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsString ;   // Sig 127944 Ferrari
        //   qryHistMov.FieldByName('FLGENTRADAMANUAL').AsInteger
      
      //Andre Imakawa - SIG 80091 - Inicio
      //Cássio Rovaroto - SIG nº 76900 - Início
      // Inicio - VANDER - SOL: 168745 - KTN: 1492479
      With qryHistMov do
        Try
          DisableControls;
          Filtered := False;

          While Not EOF do
          Begin

            //Andre Imakawa - SIG 80302 - Inicio

            StatusDOC := VerificaDocumento(FieldByName('CODDOCUMENTO').AsFloat,sMensagem);

            //Andre Imakawa - SIG 80302 - Fim

            if (StatusDOC = -5) OR
               (StatusDOC = -2) OR
               (StatusDOC = -1) OR
               (StatusDOC =  0) Then
              Begin
                Edit;
                FieldByName('VERIFICADOCUMENTO').AsInteger := 1;
                Post;
              End
            else
              // Inicio Sig 127944 Ferrari
              begin
                sVlrContrato := sVlrContrato + qryHistMov.FieldByName('VLRPREVISTO').AsFloat;  // Sig 127944 Ferrari
                sTotItens := sTotItens + qryHistMov.FieldByName('TOT_ITENS').AsFloat;  // Sig 127944 Ferrari
                if FieldByName('IDITEMEMPTMO').AsString = '13' then
                  sVlrContrato := sVlrContrato + qryHistMov.FieldByName('VLR_ENCARGOS').AsFloat ;   // Sig 127944 Ferrari
                if sIdcontratoemptmo <> FieldByName('IDCONTRATOEMPTMO').AsString  then
                  sQtdeContrato := sQtdeContrato + 1;
              end;
            sIdcontratoemptmo := FieldByName('IDCONTRATOEMPTMO').AsString ;    // Sig 127944 Ferrari
           // Fim sig 127944
            NEXT;
          End;

          Filter   := 'VERIFICADOCUMENTO = 0';
          Filtered := True;
        Finally
          //FreeAndNil(IntEmptmo);
          edtQtdeContrato.Text := IntToStr(sQtdeContrato + 1);  // Sig 127944 Ferrari
          edtVlrTotContrato.Text :=  FloatToStr(sVlrContrato);   // Sig 127944 Ferrari
          edtTotItens.Text := FloatToStr(sTotItens);  // Sig 127944 Ferrari
          First;
          EnableControls;
        End;
      // Fim    - VANDER - SOL: 168745 - KTN: 1492479
      //Andre Imakawa - SIG 80091 - Fim
      if chkEnvio.Checked then
         pnlInformaFinal.Caption  := 'Item Desviado / Executar o processo de Envio'
      else
         pnlInformaFinal.Caption  := 'Item Desviado / Envio Executado';

   end
   else
   // ----------------------------------------------------------------------------------------------
   // Processamento de Desvio e Envio
   // ----------------------------------------------------------------------------------------------
   if pgcControle.ActivePageIndex = 1 then
   begin
     if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

      try
         with qryHistMov do
         begin
            DisableControls;
            // verifica se existem item que não podem ser tratados
            if (VerificaItemNaoPodeTratar) then
            begin
             EnableControls ;
             Exit; //William Santana - SOL 219419/15902 KIN 2062272
            end;
           First;
            {
            while not(qryHistMov.EOF) do
            begin
               if FieldByName('FLGESCOLHA').AsInteger <> 0 then ExecutaDesvio;
               PreencheTabelaVirtual(False);
               qryHistMov.Next;
            end;
            }

            while not(qryHistMov.EOF) do
            begin
               if FieldByName('FLGESCOLHA').AsInteger <> 0 then
               Begin

                //Início - William Santana - SOL 219419/15902 KIN 2062272
                // pula itens que não podem ser tratados


                if ((Trim(qryHistMov.FieldByName('STATUS').AsString) = '0')
                 or (qryHistMov.FieldByName('DOCBAIXADOeRECEBIDO').AsInteger >= 1)
                 or (Trim(qryHistMov.FieldByName('SITENVIO').AsString) = '2')
                 or (Trim(qryHistMov.FieldByName('SITENVIO').AsString) = '9')) then
                begin
                  qryHistMov.Next;
                  continue;
                end;
                 //Término - William Santana - SOL 219419/15902 KIN 2062272

                 ExecutaDesvio;
                 PreencheTabelaVirtual(False);
               End;

               qryHistMov.Next;
            end;

            EnableControls;
         end;

         // Efetua o Envio para o CaR
         if (rdgFormaCobranca.ItemIndex = 0) and not(chkEnvio.Checked) then
         begin
            IntegraEmptmo.EnviaCAPCAR(MontaSelectCAPCAR('R'),
                                      sMensagem,
                                      SysDate,
                                      -1,
                                      Modulo.iMoedaCorrente,
                                      Modulo.sCentroCusto,
                                      Modulo.iPrograma,
                                      iPlanilha,
                                      sResult,
                                      sErro);
         end;

         // -------------------------------------------------------------------------------------
         // Log de operações
         if not(Sistema.GravaLogOperacoes('Trat. Parcelas Contrato ' +
                                          FloatToStr(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat) +
                                          ': Desvio')) then
         begin
            Raise Exception.Create('Falha na gravação do Log da operação.');
         end;
         // -------------------------------------------------------------------------------------

         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

         abreTabelaVirtual;

      except
         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;


         Raise;
         Repaint;
      end;
   end;

   inherited;
end;



function TfrmExecTrataItemNaoRecebido.MontaSQLItens : String;
Const
  _Operador = 'OR (';
var
   sSQL        : String;
   sSQLTratar  : String;
   sMesCompetencia, sMesCompetenciaFim : String;
begin
   // Inicio - VANDER - SOL: 168745 - KTN: 1492479
   (* ...Sempre irá selecionar uma das 3 opções do groupBox tratar... *)
   sSQLTratar := '';
   if chkBenef.Checked then
      if chkPatro.Checked then
         sSQLTratar := _Operador + ' (HME.FORMACOBRANCA = ''F'') AND  (HME.TIPOFOLHA IN (''B'', ''P'' )) )'
      Else
         sSQLTratar := _Operador + ' (HME.FORMACOBRANCA = ''F'') AND (HME.TIPOFOLHA = ''B'') )'
   Else
     if chkPatro.Checked then
        sSQLTratar := _Operador + ' (HME.FORMACOBRANCA = ''F'') AND (HME.TIPOFOLHA = ''P'') )';
   ////
   if (chkFinanceiro.Checked) then
      sSQLTratar := '   AND ( (HME.FORMACOBRANCA = ''C'')' + sSQLTratar +' ) ' + #13
   Else
      sSQLTratar := StringReplace(sSQLTratar, _Operador, 'AND (', []);
   // Fim   - VANDER - SOL: 168745 - KTN: 1492479

   //William Moreira da Silva - SOL 253185 PPM 771995
   sSQL :=
   'SELECT                                                                      '+ #13 +
   '0 AS FLGESCOLHA,                                                            '+ #13 +
   //Andre Imakawa - SIG 80091 - Inicio
   //Cássio Rovaroto - SIG nº 76900 - Início
   '0 AS VERIFICADOCUMENTO,                                                     '+ #13 +
   //'CASE                                                                        '+ #13 +
   //	 ' WHEN VER.EMISBLOQ = ''S'' THEN 1                                           '+ #13 +
   //	 ' WHEN VER.STATUS = ''2'' THEN 0                                             '+ #13 +
   //	 ' WHEN (VER.NUMLOTE IS NOT NULL) AND (VER.FLAGCANCEL <> ''C'') THEN          '+ #13 +
   //	 ' CASE                                                                       '+ #13 +
   //	 ' 	WHEN VER.QTDLANCTODOCUM  > 0 THEN 1                                       '+ #13 +
   //	 ' 	ELSE 0                                                                    '+ #13 +
   //	 '  END                                                                       '+ #13 +
   //' ELSE 0                                                                     '+ #13 +
   //' END  AS VERIFICADOCUMENTO,                                                 '+ #13 +
   //Cássio Rovaroto - SIG nº 76900 - Fim
   //Andre Imakawa - SIG 80091 - Fim
   'HE.CODDOCUMENTO,                                                            '+ #13 +
   'HME.IDHISTMOVEMPTMO,                                                        '+ #13 +
   'HME.IDCONTRATOEMPTMO,                                                       '+ #13 +
   'HME.IDITEMEMPTMO,                                                           '+ #13 +
   'ITE.ITEDESCRICAO,                                                           '+ #13 +
   'NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA,                             '+ #13 +
   'TO_CHAR(HME.DATAPREVISTA,''MM/YYYY'')AS ANOMES,                               '+ #13 +
   'HME.SEQCOBRANCA,                                                            '+ #13 +
   'HME.VLRPREVISTO,                                                            '+ #13 +
   'sum(HME.VLRPREVISTO) over(order by NVL(DEP.MATRICULA, ELP.MATRICULA),HME.IDCONTRATOEMPTMO) as tot_previsto,  '+ #13 +   // SIG 127944 Ferrari
   '(select sum(hec.VLRPREVISTO) from hmeprestacao hpr                          '+ #13 +  // SIG 127944 Ferrari
   'join hmeencargos hec on hec.idcontratoemptmo=hpr.idcontratoemptmo           '+ #13 +  // SIG 127944 Ferrari
   'where hpr.idcontratoemptmo=HME.IDCONTRATOEMPTMO                             '+ #13 +  // SIG 127944 Ferrari
   'and hpr.parcela=hec.parcela                                                 '+ #13 +  // SIG 127944 Ferrari
   'and hpr.parcela=HME.PARCELA) as VLR_ENCARGOS,                               '+ #13 +  // SIG 127944 Ferrari
   '(select COUNT(1) from hmeprestacao hpr                                      '+ #13 +  // SIG 127944 Ferrari
   'left join hmeencargos hec on hec.idcontratoemptmo=hpr.idcontratoemptmo      '+ #13 +  // SIG 127944 Ferrari
   'and hec.parcela = hpr.parcela                                                 '+ #13 +  // SIG 127944 Ferrari
   'where hpr.idcontratoemptmo=HME.IDCONTRATOEMPTMO                             '+ #13 +  // SIG 127944 Ferrari
   'and hpr.parcela=HME.PARCELA) as TOT_ITENS,                                  '+ #13 +  // SIG 127944 Ferrari
   'HME.DATAVENCTO,                                                             '+ #13 +
   'HME.PARCELA,                                                                '+ #13 +
   'HME.PARCELAALT,                                                             '+ #13 +
   'HME.NUMPARCELAS,                                                            '+ #13 +
   'DOC.STATUS,                                                                 '+ #13 +
   'TMP.SITENVIO ,                                                              '+ #13 +
   //Andre Imakawa - SIG 80091 - Inicio
   //Cássio Rovaroto - SIG nº 76900 - Início
   '(SELECT COUNT(1) FROM RECBTOPAGTO REC WHERE REC.CODDOCUMENTO = HE.CODDOCUMENTO) AS DOCBAIXADOeRECEBIDO,   '+ #13 +
   //'REC.DOCBAIXADOERECEBIDO, ' +#13 +
   //Cássio Rovaroto - SIG nº 76900 - Fim
   //Andre Imakawa - SIG 80091 - Fim
   ' ''Prestação'' AS EVENTO                                                                                     '+ #13 +

   //Ewerton Beltramini - 07/06/2021 - SIG90665
   ',LC.HISTORICOCOMPL                                                                 '+ #13 +
   ',HME.FLGENTRADAMANUAL                                                              '+ #13 +           // WO19000 Ferrari
   ',HME.DATAPREVISTA                                                                  '+ #13 +           // WO19000 Ferrari
   ',CON.TXJUROS                                                                       '+ #13 +           // WO19000 Ferrari
   'FROM                                                                                                      '+ #13 +
   'HMEPRESTACAO HME                                                                                          '+ #13 +
   'JOIN CONTRATOEMPTMO CON ON CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO                                     '+ #13 +
   'JOIN TIPOCONTREMPTMO TCE ON CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO                                 '+ #13 +
   'JOIN TIPOEMPTMO TEP ON TEP.IDTIPOEMPTMO = TCE.IDTIPOEMPTMO                                                 '+ #13 +
   'JOIN DEPENTIT DEP ON  DEP.IDTITULAR = CON.IDPESSOA                                                        '+ #13 +
   '                  AND DEP.IDPESSOA = CON.IDBENEF                                                          '+ #13 +
   'JOIN ELEGPATRO ELP ON ELP.IDPESSOA = CON.IDPESSOA                                                         '+ #13 +
   'JOIN ITEMEMPTMO ITE ON ITE.IDITEMEMPTMO = HME.IDITEMEMPTMO                                                '+ #13 +
   'LEFT JOIN HMEENVIO HE ON HE.IDHISTMOVEMPTMO = HME.IDHISTMOVEMPTMO                                         '+ #13 +
   //Andre Imakawa - SIG 80091 - Inicio
   //Cássio Rovaroto - SIG nº 76900 - Início
   //'LEFT JOIN (SELECT D1.CODDOCUMENTO, COUNT(1) AS DOCBAIXADOERECEBIDO                                        ' + #13 +
   //'             FROM DOCUMENTO D1                                                                            ' + #13 +
   //'             JOIN LANCTODOCUM L1 ON L1.CODDOCUMENTO = D1.CODDOCUMENTO AND D1.IDMODULO = 15 AND D1.RECPAG = ''R'' AND L1.OPERACAO = 5 ' + #13 +
   //'             JOIN RECBTOPAGTO R1 ON R1.CODDOCUMENTO = L1.CODDOCUMENTO AND R1.NUMLANCTO = L1.NUMLANCTO     ' + #13 +
   //'            WHERE D1.DATAVENCTO = TO_DATE(''' + DateToStr(edtDataVenctoCompetencia.Date) + ''', ''DD/MM/YYYY'') ' + #13 +
   //'            GROUP BY D1.CODDOCUMENTO) REC ON REC.CODDOCUMENTO = HE.CODDOCUMENTO                           ' + #13 +
   //Cássio Rovaroto - SIG nº 76900 - Fim
   //Andre Imakawa - SIG 80091 - Fim
   'LEFT JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = HE.CODDOCUMENTO                                             '+ #13 +
   'LEFT JOIN TMPDESC TMP ON TMP.IDTMPDESC = HE.IDTMPDESC                                                     '+ #13 +

   //Ewerton Beltramini - 07/06/2021 - SIG90665 - Inicio...
    'LEFT JOIN LANCTODOCUM LC ON LC.CODDOCUMENTO = DOC.CODDOCUMENTO AND LC.OPERACAO = 4 AND LC.CODALTERADOR = 214  '+ #13 +   //Ewerton Beltramini - 10/09/2021 - SIG119034 - Acrescentado o LEFT, antes não tinha.
   // 'LEFT JOIN CODIGOSCNAB CNAB ON LC.CODOCORRENCIA = CNAB.CODIGO AND CNAB.CODALTERADOR = LC.CODALTERADOR          '+ #13 +  // SIG 127944 Ferrari
   //Ewerton Beltramini - 07/06/2021 - SIG90665 - Fim.


   //Andre Imakawa - SIG 80091 - Inicio
   //Cássio Rovaroto - SIG nº 76900 - Início
   //'LEFT JOIN (SELECT    DOC.CODDOCUMENTO, DOC.COMPLDOCUMENTO,                                                '+ #13 +
   //'   DOC.STATUS, DOC.EMISBLOQ, DOC.CODPORTFORMA,                                                            '+ #13 +
   //'   LXD.NUMLOTE, LXD.VALOR, LXD.FLGBAIXA, LXD.LOTETRANSMISSAO,                                             '+ #13 +
   //'   LTP.FLAGEMISSAO, LTP.FLAGCANCEL,                                                                       '+ #13 +
   //'   NVL(LAC.QTDLANCTODOCUM, 0) AS QTDLANCTODOCUM                                                           '+ #13 +
   //'FROM DOCUMENTO  DOC                                                                                       '+ #13 +
   //'  LEFT JOIN  LOTEXDOCUM LXD ON DOC.CODDOCUMENTO = LXD.CODDOCUMENTO                                        '+ #13 +
   //'  LEFT JOIN LOTEPAGTO  LTP ON LXD.NUMLOTE = LTP.NUMLOTE                                                   '+ #13 +
   //'  LEFT JOIN (SELECT L1.CODDOCUMENTO, COUNT(*) AS QTDLANCTODOCUM                                           '+ #13 +
   //'			            FROM  LANCTODOCUM L1                                                                    '+ #13 +
   //'			      		    JOIN DOCUMENTO D1 ON D1.CODDOCUMENTO = L1.CODDOCUMENTO AND D1.IDMODULO = 15 AND D1.RECPAG = ''R'' '+ #13 +
   //'            		   WHERE L1.ESTORNO IS NULL                                                               '+ #13 +
   //'   				  			 AND D1.DATAVENCTO = TO_DATE(''' + DateToStr(edtDataVenctoCompetencia.Date) + ''', ''DD/MM/YYYY'') '+ #13 +
   //'   				  	  GROUP BY L1.CODDOCUMENTO) LAC ON LAC.CODDOCUMENTO = DOC.CODDOCUMENTO) VER ON VER.CODDOCUMENTO = DOC.CODDOCUMENTO '+ #13 +
   //Cássio Rovaroto - SIG nº 76900 - Fim
   //Andre Imakawa - SIG 80091 - Fim    

   'WHERE  TEP.IDEMPRESAPROP           = ' + IntToStr(Sistema.IDEmpresa)                                      + #13 +

   'AND HME.NATUREZAITEM > 0                                                                          ' + #13 +
   'AND CON.IDPATRO                 IN (' + molListaPatro.PegaPatro + ')                              ' + #13 +
   'AND CON.IDPLANOPREV             IN (' + molListaPlano.PegaPlano + ')                              ' + #13 ;

   //Ewerton Beltramini - 07/06/2021 - SIG90665 - Inicio - (Filtro de Codigos CNAB)  (Alterada a linha superior e a inferior para adaptar a inclusão do IF)
   if Trim(molListaCodigosCNAB.PegaCodigosCNAB) <> '' then
   begin
        sSQL := sSQL + ' AND (    (LC.CODOCORRENCIA         IN (' + molListaCodigosCNAB.PegaCodigosCNAB + '))                  ' + #13;
        //Ewerton Beltramini - 10/09/2021 - SIG119034 - Inicio...
        sSQL := sSQL + '       OR (LC.HISTORICOCOMPL        IN (' + molListaCodigosCNAB.PegaDescricaoCodigosCNAB + '))  )      ' + #13;  //Recolocado o Parentese de fechamento.
     //   sSQL := sSQL + '       OR (LC.CODOCORRENCIA IS NULL AND LC.HISTORICOCOMPL IS NULL) )                                   ' + #13;  //Linha incluida.    Linha retirada Ferrari WO2970
        //Ewerton Beltramini - 10/09/2021 - SIG119034 - Fim.
   end;
   //Ewerton Beltramini - 07/06/2021 - SIG90665 - Fim.

   //Ewerton Beltramini - 07/06/2021 - SIG117733 - Inicio...
   if chkInArquivo.Checked then
      sSQL := sSQL + ' AND HME.IDCONTRATOEMPTMO IN (SELECT DISTINCT IDCONTRATOEMPTMO FROM CM.CONTRATOAD WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO)'  + #13
   else if chkNotInArquivo.Checked then
      sSQL := sSQL + ' AND HME.IDCONTRATOEMPTMO NOT IN (SELECT DISTINCT IDCONTRATOEMPTMO FROM CM.CONTRATOAD WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO)' + #13;
   //Ewerton Beltramini - 07/06/2021 - SIG117733 - Fim.

   sSQL :=  sSQL + sSQLTratar + #13;

   sSQL := sSQL + '   AND TO_NUMBER(TO_CHAR(HME.DATAVENCTO,''YYYY'')) = '+ IntToStr(Trunc(DBspnAno.Value))                + #13 +
   'AND TO_NUMBER(TO_CHAR(HME.DATAVENCTO,''MM'')) = '+IntToStr(cboMes.ItemIndex + 1)                      + #13;

   //if (chkCobranca.checked) then  sSQL := sSQL +
   //'   AND ANOCOBRANCA              = ' + IntToStr(Trunc(DBspnAno.Value))                       + #13 +
   //'   AND MESCOBRANCA              = ' + IntToStr(cboMes.ItemIndex + 1)                        + #13;

   sMesCompetencia := IntToStr(cboMesCompetencia.ItemIndex + 1);
   sMesCompetenciaFim := IntToStr(cboMesCompetenciafim.ItemIndex + 1);

   if (chkCompetencia.checked) then sSQL := sSQL +
   '   AND TO_CHAR(HME.DATAPREVISTA,''YYYY/MM'') BETWEEN ('''+IntToStr(Trunc(DBspnAnoCompetencia.Value)) +'/'+Padleft(sMesCompetencia,'0',2)+''')'+ #13 +
   '                                        AND     ('''+IntToStr(Trunc(DBspnAnoCompetenciaFim.Value))+'/'+Padleft(sMesCompetenciaFim,'0',2)+''')'+ #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO        = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO            = ' + DBcboTipoEmptmo.LookupValue                           + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO       = ' + DBcboTipoContrato.LookupValue                         + #13;

   sSQL := sSQL +
   '   AND HME.DATAVENCTO              = TO_DATE(''' + DateToStr(edtDataVenctoCompetencia.Date) + ''',''DD/MM/YYYY'')        '+ #13 +
   'AND HME.FLGBAIXADO              = 0                                                                                      '+ #13 +
   'AND HME.VLREFETIVO              IS NULL                                                                                  '+ #13 +
   'AND HME.DATAEFETIVA             IS NULL                                                                                  '+ #13 +
   'AND HME.FLGQUITABONOESTORNO     = 0                                                                                      '+ #13 +
   'AND (HME.IDTIPOSUSPEMPTMO IS NULL OR (1,0) = (SELECT TS.FLGEMABERTO, TS.FLGCOBRJUDICIAL FROM TIPOSUSPEMPTMO TS WHERE TS.IDTIPOSUSPEMPTMO = HME.IDTIPOSUSPEMPTMO))     '+ #13 +
   'AND HME.IDITEMEMPTMO IN (13, 99)              '+ #13 +
   'AND EXISTS(SELECT 1 FROM PESSOAFISICA PF      '+ #13 +
   '           WHERE PF.IDPESSOA = CON.IDBENEF    '+ #13 +
   '           AND   PF.DATAMORTE IS NULL)        '+ #13 +
'ORDER BY                                         '+ #13 +
'   NVL(DEP.MATRICULA, ELP.MATRICULA),            '+ #13 +
'   HME.IDCONTRATOEMPTMO,                         '+ #13 +
'   HME.PARCELA,                                  '+ #13 +
'   TO_CHAR(HME.DATAPREVISTA,''YYYY/MM'')         '+ #13;



   {sSQL :=
   'SELECT '                                                                                       + #13 +
   '   0 AS FLGESCOLHA, '                                                                          + #13 +
   // Inicio - VANDER - SOL: 168745 - KTN: 1492479
   '   0 AS VERIFICADOCUMENTO, '                                                                   + #13 +
   '   HME.CODDOCUMENTO, '                                                                         + #13 +
   // Fim    - VANDER - SOL: 168745 - KTN: 1492479
   '   HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO , '                                               + #13 +

   '   HME.IDITEMEMPTMO, ITE.ITEDESCRICAO, '                                                       + #13 +

   '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA, '                                           + #13 +

   '   TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'') || ''/'' || TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'') AS ANOMES, '   + #13 +

   '   HME.HMESEQCOBRANCA, HME.HMEVLRPREVISTO, HME.HMEDATAVENCTO, '                                + #13 +

   '   HME.HMEPARCELA, HME.HMEPARCELAALT, HME.HMENUMPARCELAS, '                                    + #13 +

    //Início - William Santana - SOL 219419/15902 KIN 2062272
  '   DOC.STATUS,                           '                                                             + #13 +
  '   TMP.SITENVIO ,                        '                                                             + #13 +
  '   (SELECT COUNT(1) FROM RECBTOPAGTO REC WHERE REC.CODDOCUMENTO = HME.CODDOCUMENTO) AS DOCBAIXADOeRECEBIDO, '+ #13 +
  //Término - William Santana - SOL 219419/15902 KIN 2062272

   '   DECODE(HME.HMETIPOMOV, '                                                                    + #13 +
   '          0, ''Concessão/Renovação'', '                                                        + #13 +
   '          1, ''Prestação '', '                                                                 + #13 +
   '          2, ''Amortização/Refinanciamento'', '                                                + #13 +
   '          3, ''Quitação'', '                                                                   + #13 +
   '          4, ''Atualização de Débito'', '                                                      + #13 +
   '          5, ''Atualização de Saldo (Diária)'' , '                                             + #13 +
   '          6, ''Importação/Migração'', '                                                        + #13 +
   '          7, ''Ajustes (Cobrança/Devolução)'', '                                               + #13 +
   '          8, ''Ajustes (Saldo Devedor)'' '                                                     + #13 +
   '         ) AS EVENTO '                                                                         + #13 +
   'FROM '                                                                                         + #13 +
   '   HISTMOVEMPTMO   HME, '                                                                      + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                      + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                      + #13 +
   '   TIPOEMPTMO      TEP, '                                                                      + #13 +
   '   DEPENTIT        DEP, '                                                                      + #13 +
   '   ELEGPATRO       ELP, '                                                                      + #13 +
   '   ITEMEMPTMO      ITE  '                                                                      + #13 +
   //Início - William Santana - SOL 219419/15902 KIN 2062272
  ' ,   DOCUMENTO       DOC, '                                                                     + #13 +
  '     TMPDESC         TMP  '                                                                     + #13 +
  //Término - William Santana - SOL 219419/15902 KIN 2062272
   'WHERE '                                                                                        + #13 +
   '       TEP.IDEMPRESAPROP           = ' + IntToStr(Sistema.IDEmpresa)                           + #13 +


   // xavier SOL 187308
   ' AND NOT EXISTS(SELECT 1   '                                                                   + #13 +
   '                FROM  contratoemptmo c    '                                                    + #13 +
   '                JOIN  depentit d ON (c.idbenef = d.idpessoa) AND (c.idpessoa = d.idtitular) '  + #13 +
   '                JOIN  pessoa p ON (c.idbenef = p.idpessoa)   '                                 + #13 +
   '                JOIN  pessoafisica pf ON (p.idpessoa = pf.idpessoa)   '                        + #13 +
   '                WHERE c.idcontratoemptmo = HME.idcontratoemptmo      '                           + #13 +
   '                AND   pf.datamorte IS NOT NULL)                '                               + #13 +
   // xavier SOL 187308

   '   AND ( HME.HMECENTRALIZA         = 1 OR HME.HMEDESTACADO = 1 ) '                             + #13 +
 //Início - William Santana - SOL 219419/15902 KIN 2062272
 //  '   AND HMEANOCOBRANCA              = ' + IntToStr(Trunc(DBspnAno.Value))                       + #13 +
 //  '   AND HMEMESCOBRANCA              = ' + IntToStr(cboMes.ItemIndex + 1)                        + #13 +
 //Término - William Santana - SOL 219419/15902 KIN 2062272
   '   AND CON.IDPATRO                 IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   '   AND CON.IDPLANOPREV             IN (' + molListaPlano.PegaPlano + ') '                      + #13 +

 //  '   AND HME.HMETIPOMOV              NOT IN (0, 5, 8) '                                    + #13 +    //William Santana - SOL 219419/15902 KIN 2062272

   // VANDER - SOL: 168745 - KTN: 1492479
   sSQLTratar                                                                                      + #13;
   //
    //Início - William Santana - SOL 219419/15902 KIN 2062272
   if (chkCobranca.checked) then  sSQL := sSQL +
   '   AND HMEANOCOBRANCA              = ' + IntToStr(Trunc(DBspnAno.Value))                       + #13 +
   '   AND HMEMESCOBRANCA              = ' + IntToStr(cboMes.ItemIndex + 1)                        + #13;

   if (chkCompetencia.checked) then sSQL := sSQL +
   '   AND (TO_DATE(HME.HMEMESCOMPETENCIA||''/''||HME.HMEANOCOMPETENCIA, ''MM/YYYY'')) BETWEEN          '            + #13 +
   '  TO_DATE('+QuotedStr('01/'+IntToStr(cboMesCompetencia.ItemIndex + 1)+'/'+IntToStr(Trunc(DBspnAnoCompetencia.Value)))+',''DD/MM/YYYY'') '+
   '   AND '                                                                                                         +
   '  TO_DATE('+QuotedStr('01/'+IntToStr(cboMesCompetenciafim.ItemIndex + 1)+'/'+IntToStr(Trunc(DBspnAnoCompetenciaFim.Value)))+',''DD/MM/YYYY'') '+ #13;
   //Término - William Santana - SOL 219419/15902 KIN 2062272

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO        = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO            = ' + DBcboTipoEmptmo.LookupValue                           + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO       = ' + DBcboTipoContrato.LookupValue                         + #13;

   // Inicio - VANDER - SOL: 168745 - KTN: 1492479
   sSQL := sSQL +
    // '   AND ( HME.FLGDIVERGPEND        = 1 AND HME.FLGTIPODIVERG IN (9,6) ) '                      + #13 + //
   //'   AND HME.HMEANOCOMPETENCIA          = ' + IntToStr(Trunc(DBspnAnoCompetencia.Value))            + #13 +   //William Santana - SOL 219419/15902 KIN 2062272
   //'   AND HME.HMEMESCOMPETENCIA          = ' + IntToStr(cboMesCompetencia.ItemIndex + 1)             + #13 +   //William Santana - SOL 219419/15902 KIN 2062272
   '   AND HME.HMEDATAVENCTO              = TO_DATE(''' + DateToStr(edtDataVenctoCompetencia.Date) + ''',''DD/MM/YYYY'') ' + #13;
   // FIM    - VANDER - SOL: 168745 - KTN: 1492479

   sSQL := sSQL +
   '   AND HME.FLGBAIXADO              = 0 '                                                       + #13 +
   '   AND HME.HMEVLREFETIVO           IS NULL '                                                   + #13 +
   '   AND HME.HMEDATAEFETIVA          IS NULL '                                                   + #13 +
   '   AND NVL(HME.FLGESTORNADO, 0)    = 0 '                                                       + #13 +
   '   AND NVL(HME.FLGABONADO, 0)      = 0 '                                                       + #13 +
   '   AND NVL(HME.FLGQUITADO, 0)      = 0 '                                                       + #13 +
   // SOL 185074 KTN 1738438 Otacilio Aquino ** Inicio **
   '   AND (NVL(HME.FLGSUSPENSAO, 0)   = 0 OR (1,0) = (SELECT TS.FLGEMABERTO, TS.FLGCOBRJUDICIAL FROM TIPOSUSPEMPTMO TS WHERE TS.IDTIPOSUSPEMPTMO = HME.IDTIPOSUSPEMPTMO)) ' + #13 +
   // SOL 185074 KTN 1738438 Otacilio Aquino ** Fim **
   '   AND HME.IDITEMEMPTMO            = ITE.IDITEMEMPTMO '                                        + #13 +
   '   AND CON.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO '                                    + #13 +
   '   AND CON.IDBENEF                 = DEP.IDPESSOA '                                            + #13 +
   '   AND CON.IDPESSOA                = DEP.IDTITULAR '                                           + #13 +
   '   AND CON.IDPESSOA                = ELP.IDPESSOA '                                            + #13 +
   '   AND CON.IDTIPOCONTREMPTMO       = TCE.IDTIPOCONTREMPTMO '                                   + #13 +
   '   AND TCE.IDTIPOEMPTMO            = TEP.IDTIPOEMPTMO '                                        + #13 +

   // SOL 184103 KTN 1719989 Otacilio Aquino ** Inicio **
   '  AND HME.IDITEMEMPTMO IN (13, 99) ' + #13 +
   '  AND HME.HMETIPOMOV  = 1 ' + #13 +
   // SOL 184103 KTN 1719989 Otacilio Aquino ** Fim **

   //Início - William Santana - SOL 219419/15902 KIN 2062272
  '  AND HME.CODDOCUMENTO = DOC.CODDOCUMENTO(+)    '                                               + #13 +
  '  AND HME.IDTMPDESC    = TMP.IDTMPDESC(+)       '                                               + #13 +
   //Término - William Santana - SOL 219419/15902 KIN 2062272

   'ORDER BY '                                                                                     + #13 +
   '   NVL(DEP.MATRICULA, ELP.MATRICULA), HME.IDCONTRATOEMPTMO, '                                  + #13 +
   '   HME.HMEPARCELA, HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA '                              + #13;  }
   //William Moreira da Silva - SOL 253185 PPM 771995
   
   Result := sSQL;
end;



procedure TfrmExecTrataItemNaoRecebido.FormShow(Sender: TObject);
begin
   inherited;

   // Preenche a listbox de Patro...
   molListaPatro.PreenchePatro;
   //  ...e marca todas por default
   molListaPatro.btnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlano.btnMarcaTodosPlanoClick(self);

   //Ewerton Beltramini - Sig 90665 - 07/06/2021 - inicio...
   // Preenche a listbox de CodigosCNAB...
   molListaCodigosCNAB.PreencheCodigosCNAB;
   //  ...e marca todas por default
   molListaCodigosCNAB.btnMarcaTodosCodigosCNABClick(self);
   //Ewerton Beltramini - Sig 90665 - 07/06/2021 - Fim.


   ParametrosSistema;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      chkEnvio.Checked         := True;
      //Pendência 26189 - 13/09/2007 - Alberto
   end;

   cboMes.ItemIndex  := DiasUteis.ExtraiMes(Sysdate) - 1;
   DBspnAno.Value    := DiasUteis.ExtraiAno(Sysdate);

   // Inicio - VANDER - SOL: 168745 - KTN: 1492479
   cboMesCompetencia.ItemIndex  := cboMes.ItemIndex;
   DBspnAnoCompetencia.Value    := DBspnAno.Value;
   rdgFormaCobranca.ItemIndex   := 0;
   // Fim    - VANDER - SOL: 168745 - KTN: 1492479

   //Início - William Santana - SOL 219419/15902 KIN 2062272
   chkCalcEncargo.Checked          := true;
   cboMesCompetenciaFim.ItemIndex  := cboMes.ItemIndex;
   DBspnAnoCompetenciaFim.Value    := DBspnAno.Value;
   //Término - William Santana - SOL 219419/15902 KIN 2062272

end;



procedure TfrmExecTrataItemNaoRecebido.btnInverteSelecaoClick(Sender: TObject);
var
   bMostra: Boolean;
begin
   inherited;

   bMostra := False;

   if qryHistMov.RecordCount > 100 then
   begin
      qryHistMov.DisableControls;

      { Acerta tela de acompanhamento }
      frmAguarde.Max := qryHistMov.RecordCount;
      frmAguarde.Pos := 0;

      frmAguarde.Mostra('Processando, Aguarde...');

      bMostra := True;
   end;

   qryHistMov.First;
   while not(qryHistMov.EOF) do
   begin
      qryHistMov.Edit;
      if qryHistMov.FieldByName('FLGESCOLHA').AsString = '1' then
      begin
         qryHistMov.FieldByName('FLGESCOLHA').AsString := '0';
      end
      else
      begin
         qryHistMov.FieldByName('FLGESCOLHA').AsString := '1';
      end;

      qryHistMov.Next;

      (* Atualiza tela de acompanhamento *)
      if bMostra then frmAguarde.Pos := frmAguarde.Pos + 1;
   end;

   if qryHistMov.Active then qryHistMov.First;

   qryHistMov.EnableControls;

   if bMostra then frmAguarde.Apaga;
end;



procedure TfrmExecTrataItemNaoRecebido.btnMarcaTodosClick(Sender: TObject);
var
   Mostra: Boolean;
begin
   inherited;

   Mostra := False;

   if qryHistMov.RecordCount > 100 then
   begin
      qryHistMov.DisableControls;

      // Acerta tela de acompanhamento
      frmAguarde.Max := qryHistMov.RecordCount;
      frmAguarde.Pos := 0;

      frmAguarde.Mostra('Processando, Aguarde...');

      Mostra := True;
   end;

   qryHistMov.First;
   while not(qryHistMov.EOF) do
   begin
      qryHistMov.Edit;
      qryHistMov.FieldByName('FLGESCOLHA').AsString := '1';
      qryHistMov.Post;

      qryHistMov.Next;

      if Mostra = True then
      begin
         // Atualiza tela de acompanhamento
         frmAguarde.Pos := frmAguarde.Pos + 1;
      end;
   end;

   if qryHistMov.Active then qryHistMov.First;

   qryHistMov.EnableControls;

   if Mostra = True then frmAguarde.Apaga;
end;



procedure TfrmExecTrataItemNaoRecebido.DBgrdHistMovCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   if qryHistMov.IsEmpty then Exit;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not(Highlight) then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if (Sender as TwwDBGrid).CalcCellRow mod 2 = 0 then
         begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end
         else // if (Sender as TwwDBGrid).CalcCellRow mod 2 = 0
         begin
            ABrush.Color := clWhite;
         end;

         // Caso Selecionado muda cor
         if qryHistMov.FieldByName('FLGESCOLHA').AsInteger = 1 then
         begin
            AFont.Color  := clWhite;
            ABrush.Color := clNavy;
         end;
      end;
   end
   else // if State <> [gdSelected]
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end; // if State <> [gdSelected]

   //Início - William Santana - SOL 219419/15902 KIN 2062272
   if  (Trim(qryHistMov.FieldByName('STATUS').AsString) = '0')
    or (qryHistMov.FieldByName('DOCBAIXADOeRECEBIDO').AsInteger >= 1)
    or (Trim(qryHistMov.FieldByName('SITENVIO').AsString) = '2')
    or (Trim(qryHistMov.FieldByName('SITENVIO').AsString) = '9')
   then
   begin
       ABrush.Color := clRed;
   end;
   //Término - William Santana - SOL 219419/15902 KIN 2062272

end;



function TfrmExecTrataItemNaoRecebido.MontaSelectCAPCAR(const sRecPag: String): String;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT  '                                                                                + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                         + #13 +
   '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, '                                          + #13 +
   '  ABS(NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO, '                                   + #13 +
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                               + #13 +
   '  HME.HMEPARCELA, HME.HMENUMPARCELAS, HME.HMESALDODEV, '                                 + #13 +
   '  HME.HMETIPOMOV, '                                                                      + #13 +

   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || '                                                                          + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +

   '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                 + #13 +

   //Pendência 23255 - 09/10/2006 - Alberto
   '  CON.IDPLANOPREV, NVL(MIG.IDPLANOCONTATU, CON.IDPLANOPREV) AS IDPLANOORIGEM, '          + #13 +
   '  MIG.IDPATROATU AS IDPATRO, CON.IDBENEF, CON.IDPESSOA, CON.MATRICULA, '                 + #13 +
   //Fim Pendência 23255

   //Pendência 26189 - 17/09/2007 - Alberto
   '  CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.IDCBANCARIA, '                                  + #13;

   if DBcboFormaRecebimento.LookupValue <> '' then
        sSQL := sSQL + DBcboFormaRecebimento.LookupValue + ' AS PORTFORMAREC, '              + #13
   else
        sSQL := sSQL + 'DECODE(CON.PORTFORMAREC, '''', ' +
                       dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsString +
                       ', CON.PORTFORMAREC) AS PORTFORMAREC, '                               + #13;
   sSQL := sSQL +
   //Fim Pendência 26189

   '  CON.IDCBANCARIADEB, CON.IDTIPOCONTREMPTMO, ITE.ITEDESCRICAO, CON.FLGINTERNO, '         + #13 +
   '  TSE.FLGATUALSALDOENV, TSE.IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO '                     + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +

   //Pendência 23255 - 09/10/2006 - Alberto
   '  VWMIGRACONTRATOEP MIG, '                                                               + #13 +
   //Fim Pendência 23255

   '  ( '                                                                                    + #13 +
   '  SELECT '                                                                               + #13 +
   '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO, '     + #13 +
   '     CON.IDVERBA,               CON.FLGSITUACAO, '                                       + #13 +
   '     CON.NUMPARCELAS               AS PRAZO, '                                           + #13 +
   '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS, '             + #13 +

   '     TEP.IDEMPRESAPROP,         CON.IDPATRO, '                                           + #13 +
   '     CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS IDPLANOORIGEM, '        + #13 +
   '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO, '                                      + #13 +
   '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '                                    + #13 +
   '     CON.IDPESSOA,              CON.IDBENEF, '                                           + #13 +
   '     CON.MOECODIGO, CON.IDCBANCARIADEB, '                                                + #13 +

   '     CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '             + #13 +

   '     ELP.MATRICULA, ELP.MATRICULA AS MATRICULA_TIT, '                                    + #13 +

   '     CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO, '                                  + #13 +

   '     PPP.INSCRICAONUMERO, '                                                              + #13 +
   '     NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO, '                                 + #13 +
   '     NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO, '                                      + #13 +
   '     NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA, '                                    + #13 +

   '     SIT.IDSITPART,             SIT.FLGINTERNO, '                                        + #13 +
   '     SIT.DESCRICAO                 AS SIT_TITULAR, '                                     + #13 +
   '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SITDESCRICAO ' + #13 +
   '  FROM '                                                                                 + #13 +
   '     CONTRATOEMPTMO  CON, '                                                              + #13 +
   '     PARTPREVPLAN    PPP, '                                                              + #13 +
   '     ELEGPATRO       ELP, '                                                              + #13 +
   '     PATRO           PTR, '                                                              + #13 +
   '     TIPOCONTREMPTMO TCE, '                                                              + #13 +
   '     TIPOEMPTMO      TEP, '                                                              + #13 +
   '     SITPART         SIT, '                                                              + #13 +
   '     SITPLANOPREV    SPP  '                                                              + #13 +
   '  WHERE '                                                                                + #13 +
   '         CON.IDPATRO           = PTR.IDPESSOA '                                          + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '     AND CON.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)     + #13;

   sSQL := sSQL +
   '     AND CON.IDPESSOA          = ELP.IDPESSOA '                                          + #13 +
   '     AND CON.IDPESSOA          = PPP.IDPESSOA '                                          + #13 +
   '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '                                         + #13 +
   '     AND PTR.IDPESSOA          = PPP.IDPESSJUR '                                         + #13 +
   '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                 + #13 +
   '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                      + #13 +
   '     AND PPP.IDSITPART         = SIT.IDSITPART '                                         + #13 +
   '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                    + #13 +

   '     AND PPP.FLGDESATIVADO     = 0 '                                                     + #13 +

   '  ) CON, '                                                                               + #13 +

   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  ITEMEMPTMO      ITE, '                                                                 + #13 +
   '  TIPOSUSPEMPTMO  TSE  '                                                                 + #13;

   sSQL := sSQL + MontaWhereCAPCAR(sRecPag);

   //Pendência 23255 - 09/10/2006 - Alberto
   sSQL := sSQL +
   '   AND MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '                                     + #13 +
   '   AND MIG.DATAMIGRA        = (select max(DATAMIGRA) '                                   + #13 +
   '                               from   VWMIGRACONTRATOEP '                                + #13 +
   '                               where  IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '          + #13 +
   '                               and    DATAMIGRA <= HME.HMEDATAPREVISTA) '                + #13;
   //Fim Pendência 23255

   sSQL := sSQL +
   'ORDER BY '                                                                               + #13 +
   '   CON.IDCONTRATOEMPTMO, HME.HMEPARCELA, HME.HMEDATAVENCTO ';

   Result := sSQL;
end;



function TfrmExecTrataItemNaoRecebido.MontaWhereCAPCAR(const sRecPag: String): String;
var
   sSQL : String;
begin
   sSQL :=
   'WHERE '                                                                                  + #13 +
   '       ( HME.HMEFORMACOBRANCA   = ''C'' ) '                                              + #13 +
   '   AND ( HME.HMERECPAG          = ''' + sRecPag + ''' ) '                                + #13;

   sSQL := sSQL + MontaWhereComum;

   sSQL := sSQL +
   '   AND ( CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') ) '                 + #13;

   Result := sSQL;
end;



function TfrmExecTrataItemNaoRecebido.MontaWhereComum: String;
var
   sSQL : String;
begin
   sSQL :=
   '   AND ( HME.HMETIPOMOV         NOT IN (0, 5, 8) ) '                                               + #13 +
   '   AND ( HME.FLGENVIO           = 0 ) '                                                            + #13 +
   '   AND ( HME.FLGBAIXADO         = 0 ) '                                                            + #13 +
   '   AND ( HME.HMEVLREFETIVO      IS NULL ) '                                                        + #13 +
   '   AND ( HME.HMEDATAEFETIVA     IS NULL ) '                                                        + #13 +
   '   AND ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO       = 1 ) '                              + #13 +
   '   AND ( HME.FLGESTORNADO       IS NULL OR HME.FLGESTORNADO   = 0 ) '                              + #13 +
   '   AND ( HME.FLGABONADO         IS NULL OR HME.FLGABONADO     = 0 ) '                              + #13 +
   '   AND ( HME.FLGQUITADO         IS NULL OR HME.FLGQUITADO     = 0 ) '                              + #13 +
   // SOL 185074 KTN 1738438 Otacilio Aquino ** Inicio **
   '   AND ( HME.FLGSUSPENSAO       IS NULL OR HME.FLGSUSPENSAO = 0 OR (1,0) = (SELECT TS.FLGEMABERTO, TS.FLGCOBRJUDICIAL FROM TIPOSUSPEMPTMO TS WHERE TS.IDTIPOSUSPEMPTMO = HME.IDTIPOSUSPEMPTMO)  ) ' + #13 +
   // SOL 185074 KTN 1738438 Otacilio Aquino ** Fim **
   '   AND ( CON.FLGSITUACAO        <> ''C'' ) '                                             + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND ( CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + ' ) '     + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND ( CON.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue + ' ) '                + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND ( CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13;


   sSQL := sSQL +
   '   AND ( CON.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                + #13 +

   '   AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO  ) '                              + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = HME.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( CON.IDTIPOSUSPEMPTMO   = TSE.IDTIPOSUSPEMPTMO(+) ) '                            + #13 +

   // SOL 184103 KTN 1719989 Otacilio Aquino ** Inicio **
   '   AND ( HME.IDITEMEMPTMO IN (13, 99) ) ' + #13 +
   '   AND ( HME.HMETIPOMOV  = 1 ) ' + #13;
   // SOL 184103 KTN 1719989 Otacilio Aquino ** Fim **

   Result := sSQL;
end;



function TfrmExecTrataItemNaoRecebido.VerificaPreenchimento: Boolean;
begin

   Result := False;

   try

      if not(chkBenef.Checked) and not(chkPatro.Checked) And not(chkFinanceiro.Checked) then
      //  raise EValidacao.CreateVal('É necessário indicar o tipo de Folha!', chkBenef);
        raise EValidacao.CreateVal('É necessário indicar o destino de cobrança a tratar.', chkBenef);

      // Inicio - VANDER - SOL: 168745 - KTN: 1492479
      if length(trim(edtDataVenctoCompetencia.Text)) = 0 then
      //   raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenctoCompetencia);
         raise EValidacao.CreateVal('É necessário indicar a data de vencimento.', edtDataVenctoCompetencia); //William Santana - SOL 219419/15902 KIN 2062272
      // Fim    - VANDER - SOL: 168745 - KTN: 1492479

      if length(trim(edtDataVencto.Text)) = 0 then
      //   raise EValidacao.CreateVal('É necessário indicar a NOVA Data de Vencimento!', edtDataVencto);
         raise EValidacao.CreateVal('É necessário indicar a nova data de vencimento.', edtDataVencto);  //William Santana - SOL 219419/15902 KIN 2062272

      //Início - William Santana - SOL 219419/15902 KIN 2062272
      if (edtDataVenctoCompetencia.date >= edtDataVencto.Date) then  //( DataVencto >= NovaDataVencto)
         raise EValidacao.CreateVal('A nova data de vencimento deverá ser maior que a data de vencimento atual.', edtDataVencto);

      if (not(chkCompetencia.checked or chkCobranca.checked)) or
         (chkCompetencia.checked and ((trim(DBspnAnoCompetencia.Text) = '') or (trim(DBspnAnoCompetenciafim.Text) = ''))) or
         (chkCobranca.checked and (trim(DBspnAno.Text) = ''))
       then
         raise EValidacao.CreateVal('É obrigatório indicar mês e ano de competência ou cobrança. ', edtDataVencto);
       //Térimino - William Santana - SOL 219419/15902 KIN 2062272

        //Pendência 26189 - 17/09/207 - Alberto
      if (rdgFormaCobranca.ItemIndex = 0) and
           (DBcboFormaRecebimento.Text = '')  then
       //    MsgDlg('Não foi indicada Conta-Caixa x Forma Recebimento Diferenciada. ' +
       //         'Será utilizada a padronizada nos parâmetros do sistema.', 'Empréstimo', mtWarning, [mbOk], 0);
       //Fim Pendência 26189
       //Início - William Santana - SOL 219419/15902 KIN 2062272
          if (MsgDlg('Não foi indicada nova Conta-caixa x Forma Recebimento Diferenciada. ' +
                 'Será utilizada a forma padronizada nos parâmetros do sistema.',
                 'Empréstimo', mtWarning, mbOKCancel, 0) = mrCancel ) then
           Exit;
       //Térimino - William Santana - SOL 219419/15902 KIN 2062272

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


//Pendência 26189 - 17/09/2007 - Alberto
procedure TfrmExecTrataItemNaoRecebido.rdgFormaCobrancaClick(Sender: TObject);
begin
  inherited;

   if rdgFormaCobranca.ItemIndex = 0 then
   begin
      if (molContratoEmptmo.IDContrato > 0) then
         DBcboFormaRecebimento.LookupValue := dtmEmptmo.qryDadosContratoPORTFORMAREC.AsString;

      AtualizaConjunto(True,pnlCAR);

   end else begin

      DBcboFormaRecebimento.Clear;
      AtualizaConjunto(False,pnlCAR);

   end;

   btnAtribuiParametro.Enabled := DBcboFormaRecebimento.Enabled;

end;


procedure TfrmExecTrataItemNaoRecebido.AbreQueriesDebito;
begin
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IdEmpresa;
      Open;
   end;

   with dtmLookEmptmo.qryLookPortadorFormaR do begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;
end;


procedure TfrmExecTrataItemNaoRecebido.FormCreate(Sender: TObject);
begin
   inherited;

   AbreQueriesDebito;

   if dtmEmptmo.qryParamEmptmoFLGFORMAREC.AsString = 'C' then
      rdgFormaCobranca.ItemIndex := 0
   else
      rdgFormaCobranca.ItemIndex := 1;

   contratoeparcela := TStringList.Create; //William Santana - SOL 219419/15902 KIN 2062272;
end;


procedure TfrmExecTrataItemNaoRecebido.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);

   if molContratoEmptmo.IDContrato <> 0 then begin

      with dtmEmptmo.qryDadosContrato do begin
         LimpaParametros(dtmEmptmo.qryDadosContrato);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;
         Open;
      end;

      DBcboTipoEmptmo.LookupValue   := dtmEmptmo.qryDadosContratoIDTIPOEMPTMO.AsString;
      DBcboTipoContrato.LookupValue := dtmEmptmo.qryDadosContratoIDTIPOCONTREMPTMO.AsString;

   end;

   DBcboTipoEmptmo.Enabled       := molContratoEmptmo.IDContrato <> 0;
   DBcboTipoContrato.Enabled     := molContratoEmptmo.IDContrato <> 0;

   DeterminaFormaCobranca(molContratoEmptmo.IDContrato, '');

end;


procedure TfrmExecTrataItemNaoRecebido.DBcboTipoEmptmoChange(Sender: TObject);
begin
  inherited;

  DBcboTipoContrato.Enabled := ( DBcboTipoEmptmo.LookupValue <> '' );

  if DBcboTipoContrato.Enabled then begin

     with dtmLookEmptmo.qryLookTipoContrato do begin
        LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);
        ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IdEmpresa;
        ParamByName('PIDTIPOEMPTMO').AsString   := DBcboTipoEmptmo.LookupValue;
        Open;
     end;

  end;

end;


procedure TfrmExecTrataItemNaoRecebido.DBcboTipoContratoChange(Sender: TObject);
begin
  inherited;

  rdgFormaCobranca.ItemIndex := -1;

  DeterminaFormaCobranca(0, DBcboTipoContrato.LookupValue);

end;



procedure TfrmExecTrataItemNaoRecebido.DeterminaFormaCobranca(
             idContrato: Double;
             idTipoContrEmptmo: String);
begin

   rdgFormaCobranca.ItemIndex := -1;

   //Procura forma de recebimento do contrato
   if (idContrato > 0) then
   begin
      DBcboTipoEmptmo.LookupValue := dtmEmptmo.qryDadosContratoIDTIPOEMPTMO.AsString;

      if not dtmEmptmo.qryDadosContratoFLGFORMAREC.IsNull then
      begin
         if dtmEmptmo.qryDadosContratoFLGFORMAREC.AsString = 'C' then
            rdgFormaCobranca.ItemIndex := 0
         else
            rdgFormaCobranca.ItemIndex := 1;
      end;
   end;

   //Procura forma de recebimento do tipo de contrato
   if (rdgFormaCobranca.ItemIndex = -1) and
      (idTipoContrEmptmo <> '') and
      not dtmLookEmptmo.qryLookTipoContratoFLGFORMAREC.IsNull then
   begin
      if dtmLookEmptmo.qryLookTipoContratoFLGFORMAREC.AsString = 'C' then
         rdgFormaCobranca.ItemIndex := 0
      else
         rdgFormaCobranca.ItemIndex := 1;

   end;

   //Procura forma de recebimento da parametrização
   if (rdgFormaCobranca.ItemIndex = -1) then
   begin
      if dtmEmptmo.qryParamEmptmoFLGFORMAREC.AsString = 'C' then
         rdgFormaCobranca.ItemIndex := 0
      else
         rdgFormaCobranca.ItemIndex := 1;
   end;
end;



procedure TfrmExecTrataItemNaoRecebido.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnLimpaContratoClick(Sender);

  DBcboTipoEmptmo.Clear;
  DBcboTipoContrato.Clear;

  DBcboTipoEmptmo.Enabled := true;

end;
//Fim Pendência 26189



procedure TfrmExecTrataItemNaoRecebido.btnAtribuiParametroClick(Sender: TObject);
begin
  inherited;
   DBcboFormaRecebimento.LookupValue := IntToStr(dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsInteger);
end;

procedure TfrmExecTrataItemNaoRecebido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  UFuncoesEmptmo.bBuscaMutuario := false;

  FreeAndNil(contratoeparcela);  //William Santana - SOL 219419/15902 KIN 2062272
end;

//Início - William Santana - SOL 219419/15902 KIN 2062272
function TfrmExecTrataItemNaoRecebido.VerificaItemNaoPodeTratar(): boolean;
var
  p1,p2,p3: boolean;
begin
  //Existem 3 casos que não podem ser tratados, cada um com sua mensagem de validação
  // se o usuáirio clicar em SIM, não deverá repetir a mesma mensagem

  Result := false;
  p1 := false; p2 := false; p3 := false;

  qryHistMov.first;

  while not(qryHistMov.eof) do
  begin
    if (qryHistMov.FieldByName('FLGESCOLHA').AsInteger <> 0) then
    begin
      if (Trim(qryHistMov.FieldByName('STATUS').AsString) = '0') then
      begin
       if (not(p1) and (MsgDlg('Há itens que não podem ser tratados devido ao vínculo com documento não baixado. '+
          'Deseja continuar, mas sem tratar esses itens?', 'Empréstimo', mtWarning, [mbYes, mbNo], 0) = mrNo)) then
          begin
            Result := true;
            Exit;
          end
       else
        p1 := true;

      end
      else
      if (qryHistMov.FieldByName('DOCBAIXADOeRECEBIDO').AsInteger >= 1) then
      begin
       if (not(p2) and (MsgDlg('Há itens que não podem ser tratados devido ao vínculo com documento baixado e recebido. '+
          'Realize o Recebimento Automático. '+
          'Deseja continuar, mas sem tratar esses itens?', 'Empréstimo', mtWarning, [mbYes, mbNo], 0) = mrNo)) then
          begin
            Result := true;
            Exit;
          end
       else
        p2 := true;

      end
      else
      if (Trim(qryHistMov.FieldByName('SITENVIO').AsString) = '2')
       or (Trim(qryHistMov.FieldByName('SITENVIO').AsString) = '9') then
      begin
       if (not(p3) and (MsgDlg('Há itens que não podem ser tratados devido ao pagamento ter sido efetuado na folha. '+
         'Realize o Recebimento Automático. '+
         'Deseja continuar, mas sem tratar esses itens?', 'Empréstimo', mtWarning, [mbYes, mbNo], 0) = mrNo)) then
          begin
            Result := true;
            Exit;
          end
       else
       p3 := true;
      end;
    end;
    qryHistMov.Next;
  end;

end;

function TfrmExecTrataItemNaoRecebido.PadLeft(const Str, Caracter: string; const Tamanho: Integer): string;
begin
  Result := Str;
  while Length(Result) < Tamanho do
    Result := Caracter + Result;
end;

Procedure TfrmExecTrataItemNaoRecebido.abreTabelaVirtual();
var
  sSQL : string;
begin

  //William Moreira da Silva - SOL 260658 PPM 1039277
  sSQL :=  'SELECT c.idcontratoemptmo AS CONTRATO,' +
          '       d.matricula AS MATRICULA,' +
          '       CAST(to_char(h.hmeanocobranca) || ''/'' || trim(to_char(h.hmemescobranca,''00'')) AS VARCHAR2(8)) AS MESCOBRANCA,' +  // Paulo Nobre - MIGRACAO-ORACLE-2025   
          '       h.hmeparcelaalt AS PAR,' +
          '       h.hmeparcela AS CE,' +
          '       h.hmenumparcelas AS LAS,' +
          '       i.itedescricao AS ITEM,' +
          '       h.hmedatavencto AS NOVOVENCTO,' +
          '       SUM(h.hmevlrprevisto) AS VALOR' +
           //William Moreira da Silva - SOL 260658 PPM 1039277
          ' FROM histmovemptmo h' +
          '     JOIN contratoemptmo c ON c.idcontratoemptmo = h.idcontratoemptmo' +
          '     JOIN depentit d ON d.idpessoa = c.idbenef' +
          '                     AND d.idtitular = c.idpessoa' + 
          '     JOIN itememptmo i ON i.iditememptmo = decode(h.iditememptmo,99,99,13)' + 
          ' WHERE h.hmetipomov IN (1,4)' + 
          ' AND   h.hmecentraliza + h.hmedestacado = 1' + 
          ' AND   h.hmedatavencto = '+ QuotedStr(edtDataVencto.text )  + 
          ' AND   h.hmemescobranca = '+ intTostr(DiasUteis.ExtraiMes(edtDataVencto.DateTime)) +   
          ' AND   h.hmeanocobranca = '+ intTostr(DiasUteis.ExtraiAno(edtDataVencto.DateTime)) +   
          ' AND   NVL(h.flgabonado,0) = 0' +
          ' AND   NVL(h.flgestornado,0) = 0' + 
          ' AND   NVL(h.flgquitado,0) = 0' + 
          ' AND   (NVL(h.flgsuspensao,0) = 0' + 
          '       OR' + 
          '       1 = (SELECT ts.flgemaberto FROM tiposuspemptmo ts' + 
          '            WHERE ts.idtiposuspemptmo = h.idtiposuspemptmo))' + 
          ' AND   h.hmevlrefetivo IS NULL' +
          ' AND   h.hmedataefetiva IS NULL' + 
          ' AND   (c.idcontratoemptmo,h.hmeparcela) IN ('+contratoeparcela.GetText+'(0,0))' + 
          ' GROUP BY c.idcontratoemptmo,' + 
          '         d.matricula,' + 
          '         to_char(h.hmeanocobranca) || ''/'' || trim(to_char(h.hmemescobranca,''00'')),' + 
          '         h.hmeparcela,' + 
          '         h.hmeparcelaalt,' + 
          '         h.hmenumparcelas,' +
          '         i.itedescricao,' + 
          '         h.hmedatavencto';


  qryHistMovVirtual.Close;
  qryHistMovVirtual.SQL.Clear;
  qryHistMovVirtual.SQL.Add(sSQL);
  qryHistMovVirtual.Open;
end;

//Término - William Santana - SOL 219419/15902 KIN 2062272

//Andre Imakawa - SIG 80302 - Inicio
function TfrmExecTrataItemNaoRecebido.VerificaDocumento(const fDocumento : Extended;
                                          var   sMsg       : String
                                         ): Integer;
var
  qryVerificaDocumento, qryVerificaLanctoDocum: TwwQuery;

begin
   Result := 0;
   
   qryVerificaDocumento := TwwQuery.Create(nil);
   qryVerificaDocumento.DatabaseName := 'BaseDados';
   qryVerificaLanctoDocum := TwwQuery.Create(nil);
   qryVerificaLanctoDocum.DatabaseName := 'BaseDados';

   try

      try         

         qryVerificaDocumento.SQL.Text := ' SELECT DOC.CODDOCUMENTO, DOC.COMPLDOCUMENTO,           '   + #13 +
                            ' DOC.STATUS, DOC.EMISBLOQ, DOC.CODPORTFORMA,                          '   + #13 +
                            ' LXD.NUMLOTE, LXD.VALOR, LXD.FLGBAIXA, LXD.LOTETRANSMISSAO,           '   + #13 +
                            ' LTP.FLAGEMISSAO, LTP.FLAGCANCEL                                      '   + #13 +
                            ' FROM                                                                 '   + #13 +
                            ' DOCUMENTO  DOC,                                                      '   + #13 +
                            ' LOTEXDOCUM LXD,                                                      '   + #13 +
                            ' LOTEPAGTO  LTP                                                       '   + #13 +
                            ' WHERE                                                                '   + #13 +
                            ' DOC.CODDOCUMENTO =' + floattostr(fDocumento) + '                     '   + #13 +
                            ' AND DOC.CODDOCUMENTO = LXD.CODDOCUMENTO(+)                           '   + #13 +
                            ' AND LXD.NUMLOTE      = LTP.NUMLOTE(+)                                ';

         qryVerificaDocumento.open;

         if not(qryVerificaDocumento.isEmpty) then
         begin
            if qryVerificaDocumento.FieldByName('EMISBLOQ').AsString = 'S' then
            begin
               sMsg     := 'Arquivo de pagamento já enviado. A operação não pode ser efetuada.';
               Result   := -2;
            end;

            if trim(qryVerificaDocumento.fieldByName('STATUS').AsString) = '2' then
            begin
               sMsg     := 'O Documento já foi baixado. A operação não pode ser efetuada.';
               Result   := -3;
            end;


            if not(qryVerificaDocumento.fieldByName('NUMLOTE').IsNull)
               and (qryVerificaDocumento.fieldByName('FLAGCANCEL').AsString <> 'C') then
            begin



               qryVerificaLanctoDocum.SQL.Text := 'SELECT COUNT(*) AS QTDLANCTODOCUM' + #13#10 +
                                                  '  FROM LANCTODOCUM' + #13#10 +
                                                  ' WHERE ESTORNO IS NULL' + #13#10 +
                                                  '   AND CODDOCUMENTO = ' + floattostr(fDocumento) ;


               qryVerificaLanctoDocum.open;

               if qryVerificaLanctoDocum.FieldByName('QTDLANCTODOCUM').AsInteger > 0 then
               begin
                 sMsg     := 'O Documento já está contido em um Lote. A operação não pode ser efetuada.';
                 Result   := -5;
               end
               else
               begin
                 sMsg     := 'Documento está contido e estornado em um Lote.';
                 Result   := -6;
               end;

            end;

         end
         else
         begin
            sMsg     := 'Não foi encontrado documento.';
            Result   := -4;
         end;

      except
         Result := -1;
      end;

   finally
      qryVerificaDocumento.Close;
      qryVerificaLanctoDocum.Close;
      FreeAndNil(qryVerificaDocumento);
      FreeAndNil(qryVerificaLanctoDocum);
   end;
end;
//Andre Imakawa - SIG 80302 - Fim

procedure TfrmExecTrataItemNaoRecebido.molListaPatrobtnInvertePatroClick(
  Sender: TObject);
begin
  inherited;
  molListaPatro.btnInvertePatroClick(Sender);

end;

//Ewerton Beltramini - Sig 90665 - 07/06/2021 - Inicio...
procedure TfrmExecTrataItemNaoRecebido.btnInvertePatroClick(
  Sender: TObject);
begin
  inherited;
  molListaCodigosCNAB.btnInverteCodigosCNABClick(Sender);   //Ewerton Beltramini - Sig 90665 - 07/06/2021.
end;

procedure TfrmExecTrataItemNaoRecebido.molListaCodigosCNABClick(
  Sender: TObject);
begin
  inherited;
  molListaCodigosCNAB.btnInverteCodigosCNABClick(Sender); //Ewerton Beltramini - Sig 90665 - 07/06/2021.
end;

procedure TfrmExecTrataItemNaoRecebido.molListaCodigosCNABbtnMarcaTodosCodigosCNABClick(
  Sender: TObject);
begin
  inherited;
  molListaCodigosCNAB.btnMarcaTodosCodigosCNABClick(Sender);  //Ewerton Beltramini - Sig 90665 - 07/06/2021.

end;
//Ewerton Beltramini - Sig 90665 - 07/06/2021 - Fim.
procedure TfrmExecTrataItemNaoRecebido.molListaPatrobtnMarcaTodosPatroClick(
  Sender: TObject);
begin
  inherited;
  molListaPatro.btnMarcaTodosPatroClick(Sender);
end;


//Ewerton Beltramini - 07/06/2021 - SIG117733 - Inicio...
procedure TfrmExecTrataItemNaoRecebido.chkInArquivoClick(Sender: TObject);
begin
  inherited;
  if (chkNotInArquivo.Checked) then
      chkNotInArquivo.Checked := False;
end;
procedure TfrmExecTrataItemNaoRecebido.chkNotInArquivoClick(
  Sender: TObject);
begin
  inherited;
  if (chkInArquivo.Checked) then
      chkInArquivo.Checked := False;
end;
//Ewerton Beltramini - 07/06/2021 - SIG117733 - Fim.

// Inicio WO19000 Ferrari
function TfrmExecTrataItemNaoRecebido.CalculoAtualizacao(DataPrevista,
  Valor_Parcela, Data_atualizada: string; ItemParcela: Integer;
  Taxa_Juros: string): string;
var
  sSqlCalc : string;
begin
  sSqlCalc := '';
  qryCalculos.Close;
  qryCalculos.SQL.Clear;
  case ItemParcela of
     42:  sSqlCalc := 'select CM.FN_EMP_CALC_CORRECAO_MONETARIA('''+ DataPrevista + ''',' + OraNumero(Valor_Parcela) + ',''' + Data_atualizada + ''') as valor_calculado from dual ';
     43:  sSqlCalc := 'select CM.FN_EMP_CALC_JUR_REMUNERATORIO('''+ DataPrevista + ''',' + OraNumero(Valor_Parcela) + ', CM.FN_EMP_CALC_CORRECAO_MONETARIA('''+ DataPrevista + ''',' + OraNumero(Valor_Parcela) + ',''' + Data_atualizada + '''),' + OraNumero(Taxa_Juros) + ','''  + Data_atualizada + ''') as valor_calculado from dual ';
     44:  sSqlCalc := 'select CM.FN_EMP_CALC_MULTA('''+ DataPrevista + ''',' + OraNumero(Valor_Parcela) + ') as valor_calculado from dual ';
     46:  sSqlCalc := 'select CM.FN_EMP_CALC_JUROS_MORATORIOS('''+ DataPrevista + ''',' + OraNumero(Valor_Parcela) + ',''' + Data_atualizada + ''') as valor_calculado from dual ';
  end;    // WO10891 Ferrari

  qryCalculos.SQL.Text := sSqlCalc;
  qryCalculos.Open;
  Result := qryCalculos.FieldByName('valor_calculado').AsString;
end;

function TfrmExecTrataItemNaoRecebido.CalculoAtualizacaoIOF(DataPrevista,
  DataCredito: string; NumParcela, ParcRestantes: Integer; Taxa_Juros,
  Valor_Parcela, Data_atualizada, SistemaAmort: string): string;
var
  sSqlCalc : string;
begin
  sSqlCalc := '';
  qryCalculos.Close;
  qryCalculos.SQL.Clear;
  sSqlCalc := 'select CM.FN_EMP_CALC_IOF_COMPLEMENTAR('''+ DataPrevista + ''',''' + DataCredito + ''',' + IntToStr(NumParcela) + ',' + IntToStr(ParcRestantes) + ',' + OraNumero(Taxa_Juros) + ',' + OraNumero(Valor_Parcela) + ',''' + Data_atualizada + ''',''' + SistemaAmort + ''') as valor_calculado from dual ';
  qryCalculos.SQL.Text := sSqlCalc;
  qryCalculos.Open;
  Result := qryCalculos.FieldByName('valor_calculado').AsString;
end;
// Fim WO19000 Ferrari

end.
