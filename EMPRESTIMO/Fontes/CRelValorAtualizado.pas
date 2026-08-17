unit CRelValorAtualizado;
{
------------------------------------------------------------------------------------------------------------
Nº                : WO42910
Data da Alteração : 29/07/2026
Responsável       : Leandro Pocebon
Descrição         : Ajuste não mostar linhas do item parcelas em atraso indevidamente
Rotina de calculo : qryHistMovVirtual
------------------------------------------------------------------------------------------------------------
Nº                : WO39105
Data da Alteração : 28/05/2026
Responsável       : Leandro Pocebon
Descrição         : Ajuste não mostar linhas do item parcelas em atraso indevidamente
Rotina de calculo : qryHistMovVirtual
------------------------------------------------------------------------------------------------------------
Nº                : MIGRACAO-ORACLE
Data da Alteração : 15/10/2025
Responsável       : EDILAINE
Descrição         : Cast de valores concatenados para VARCHAR
------------------------------------------------------------------------------------------------------------
Nº                : WO19066
Data da Alteração : 21/02/2025
Responsável       : Luis Ferrari
Descrição         : Ajuste para calcular encargos sem passar por Tratamento de parcelas em atraso.
Rotina de calculo : CalculoAtualizacao
------------------------------------------------------------------------------------------------------------
Nº                : WO18350
Data da Alteração : 22/01/2025
Responsável       : Luis Ferrari
Descrição         : Ajuste para parcelas e encargos manuais.
Rotina de calculo : CalculoAtualizacao
------------------------------------------------------------------------------------------------------------
Nº                : WO16298
Data da Alteração : 08/11/2024
Responsável       : Luis Ferrari
Descrição         : Ajuste nos calculos dos Encargos.
Rotina de calculo : CalculoAtualizacao
------------------------------------------------------------------------------------------------------------
Nº                : WO15857
Data da Alteração : 24/10/2024
Responsável       : Luis Ferrari
Descrição         : Ajuste nos calculos dos Encargos e retirada do calculo com as regras.
Rotina de calculo : CalculoAtualizacao
------------------------------------------------------------------------------------------------------------
Nº                : WO14093
Data da Alteração : 04/09/2024
Responsável       : Luis Ferrari
Descrição         : Ajuste no Relatorio, calculo do IOF.
Rotina de calculo : CalculoAtualizacao
------------------------------------------------------------------------------------------------------------
Nº                : WO10891
Data da Alteração : 24/06/2024
Responsável       : Luis Ferrari
Descrição         : Ajuste no Relatorio, calculo passa a ser dinamico agora, conforme o periodo escolhido.
Rotina de calculo : CalculoAtualizacao
------------------------------------------------------------------------------------------------------------
Nº                : WO3977
Data da Alteração : 10/10/2023
Responsável       : Helen V Bianchi
Descrição         : Ajuste na query QRYHISTMOV (SelecionaRegistrosDivergentes) posicionando os valores para
                    data solicitada.
-----------------------------------------------------------------------------------------------------------
Nº SIG            : WO4002
Data da Alteração : 05/10/2023
Responsável       : Luis Ferrari
Descrição         : Ajuste na query QRYHISTMOV (SelecionaRegistrosDivergentes) não trazer item do FGQC - Desconto Temporário para o Relatorio
------------------------------------------------------------------------------------------------------------
Nº SIG            : 130891
Data da Alteração : 15/12/2022
Responsável       : Luis Ferrari
Descrição         : Ajuste na query QRYHISTMOV (SelecionaRegistrosDivergentes) trazer itens da parcela dos encargos por inadimplência
------------------------------------------------------------------------------------------------------------
Nº SIG            : 96903
Data da Alteração : 04/02/2020
Responsável       : Taffarel Sevaybriker
Descrição         : Parcela sendo exibida cortando caracteres - removido espaço da formatação do campo.
------------------------------------------------------------------------------------------------------------
Nº SIG            : 27356
Data da Alteração : 15/08/2016
Responsável       : André Imakawa
Descrição         : Remover codigo da da query - SelecionaRegistrosDivergentes
------------------------------------------------------------------------------------------------------------
Nº SIG            : 22070
Data da Alteração : 13/07/2016
Alteração Form    : Consulta que monta relatorio
Responsável       : William Moreira da Silva
Descrição         : Ajustar a informação Aposentado por Invalidez
------------------------------------------------------------------------------------------------------------
Nº SOL            : 1069135
Nº PPM            : 261493
Data da Alteração : 16/09/2015
Alteração Form    : Alteração somente no DFM
Responsável       : Felipe A. Santos.
Descrição         : Alteração somente no DFM, caption formulário "Valor atualizado por Contrato" para
                    "Demonstrativo de Valores em Aberto".
------------------------------------------------------------------------------------------------------------
Nº SOL            : 218798.16629
Nº PPM            : 560594
Data da Alteração : 25/11/2014
Alteração Form    : Criar opção para geração por contratos
Responsável       : William Santana
Descrição         : Criação de uma grid de contratos para opção de geração do relatório
------------------------------------------------------------------------------------------------------------
Pendência   : SOL 238210 KINTANA 539626
Responsável : William Moreira da Silva
Data        : 08/10/2014
Descrição   : Valores duplicados no relatorio     
------------------------------------------------------------------------------------------------------------

Pendência   : SOL 237361 KINTANA 511634
Responsável : Marcio SAnches Spinosa SOL 237361 KINTANA 511634
Data        : 15/09/2014
Descrição   : Ajuste na query do cpf impresso
------------------------------------------------------------------------------------------------------------
Pendência   : SOL 225485 KINTANA 2059144
Responsável : William Moreira da Silva
Data        : 04/02/2014
Descrição   : Erro no campo FLGPERDAEFETIVA ao gerar o relatório(.DFM)
------------------------------------------------------------------------------------------------------------
Pendência   : SOL 221162 KINTANA 2054131
Responsável : William Moreira da Silva
Data        : 28/11/2013
Descrição   : Não eram trazidos contrato com o FLGDESTATIVADO = 1 (.DFM)
------------------------------------------------------------------------------------------------------------
Pendência   : SOL 218079 KINTANA 2048940
Responsável : William Moreira da Silva
Data        : 07/10/2013
Descrição   : Erros nos valores da prestação e nos saldos.
------------------------------------------------------------------------------------------------------------
Pendência   : SOL 179770 KINTANA 1736570
Responsável : TADEU PASSOS
Data        : 09/07/2013
Descrição   : Realizar ajuste no relatório de Valores Atualizados por Contrato
------------------------------------------------------------------------------------------------------------
Pendência   : SOL 208810 Kintana 2016283
Responsável : William Moreira da Silva
Data        : 05/06/2013
Descrição   : Correção no Registro do FGQC que não estava sendo apresentado em alguns casos
------------------------------------------------------------------------------------------------------------
Pendência   : SOL 206924 Kintana 2000162
Responsável : William Moreira da Silva
Data        : 13/05/2013
Descrição   : Correção no Registro do FGQC que era apresentado duplicado no relatorio
------------------------------------------------------------------------------------------------------------
Pendência   : SOL 141214 Kintana 897762
Responsável : Ádler Souza
Data        : 18/08/2010
Descrição   : Correção na Rotina de calculo de itens.
------------------------------------------------------------------------------------------------------------
Pendência   : SOL 139313 Kintana 855071
Responsável : Fernando Xavier
Data        : 13/07/2010
Descrição   : trazer a proxima parcela na sql para usar no lugar das variaveis.
------------------------------------------------------------------------------------------------------------
Pendência   : SOL 126520 Kintana 663633
Responsável : BRUNO AZEVEDO
Data        : 17/06/2010
Descrição   : Exibir os itens de prestação para contratos que possuem FGQC.
------------------------------------------------------------------------------------------------------------
Pendência   : SOL 120612 Kintana 575379
Responsável : Renato Visoni
Data        : 18/06/2009
Descrição   : Alteração na qryHistMov para listar contratos de participantes sem planos ativos na fundação.
}
interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, CheckLst, fcCombo, fcColorCombo, Mask, wwdbedit,
   Wwdbspin, wwdblook, Db, DBTables, Wwdatsrc, Wwquery, Grids, Wwdbgrid, wwdbdatetimepicker,
   uTypesEmptmo, Wwdbigrd, mMutuario, MontaSelect;

type
   TcfgRelValorAtualizado = class(TcfgRel)
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Panel2: TPanel;
      edtDataVencto: TwwDBDateTimePicker;
      Label2: TLabel;
      qryHistMov: TwwQuery;
      dtsHistMovVirtual: TwwDataSource;
      qryHistMovVirtual: TwwQuery;
      qryHistMovVirtualITEDESCRICAO: TStringField;
      qryHistMovVirtualEVENTO: TStringField;
      qryHistMovVirtualANOMES: TStringField;
      qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMESEQCOBRANCA: TFloatField;
      qryHistMovVirtualHMETIPOMOV: TFloatField;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      qryHistMovVirtualIDITEMEMPTMO: TFloatField;
      qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField;
      qryHistMovVirtualHMEVLRPREVISTO: TFloatField;
      qryHistMovVirtualHMESALDODEV: TFloatField;
      qryHistMovVirtualHMETXJUROS: TFloatField;
      qryHistMovVirtualHMEPARCELA: TFloatField;
      updHistMovVirtual: TUpdateSQL;
      qry: TwwQuery;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      qryHistMovHMEDATAVENCTO: TDateTimeField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMESALDODEV: TFloatField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovHMEFORMACOBRANCA: TStringField;
      qryHistMovIDHISTMOVEMPTMO: TFloatField;
      qryHistMovHMEANOCOBRANCA: TFloatField;
      qryHistMovHMEMESCOBRANCA: TFloatField;
      qryHistMovHMENUMPARCELAS: TFloatField;
      qryHistMovHMERECPAG: TStringField;
      qryHistMovCOMPETENCIA: TStringField;
      qryHistMovCOBRANCA: TStringField;
      qryHistMovIDPATRO: TFloatField;
      qryHistMovIDPLANOPREV: TFloatField;
      qryHistMovIDSITPART: TFloatField;
      qryHistMovFLGINTERNO: TStringField;
      qryHistMovITEDESCRICAO: TStringField;
      qryHistMovVirtualHMEPARCELAALT: TFloatField;
      qryHistMovVirtualHMENUMPARCELAS: TFloatField;
      qryHistMovHMEPARCELAALT: TFloatField;
      qryINSCRICAONUMERO: TFloatField;
      qryDESCSITCONTRATO: TStringField;
      qryIDSITPART: TFloatField;
      qrySITUACAO: TStringField;
      qryFLGINTERNO: TStringField;
      qryMATRICULA: TStringField;
      qryBENEFICIARIO: TStringField;
      qryTCEDESCRICAO: TStringField;
      qryIDTIPOEMPTMO: TFloatField;
      qryDESCTIPOEMPTMO: TStringField;
      qryIDCONTRATOEMPTMO: TFloatField;
      qryIDCONTRQUITACAO: TFloatField;
      qryIDPESSOA: TFloatField;
      qryIDBENEF: TFloatField;
      qryIDINSCRICAOEMPTMO: TFloatField;
      qryIDPLANOPREV: TFloatField;
      qryIDPATRO: TFloatField;
      qryIDVERBA: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryIDCBANCARIADEB: TFloatField;
      qryNUMPARCELAS: TFloatField;
      qryIDCBANCARIA: TFloatField;
      qryCODFORMAPAG: TFloatField;
      qryPORTFORMAPAG: TFloatField;
      qryPORTFORMAREC: TFloatField;
      qryDATACANC: TDateTimeField;
      qryDATACREDITO: TDateTimeField;
      qryDATASITUACAO: TDateTimeField;
      qryDATAASSINATURA: TDateTimeField;
      qryDATAPRIMPARC: TDateTimeField;
      qryVLRCONTRATO: TFloatField;
      qryVLRPARCELA: TFloatField;
      qryTXJUROS: TFloatField;
      qryFLGSITUACAO: TStringField;
      qryFLGFORMAREC: TStringField;
      qryFLGFORMAPAG: TStringField;
      qryVLRSALBASE: TFloatField;
      qryVLRMARGEM: TFloatField;
      qryVLRMAXPERMIT: TFloatField;
      qryIDPLANOORIGEM: TFloatField;
      qryDATAINSC: TDateTimeField;
      qryMOESIGLA: TStringField;
      qryMOECODIGO: TFloatField;
      qryIDTIPOSUSPEMPTMO: TFloatField;
      qryDATAINICIOSUSP: TDateTimeField;
      qryDATAFIMSUSP: TDateTimeField;
      qryANOSUSPENSAO: TFloatField;
      qryMESSUSPENSAO: TFloatField;
      qryTSEDESCRICAO: TStringField;
      qryHistMovHMECENTRALIZA: TFloatField;          //BRUNO AZEVEDO SOL 126520 KINTANA 663633
      qryHistMovVirtualHMECENTRALIZA: TFloatField;
      qryHistMovVirtualPROXIMA_PARCELA: TFloatField; //SOL 139313 Kintana 855071
      qryHistMovPROXIMA_PARCELA: TFloatField;
    qryNUMDOCUMENTO: TStringField;
    qryContratos_old: TwwQuery;
    qryHistMovVirtualTSEDESCRICAO: TStringField;
    qryHistMovVirtualTAXA: TStringField;
    qryHistMovVirtualPRAZO: TStringField;
    chkCalcApenas: TCheckBox;
    qryAux: TwwQuery;
    qryHistMovVirtualDATACREDITO: TStringField;
    qryHistMovVirtualINDICE: TStringField;
    edtMatricula: TEdit;
    Label5: TLabel;
    Label1: TLabel;
    edtNome: TEdit;
    btnBuscaPart: TBitBtn;
    btnLimpaPart: TBitBtn;
    montaSelectMutuario: TMontaSelect;   //SOL 139313 Kintana 855071
    fltfldFLGPERDAEFETIVA: TFloatField;  //William Moreira da Silva - SOL 225485 - KTN 2059144
    gridContratos: TwwDBGrid;
    qryContratos: TwwQuery;
    dsContratos: TwwDataSource;
    updContratos: TUpdateSQL;
    qryContratosSEL: TFloatField;
    qryContratosMATRICULA: TStringField;
    qryContratosIDCONTRATOEMPTMO: TFloatField;
    qryContratosFLGSITUACAO: TStringField;
    qryContratosTCEDESCRICAO: TStringField;
    qryCalculos: TwwQuery;
    qryAmortizacao: TwwQuery;
    qryContratosVLRCONTRATO: TFloatField;
    qryHistMovVirtualFLGENTRADAMANUAL: TFloatField;       // WO18350 Ferrari
    qryHistMovFLGENTRADAMANUAL: TFloatField;              // WO18350 Ferrari
    qryHistMovVirtualHMEDATAVENCTO: TDateTimeField;              // WO18350 Ferrari

    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molMutuariobtnBuscaPartClick(Sender: TObject);
    procedure molMutuariobtnLimpaPartClick(Sender: TObject);


   private  // Private declarations
      iContrSel, iRegraCalc, iContrAtual, iTotRegras : Integer; // William Santana - SOL 218798.16629 PPM 560594
      rContrato   : TDadosContrato;
      vLista      : TListaItem;
      rSaldo      : TSaldoDevAnt;
      sCPF        : string;

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;

      procedure CalculaValores;
      procedure PreencheRelatorio;

      procedure PreencheTabelaVirtual(bItensCalculados: Boolean = False);
      procedure SelecionaRegistrosDivergentes;
      function  VerificaPreenchimento: Boolean;
      procedure Sel(i: Extended);

      procedure PreencheTabelaRel;
      function VerificaLength(Parcela : String) : String; //TAES - SIG96903
      function CalculoAtualizacao(DataPrevista : String ;Valor_Parcela : string ;Data_atualizada : string ;ItemParcela :Integer ;Taxa_Juros :string) : string; // WO10891 Ferrari
      function CalculoAtualizacaoIOF(DataPrevista : String ;DataCredito : string ;NumParcela : Integer ;ParcRestantes : Integer ;Taxa_Juros :string ;Valor_Parcela : string ;Data_atualizada : string ;SistemaAmort : string) : string;  // WO10891 Ferrari

   public   // Public declarations

   end;



var
  cfgRelValorAtualizado: TcfgRelValorAtualizado;
  sMatricula : String = '';
  sAmortizacao : string = '';


implementation
{$R *.DFM}
uses
   DLookEmptmo,
   dBaseDados,
   uDataBase,
   UFuncoesEmptmo,
   UDiasUteis,
   USistema,
   dEmptmo,
   uMensErro,
   fProgresso,
   uCalcEmptmo,
   uVerificaPreenchimento,
   dRelValorAtualizado,
   //Início -  William Santana - SOL 218798.16629 PPM 560594
    dCalcEmptmo,
   FProgressoDuplo;
   //Término - William Santana - SOL 218798.16629 PPM 560594



procedure TcfgRelValorAtualizado.AbreQueries;
begin
   ParametrosSistema;

   //Início - William Santana - SOL 218798.16629 PPM 560594
   qryContratos.Close;
   qryContratos.ParamByName('MATRICULA').AsString := '-1';
   qryContratos.Open;
   //Término - William Santana - SOL 218798.16629 PPM 560594
end;



procedure TcfgRelValorAtualizado.MontaQuery;
begin
   inherited;

   with dtmRelValorAtualizado do
   begin
      // -------------------------------------------------------------------------------------------

      rptRelValorAtualizado_lblMutuario.Caption    := edtNome.Text;
      rptRelValorAtualizado_lblMatricula.Caption   := edtMatricula.Text;
      //rptRelValorAtualizado_lblDataVencto.Caption  := edtDataVencto.Text;
      rptRelValorAtualizado_lblDataVencto2.Caption := edtDataVencto.Text;

      // TADEU PASSOS SOL 179770 KINTANA 1736570
      qryAux.Close;
      qryAux.SQL.Clear;
    //Início -  William Santana - SOL 218798.16629 PPM 560594
     // qryAux.SQL.Add('SELECT DISTINCT PF.NUMDOCUMENTO CPF, P.NOME PLANO, PJ.NOME PATROCINADORA ' +
//                     '  FROM CONTRATOEMPTMO C, PLANPREV P, PESSOA PF, PESSOA PJ, DEPENTIT D ' +
////                     ' WHERE C.IDPESSOA = PF.IDPESSOA ' +
//                     ' WHERE C.IDBENEF = PF.IDPESSOA ' + //Marcio SAnches Spinosa SOL 237361 KINTANA 511634
//                     '   AND C.IDPATRO = PJ.IDPESSOA ' +
//                     '   AND C.IDPLANOPREV = P.IDPLANOPREV ' +
//                     '   AND C.IDBENEF = D.IDPESSOA' +
//                     '   AND C.IDPESSOA = D.IDTITULAR' +
//                     '   AND C.FLGSITUACAO NOT IN (''C'',''Q'',''K'') ' +
//                     '   AND D.MATRICULA = ' + QuotedStr(edtMatricula.Text));

         qryAux.SQL.Add(' SELECT DISTINCT PF.NUMDOCUMENTO CPF, D.IDPESSOA, D.IDTITULAR,' +
          '                P.NOME PLANO,' +
          '                PJ.NOME PATROCINADORA,' +

          //William Moreira da Silva - SIG 22070
          //'                DECODE((SELECT B.IDSITBENEFICIO FROM BENEFBFCIARIO B' +
          //'                        WHERE B.IDSITBENEFICIO = 1' +
          //'                          AND B.IDPESSOA = C.IDBENEF' +
          //'                          AND ROWNUM = 1),   NULL, SIT.DESCRICAO,' +
          //'                       ''PENSIONISTA'') AS SITPART' +
          '                         CASE' + 
          '  WHEN C.IDPESSOA = C.IDBENEF THEN' + 
          '   (SELECT DISTINCT SP.DESCRICAO' + 
          '      FROM PARTPREVPLAN PPP' + 
          '      JOIN SITPART SP' + 
          '        ON SP.IDSITPART = PPP.IDSITPART' + 
          '     WHERE PPP.IDPESSOA = C.IDBENEF' +
          '       AND ((PPP.IDSITPLANOPREV = 25) OR' + 
          '           (PPP.IDPLANOPREV =' + 
          '           (SELECT MAX(PPP2.IDPLANOPREV)' + 
          '                FROM PARTPREVPLAN PPP2' + 
          '               WHERE PPP2.FLGDESATIVADO = 0' +
          '                 AND PPP2.IDPESSOA = PPP.IDPESSOA) AND NOT EXISTS' + 
          '            (SELECT 1' + 
          '                FROM PARTPREVPLAN PPP2' + 
          '               WHERE PPP2.IDPESSOA = PPP.IDPESSOA' + 
          '                 AND PPP2.IDSITPLANOPREV = 25)) OR' + 
          '           ((PPP.FLGDESATIVADO = 1) AND NOT EXISTS' + 
          '            (SELECT 1' + 
          '                FROM PARTPREVPLAN PPP1' + 
          '               WHERE PPP1.IDPESSOA = PPP.IDPESSOA' + 
          '                 AND PPP1.FLGDESATIVADO = 0) AND' + 
          '            PPP.IDPLANOPREV =' + 
          '            (SELECT MAX(PPP1.IDPLANOPREV)' + 
          '                FROM PARTPREVPLAN PPP1' + 
          '               WHERE PPP1.IDPESSOA = PPP.IDPESSOA' + 
          '                 AND NVL(PPP1.DATACANCELAMENTO, TRIM(SYSDATE)) =' + 
          '                     (SELECT NVL(MAX(PPP2.DATACANCELAMENTO),' + 
          '                                 TRIM(SYSDATE))' + 
          '                        FROM PARTPREVPLAN PPP2' + 
          '                       WHERE PPP2.IDPESSOA = PPP1.IDPESSOA)' + 
          '                 AND NOT EXISTS' + 
          '               (SELECT 1' + 
          '                        FROM PARTPREVPLAN PPP2' +
          '                       WHERE PPP2.IDPESSOA = PPP1.IDPESSOA' + 
          '                         AND PPP2.IDSITPLANOPREV = 25)))))' +
          '  ELSE' + 
          '   ''PENSIONISTA''' +
          'END AS SITPART ' +
          //William Moreira da Silva - SIG 22070

          '  FROM CONTRATOEMPTMO C' +
          ' INNER JOIN DEPENTIT D ON (D.IDPESSOA = C.IDBENEF AND C.IDPESSOA = D.IDTITULAR)' +
          ' INNER JOIN PLANPREV P ON (C.IDPLANOPREV = P.IDPLANOPREV)' +
          ' INNER JOIN PESSOA PJ ON (C.IDPATRO = PJ.IDPESSOA)' +
          ' INNER JOIN PESSOA PF ON (C.IDBENEF = PF.IDPESSOA)' + 
          '  LEFT OUTER JOIN PARTPREVPLAN PPP ON (C.IDPLANOPREV = PPP.IDPLANOPREV AND D.IDPESSOA = PPP.IDPESSOA)' +
          '  LEFT OUTER JOIN SITPART SIT ON (PPP.IDSITPART = SIT.IDSITPART)' +
          ' WHERE C.FLGSITUACAO NOT IN (''C'', ''Q'', ''K'')'  +
     //Término -  William Santana - SOL 218798.16629 PPM 560594
          ' AND D.MATRICULA = ' + QuotedStr(edtMatricula.Text));
      qryAux.Open;

//      rptRelValorAtualizado_lblCPF.Caption           := qryAux.FieldByName('CPF').AsString;
      rptRelValorAtualizado_lblCPF.Caption           := scpf;
      rptRelValorAtualizado_lblPatrocinadora.Caption := qryAux.FieldByName('PATROCINADORA').AsString;
      rptRelValorAtualizado_lblPlano.Caption         := qryAux.FieldByName('PLANO').AsString;
      // TADEU PASSOS SOL 179770 KINTANA 1736570

      //Início - William Santana - SOL 218798.16629 PPM 560594
      if (qryAux.FieldByName('SITPART').AsString = EmptyStr) and
         (qryAux.FieldByName('IDPESSOA').AsInteger <> qryAux.FieldByName('IDTITULAR').AsInteger) then
         rptRelValorAtualizado_lblSitPart.Caption := 'PENSIONISTA'
       else
      rptRelValorAtualizado_lblSitPart.Caption := qryAux.FieldByName('SITPART').AsString;
      //Término - William Santana - SOL 218798.16629 PPM 560594

      // -------------------------------------------------------------------------------------------

//      bSeparador  := chkLinhas.Checked;
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

      // -------------------------------------------------------------------------------------------
   end;

   FiltraRelatorio;
end;



procedure TcfgRelValorAtualizado.FiltraRelatorio;


begin

   inherited;
end;



procedure TcfgRelValorAtualizado.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   // limpa a seleção de Contrato


   edtDataVencto.Date := Sysdate;

   AbreQueries;
end;



procedure TcfgRelValorAtualizado.bbtnConfirmarClick(Sender: TObject);
var
  i : integer;
  IdContrato : Extended;
  sSql : string;
begin
   // TADEU PASSOS
   if Trim(edtMatricula.Text) <> '' then
   begin

     //Início - William Santana - SOL 218798.16629 PPM 560594
    // i := 0;
     iContrAtual := 0;
//     qryContratos.Close;
//     qryContratos.ParamByName('MATRICULA').AsString := edtMatricula.Text;
//     qryContratos.Open;
//     qryContratos.Last;
//     qryContratos.First;
     //Término - William Santana - SOL 218798.16629 PPM 560594

     if not(VerificaPreenchimento) then Exit;
     qryContratos.First;

     //Início - William Santana - SOL 218798.16629 PPM 560594
//   frmProgresso.MostraFormProgresso('Preparando relatório para impressão...',
//                                      True,
//                                      True,
//                                      True,
//                                      0,
//                                      qryContratos.RecordCount
//                                     );
//     frmProgresso.btnCancelar.Visible := False;
//     frmProgresso.Refresh;

     //Término - William Santana - SOL 218798.16629 PPM 560594
 
     dtmRelValorAtualizado.qryValorAtualizado.Close;
     dtmRelValorAtualizado.qryValorAtualizado.Open;

     qryContratos.First;
     while not qryContratos.Eof do
     begin
       SelecionaRegistrosDivergentes;

       CalculaValores;
       // Inicio WO10891 Ferrari
       IdContrato := qryContratos.FieldByName('IDCONTRATOEMPTMO').AsFloat;
       sSql := 'select b.SISTEMA_AMORTIZACAO from contratoemptmo a '+ #13 +
                       'inner join tipocontremptmo b on b.IDTIPOCONTREMPTMO = a.IDTIPOCONTREMPTMO '+ #13 +
                       'where a.IDCONTRATOEMPTMO = ' + FormatFloat('#0', IdContrato) ;
       qryAmortizacao.Close;
       qryAmortizacao.SQL.Text := sSQL;
       qryAmortizacao.Open;
       sAmortizacao :=  qryAmortizacao.FieldByName('SISTEMA_AMORTIZACAO').AsString;


       // Fim WO10891 Ferrari
       PreencheTabelaRel;

       qryContratos.Next;

       //Início - William Santana - SOL 218798.16629 PPM 560594
       //Inc(i);
       inc(iContrAtual);
//       frmProgresso.AndaFormProgresso(i);
//       frmProgresso.Refresh;

       frmProgressoDuplo.AndaFormProgressoDuplo(iContrAtual,iRegraCalc);
       frmProgressoDuplo.Refresh;
        //Término - William Santana - SOL 218798.16629 PPM 560594
     end;
     inherited;

     //Início - William Santana - SOL 218798.16629 PPM 560594
      qryContratos.Filtered := false;
      qryContratos.EnableControls;
     //Término - William Santana - SOL 218798.16629 PPM 560594
   end
   else
     MsgDlg('Nenhuma matrícula foi escolhida para a geração do relatório. Escolha uma matrícula a fim de possibilitar a geração do relatório.', 'Empréstimo', mtInformation, [mbOk], 0);
  //William Santana - SOL 218798.16629 PPM 560594
 //  frmProgresso.EscondeFormProgresso;
    frmProgressoDuplo.EscondeFormProgressoDuplo;
    //William Santana - SOL 218798.16629 PPM 560594
   // TADEU PASSOS

end;



procedure TcfgRelValorAtualizado.CalculaValores;
var
   fSaldoAReceber       : Currency;
   iParcela             : Integer;
   iParcelaAlt          : Integer;
   iParcAnt             : Integer;
   iNovoAnoCompetencia  : Integer;
   iNovoMesCompetencia  : Integer;
   sMensErro            : String;
   iIDHistMovEmptmo     : Extended;
   sSQL                 : String;
   iContrato            : Extended;
   iContador            : Integer;
   sNovoMesCobranca     : String;
   sNovoAnoCobranca     : String;
   sNovaFormaCobranca   : String;
   sNovaDataCobranca    : String;

begin
   qryHistMovVirtual.Close;
   qryHistMovVirtual.Open;

   sMensErro := '';

   try
      qryHistMov.First;

      iContador   := 0;
      iParcAnt    := -1;

      qryHistMov.DisableControls;

      // abre a query principal com o participante escolhido
      iContrato := qryContratos.FieldByName('IDCONTRATOEMPTMO').AsFloat;
      Sel(iContrato);

      // Preenche registro com os dados do Contrato
      PreencheDadosContrato(qry, rContrato);

      //Início - William Santana - SOL 218798.16629 PPM 560594
      iRegraCalc := 0;
      //pegando o número de regras
      iTotRegras:=0;
      qryHistMov.filter := 'HMECENTRALIZA = 1';
      qryHistMov.filtered := true;
      qryHistMov.first;
      while not(qryHistMov.eof) do
      begin
       inc(iTotRegras);
       qryHistMov.next;
      end;
      qryHistMov.filtered := false;
      qryHistMov.first;

      with dtmCalcEmptmo.qryBuscaItens do
      begin
         LimpaParametros(dtmCalcEmptmo.qryBuscaItens);
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger := rContrato.IDTipoContrEmptmo;
         ParamByName('PEVENTO').AsInteger            := 4;
         Open;
      end;

      iTotRegras := iTotRegras * dtmCalcEmptmo.qryBuscaItens.recordcount;

      frmProgressoDuplo.MostraFormProgressoDuplo('Preparando relatório para impressão...',
                                                'Calculando...',
                                                 iContrAtual,   //contrato atual em processamento
                                                 iRegraCalc,   //regra atual em processamento
                                                 iContrSel,   //total de contratos selecionados
                                                 iTotRegras, //total de Regras
                                                 false,
                                                 false);
      frmProgressoDuplo.Refresh;

      //Término - William Santana - SOL 218798.16629 PPM 560594


      while not(qryHistMov.EOF) do
      begin

         // calcula nova competência
         iNovoAnoCompetencia  := DiasUteis.ExtraiAno(edtDataVencto.Date);
         iNovoMesCompetencia  := DiasUteis.ExtraiMes(edtDataVencto.Date);
         sNovaFormaCobranca   := 'F';

         //Pendência 22798 - 15/09/2006
         sNovaDataCobranca    := FormatDateTime('dd/mm/yyyy', edtDataVencto.Date);

         // Processa Registro Selecionado ----------------------------------------------------------

         fSaldoAReceber := qryHistMovHMEVLRPREVISTO.AsCurrency;
         iParcela       := qryHistMovHMEPARCELA.AsInteger;

         // Calcula novos dados da Cobrança
         sNovoMesCobranca := Copy(sNovaDataCobranca, 4, 2);
         sNovoAnoCobranca := Copy(sNovaDataCobranca, 7, 4);

         if (fSaldoAReceber <> 0) and (fSaldoAReceber <> qryHistMovHMEVLRPREVISTO.AsCurrency) then
         begin
            PreencheTabelaVirtual;
         end
         else
         if (fSaldoAReceber = qryHistMovHMEVLRPREVISTO.AsCurrency) then
         begin
            SetLength(vLista, 1);
            vLista[0].Nome                   := qryHistMovITEDESCRICAO.AsString;
            vLista[0].AnoCompetencia         := qryHistMovHMEANOCOMPETENCIA.AsInteger;
            vLista[0].MesCompetencia         := qryHistMovHMEMESCOMPETENCIA.AsInteger;
            vLista[0].SeqCobranca            := qryHistMovHMESEQCOBRANCA.AsInteger;
            vLista[0].iEvento                := qryHistMovHMETIPOMOV.AsInteger;
            vLista[0].CodigoItem             := qryHistMovIDITEMEMPTMO.AsInteger;
            vLista[0].DataPrevista           := qryHistMovHMEDATAPREVISTA.AsDateTime;
            vLista[0].Valor                  := fSaldoAReceber;
            vLista[0].SaldoDevedor           := qryHistMovHMESALDODEV.AsCurrency;
            vLista[0].TxJuros                := qryHistMovHMETXJUROS.AsCurrency;
            vLista[0].DataVencto             := qryHistMovHMEDATAVENCTO.AsDateTime ;        // WO18350 Ferrari

            vLista[0].Parcela                := qryHistMovHMEPARCELA.AsInteger;
            vLista[0].ParcelaAlt             := qryHistMovHMEPARCELAALT.AsInteger;
            vLista[0].ParcResta              := qryHistMovHMENUMPARCELAS.AsInteger;
            vLista[0].Origem                 := qryHistMovFLGENTRADAMANUAL.AsInteger;        // WO18350 Ferrari

            vLista[0].AnoCobranca            := StrToInt(sNovoAnoCobranca);
            vLista[0].DataEfetiva            := 0;
            vLista[0].FlgBaixado             := -1;

            vLista[0].FlgDivergPend          := -1;
            vLista[0].FlgEnvio               := 0;
            vLista[0].FlgTipoDiverg          := -1;
            vLista[0].FormaCobranca          := sNovaFormaCobranca;

            vLista[0].MesCobranca            := StrToInt(sNovoMesCobranca);

            vLista[0].RecPag                 := qryHistMovHMERECPAG.AsString;

            //BRUNO AZEVEDO SOL 126520 KINTANA 663633
            vLista[0].Centraliza             :=  qryHistMovHMECENTRALIZA.AsString;

            //Fernando Xavier SOL 139313 Kintana 855071
            vLista[0].PROXIMAPARCELA         :=  qryHistMovPROXIMA_PARCELA.AsFLOAT;

            // Preenche a Tabela de Resultados
            PreencheTabelaVirtual;
         end;

         // Limpa a lista de itens
         SetLength(vLista, 0);

         // Recebimento a menor ou Valor não recebido
        // if (fSaldoAReceber > 0) and ( Copy(qryHistMovHMEDATAPREVISTA.Asstring,4,8) = Copy(edtDataVencto.Text,4,8) ) then
// 130891
         if (fSaldoAReceber > 0) and ( qryHistMovHMEDATAVENCTO.AsDateTime < edtDataVencto.Date) then
         begin
            //BRUNO AZEVEDO SOL 126520 KINTANA 663633
            //if (iParcela <> iParcAnt)
            if (qryHistMovHMECENTRALIZA.AsFloat = 1) then
            begin
             //Início - William Santana - SOL 218798.16629 PPM 560594
              // Calcula novos itens de Cobranca
              //if not(CalcEmptmo.CalculaItensDiverg(rContrato,
//                                                   7,
//                                                   iParcela,
//                                                   iParcelaAlt,
//                                                   qryHistMovHMENUMPARCELAS.AsInteger,
//                                                   DiasUteis.ExtraiAno(edtDataVencto.Date),
//                                                   DiasUteis.ExtraiMes(edtDataVencto.Date),
//                                                   edtDataVencto.Date,
//                                                   edtDataVencto.Date,
//                                                   edtDataVencto.Date,
//                                                   sNovaFormaCobranca,
//                                                   vLista,
//                                                   True,
//                                                   false
//                                                  )) then
{               if not(CalcEmptmo.CalculaItensDiverg(rContrato,               // sig 130891           WO15857 Ferrari  retirei agora
                                                   7,
                                                   iParcela,
                                                   iParcelaAlt,
                                                   qryHistMovHMENUMPARCELAS.AsInteger,
                                                   DiasUteis.ExtraiAno(edtDataVencto.Date),
                                                   DiasUteis.ExtraiMes(edtDataVencto.Date),
                                                   edtDataVencto.Date,
                                                   edtDataVencto.Date,
                                                   edtDataVencto.Date,
                                                   sNovaFormaCobranca,
                                                   vLista,
                                                   false,
                                                   iRegraCalc,
                                                   iContrAtual,
                                                   '',
                                                   False,
                                                   True
                                                  )) then

              //Término - William Santana - SOL 218798.16629 PPM 560594
              begin
                 // Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
                 // por Cancelamento do Usuário, logo o procedimento será abortado
                 Exit;
              end;
}
              // Ádler Souza - SOL 141214 Kintana 897762
              if (Length(vLista) > 0) then begin
                qryHistMovVirtual.Edit;
                qryHistMovVirtualPROXIMA_PARCELA.AsFLOAT := qryHistMovVirtualHMEPARCELA.AsFloat;
                qryHistMovVirtual.Post;
              end;
              //Fim - Ádler Souza - SOL 141214 Kintana 897762
            end;  // if iParcela <> iParcAnt

            // Preenche a Tabela de Resultados
            PreencheTabelaVirtual(True);
         end; // if (fSaldoAReceber > 0) or

         // Proximo Registro do Historico
         iParcAnt := iParcela;

         qryHistMov.Next;
      end;  // while not(qryHistMov.EOF)

      qryHistMov.EnableControls;

      Repaint;

   except
      Raise;
      Repaint;
   end;
end;



procedure TcfgRelValorAtualizado.PreencheRelatorio;
begin
end;



procedure TcfgRelValorAtualizado.PreencheTabelaVirtual(bItensCalculados: Boolean = False);
var
   i : Integer;
begin
   // Laço que varre o vetor Lista inserindo na tabela virtual TODOS os itens calculados
   for i := 0 to high(vLista) do
   begin
      qryHistMovVirtual.Insert;

      qryHistMovVirtualITEDESCRICAO.AsString       := vLista[i].Nome;
      qryHistMovVirtualANOMES.AsString             := FormatFloat('00', vLista[i].MesCompetencia) + '/' + FormatFloat('0000', vLista[i].AnoCompetencia);
      qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger := vLista[i].AnoCompetencia;
      qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger := vLista[i].MesCompetencia;
      qryHistMovVirtualHMESEQCOBRANCA.AsInteger    := vLista[i].SeqCobranca;
      qryHistMovVirtualHMETIPOMOV.AsInteger        := vLista[i].iEvento;

      case vLista[i].iEvento of
         0: qryHistMovVirtualEVENTO.AsString       := 'Concessão';
         1: qryHistMovVirtualEVENTO.AsString       := 'Parcela';
         2: qryHistMovVirtualEVENTO.AsString       := 'Amortização';
         3: qryHistMovVirtualEVENTO.AsString       := 'Quitação';
         4: qryHistMovVirtualEVENTO.AsString       := 'Atualização Débito';
      end;

      qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat    := rContrato.IDContratoEmptmo;
      qryHistMovVirtualIDITEMEMPTMO.AsInteger      := vLista[i].CodigoItem;
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := vLista[i].DataPrevista;
      qryHistMovVirtualHMEVLRPREVISTO.AsCurrency   := vLista[i].Valor;
      qryHistMovVirtualHMESALDODEV.AsCurrency      := vLista[i].SaldoDevedor;
      qryHistMovVirtualHMETXJUROS.AsCurrency       := vLista[i].TxJuros ;
      qryHistMovVirtualHMEPARCELA.AsInteger        := vLista[i].Parcela;
      qryHistMovVirtualFLGENTRADAMANUAL.AsInteger  := vLista[i].Origem;            // WO18350 Ferrari
      qryHistMovVirtualHMEDATAVENCTO.AsDateTime    := vLista[i].DataVencto;        // WO18350 Ferrari

      //BRUNO AZEVEDO SOL 126520 KINTANA 663633
      qryHistMovVirtualHMECENTRALIZA.AsString      := vLista[i].Centraliza;


      //  FERNANDO XAVIER  SOL 139313 Kintana 855071
      if vLista[i].proximaparcela > 0 then
         qryHistMovVirtualPROXIMA_PARCELA.AsFLOAT  := vLista[i].proximaparcela
      ELSE
         qryHistMovVirtualPROXIMA_PARCELA.AsFLOAT  := vLista[i].Parcela;

      // Ádler Souza - SOL 141214 Kintana 897762
      if (bItensCalculados) and (i = high(vLista)) then begin
        qryHistMovVirtualPROXIMA_PARCELA.AsFLOAT  := qryHistMovPROXIMA_PARCELA.AsFLOAT;
      end;
      //Fim - Ádler Souza - SOL 141214 Kintana 897762

      // TADEU PASSOS
      qryHistMovVirtualTSEDESCRICAO.AsString := qryTCEDESCRICAO.AsString;
      qryHistMovVirtualPRAZO.AsString        := qryNUMPARCELAS.AsString;
      qryHistMovVirtualDATACREDITO.AsString  := qryDATACREDITO.AsString;
      qryHistMovVirtualINDICE.AsString       := qryMOESIGLA.AsString;
      qryHistMovVirtualTAXA.AsString         := qryHistMovVirtualHMETXJUROS.AsString + ' % (ao ano)';
      // TADEU PASSOS

      qryHistMovVirtual.Post;
   end;  // for i := 0 to High(vLista)
end;



procedure TcfgRelValorAtualizado.SelecionaRegistrosDivergentes;
var
   sSQL  : String;
   sData : String;
   nData,nData2 : string;  // SIG 130891 Ferrari
   IdContrato : Extended;
begin
   sData := QuotedStr(FormatDateTime('dd/mm/yyyy', edtDataVencto.Date));
   nData := QuotedStr(FormatDateTime('yyyy/mm', edtDataVencto.Date));  // SIG 130891 Ferrari
   nData2 := QuotedStr(FormatDateTime('yyyy/mm', IncMonth(edtDataVencto.Date,1)));   // SIG 130891 Ferrari
   IdContrato := qryContratos.FieldByName('IDCONTRATOEMPTMO').AsFloat;

   // Busca Registros a processar
   //William Moreira da Silva - SOL 206924 KTN 2000162 - Inicio
   sSQL := ' SELECT    TMP.HMEANOCOMPETENCIA,  TMP.HMEMESCOMPETENCIA,    TMP.HMESEQCOBRANCA,  TMP.HMETIPOMOV,    '+ #13 +
   ' TMP.IDCONTRATOEMPTMO,   TMP.IDITEMEMPTMO,   TMP.HMEDATAVENCTO,   TMP.HMEDATAPREVISTA,               '+ #13 +
   ' TMP.HMEVLRPREVISTO,  TMP.HMESALDODEV,  TMP.HMETXJUROS,  TMP.HMEPARCELA,  TMP.HMEPARCELAALT,         '+ #13 +
   ' TMP.HMEFORMACOBRANCA, TMP.IDHISTMOVEMPTMO,  TMP.HMEANOCOBRANCA,  TMP.HMEMESCOBRANCA,                '+ #13 +
   ' TMP.HMENUMPARCELAS,  TMP.HMERECPAG, TMP.ITEDESCRICAO,   TMP.HMECENTRALIZA,  TMP.PROXIMA_PARCELA,    '+ #13 +
   ' TMP.COMPETENCIA,    TMP.COBRANCA, TMP.IDPATRO,  TMP.IDPLANOPREV, TMP.IDSITPART, TMP.FLGINTERNO, TMP.FLGENTRADAMANUAL '+ #13 +     // WO18350 Ferrari
   ' FROM ( SELECT decode(HME.IDITEMEMPTMO,99,decode(lead(HME.IDHISTMOVEMPTMO)Over (ORDER BY HME.IDCONTRATOEMPTMO, '+ #13 +
   '  HME.HMEPARCELA,                                                                                              '+ #13 +
   '     NVL(ITC.ITCORDEMEXTRATO, 0),                                                                              '+ #13 +
   //'         DECODE(HME.HMETIPOMOV, 1, 1, 2, 2, 3, 3, 4, 5, 7, 4)),HME.IDHISTMOVEMPTMO,0,1),0) AS ControleFGQC ,   '+ #13 +
   //William Moreira da Silva - SOL 208810 Kintana 2016283
   '         DECODE(HME.HMETIPOMOV, 1, 1, 2, 2, 3, 3, 4, 5, 7, 4)),HME.IDHISTMOVEMPTMO,1,0),0) AS ControleFGQC ,   '+ #13 +
   '      HME.HMEANOCOMPETENCIA,                                                                         '+ #13 +
   '      HME.HMEMESCOMPETENCIA,                                                                         '+ #13 +
   '      HME.HMESEQCOBRANCA,                                                                            '+ #13 +
   '      HME.HMETIPOMOV,                                                                                '+ #13 +
   '      HME.IDCONTRATOEMPTMO,                                                                          '+ #13 +
   '      HME.IDITEMEMPTMO,                                                                              '+ #13 +
   '      HME.HMEDATAVENCTO,                                                                             '+ #13 +
   '      HME.HMEDATAPREVISTA,                                                                           '+ #13 +
   '      HME.HMEVLRPREVISTO,                                                                            '+ #13 +
   '      HME.HMESALDODEV,                                                                               '+ #13 +
   '      HME.HMETXJUROS,                                                                                '+ #13 +
   '      HME.HMEPARCELA,                                                                                '+ #13 +
   '     HME.HMEPARCELAALT,                                                                             '+ #13 +
   '      HME.HMEFORMACOBRANCA,                                                                          '+ #13 +
   '      HME.IDHISTMOVEMPTMO,                                                                           '+ #13 +
   '     HME.HMEANOCOBRANCA,                                                                            '+ #13 +
   '      HME.HMEMESCOBRANCA,                                                                            '+ #13 +
   '      HME.HMENUMPARCELAS,                                                                            '+ #13 +
   '      HME.HMERECPAG,                                                                                 '+ #13 +
   '      HME.FLGENTRADAMANUAL,                                                                          '+ #13 +   // WO18350 Ferrari
   '      ITE.ITEDESCRICAO,                                                                              '+ #13 +
   '      HME.HMECENTRALIZA,                                                                             '+ #13 +
   '      decode(LEAD(HME.HMEPARCELA)                                                                    '+ #13 +
   '             OVER(ORDER BY HME.IDCONTRATOEMPTMO,                                                     '+ #13 +
   '                  HME.HMEPARCELA,                                                                    '+ #13 +
   '                  NVL(ITC.ITCORDEMEXTRATO, 0),                                                       '+ #13 +
   '                  DECODE(HME.HMETIPOMOV, 1, 1, 2, 2, 3, 3, 4, 5, 7, 4)),                             '+ #13 +
   '             null,                                                                                   '+ #13 +
   '             HME.HMEPARCELA,                                                                         '+ #13 +
   '             LEAD(HME.HMEPARCELA)                                                                    '+ #13 +
   '             OVER(ORDER BY HME.IDCONTRATOEMPTMO,                                                     '+ #13 +
   '                  HME.HMEPARCELA,                                                                    '+ #13 +
   '                  NVL(ITC.ITCORDEMEXTRATO, 0),                                                       '+ #13 +
   '                  DECODE(HME.HMETIPOMOV, 1, 1, 2, 2, 3, 3, 4, 5, 7, 4))) AS PROXIMA_PARCELA,         '+ #13 +
   //MIGRACAO-ORACLE : inicio
   //'  TO_CHAR(HME.HMEMESCOMPETENCIA,''00'') ||''/''|| HME.HMEANOCOMPETENCIA AS COMPETENCIA,              '+ #13 +
   //'  TO_CHAR(HME.HMEMESCOBRANCA,''00'') ||''/''|| HME.HMEANOCOBRANCA AS COBRANCA,                       '+ #13 +
   '  CAST(TO_CHAR(HME.HMEMESCOMPETENCIA,''00'') ||''/''|| HME.HMEANOCOMPETENCIA AS VARCHAR2(7)) AS COMPETENCIA, '+ #13 +
   '  CAST(TO_CHAR(HME.HMEMESCOBRANCA,''00'') ||''/''|| HME.HMEANOCOBRANCA AS VARCHAR2(7)) AS COBRANCA,          '+ #13 +
   //MIGRACAO-ORACLE : fim
   '      CON.IDPATRO,                                                                                   '+ #13 +
   '      CON.IDPLANOPREV,                                                                               '+ #13 +
   '      PPP.IDSITPART,                                                                                 '+ #13 +
   '      STP.FLGINTERNO,                                                                                '+ #13 +
   '      TSE.TSEDESCRICAO                                                                               '+ #13 + // TADEU PASSOS
   ' FROM HISTMOVEMPTMO   HME,                                                                           '+ #13 +
   '      PARTPREVPLAN    PPP,                                                                           '+ #13 +
   '      CONTRATOEMPTMO  CON,                                                                           '+ #13 +
   '      TIPOSUSPEMPTMO  TSE,                                                                           '+ #13 +
   '      SITPART         STP,                                                                           '+ #13 +
   '      TIPOCONTREMPTMO TC,                                                                            '+ #13 +
   '      ITEMEMPTMO      ITE,                                                                           '+ #13 +
   '      TIPOEMPTMO      TE,                                                                            '+ #13 +
   '      ITEMXTIPOCONTR  ITC                                                                            '+ #13 +
   'WHERE '                                                                                     + #13 +
   '       ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO = 1 ) '                             + #13 +
//   '   AND HME.HMEDATAPREVISTA     <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                  + #13 +   // SIG 130891 Ferrari
//WO3977 Helen V Bianchi - Inicio
//   '   AND ((to_char(HME.HMEDATAPREVISTA,''YYYY/MM'')    <= ' + nData + ') OR '                 + #13 +     // SIG 130891 Ferrari
   '   AND (HME.HMEDATAPREVISTA     <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') OR '                  + #13 +
//WO3977 Helen V Bianchi - Fim
   //   '        (to_char(HME.HMEDATAPREVISTA,''YYYY/MM'')    = ' + nData + ' AND '                  + #13 +     // SIG 130891 Ferrari

   '        (to_char(HME.HMEDATAPREVISTA,''YYYY/MM'')    = ' + nData2 + ' and '                  + #13 +     // SIG 130891 Ferrari
   '         HME.IDITEMEMPTMO NOT IN(13,99))) '                                                         + #13 +     // SIG 130891 Ferrari
//   '         HME.IDITEMEMPTMO IN(13,99))) '                                                         + #13 +     // SIG 130891 Ferrari
   '   AND HME.HMEVLREFETIVO        IS NULL '                                                   + #13 +
   '   AND HME.HMEDATAEFETIVA       IS NULL '                                                   + #13 +
   '   AND HME.FLGBAIXADO           = 0 '                                                       + #13 +
   '   AND TE.IDEMPRESAPROP         = ' + IntToStr(Sistema.IDEmpresa)                           + #13 +

   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', IdContrato)                         + #13 +

   '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                       + #13 +
   '   AND NVL(HME.FLGABONADO, 0)   = 0 '                                                       + #13 +
   '   AND NVL(HME.FLGQUITADO, 0)   = 0 '                                                       + #13 +

   '   AND ( '                                                                                  + #13 +
   '       NVL(HME.FLGSUSPENSAO, 0) = 0 OR '                                                    + #13 +
   '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1) '                    + #13 +
   '       ) '                                                                                  + #13 +

   '   AND HME.HMETIPOMOV           IN (1, 2, 3, 4, 7) '                                        + #13 +
   '   AND CON.FLGSITUACAO          NOT IN (''C'', ''Q'', ''K'') '                              + #13 +

   '   AND CON.IDPATRO              = PPP.IDPESSJUR '                                           + #13 +
   '   AND CON.IDPESSOA             = PPP.IDPESSOA '                                            + #13 +

   // Andre Imakawa - SIG 27356 - Inicio
   {
   '  AND (PPP.FLGDESATIVADO = 0 OR                                                             '+ #13 +
   '      (PPP.FLGDESATIVADO = 1 AND NOT EXISTS                                                 '+ #13 +
   '       (SELECT 1                                                                            '+ #13 +
   '           FROM PARTPREVPLAN PPP1                                                          '+ #13 +
   '          WHERE PPP1.IDPESSOA = PPP.IDPESSOA                                               '+ #13 +
   '            AND PPP1.FLGDESATIVADO = 0) AND                                                '+ #13 +
   '       (PPP.IDSITPLANOPREV = 25 OR                                                         '+ #13 +
   '       (PPP.IDSITPLANOPREV <> 25 AND                                                       '+ #13 +
   '       PPP.DATACANCELAMENTO =                                                              '+ #13 +
   '       (SELECT MAX(PPP1.DATACANCELAMENTO)                                                  '+ #13 +
   '             FROM PARTPREVPLAN PPP1                                                        '+ #13 +
   '            WHERE PPP1.IDPESSOA = PPP.IDPESSOA) AND NOT EXISTS                             '+ #13 +
   '        (SELECT 1                                                                          '+ #13 +
   '             FROM PARTPREVPLAN PPP1                                                        '+ #13 +
   '            WHERE PPP1.IDPESSOA = PPP.IDPESSOA                                             '+ #13 +
   '              AND PPP1.IDSITPLANOPREV = 25)))))                                            '+ #13 +
   }
   // Andre Imakawa - SIG 27356 - Fim

   '  AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO                                          '+ #13 +
   '  AND PPP.IDSITPART = STP.IDSITPART                                                        '+ #13 +
   '  AND CON.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO                                         '+ #13 +
   '  AND TC.IDTIPOEMPTMO = TE.IDTIPOEMPTMO                                                    '+ #13 +
   '  AND HME.IDITEMEMPTMO = ITE.IDITEMEMPTMO                                                  '+ #13 +
   '  AND HME.IDTIPOSUSPEMPTMO = TSE.IDTIPOSUSPEMPTMO(+)                                       '+ #13 +
   '  AND ITC.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO                                     '+ #13 +
   '  AND ITC.IDITEMEMPTMO = HME.IDITEMEMPTMO                                               '+ #13 +
      //William Moreir da Silva - SOL 238210 KINTANA 539626
   ' AND (PPP.IDPLANOPREV =                                                                  '+ #13 +
   '     (SELECT MAX(PPP2.IDPLANOPREV)                                                       '+ #13 +
   '         FROM PARTPREVPLAN PPP2                                                          '+ #13 +
   '        WHERE PPP2.FLGDESATIVADO = 0                                                     '+ #13 +
   '          AND PPP2.IDPESSOA = PPP.IDPESSOA) OR                                           '+ #13 +
   '     (PPP.FLGDESATIVADO = 1 AND NOT EXISTS                                               '+ #13 +
   '      (SELECT 1                                                                          '+ #13 +
   '          FROM PARTPREVPLAN PPP1                                                         '+ #13 +
   '         WHERE PPP1.IDPESSOA = PPP.IDPESSOA                                              '+ #13 +
   '           AND PPP1.FLGDESATIVADO = 0) AND                                               '+ #13 +
   '      (PPP.IDSITPLANOPREV = 25 OR                                                        '+ #13 +
   '      (PPP.IDPLANOPREV =                                                                 '+ #13 +
   '      (SELECT MAX(PPP1.IDPLANOPREV)                                                      '+ #13 +
   '            FROM PARTPREVPLAN PPP1                                                       '+ #13 +
   '           WHERE PPP1.IDPESSOA = PPP.IDPESSOA                                            '+ #13 +
   '             AND NVL(PPP1.DATACANCELAMENTO, TRIM(SYSDATE)) =                             '+ #13 +
   '                 (SELECT NVL(MAX(PPP2.DATACANCELAMENTO), TRIM(SYSDATE))                  '+ #13 +
   '                    FROM PARTPREVPLAN PPP2                                               '+ #13 +
   '                   WHERE PPP2.IDPESSOA = PPP1.IDPESSOA)                                  '+ #13 +
   '             AND NOT EXISTS (SELECT 1                                                    '+ #13 +
   '                   FROM PARTPREVPLAN PPP2                                                '+ #13 +
   '                  WHERE PPP2.IDPESSOA = PPP1.IDPESSOA                                    '+ #13 +
   '                    AND PPP2.IDSITPLANOPREV = 25))))))                                   '+ #13 +
   //William Moreir da Silva - SOL 238210 KINTANA 539626

   ' ORDER BY HME.IDCONTRATOEMPTMO,                                                          '+ #13 +
   '        HME.HMEPARCELA,                                                                '+ #13 +
   '        NVL(ITC.ITCORDEMEXTRATO, 0),                                                   '+ #13 +
   '         DECODE(HME.HMETIPOMOV, 1, 1, 2, 2, 3, 3, 4, 5, 7, 4)                           '+ #13 +
   '  )TMP                                                                                  '+ #13 +
   ' Where TMP.ControleFGQC = 0                                                             '+ #13 +
   ' And TMP.IDITEMEMPTMO  not in (159)                                                     ';    // WO4002 Ferrari
 //  ' order by TMP.hmeparcela,PROXIMA_PARCELA,TMP.IDITEMEMPTMO,TMP.FLGENTRADAMANUAL          ';    // WO18350 Ferrari
   //William Moreira da Silva - SOL 206924 KTN 2000162

   {'SELECT '                                                                                   + #13 +
   '  HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRANCA , '                      + #13 +
   '  HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTMO   , HME.HMEDATAVENCTO, '   + #13 +
   '  HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO   , HME.HMESALDODEV, '                          + #13 +
   '  HME.HMETXJUROS       , HME.HMEPARCELA       , HME.HMEPARCELAALT, HME.HMEFORMACOBRANCA, '  + #13 +
   '  HME.IDHISTMOVEMPTMO  , HME.HMEANOCOBRANCA   , HME.HMEMESCOBRANCA, '                       + #13 +
   '  HME.HMENUMPARCELAS   , HME.HMERECPAG,         ITE.ITEDESCRICAO, HME.HMECENTRALIZA, '      + #13 +
   // FERNANDO XAVIER SOL 139313 Kintana 855071
   ' decode(LEAD(HME.HMEPARCELA) OVER (ORDER BY HME.IDCONTRATOEMPTMO'                           + #13 +
   '                                 , HME.HMEPARCELA'                                          + #13 +
   '                                 , NVL(ITC.ITCORDEMEXTRATO, 0)'                             + #13 +
   '                                 , DECODE(HME.HMETIPOMOV, 1, 1, 2, 2, 3, 3, 4, 5, 7, 4) ),null,HME.HMEPARCELA,'+ #13 +

   ' LEAD(HME.HMEPARCELA) OVER (ORDER BY HME.IDCONTRATOEMPTMO'                                  + #13 +
   '                                 , HME.HMEPARCELA'                                          + #13 +
   '                                 , NVL(ITC.ITCORDEMEXTRATO, 0)'                             + #13 +
   '                                 , DECODE(HME.HMETIPOMOV, 1, 1, 2, 2, 3, 3, 4, 5, 7, 4) ))' + #13 +

   '                                  AS PROXIMA_PARCELA,'                                      + #13 +
   // FERNANDO XAVIER SOL 139313 Kintana 855071

   '  TO_CHAR(HME.HMEMESCOMPETENCIA,''00'') ||''/''|| HME.HMEANOCOMPETENCIA AS COMPETENCIA, '   + #13 +
   '  TO_CHAR(HME.HMEMESCOBRANCA,''00'') ||''/''|| HME.HMEANOCOBRANCA AS COBRANCA, '            + #13 +


   '  CON.IDPATRO, CON.IDPLANOPREV, '                                                           + #13 +
   '  PPP.IDSITPART, '                                                                          + #13 +
   '  STP.FLGINTERNO '                                                                          + #13 +

   'FROM '                                                                                      + #13 +
   '   HISTMOVEMPTMO   HME, '                                                                   + #13 +
   '   PARTPREVPLAN    PPP, '                                                                   + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                   + #13 +
   '   TIPOSUSPEMPTMO  TSE, '                                                                   + #13 +
   '   SITPART         STP, '                                                                   + #13 +
   '   TIPOCONTREMPTMO TC,  '                                                                   + #13 +
   '   ITEMEMPTMO      ITE, '                                                                   + #13 +
   '   TIPOEMPTMO      TE,  '                                                                   + #13 +
   '   ITEMXTIPOCONTR  ITC  '                                                                   + #13 +

   'WHERE '                                                                                     + #13 +
   '       ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO = 1 ) '                             + #13 +

   '   AND HME.HMEDATAPREVISTA     <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                  + #13 +

   '   AND HME.HMEVLREFETIVO        IS NULL '                                                   + #13 +
   '   AND HME.HMEDATAEFETIVA       IS NULL '                                                   + #13 +
   '   AND HME.FLGBAIXADO           = 0 '                                                       + #13 +

   '   AND TE.IDEMPRESAPROP         = ' + IntToStr(Sistema.IDEmpresa)                           + #13 +

   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13 +

   '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                       + #13 +
   '   AND NVL(HME.FLGABONADO, 0)   = 0 '                                                       + #13 +
   '   AND NVL(HME.FLGQUITADO, 0)   = 0 '                                                       + #13 +

   '   AND ( '                                                                                  + #13 +
   '       NVL(HME.FLGSUSPENSAO, 0) = 0 OR '                                                    + #13 +
   '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1) '                    + #13 +
   '       ) '                                                                                  + #13 +

   '   AND HME.HMETIPOMOV           IN (1, 2, 3, 4, 7) '                                        + #13 +
   '   AND CON.FLGSITUACAO          NOT IN (''C'', ''Q'' ) '                                    + #13 +

   '   AND CON.IDPATRO              = PPP.IDPESSJUR '                                           + #13 +
   '   AND CON.IDPESSOA             = PPP.IDPESSOA '                                            + #13 +

   //Renato Visoni SOL 120612 Kintana 575379
   //'   AND PPP.FLGDESATIVADO        = 0 '                                                       + #13 +
   'AND (PPP.FLGDESATIVADO = 0 OR (PPP.FLGDESATIVADO = 1 AND NOT EXISTS (SELECT 1 FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PPP.IDPESSOA  ' + #13 +
   'AND PPP1.FLGDESATIVADO = 0) AND (PPP.IDSITPLANOPREV = 25 OR (PPP.IDSITPLANOPREV <> 25                                                    ' + #13 +
   'AND PPP.DATACANCELAMENTO = (SELECT MAX(PPP1.DATACANCELAMENTO) FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PPP.IDPESSOA)                 ' + #13 +
   'AND NOT EXISTS (SELECT 1 FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PPP.IDPESSOA AND PPP1.IDSITPLANOPREV = 25)))))                     ' + #13 +
   //Renato Visoni SOL 120612 Kintana 575379

   '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                    + #13 +
   '   AND PPP.IDSITPART            = STP.IDSITPART '                                           + #13 +
   '   AND CON.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO '                                    + #13 +
   '   AND TC.IDTIPOEMPTMO          = TE.IDTIPOEMPTMO '                                         + #13 +
   '   AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO '                                        + #13 +

   '   AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+) '                                 + #13 +
   '   AND ITC.IDTIPOCONTREMPTMO    = CON.IDTIPOCONTREMPTMO  '                                  + #13 +
   '   AND ITC.IDITEMEMPTMO         = HME.IDITEMEMPTMO '                                        + #13 +

   'ORDER BY '                                                                                  + #13 +
   // Marchetti - Pendencia 27915
   // Colocado o campo ITCORDEMEXTRATO para solucionar o problema da ordenação do relatorio
   '   HME.IDCONTRATOEMPTMO, HME.HMEPARCELA, NVL(ITC.ITCORDEMEXTRATO, 0),  '                    + #13 +
   '   DECODE(HME.HMETIPOMOV, 1, 1, 2, 2, 3, 3, 4, 5, 7, 4) '                                   + #13;}
   //William Moreira da Silva - SOL 206924 KTN 2000162 - Fim

   //Abre a query HistMovVirtual com os parâmetros passados
   qryHistMov.Close;
   qryHistMov.SQL.Text := sSQL;
   qryHistMov.SQL.SaveToFile(Sistema.TempDir + 'EP-ParcelasRelValorAtualizado.txt');
   qryHistMov.Open;
end;



function TcfgRelValorAtualizado.VerificaPreenchimento: Boolean;
var
   dData : TDateTime;
   i : Integer;
begin
    Result := False;
    try

      if Trim(edtMatricula.Text) = '' then
         raise EValidacao.CreateVal('É necessário indicar um Mutuário!', btnBuscaPart);

      if length(trim(edtDataVencto.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVencto);

      if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
      begin
         // TADEU PASSOS

         //Início - William Santana - SOL 218798.16629 PPM 560594
         qryContratos.First;
         qryContratos.Filtered := False;
         qryContratos.Filter := 'SEL = 1';
         qryContratos.Filtered := True;
         qryContratos.DisableControls;
         iContrSel := 0;
         if not(qryContratos.IsEmpty) then
         begin
          while not qryContratos.Eof do
          begin
           inc(iContrSel);
           qryContratos.next;
          end ;
         end
         else
         begin
          MsgDlg('Nenhum contrato foi informado para a geração do relatório. Seleciona ao menos um contrato.', 'Empréstimo', mtInformation, [mbOk], 0);
          qryContratos.Filtered := false;
          qryContratos.EnableControls;
          exit;
         end;

//         frmProgresso.MostraFormProgresso('Verificando Preenchimento...',
//                                          True,
//                                          True,
//                                          True,
//                                          0,
//                                          qryContratos.RecordCount
//                                         );
//         frmProgresso.btnCancelar.Visible := False;
//         frmProgresso.Refresh;
     //Término -  William Santana - SOL 218798.16629 PPM 560594

         qryContratos.First;
         while not qryContratos.Eof do
         begin
           if qryContratos.FieldByName('FLGSITUACAO').AsString <> 'E' then
           begin

             //Pendência 22798 - 15/09/2006
             if not(CalcEmptmo.PossuiAtualizacaoDiariaExt(qryContratos.FieldByName('IDCONTRATOEMPTMO').AsFloat, edtDataVencto.Date)) then
             begin
                dData  := CalcEmptmo.UltimaDataAtualizacao(qryContratos.FieldByName('IDCONTRATOEMPTMO').AsFloat);
                rSaldo := CalcEmptmo.SaldoDevAnt(qryContratos.FieldByName('IDCONTRATOEMPTMO').AsFloat, dData, -1, -1, False);

                if rSaldo.fSaldoDevAnt <> 0 then
                   raise EValidacao.CreateVal('Não existe Atualização Diária para a data informada!', edtDataVencto);

             end   // if not(CalcEmptmo.PossuiAtualizacaoDiaria(...
             else
             begin
                rSaldo := CalcEmptmo.SaldoDevAnt(qryContratos.FieldByName('IDCONTRATOEMPTMO').AsFloat, edtDataVencto.Date, -1, -1, False);
             end;

           end; // if qryContratos.FieldByName('').AsString <> 'E'

           qryContratos.Next;
           Inc(i);
           //Início - William Santana - SOL 218798.16629 PPM 560594
         //  frmProgresso.AndaFormProgresso(i);
         //  frmProgresso.Refresh;

         end; // while qryContratos.Eof
       //  frmProgresso.EscondeFormProgresso;
        //Término - William Santana - SOL 218798.16629 PPM 560594

         // TADEU PASSOS
      end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1

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



procedure TcfgRelValorAtualizado.Sel(i: Extended);
begin
   // abre a query principal com os parâmetros passados
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;
   end;
end;



procedure TcfgRelValorAtualizado.molMutuariobtnBuscaPartClick(
  Sender: TObject);
begin
  inherited;
  montaSelectMutuario.Executar;

  if montaSelectMutuario.RetornouValor then
  begin
    edtMatricula.Text := montaSelectMutuario.ValoresChave[3];
    edtNome.Text := montaSelectMutuario.ValoresChave[2];
    sCPF         := montaSelectMutuario.ValoresChave[6];

    //Início - William Santana - SOL 218798.16629 PPM 560594
    qryContratos.Close;
    qryContratos.ParamByName('MATRICULA').AsString := montaSelectMutuario.ValoresChave[3];
    qryContratos.Open;
    qryContratos.edit;
    //Término - William Santana - SOL 218798.16629 PPM 560594
  end ;

end;

procedure TcfgRelValorAtualizado.molMutuariobtnLimpaPartClick(
  Sender: TObject);
begin
  inherited;
  edtMatricula.Clear;
  edtNome.Clear;
end;

// TADEU PASSOS
procedure TcfgRelValorAtualizado.PreencheTabelaRel;
var
  bcontrolaquery    : boolean; //  Xavier  SOL 139313 Kintana 855071
     iParcelaAnt       : Integer;
   iParcelaAtu       : Integer;
   iParcelaRestante  : Integer;
   fVlrCorrecao      : Currency;
   fVlrJurosRemunera : Currency;
   fVlrMulta         : Currency;
   fVlrJurosMora     : Currency;
   fVlrEncargo       : Currency;
   fVlrOrig          : Currency;
   fVlrTotal         : Currency;
   fTotalGeral       : Currency;
   fVlrIoFComp       : Currency; // William Santana - SOL 218798.16629 PPM 560594

   // TADEU PASSOS SOL 179770 KINTANA 1736570
   QtdePrestacoes    : Integer;
   QtdeFGQC          : Integer;
   fVlrFGQC          : Currency;
   // TADEU PASSOS SOL 179770 KINTANA 1736570
   NumCasas          : String; //TAES - SIG96903
   iContador         : Integer; // WO10891 Ferrari
   iItem             : Integer; // WO10891 Ferrari
   dDataParcela      : string;  // WO10891 Ferrari
   dDataCredito      : string;  // WO10891 Ferrari
   itaxa             : Currency; // WO10891 Ferrari
   iControle         : Integer;
begin
   //  Xavier   SOL 139313 Kintana 855071
   bcontrolaquery := false;

   qryHistMovVirtual.First;

   iParcelaAnt := qryHistMovVirtualHMEPARCELA.AsInteger;
   iParcelaAtu := qryHistMovVirtualHMEPARCELA.AsInteger;
   fTotalGeral := 0;

   // TADEU PASSOS SOL 179770 KINTANA 1736570
   QtdeFGQC := 0;
   QtdePrestacoes := 0;
   fVlrFGQC := 0;
   // TADEU PASSOS SOL 179770 KINTANA 1736570

   rSaldo := CalcEmptmo.SaldoDevAnt(qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat, edtDataVencto.Date, -1, -1, False);
   //William Moreira da Silva - SOL 218079 KINTANA 2048940

   while not(qryHistMovVirtual.EOF) do
   begin

     dtmRelValorAtualizado.qryValorAtualizado.Insert;

     // TADEU PASSOS SOL 179770 KINTANA 1736570

     NumCasas := VerificaLength(qryHistMovVirtualHMEPARCELA.AsString); //TAES - SIG96903

     dtmRelValorAtualizado.qryValorAtualizadoPARCELAS.AsString := NumCasas + qryHistMovVirtualHMEPARCELA.AsString + '/' + //TAES - SIG96903
                      IntToStr(qryHistMovVirtualPRAZO.AsInteger - qryHistMovVirtualHMEPARCELA.AsInteger);

     if Trim(qryHistMovVirtualITEDESCRICAO.AsString) = 'FGQC' then
     begin
       Inc(QtdeFGQC);
       fVlrFGQC := fVlrFGQC + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
     end
     else if Trim(qryHistMovVirtualITEDESCRICAO.AsString) = 'Prestação' then
       Inc(QtdePrestacoes);

     dtmRelValorAtualizado.qryValorAtualizadoIDCONTRATOEMPTMO.AsFloat := qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat;
     dtmRelValorAtualizado.qryValorAtualizadoTSEDESCRICAO.AsString    := qryHistMovVirtualTSEDESCRICAO.AsString;
     dtmRelValorAtualizado.qryValorAtualizadoTAXA.AsString            := qryHistMovVirtualTAXA.AsString;
     dtmRelValorAtualizado.qryValorAtualizadoPRAZO.AsString           := qryHistMovVirtualPRAZO.AsString;
     dtmRelValorAtualizado.qryValorAtualizadoDATACREDITO.AsString     := qryHistMovVirtualDATACREDITO.AsString;
     dtmRelValorAtualizado.qryValorAtualizadoINDICE.AsString          := qryHistMovVirtualINDICE.AsString;
     // TADEU PASSOS SOL 179770 KINTANA 1736570

     dtmRelValorAtualizado.qryValorAtualizadoITEDESCRICAO.AsString        := qryHistMovVirtualITEDESCRICAO.AsString;
     dtmRelValorAtualizado.qryValorAtualizadoANOMES.AsString              := qryHistMovVirtualANOMES.AsString;
     dtmRelValorAtualizado.qryValorAtualizadoHMEANOCOMPETENCIA.AsInteger  := qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger;
     dtmRelValorAtualizado.qryValorAtualizadoHMEMESCOMPETENCIA.AsInteger  := qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger;
     dtmRelValorAtualizado.qryValorAtualizadoHMEDATAPREVISTA.AsDateTime   := qryHistMovVirtualHMEDATAPREVISTA.AsDateTime;
     dtmRelValorAtualizado.qryValorAtualizadoHMEVLRPREVISTO.AsCurrency    := qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;

     dtmRelValorAtualizado.qryValorAtualizadoVLR_CORRECAO.AsCurrency      := 0;
     dtmRelValorAtualizado.qryValorAtualizadoVLR_MULTA.AsCurrency         := 0;
     dtmRelValorAtualizado.qryValorAtualizadoVLR_JUROSMORA.AsCurrency     := 0;
     dtmRelValorAtualizado.qryValorAtualizadoVLR_JUROSREMUNERA.AsCurrency := 0;

     dtmRelValorAtualizado.qryValorAtualizadoVLR_IOFCOMP.AsCurrency       := 0;   // William Santana - SOL 218798.16629 PPM 560594

     fVlrCorrecao      := 0;
     fVlrJurosRemunera := 0;
     fVlrMulta         := 0;
     fVlrJurosMora     := 0;
     fVlrEncargo       := 0;
     fVlrIoFComp       := 0;   // William Santana - SOL 218798.16629 PPM 560594
     fVlrOrig          := qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
     dDataParcela      := DateToStr(qryHistMovVirtualHMEDATAPREVISTA.AsDateTime);   // WO10891 Ferrari
     dDataCredito      := qryHistMovVirtualDATACREDITO.AsString; // WO10891 Ferrari
     iParcelaRestante  := qryHistMovVirtualPRAZO.AsInteger - qryHistMovVirtualHMEPARCELA.AsInteger ;
     itaxa             := StrToCurr(qryHistMovVirtualHMETXJUROS.AsString); // WO10891 Ferrari
     //BRUNO AZEVEDO SOL 126520 KINTANA 663633
     if (qryHistMovVirtualHMECENTRALIZA.AsFloat = 1) then begin
       iContador := 1;    // WO10891 Ferrari
       iItem := 1;        // WO10891 Ferrari
       iControle := qryHistMovVirtualFLGENTRADAMANUAL.AsInteger;
       while not(qryHistMovVirtual.EOF) and (qryHistMovVirtualHMEPARCELA.AsFLOAT = qryHistMovVirtualPROXIMA_PARCELA.AsFLOAT) do
       begin
//          if (qryHistMovVirtualHMETIPOMOV.AsInteger = 4) then // WO10891 Ferrari
          if (qryHistMovVirtualHMETIPOMOV.AsInteger = 4) and ((iContador = 1) and (qryHistMovVirtualIDITEMEMPTMO.AsInteger <> iItem)) then  // WO10891 Ferrari
          begin
            // Inicio WO10891 Ferrari
{             case qryHistMovVirtualIDITEMEMPTMO.AsInteger of
                42: fVlrCorrecao      := fVlrCorrecao        + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
                43: fVlrJurosRemunera := fVlrJurosRemunera   + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
                44: fVlrMulta         := fVlrMulta           + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
                46: fVlrJurosMora     := fVlrJurosMora       + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
                121: fVlrIoFComp      := fVlrIoFComp         + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;   // William Santana - SOL 218798.16629 PPM 560594
             end;   } // WO10891 Ferrari
             if (qryHistMovVirtualFLGENTRADAMANUAL.AsInteger = 0) and (iControle = 0) then           // WO18350 Ferrari
             begin
               case qryHistMovVirtualIDITEMEMPTMO.AsInteger of
                  42: fVlrCorrecao      := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)));   //+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
                  43: fVlrJurosRemunera := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)));   //+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
                  44: fVlrMulta         := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)));   // WO15857 Ferrari  // WO16298 Ferrari
                  46: fVlrJurosMora     := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)));   //+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
                 121: fVlrIoFComp       := StrToCurr(CalculoAtualizacaoIOF(dDataParcela,dDataCredito,iParcelaAtu,iParcelaRestante,CurrToStr(itaxa),qryContratos.FieldByName('VLRCONTRATO').AsString,edtDataVencto.Text,sAmortizacao));   //+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;  // WO14093 Ferrari      // WO15857 Ferrari  // WO16298 Ferrari
               end;    // WO10891 Ferrari
             end
             else if (qryHistMovVirtualFLGENTRADAMANUAL.AsInteger = 1) and (qryHistMovVirtualHMEDATAVENCTO.AsDateTime <> edtDataVencto.date) then
             begin
               case qryHistMovVirtualIDITEMEMPTMO.AsInteger of
                  42: fVlrCorrecao      := fVlrCorrecao + StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)))+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
                  43: fVlrJurosRemunera := fVlrJurosRemunera + StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)))+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
                  44: fVlrMulta         := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)));   // WO15857 Ferrari  // WO16298 Ferrari
                  46: fVlrJurosMora     := fVlrJurosMora + StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)))+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
                 121: fVlrIoFComp       := fVlrIoFComp + StrToCurr(CalculoAtualizacaoIOF(dDataParcela,dDataCredito,iParcelaAtu,iParcelaRestante,CurrToStr(itaxa),qryContratos.FieldByName('VLRCONTRATO').AsString,edtDataVencto.Text,sAmortizacao))+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;  // WO14093 Ferrari      // WO15857 Ferrari  // WO16298 Ferrari
               end;    // WO10891 Ferrari
             end
             else if ((qryHistMovVirtualFLGENTRADAMANUAL.AsInteger = 1) and (qryHistMovVirtualHMEDATAVENCTO.AsDateTime = edtDataVencto.date)) or
                     ((iControle = 1) and (qryHistMovVirtualHMEDATAVENCTO.AsDateTime = edtDataVencto.date)) then
             begin
               case qryHistMovVirtualIDITEMEMPTMO.AsInteger of
                  42: fVlrCorrecao      := fVlrCorrecao        + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
                  43: fVlrJurosRemunera := fVlrJurosRemunera   + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
                  44: fVlrMulta         := fVlrMulta           + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
                  46: fVlrJurosMora     := fVlrJurosMora       + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
                 121: fVlrIoFComp       := fVlrIoFComp         + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
               end;    // WO10891 Ferrari
             end;
          end
             // Inicio WO18350 Ferrari
          else if (qryHistMovVirtualFLGENTRADAMANUAL.AsInteger = 1) and (qryHistMovVirtualHMEDATAVENCTO.AsDateTime <> edtDataVencto.date) then
          begin
            case qryHistMovVirtualIDITEMEMPTMO.AsInteger of
               42: fVlrCorrecao      := fVlrCorrecao + StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)))+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
               43: fVlrJurosRemunera := fVlrJurosRemunera + StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)))+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
               44: fVlrMulta         := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)));   // WO15857 Ferrari  // WO16298 Ferrari
               46: fVlrJurosMora     := fVlrJurosMora + StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)))+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
              121: fVlrIoFComp       := fVlrIoFComp + StrToCurr(CalculoAtualizacaoIOF(dDataParcela,dDataCredito,iParcelaAtu,iParcelaRestante,CurrToStr(itaxa),qryContratos.FieldByName('VLRCONTRATO').AsString,edtDataVencto.Text,sAmortizacao))+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;  // WO14093 Ferrari      // WO15857 Ferrari  // WO16298 Ferrari
            end;    // WO10891 Ferrari
          end
          else if ((qryHistMovVirtualFLGENTRADAMANUAL.AsInteger = 1) and (qryHistMovVirtualHMEDATAVENCTO.AsDateTime = edtDataVencto.date)) or
                  ((iControle = 1) and (qryHistMovVirtualHMEDATAVENCTO.AsDateTime = edtDataVencto.date)) then
          begin
            case qryHistMovVirtualIDITEMEMPTMO.AsInteger of
               42: fVlrCorrecao      := fVlrCorrecao        + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
               43: fVlrJurosRemunera := fVlrJurosRemunera   + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
               44: fVlrMulta         := fVlrMulta           + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
               46: fVlrJurosMora     := fVlrJurosMora       + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
              121: fVlrIoFComp       := fVlrIoFComp         + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
            end;    // WO10891 Ferrari
          end;

             // Fim WO18350 Ferrari
           iItem := qryHistMovVirtualIDITEMEMPTMO.AsInteger ;
           // Fim WO10891 Ferrari
           //  fVlrEncargo := fVlrEncargo + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency
          // WO10891 Ferrari
   //       if (qryHistMovVirtualHMETIPOMOV.AsInteger = 4) then
   //         fVlrEncargo := fVlrEncargo + fVlrCorrecao + fVlrJurosRemunera + fVlrMulta + fVlrJurosMora;  // WO10891 Ferrari
         //   fVlrEncargo := fVlrEncargo + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;    // WO10891 Ferrari

          qryHistMovVirtual.Next;

          iParcelaAtu := qryHistMovVirtualHMEPARCELA.AsInteger;
       end;
       // Ádler Souza - SOL 141214 Kintana 897762
       if ((qryHistMovVirtualHMETIPOMOV.AsInteger = 4) and not(qryHistMovVirtual.EOF)) then
       begin
         //Inicio WO10891 Ferrari
{         case qryHistMovVirtualIDITEMEMPTMO.AsInteger of
           42: fVlrCorrecao      := fVlrCorrecao        + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
           43: fVlrJurosRemunera := fVlrJurosRemunera   + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
           44: fVlrMulta         := fVlrMulta           + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
           46: fVlrJurosMora     := fVlrJurosMora       + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;
           121: fVlrIoFComp      := fVlrIoFComp         + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;   // William Santana - SOL 218798.16629 PPM 560594
         end;    }
         if (qryHistMovVirtualFLGENTRADAMANUAL.AsInteger = 0) and (iControle = 0) then       // WO18350 Ferrari
         begin
           case qryHistMovVirtualIDITEMEMPTMO.AsInteger of
              42: fVlrCorrecao      := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)));   //+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
              43: fVlrJurosRemunera := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)));   //+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
              44: fVlrMulta         := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)));   // WO15857 Ferrari   // WO16298 Ferrari
              46: fVlrJurosMora     := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)));   //+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
             121: fVlrIoFComp       := StrToCurr(CalculoAtualizacaoIOF(dDataParcela,dDataCredito,iParcelaAtu,iParcelaRestante,CurrToStr(itaxa),qryContratos.FieldByName('VLRCONTRATO').AsString,edtDataVencto.Text,sAmortizacao));   //+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;   // WO14093 Ferrari      // WO15857 Ferrari    // WO16298 Ferrari
           end;
         end
         // Inicio WO18350 Ferrari
         else if iControle = 1 then
         begin
           case qryHistMovVirtualIDITEMEMPTMO.AsInteger of
              42: fVlrCorrecao      := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)))+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
              43: fVlrJurosRemunera := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)))+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
              44: fVlrMulta         := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)));   // WO15857 Ferrari   // WO16298 Ferrari
              46: fVlrJurosMora     := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,qryHistMovVirtualIDITEMEMPTMO.AsInteger,CurrToStr(itaxa)))+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
             121: fVlrIoFComp       := StrToCurr(CalculoAtualizacaoIOF(dDataParcela,dDataCredito,iParcelaAtu,iParcelaRestante,CurrToStr(itaxa),qryContratos.FieldByName('VLRCONTRATO').AsString,edtDataVencto.Text,sAmortizacao))+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;   // WO14093 Ferrari      // WO15857 Ferrari    // WO16298 Ferrari
           end;
         end;
         // Fim WO18350 Ferrari
         // Fim WO10891 Ferrari
//         fVlrEncargo := fVlrEncargo + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency    // WO10891 Ferrari
//         fVlrEncargo := fVlrEncargo + fVlrCorrecao + fVlrJurosRemunera + fVlrMulta + fVlrJurosMora;  // WO10891 Ferrari
       end
       // Inicio WO19066 Ferrari
       else if qryHistMovVirtualHMETIPOMOV.AsInteger = 1 then
         begin
           fVlrCorrecao      := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,42,CurrToStr(itaxa)));   //+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
           fVlrJurosRemunera := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,43,CurrToStr(itaxa)));   //+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
           fVlrMulta         := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,44,CurrToStr(itaxa)));   // WO15857 Ferrari   // WO16298 Ferrari
           fVlrJurosMora     := StrToCurr(CalculoAtualizacao(dDataParcela,CurrToStr(fVlrOrig),edtDataVencto.Text,46,CurrToStr(itaxa)));   //+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;     // WO15857 Ferrari  // WO16298 Ferrari
           fVlrIoFComp       := StrToCurr(CalculoAtualizacaoIOF(dDataParcela,dDataCredito,iParcelaAtu,iParcelaRestante,CurrToStr(itaxa),qryContratos.FieldByName('VLRCONTRATO').AsString,edtDataVencto.Text,sAmortizacao));   //+ qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;   // WO14093 Ferrari      // WO15857 Ferrari    // WO16298 Ferrari
       end;
       // Fim WO19066 Ferrari
       // Fim - Ádler Souza - SOL 141214 Kintana 897762
       fVlrEncargo := fVlrEncargo + fVlrCorrecao + fVlrJurosRemunera + fVlrMulta + fVlrJurosMora + fVlrIoFComp;  // WO10891 Ferrari
       iParcelaAtu := qryHistMovVirtualHMEPARCELA.AsInteger;

       dtmRelValorAtualizado.qryValorAtualizadoVLR_CORRECAO.AsCurrency      := 0;
       dtmRelValorAtualizado.qryValorAtualizadoVLR_JUROSREMUNERA.AsCurrency := 0;
       dtmRelValorAtualizado.qryValorAtualizadoVLR_MULTA.AsCurrency         := 0;
       dtmRelValorAtualizado.qryValorAtualizadoVLR_JUROSMORA.AsCurrency     := 0;

       dtmRelValorAtualizado.qryValorAtualizadoVLR_IOFCOMP.AsCurrency     := 0;   // William Santana - SOL 218798.16629 PPM 560594

       if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
       begin
          dtmRelValorAtualizado.qryValorAtualizadoVLR_CORRECAO.AsCurrency      := fVlrCorrecao;
          dtmRelValorAtualizado.qryValorAtualizadoVLR_JUROSREMUNERA.AsCurrency := fVlrJurosRemunera;
          dtmRelValorAtualizado.qryValorAtualizadoVLR_MULTA.AsCurrency         := fVlrMulta;
          dtmRelValorAtualizado.qryValorAtualizadoVLR_JUROSMORA.AsCurrency     := fVlrJurosMora;
          dtmRelValorAtualizado.qryValorAtualizadoVLR_IOFCOMP.AsCurrency       := fVlrIoFComp; // William Santana - SOL 218798.16629 PPM 560594
       end;
     //BRUNO AZEVEDO SOL 126520 KINTANA 663633
     end else begin
       // Xavier  SOL 139313 Kintana 855071
       bcontrolaquery    := true;
       qryHistMovVirtual.Next;

     end;

     dtmRelValorAtualizado.qryValorAtualizadoVLR_ENCARGOS.AsCurrency   := fVlrEncargo;
     dtmRelValorAtualizado.qryValorAtualizadoVLR_ATUALIZADO.AsCurrency := fVlrOrig + fVlrEncargo;

     fTotalGeral := fTotalGeral + fVlrOrig + fVlrEncargo;


     with dtmRelValorAtualizado do
     begin
        qryValorAtualizadoQTDEPRESTACOES.AsInteger := QtdePrestacoes;
        qryValorAtualizadoQTDEFGQC.AsInteger       := QtdeFGQC;
        qryValorAtualizadoVLRFGQC.AsFloat          := fVlrFGQC;
        //William Moreira da Silva - SOL 218079 KINTANA 2048940
        //qryValorAtualizadoVLRDEVVENCIDO.AsFloat    := fTotalGeral + fVlrFGQC;
        qryValorAtualizadoVLRDEVVENCIDO.AsFloat    := fTotalGeral;
        qryValorAtualizadoVLRDEVVENCER.AsFloat     := rSaldo.fSaldoDevAnt;

        //rptRelValorAtualizado_lblSaldoDev.Caption       := FormatFloat('#,#0.00;(#,#0.00)', rSaldo.fSaldoDevAnt);


        //Prestações (Valor Nominal + Encargos)
        //William Moreira da Silva - SOL 218079 KINTANA 2048940
        //qryValorAtualizadoVLRATUALIZADO.AsFloat := fTotalGeral;
          qryValorAtualizadoVLRATUALIZADO.AsFloat := fTotalGeral - fVlrFGQC;

        //qryValorAtualizadoTOTALDEVIDO.AsFloat := rSaldo.fSaldoDevAnt + fTotalGeral + fVlrFGQC;
        qryValorAtualizadoTOTALDEVIDO.AsFloat := rSaldo.fSaldoDevAnt + fTotalGeral;
        //William Moreira da Silva - SOL 218079 KINTANA 2048940
     end;

     dtmRelValorAtualizado.qryValorAtualizado.Post;

      iParcelaAnt := qryHistMovVirtualHMEPARCELA.AsInteger;
      if not(bcontrolaquery) then  // Xavier SOL 139313 Kintana 855071
         qryHistMovVirtual.Next;

      bcontrolaquery := false;
   end;
end;
// TADEU PASSOS

//TAES - SIG96903 - início
function TcfgRelValorAtualizado.VerificaLength(Parcela: String): String;
begin
     if((Length(Parcela)) = 3) then
     begin
       Result := '';
     end
     else if ((Length(Parcela)) = 2) then
     begin
       Result := '0';
     end
     else
     begin
       Result := '00'
     end;
end;
//TAES - SIG96903 - fim

function TcfgRelValorAtualizado.CalculoAtualizacao(
  DataPrevista: String; Valor_Parcela: string;
  Data_atualizada: string;
  ItemParcela: Integer;
  Taxa_Juros :string): string;
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

function TcfgRelValorAtualizado.CalculoAtualizacaoIOF(DataPrevista,
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

end.
