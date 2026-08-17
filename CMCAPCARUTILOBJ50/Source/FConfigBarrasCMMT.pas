// Alterações:
{--------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------
{--------------------------------------------------------------------------------------------------
Atender     : MIGRACAO-ORACLE
Data        : 17/10/2025
Autor       : EDILAINE
Descrição   : Uso de cast em campos texto extensos
--------------------------------------------------------------------------------------------------
Atender     : WO16145
Data        : 19/12/2024
Autor       : Arnaldo V. Scarin
Descrição   : Correção do FatorVencimento, que a partir de 22/02/2025 será reiniciado em 1000, por conta
              do Codigo exceder 9999
--------------------------------------------------------------------------------------------------
Pendência   :  SIG 114623
Responsável :  Ewerton Beltramini
Data        :  29/01/2021
Descrição   :  Implementação do comando Copy, para igualar as bases de produção.
-------------------------------------------------------------------------------
Nº SIG......: 29271
Data........: 03/02/2017
Responsável.: William Santana
Descrição...: Modernização Layout CARTEIRACOBR 
--------------------------------------------------------------------------------------------------
Nº SOL......: 253577/17906
Nº PPM......: 1163500
Data........: 17/11/2015
Responsável.: Helio Lima Custodio
Descrição...: Correção o e-mail utilizado para envio, deve ser o campo
              EMAILFUNCEF  da tabela PessoaFisica.
--------------------------------------------------------------------------------------------------
Nº SOL......: 258995
Nº PPM......: 996923
Data........: 29/07/2015
Responsável.: Helio Lima Custodio
Descrição...: Correção ao emitir boleto ao emitir arquivos separados e ao enviar e-mail.
--------------------------------------------------------------------------------------------------
Nº SOL......: 253577/17359
Nº PPM......: 842402
Data........: 01/07/2015
Responsável.: Helio Lima Custodio
Descrição...: Adiciona opção de envio separado por arquivo e de envio de e-mail aos participantes.
--------------------------------------------------------------------------------------------------
Nº SOL......: 208257.15307
Nº KINTANA..: 2050609
Data........: 26/11/2013
Responsável.: William Santana
Descrição...: AJUSTE NA QUERY PARA EMISSÃO DE FICHA DE COMPENSAÇÃO.
--------------------------------------------------------------------------------------------------
Nº SOL......: 206258.14662
Nº KINTANA..: 2020646
Data........: 13/06/2013
Responsável.: Fernando Xavier
Descrição...: correção do número de agencia e convênio bancário.
----------------------------------------------------------------------------------------------------
Nº SOL......: 206258
Nº KINTANA..: 1995712
Data........: 08/05/2013
Responsável.: FELIPE AZEVEDO DOS SANTOS
Descrição...: correção do número de agencia e convênio bancário.
----------------------------------------------------------------------------------------------------
Nº SOL......: 145684
Nº KINTANA..: 984840
Data........: 19/10/2010
Responsável.: Arnaldo Vicente Scarin
Descrição...: Correção da rotina de geração do nosso numero, pois estava ocorrendo
              erro quando impresso o boleto SICOB para documentos do imobiliario.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: SelDados, MontaBarrasCEFSigcb
Nº SOL......: 124468/388 121467/381
Nº KINTANA..: 668793 668796
Data........: 07/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Criação da função CalcDVNossoNumeroCefSigCB para calcular o DV do Nosso numero.
              Criação das funções CalcDVGeral e CalcDVCampo123 para correção da da rotina
              MontaBarrasCEFSigcb
---------------------------------------------------------------------------------------------------}
{ -----------------------------------------------------------------------------}
// Rotinas   : GetDocumentos
// Data      : 07/04/2005
// Autor     : Andre Tavares
// Pendência : 22079
// Descrição : criei várias propriedades para o form para que seja possível chamálo preenchido na tela de
//lançamento de documentos no CAR.
//------------------------------------------------------------------------------
{--------------------------------------------------------------------------------------------------
Rotina    : Procure pelo numero da pendencia para encontrar as alteraçoes
Data      : 23/02/2006
Autor     : André Tavares
Pendência : 21632
Descrição : o campo nosso número do boleto tem que ser o mesmo que sai no código de barras.
--------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------
Rotina    : Procure pelo numero da pendencia para encontrar as alteraçoes
Data      : 26/12/2005
Autor     : André Tavares
Pendência : 21127
Descrição : IntBancoManager.NossoNumero := formatFloat('#0', rNossoNumero); - isso aqui tem que ser atualizado, pois é utilizado ao longo dos processos
--------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------
Rotina    : Procure pelo numero da pendencia para encontrar as alteraçoes
Data      : 31/03/2005
Autor     : André Tavares
Pendência : 18844
Descrição : Não deixar repetir o nossoNumero do documento.
---------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------
Rotina    : ALTEREI A QUERY DO SQLBLOQUETE
Data      : 20/12/2004
Autor     : André Tavares
Pendência : 18246
Descrição : a query não estava grupando os documentos com o mesmo codgrupocnab.
---------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------
Rotina    : MemMensagem1Print
Data      : 19/11/2004
Autor     : André Tavares
Pendência : 18122
Descrição : pergunta se a linha está vazia antes de adicionar
---------------------------------------------------------------------------------------------------}
//início - andre tavares - pendência 17283 - 30/08/2004
{--------------------------------------------------------------------------------------------------
Rotina    : SelDados
Data      : 30/08//2004
Autor     : André Tavares
Pendência : 17283
Descrição : Ao reimprimir o boloqute com o mesmo nosso número, o sistema estava adicionando o DV novamente.
---------------------------------------------------------------------------------------------------}

{--------------------------------------------------------------------------------------------------
Componente: CdsBloqueteTipoCli
Data      : 28/02/2004
Autor     : David
Pendência : 15931
Descrição : Solução do problema que ocorria quando se tentava imprimir a ficha
            filtrada pelo tipo de cliente. O SQL do componente foi alterado. O
            SQL original está comentado no fim do código.
---------------------------------------------------------------------------------------------------}

{--------------------------------------------------------------------------------------------------
Rotina    : SelDados
Data      : 04/02/2004
Autor     : André Tavares
Descrição : resolução da pendência 15474
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : MemMensagem1Print
Data      : 28/08/2003
Autor     : André Tavares
Descrição : resolução da pendência 13159
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : SelDados e
Data      : 26/08/2003
Autor     : Gleyber
Pendência : 14894
Descrição : Correção para que quando não houver documentos a ser impresso não mostrar mensagens.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : OpenBloquete
Data      : 22/07/2003
Autor     : André Pontes
Pendência : 14629
Descrição : Correção SqlBloqueteTipoCli (campo NODOCUMENTO)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BtnImprimeClick
Data      : 04/07/2003
Autor     : André Tavares
Descrição : resolução da pendência 14324
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : SelDados
Data      : 03/07/2003
Autor     : André Tavares
Descrição : resolução da pendência 14179
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : SelDados
Data      : 02/07/2003
Autor     : André Tavares
Descrição : Preenchimeno do campo nossonumero que por estar vazio, não estava mantendo o noosonumero
original como deveria. resolução da pendência 14263
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : OpenBloquete
Data      : 20/06/2003
Autor     : André Pontes
Descrição : Criação de novo filtro por Usuário
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
 02/06/2000 - 2.23.05
  Correção na seleção de documentos a serem impressos;
  Implementação do tratamento de erros de seleção de documentos e impressão;
  Correção na gravação da impressão dos documentos;
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
 06/06/2000 - 02.24.02
   Correção na seleção das mensagens associadas ao documento para impressão;
   Indicação do nº de registros a serem impressos;
   Implementação da Possibilidade de cancelamento da impressão;
   Otimização da consulta de seleção dos registros;
---------------------------------------------------------------------------------------------------}

Unit FConfigBarrasCMMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppClass, ppBands, ppProd, ppReport, ppComm, ppCache, ppDB, ppDBBDE, Db, Menus,
  ppEndUsr, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Wwdatsrc,
  MAHlpBtn, TB97Ctls, TB97Tlbr, TB97, StdCtrls, Buttons, Mask, wwdbedit, wwdblook,
  CMDBLookupCombo, ExtCtrls, ppStrtch, ppMemo, ppCtrls, ppBarCod, ppPrnabl, ExtDlgs,
  Grids, Wwdbigrd, Wwdbgrid, ppVar, ppRelatv, ppDBPipe, CmEventosCadastro,
  ImgList, JclDateTime, FConfigRelatorioMT, uCmSqlParams, DBClient, uCMClientDataSet,
  uCtrlParamIntegra, uCtrlIntBanco, uString, uContaBancariaMT, uCtrlConfigbarras,
  uDataBase, uCtrlParamBloqueteCobranca, ppModule, raCodMod,
   DBCtrls, //início andre tavares - pendencia 22455 26/05/2006
  Wwquery; //Helio - SOL Nº 253577-17359 PPM Nº 842402

Type
   EImprimeFichaCompError = Exception;

   TFrmConfigBarrasCMMT = Class(TFrmConfigRelatorioMT)
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      EdnNomeBanco: TwwDBEdit;
      EdtNumBanco: TwwDBEdit;
      EdtCateira: TwwDBEdit;
      EdtCodMoeda: TwwDBEdit;
      EdtAceite: TwwDBEdit;
      EdtEspecieDoc: TwwDBEdit;
      EdtNumDig: TwwDBEdit;
      ScrollBox1: TScrollBox;
      ImgBanco: TImage;
      RptBarrasBBLine36: TppLine;
      RptBarrasBBLine41: TppLine;
      RptBarrasBBLine29: TppLine;
      RptBarrasBBLine43: TppLine;
      RptBarrasBBLine42: TppLine;
      RptBarrasBBLabel42: TppLabel;
      RptBarrasBBLine48: TppLine;
      RptBarrasBBLine52: TppLine;
      RptBarrasBBLine50: TppLine;
      RptBarrasBBLine49: TppLine;
      RptBarrasBBLine21: TppLine;
      RptBarrasBBLine23: TppLine;
      RptBarrasBBLine22: TppLine;
      RptBarrasBBLine19: TppLine;
      RptBarrasBBLine5: TppLine;
      RptBarrasBBLine13: TppLine;
      LblNomeBanco2: TppLabel;
      LblNumBanco2: TppLabel;
      RptBarrasBBLine1: TppLine;
      RptBarrasBBLine3: TppLine;
      RptBarrasBBLine2: TppLine;
      RptBarrasBBLine4: TppLine;
      RptBarrasBBLine6: TppLine;
      RptBarrasBBLine7: TppLine;
      RptBarrasBBLine8: TppLine;
      RptBarrasBBLine9: TppLine;
      RptBarrasBBLine10: TppLine;
      RptBarrasBBLine11: TppLine;
      RptBarrasBBLabel3: TppLabel;
      RptBarrasBBLine14: TppLine;
      RptBarrasBBLine15: TppLine;
      RptBarrasBBLine16: TppLine;
      RptBarrasBBLine17: TppLine;
      RptBarrasBBLabel4: TppLabel;
      RptBarrasBBLabel5: TppLabel;
      RptBarrasBBLabel6: TppLabel;
      RptBarrasBBLabel7: TppLabel;
      RptBarrasBBLabel8: TppLabel;
      RptBarrasBBLabel9: TppLabel;
      RptBarrasBBLabel10: TppLabel;
      RptBarrasBBLabel11: TppLabel;
      RptBarrasBBLabel12: TppLabel;
      RptBarrasBBLabel13: TppLabel;
      RptBarrasBBLabel14: TppLabel;
      RptBarrasBBLabel15: TppLabel;
      RptBarrasBBLabel16: TppLabel;
      RptBarrasBBLabel17: TppLabel;
      RptBarrasBBLabel18: TppLabel;
      RptBarrasBBLabel19: TppLabel;
      RptBarrasBBLabel20: TppLabel;
      RptBarrasBBLabel21: TppLabel;
      RptBarrasBBLabel22: TppLabel;
      RptBarrasBBLine18: TppLine;
      RptBarrasBBLabel23: TppLabel;
      RptBarrasBBLine20: TppLine;
      RptBarrasBBLabel24: TppLabel;
      RptBarrasBBLabel25: TppLabel;
      RptBarrasBBLabel26: TppLabel;
      RptBarrasBBLabel27: TppLabel;
      RptBarrasBBLabel28: TppLabel;
      RptBarrasBBLabel29: TppLabel;
      RptBarrasBBLabel30: TppLabel;
      LblAceite2: TppLabel;
      RptBarrasBBLabel32: TppLabel;
      RptBarrasBBLine24: TppLine;
      RptBarrasBBLine25: TppLine;
      RptBarrasBBLine26: TppLine;
      RptBarrasBBLine27: TppLine;
      RptBarrasBBLine28: TppLine;
      LblNomeBanco1: TppLabel;
      LblNumBanco1: TppLabel;
      RptBarrasBBLine30: TppLine;
      RptBarrasBBLine31: TppLine;
      RptBarrasBBLine32: TppLine;
      RptBarrasBBLine33: TppLine;
      RptBarrasBBLine34: TppLine;
      RptBarrasBBLine35: TppLine;
      RptBarrasBBLine37: TppLine;
      RptBarrasBBLine38: TppLine;
      RptBarrasBBLabel36: TppLabel;
      RptBarrasBBLine40: TppLine;
      RptBarrasBBLabel37: TppLabel;
      RptBarrasBBLabel39: TppLabel;
      RptBarrasBBLabel40: TppLabel;
      RptBarrasBBLabel41: TppLabel;
      RptBarrasBBLabel43: TppLabel;
      RptBarrasBBLabel44: TppLabel;
      RptBarrasBBLabel45: TppLabel;
      RptBarrasBBLabel46: TppLabel;
      RptBarrasBBLabel47: TppLabel;
      RptBarrasBBLabel48: TppLabel;
      RptBarrasBBLabel49: TppLabel;
      RptBarrasBBLabel50: TppLabel;
      RptBarrasBBLabel51: TppLabel;
      RptBarrasBBLabel52: TppLabel;
      RptBarrasBBLabel53: TppLabel;
      RptBarrasBBLabel54: TppLabel;
      RptBarrasBBLabel55: TppLabel;
      RptBarrasBBLine44: TppLine;
      RptBarrasBBLabel56: TppLabel;
      RptBarrasBBLine45: TppLine;
      RptBarrasBBLabel57: TppLabel;
      RptBarrasBBLabel58: TppLabel;
      RptBarrasBBLabel59: TppLabel;
      RptBarrasBBLabel60: TppLabel;
      RptBarrasBBLabel61: TppLabel;
      RptBarrasBBLabel62: TppLabel;
      RptBarrasBBLabel63: TppLabel;
      LblAceite1: TppLabel;
      RptBarrasBBLabel65: TppLabel;
      RptBarrasBBLine46: TppLine;
      RptBarrasBBLine47: TppLine;
      RptBarrasBBDBText1: TppDBText;
      RptBarrasBBCalc1: TppCalc;
      RptBarrasBBDBText2: TppDBText;
      RptBarrasBBDBText4: TppDBText;
      RptBarrasBBDBText5: TppDBText;
      RptBarrasBBDBText6: TppDBText;
      RptBarrasBBLabel35: TppLabel;
      RptBarrasBBLabel38: TppLabel;
      RptBarrasBBLabel66: TppLabel;
      LblCarteira1: TppLabel;
      RptBarrasBBDBText3: TppDBText;
      RptBarrasBBDBText7: TppDBText;
      RptBarrasBBLabel69: TppLabel;
      RptBarrasBBLabel70: TppLabel;
      RptBarrasBBLabel71: TppLabel;
      RptBarrasBBDBText17: TppDBText;
      RptBarrasBBDBText18: TppDBText;
      RptBarrasBBLabel72: TppLabel;
      RptBarrasBBDBText19: TppDBText;
      RptBarrasBBDBText20: TppDBText;
      RptBarrasBBDBText21: TppDBText;
      RptBarrasBBDBText22: TppDBText;
      RptBarrasBBDBText23: TppDBText;
      RptBarrasBBDBText24: TppDBText;
      RptBarrasBBDBText25: TppDBText;
      RptBarrasBBDBText26: TppDBText;
      RptBarrasBBDBText27: TppDBText;
      RptBarrasBBLabel73: TppLabel;
      RptBarrasBBDBText28: TppDBText;
      RptBarrasBBDBText29: TppDBText;
      RptBarrasBBDBText30: TppDBText;
      RptBarrasBBDBText31: TppDBText;
      RptBarrasBBDBText32: TppDBText;
      RptBarrasBBDBText33: TppDBText;
      RptBarrasBBDBText34: TppDBText;
      RptBarrasBBLabel74: TppLabel;
      LblEmpresa2: TppLabel;
      RptBarrasBBDBText40: TppDBText;
      RptBarrasBBDBText41: TppDBText;
      RptBarrasBBDBText42: TppDBText;
      LblCarteira2: TppLabel;
      RptBarrasBBDBText43: TppDBText;
      RptBarrasBBDBText44: TppDBText;
      RptBarrasBBCalc2: TppCalc;
      RptBarrasBBDBText45: TppDBText;
      RptBarrasBBDBText46: TppDBText;
      LblEmpresa: TppLabel;
      RptBarrasBBDBText47: TppDBText;
      RptBarrasBBDBText48: TppDBText;
      RptBarrasBBDBText49: TppDBText;
      Barras: TppDBBarCode;
      RptBarrasBBLine51: TppLine;
      ImgLogo1: TppImage;
      ImgLogo2: TppImage;
      MemMensagem2: TppMemo;
      MemMensagem1: TppMemo;
      LblEspecieDoc1: TppLabel;
      LblEspecieDoc2: TppLabel;
      PpmImagem: TPopupMenu;
      MnuSeleciona: TMenuItem;
      MnuImgPadrao: TMenuItem;
      MnuLimpaImg: TMenuItem;
      MnuUnibanco: TMenuItem;
      MnuBancoDoBrasil: TMenuItem;
      MnuBanerj: TMenuItem;
      MnuBradesco: TMenuItem;
      MnuCaixa: TMenuItem;
      MnuItau: TMenuItem;
      MnuMeridional: TMenuItem;
      MnuAbn: TMenuItem;
      MnuReal: TMenuItem;
      MnuHsbc: TMenuItem;
      OpFoto: TOpenPictureDialog;
      DsBloquete: TwwDataSource;
      LblPortForma: TLabel;
      DbLcPortador: TwwDBLookupCombo;
      Label12: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      dblkTipClie: TwwDBLookupCombo;
      CmbTipoDoc: TwwDBLookupCombo;
      CMDBMODULO: TCMDBLookupCombo;
      RptModeloDBText1: TppDBText;
      PnlDocsImpressos: TPanel;
      GrdDocsImpressos: TwwDBGrid;
      SqlPortForma: TCMSqlParams;
      CdsPortForma: TCMClientDataSet;
      CdsBloquete: TCMClientDataSet;
      SqlBloquete: TCMSqlParams;
      CdsBloqueteTipoCli: TCMClientDataSet;
      SqlBloqueteTipoCli: TCMSqlParams;
      CdsBloqImpressos: TCMClientDataSet;
      SqlBloqImpressos: TCMSqlParams;
      CdsBanco: TCMClientDataSet;
      SqlBanco: TCMSqlParams;
      CdsModulo: TCMClientDataSet;
      SqlModulo: TCMSqlParams;
      CdsTipoDoc: TCMClientDataSet;
      SqlTipoDoc: TCMSqlParams;
      CdsAux: TCMClientDataSet;
      SqlAux: TCMSqlParams;
      CdsTipClie: TCMClientDataSet;
      SqlTipClie: TCMSqlParams;
      DBcboUsuario: TCMDBLookupCombo;
      Label15: TLabel;
      sqlUsuario: TCMSqlParams;
      cdsUsuario: TCMClientDataSet;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label11: TLabel;
    cdsMSG: TCMClientDataSet;
    sqlMsg: TCMSqlParams;
    dblkmsg: TwwDBLookupCombo;
    Edit9: TEdit;
    CdsDadosCEP: TStringField;
    CdsDadosCODESTADO: TStringField;
    CdsDadosCIDADE: TStringField;
    CdsDadosBAIRRO: TStringField;
    strfildCOMPLEMENTO: TStringField;
    CdsDadosNUMERO: TStringField;
    CdsDadosLOGRADOURO: TStringField;
    CdsDadosNUMDOCUMENTO: TStringField;

    //Inicio - Helio - SOL Nº 253577-17359 PPM Nº 842402
    CdsDadosIDPESSOA: TFloatField;
    CdsDadosEMAILFUNCEF: TStringField; //Helio - SOL Nº 253577/17906 PPM Nº 1163500
    CdsDadosMATRICULA: TStringField;
    //Fim - Helio - SOL Nº 253577-17359 PPM Nº 842402

    CdsDadosNOME: TStringField;
    CdsDadosVALORDESCONTO: TFloatField;
    CdsDadosDATALIMITE: TDateTimeField;
    CdsDadosDATAPROGRAMADA: TDateTimeField;
    CdsDadosCODPORTFORMA: TFloatField;
    CdsDadosDATAVENCTO: TDateTimeField;
    CdsDadosDATAREMESSA: TDateTimeField;
    CdsDadosEMISBLOQ: TStringField;
    CdsDadosSTATUS: TStringField;
    CdsDadosDATAEMISSAO: TDateTimeField;
    CdsDadosDATADOCUMENTO: TDateTimeField;
    CdsDadosNODOCUMENTO: TFloatField;
    CdsDadosMOESIGLA: TStringField;
    CdsDadosCODDOCUMENTO: TFloatField;
    CdsDadosTIPO: TStringField;
    CdsDadosNOSSONUMERO: TStringField;
    CdsDadosCOMPLDOCUMENTO: TStringField;
    CdsDadosTIPOENDERECO: TStringField;
    CdsDadosNUMAGENCIA: TStringField;
    CdsDadosNUMCONTA: TStringField;
    CdsDadosVALORJUROS: TFloatField;
    CdsDadosCODBARRA: TStringField;
    CdsDadosRSALDO: TFloatField;
    CdsDadosRSALDOOUTRAMOEDA: TFloatField;
    CdsDadosCODBARRADIG: TStringField;
    CdsDadosFLGGRUPO: TStringField;
    CdsDadosAGENCIACODCEDENTE: TStringField;
    CdsDadosNUMEMPRESABANCO: TStringField;
    CdsDadosAGENCIACONVENIO: TStringField;
    CdsDadosIDMODULO: TFloatField;
    strngfldCdsDadosNUMDOCUMENTO_CEDENTE: TStringField;
    strngfldCdsDadosRAZAOSOCIAL_CEDENTE: TStringField;
    CdsDadosCedente: TCMClientDataSet;
    strngfldCdsDadosENDERECO_CEDENTE: TStringField;
    pplfPpDadosppField1: TppField;
    pplfPpDadosppField2: TppField;
    pplfPpDadosppField3: TppField;
    pplfPpDadosppField4: TppField;
    pplfPpDadosppField5: TppField;
    pplfPpDadosppField6: TppField;
    pplfPpDadosppField7: TppField;
    pplfPpDadosppField8: TppField;
    pplfPpDadosppField9: TppField;
    pplfPpDadosppField10: TppField;
    pplfPpDadosppField11: TppField;
    pplfPpDadosppField12: TppField;
    pplfPpDadosppField13: TppField;
    pplfPpDadosppField14: TppField;
    pplfPpDadosppField15: TppField;
    pplfPpDadosppField16: TppField;
    pplfPpDadosppField17: TppField;
    pplfPpDadosppField18: TppField;
    pplfPpDadosppField19: TppField;
    pplfPpDadosppField20: TppField;
    pplfPpDadosppField21: TppField;
    pplfPpDadosppField22: TppField;
    pplfPpDadosppField23: TppField;
    pplfPpDadosppField24: TppField;
    pplfPpDadosppField25: TppField;
    pplfPpDadosppField26: TppField;
    pplfPpDadosppField27: TppField;
    pplfPpDadosppField28: TppField;
    pplfPpDadosppField29: TppField;
    pplfPpDadosppField30: TppField;
    pplfPpDadosppField31: TppField;
    pplfPpDadosppField32: TppField;
    pplfPpDadosppField33: TppField;
    pplfPpDadosppField34: TppField;
    pplfPpDadosppField35: TppField;
    pplfPpDadosppField36: TppField;
    pplfPpDadosppField37: TppField;
    pplfPpDadosppField38: TppField;
    pplfPpDadosppField39: TppField;
    pplfPpDadosppField40: TppField;
    pplfPpDadosppField41: TppField;
    cdsEnvioEmailDoc: TCMClientDataSet;
    SqlEnvioEmailDoc: TCMSqlParams;

      procedure MnuLimpaImgClick(Sender: TObject);
      procedure MnuUnibancoClick(Sender: TObject);

      procedure FormCreate(Sender: TObject);
      procedure MnuSelecionaClick(Sender: TObject);
      procedure DsgnCMShow(Sender: TObject);
      procedure MemMensagem1Print(Sender: TObject);
      procedure CmbModeloCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; Modified: Boolean);
      procedure BtnImprimeClick(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
      procedure RptModeloBeforePrint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure dblkmsgCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkmsgChange(Sender: TObject);
  private
    Fidmodulo: integer;
    Fidusuario: integer;
    Fcodtipodoc: integer;
    Fidconfigbarras: integer;
    Fidtipocliente: integer;
    Fcodportadorforma: integer;
    Fcoddocumento: integer;
    CancelaGeraAquivo, CancelaEnvioEmail : Boolean; //Helio - SOL Nº 253577-17359 PPM Nº 842402
    procedure Setcodtipodoc(const Value: integer);
    procedure Setidconfigbarras(const Value: integer);
    procedure Setidmodulo(const Value: integer);
    procedure Setidtipocliente(const Value: integer);
    procedure Setidusuario(const Value: integer);
    procedure Setcodportadorforma(const Value: integer);
    procedure Setcoddocumento(const Value: integer);

    //Inicio - Helio - SOL Nº 253577-17359 PPM Nº 842402
    function CriaAbreQryModeloEmail(idModeloEmail : Integer) : TWWQuery;
    procedure ImprimeArquivoSepPorDoc;
    function HabilitadoOpcGerarArquivoPorDoc : Boolean;
    function HabilitadoOpcEnviaEmail : Boolean;
    function ObtemMatricula(idPessoa : Integer) : String;
    procedure CarregaDataSetEnvioEmailDoc;
    procedure PreparaEEnviaEmailDoc;
    procedure EnviaEmailDoc(pathAnexo,
                            nomeAnexo,
                            corpoEmail,
                            assuntoEmail,
                            caixaSaida,
                            caixaCopiaOculta : String);
    function GeraNomeArquivBoletoDisponivel(descricao,
                                            matricula,
                                            diretorio : String) : String;
    //Fim - Helio - SOL Nº 253577-17359 PPM Nº 842402

   private  // Public declarations

      CtrlConfigbarras: TCtrlConfigbarras;
      CtrlIntBanco: TCtrlIntBanco;

      bSelecionaBloquetos, bMudouImagem: Boolean;
      iDigito11: Longint;
      ListDbg: TStrings;
      bGravaImpressao: Boolean;

      fCodPortForma: Integer;
      { Seleciona o PORTADORFORMA de acordo com o controle dblcPortadorForma.
       Apenas se a variável fCodPortForma < 0   }

      function GetCodPortForma: Integer;
      procedure CdsDadosCalcFields;
      function RemoveAllChar(S: String): String;
      procedure SetaLabelRpt(Edt: TwwDBEdit; Lbl: TppLabel);

      //andré tavares - cálculo do dv do nossonúmero do banco Banespa
      function CalculaDvBANESPA(sNossoNumero: String): String;
      function CalculaDv1Dv2CampoLivreBANESPA(sCampoLivre: String): String;

      //andré  tavares - 19/10/2007 - monta o nossonúmero dos boletos do besc
      function montaNossoNumeroBESC(sNossoNumero: string): string;
      //andré  tavares - 20/10/2007 - monta o campolivre dos boletos do besc que
      //irá concatenar com o restante da linha digitável
      function montaCampolivreBESC(sDados: string): string;

      //Cássio - SOL Nº 121467 KINTANA Nº 596922
      //Rotina para montagem do Campo Livre para boletos CAIXA
      function montaCampoLivreCaixa(sCodCedente, sNossoNumero: string): string;

      { Rotina generica para cálculo do dígito verificador com variaçao apenas da Base ( Módulo ) }
      function CalculaDac(sNossoNumero: String; iModulo: Integer): String;
      { Rotina para cálculo do dígito verificador para o Banco 341 > Itaú }
      function CalculaDac341(sNossoNumero: String): String;
      { Rotina para cálculo do dígito verificador fixo com módulo 11 }
      function CalculaDac11(sNum: String): Integer;
      function CalculaModulo11HSBC(sNossoNumero: String): String;
      function MontaBarras(bCodBarras: Boolean): String;
      function MontaCampoLivre: String;
      function calculadigd: String;

      // Ricardo A. SOL 121467-381 KTN 668796
      procedure EditaNossoNumeroCaixa;
      function MontaBarrasCEFSigcb( bCodBarra: Boolean ): String;
      // FIM Ricardo A. SOL 121467-381 KTN 668796

      // Alterado por FHBS - SOL: 121468/388-121467/381  KTN: 668793-668796
      function CalcDVNossoNumeroCefSigCB(sNum: String): String;
      // Fim - Alterado por FHBS

      function NossoNumeroIsEmpty(sNossoNumero: String): Boolean;

      procedure OpenBloquete(ClientDataset: TClientDataset);

   protected

      procedure SelDados; override;
      procedure SelModelo; override;
      procedure InsereCdsPrincipal; override;
      function TestaImpressao: Boolean; override;
      procedure AbreCdsPrincipal(iId: Integer); override;


   public   // Public declarations

      controlerem, PORTFORMA: Integer;
      diasprotesto: real;

      //início - andre tavares - pendência 22079 - 17/07/2006
      property coddocumento      : integer read Fcoddocumento     write Setcoddocumento      default 0;
      property idconfigbarras    : integer read Fidconfigbarras   write Setidconfigbarras    default 0;
      property codportadorforma  : integer read Fcodportadorforma write Setcodportadorforma  default 0;
      property idtipocliente     : integer read Fidtipocliente    write Setidtipocliente     default 0;
      property codtipodoc        : integer read Fcodtipodoc       write Setcodtipodoc        default 0;
      property idmodulo          : integer read Fidmodulo         write Setidmodulo          default 0;
      property idusuario         : integer read Fidusuario        write Setidusuario         default 0;

      procedure HabilitaImpressao(bImprime: Boolean); override;
      procedure TRATACMBMODELO;

      procedure MsgErro( sMsg : string );

    end;



var
  FrmConfigBarrasCMMT: TFrmConfigBarrasCMMT;
  CtrlParamBloqueteCobranca : TCtrlParamBloqueteCobranca; //ANDRE TAVARES 03/06/2006

Implementation

{$R *.DFM}
{$R *.RES}

Uses uMensErro, uSistema, dBaseDados, ufuncaogeral, uCMTypes, uIntBancoManager,
     FSelModeloEmail, filectrl, UEmailUtil; //Helio - SOL Nº 253577-17359 PPM Nº 842402



procedure TFrmConfigBarrasCMMT.OpenBloquete(ClientDataset: TClientDataset);
begin
      ClientDataSet.Data := CtrlParamBloqueteCobranca.GetDocsEmissao(sistema.IdEmpresa, StrToIntDef(DBcboUsuario.LookupValue, 0), 'N', StrToIntDef(CMDBMODULO.LookupValue, 0), 0,
                                                                     GetCodPortForma, StrToIntDef(dblkTipClie.LookupValue, 0),
                                                                     false, strToIntDef(CmbTipoDoc.LookupValue, 0), fcoddocumento);

      if Trim(CmbTipoDoc.Text) <> '' then
      begin
        ClientDataSet.Filter := ' CODTIPDOC = ' + CmbTipoDoc.LookupValue;
        ClientDataSet.Filtered := True;
      end;

      if DBcboUsuario.LookupValue <> '' then
      begin
         if ClientDataSet.Filter <> '' then
            ClientDataSet.Filter := ClientDataSet.Filter + ' AND IDUSUARIOINCLUSAO = ' + DBcboUsuario.LookupValue
         else
            ClientDataSet.Filter := ' IDUSUARIOINCLUSAO = ' + DBcboUsuario.LookupValue;
            ClientDataSet.Filtered := True;
      end;

end;

function TFrmConfigBarrasCMMT.CalculaDigd: String; //Maria 26/07
var
  I, Multiplicador, Val, Valor: Integer;
  sNossoNumero, sNumAgencia, sNumConta: String;
begin
  //andré tavares - pendência 27408 - 13/02/2008
  //sNumAgencia := RemoveAllChar(CdsDados.FieldByName('NUMAGENCIA').AsString);
  sNumAgencia := RemoveAllChar(CdsDados.FieldByName('AGENCIACONVENIO').AsString);
  sNumConta := RemoveAllChar(CdsDados.FieldByName('NUMCONTA').AsString);

  sNossoNumero := RemoveAllChar(CdsDados.FieldByName('NOSSONUMERO').AsString);

  Result := sNossoNumero +
    ZD(Copy(sNumAgencia, 1, Length(sNumAgencia) - 1), 4) +
    ZD(Copy(sNumConta, 1, Length(sNumConta) - 1), 7);
  if (Length(Result) Mod 2) <> 0 then
    Multiplicador := 2
  else
    Multiplicador := 1;

  Valor := 0;

  for I := 1 To Length(Result) do
  begin
    Val := StrToInt(Copy(Result, I, 1)) * Multiplicador;
    if Val >= 10 then
      Val := StrToInt(Copy(IntToStr(Val), 1, 1)) + StrToInt(Copy(IntToStr(Val), 2, 1));
    Valor := Valor + Val;
    if Multiplicador = 1 then
      Multiplicador := 2
    else
      Multiplicador := 1;
  end;

  Result := '0';
  if (Valor Mod 10) <> 10 then
    Result := IntToStr(10 - (Valor Mod 10));
end;



procedure TFrmConfigBarrasCMMT.HabilitaImpressao(bImprime: Boolean);
begin
  Inherited;
  if bImprime then
  begin
    DsBloquete.DataSet := CdsBloquete;
    {PANEL que exibe na GRID os Documentos que serão impressos}
    PnlDocsImpressos.Visible := False;

    if bImprime then
      GroupBox1.Align := alNone
    else
    begin
      GroupBox1.Align := alBottom;
    end;

    SqlTipoDoc.Prepare;
    SqlTipoDoc.ParambyName('RECPAG').AsString := ParamIntegra.RecPag;
    SqlTipoDoc.ParambyName('idusuario').AsInteger := sistema.idusuario;
    SqlTipoDoc.Open;

    SqlTipClie.Open;
    SqlModulo.Open;
    sqlUsuario.Open;

    if CdsModelo.Locate('IDCONFIGBARRAS', VarArrayOf([Fidconfigbarras]), [loCaseInsensitive, loPartialKey]) then
    begin
      CmbModelo.Text        := CdsModelo.fieldByName('DESCCONFIGBARRAS').asString;
      CmbModelo.LookupValue := CdsModelo.fieldByName('IDCONFIGBARRAS').asString;
    end;

    TRATACMBMODELO;
    if (not CdsBanco.IsEmpty) and (CdsBanco.Locate('CODPORTFORMA', VarArrayOf([Fcodportadorforma]), [loCaseInsensitive, loPartialKey])) then
    begin
      DbLcPortador.Text        := CdsBanco.fieldByName('DESCRICAO').asString;
      DbLcPortador.LookupValue := CdsBanco.fieldByName('CODPORTFORMA').asString;
    end;

    if CdsTipClie.Locate('IDTIPOCLIENTE', VarArrayOf([Fidtipocliente]), [loCaseInsensitive, loPartialKey]) then
    begin
      dblkTipClie.Text        := CdsTipClie.fieldByName('DESCRICAO').asString;
      dblkTipClie.LookupValue := CdsTipClie.fieldByName('IDTIPOCLIENTE').asString;
    end;

    if CdsTipoDoc.Locate('CODTIPDOC', VarArrayOf([Fcodtipodoc]), [loCaseInsensitive, loPartialKey]) then
    begin
      CmbTipoDoc.Text        := CdsTipoDoc.fieldByName('DESCRICAO').asString;
      CmbTipoDoc.LookupValue := CdsTipoDoc.fieldByName('CODTIPDOC').asString;
    end;

    if CdsModulo.Locate('IDMODULO', VarArrayOf([Fidmodulo]), [loCaseInsensitive, loPartialKey]) then
    begin
      cmdbmodulo.Text        := CdsModulo.fieldByName('NOMEMODULO').asString;
      cmdbmodulo.LookupValue := CdsModulo.fieldByName('IDMODULO').asString;
    end;

    if cdsUsuario.Locate('IDUSUARIO', VarArrayOf([fidusuario]), [loCaseInsensitive, loPartialKey]) then
    begin
      DBcboUsuario.Text        := cdsUsuario.fieldByName('NOMEUSUARIO').asString;
      DBcboUsuario.LookupValue := cdsUsuario.fieldByName('IDUSUARIO').asString;
    end;

    CAPTION := 'Impressão  de Bloquetos (Ficha de Compensação) Com Código de Barras';
    Height := 550;
  end
  else
  begin
    CAPTION := 'Configuração de Bloquetos (Ficha de Compensação) Com Código de Barras';
    Height := 314;
  end;
end;

procedure TFrmConfigBarrasCMMT.CmeCadastroInsert(Sender: TObject);
begin
  Inherited;
  ImgBanco.picture := Nil;
  if DeRelatorio.CanFocus then
    DeRelatorio.SetFocus;
end;

procedure TFrmConfigBarrasCMMT.CmeCadastroEdit(Sender: TObject);
begin
  Inherited;
  if DeRelatorio.CanFocus then
    DeRelatorio.SetFocus;
end;



procedure TFrmConfigBarrasCMMT.SelDados;
var
  sSql: String;
  rNossoNumero, rNossoNumeroTemp: Extended;
  sNossoNumero, sString: String;
  bEspera: boolean;
  iModulo : integer;
begin
  Inherited;

  fCodPortForma := -1;
  with SqlDados do
  begin
    SQL.Clear;
    SQL.Append('SELECT ');
    SQL.Append('  E.CEP, ES.CODESTADO, C.NOME AS CIDADE, E.BAIRRO,  ');
    SQL.Append('  E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, P.NUMDOCUMENTO, ');
    SQL.Append('  P.IDPESSOA, '); //Helio - SOL Nº 253577-17359 PPM Nº 842402
    SQL.Append(' PF.EMAILFUNCEF, '); //Helio - SOL Nº 253577/17906 PPM Nº 1163500
    SQL.Append(' ''                '' AS MATRICULA, ');
    SQL.Append('  P.RAZAOSOCIAL AS NOME, D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGRAMADA, ');
    SQL.Append('  D.CODPORTFORMA, D.DATAVENCTO, D.DATAREMESSA, D.EMISBLOQ, D.STATUS, ');
    SQL.Append('  D.DATAEMISSAO, D.DATAEMISSAO AS DATADOCUMENTO, D.NODOCUMENTO, M.MOESIGLA, D.CODDOCUMENTO, P.TIPO, D.NOSSONUMERO, ');
    SQL.Append('  D.COMPLDOCUMENTO, E.TIPOENDERECO, AB.NUMAGENCIA, PC.NOCONTACORR AS NUMCONTA, F.JUROSPORDIA AS VALORJUROS, ');
    SQL.Append('  (''01234567890123456789012345678901234567890123'') AS CODBARRA, (0) As rSaldo, (0) As rSaldoOutraMoeda, ');
    SQL.Append('  (''00186.99595  90309.403922  00152.059168                                      000'') AS CODBARRADIG, ('' '') AS FLGGRUPO, ');
    SQL.Append('  (''01234567890123456789012345678901234567890123'') AS AGENCIACODCEDENTE, ');
    SQL.Append('  (''00000-00'') AS NUMEMPRESABANCO, AB.NUMAGENCIA as AGENCIACONVENIO '); //andré tavares - pendência 27408 - 13/02/2008

    // Ricardo A. SOL 121467-381 KTN 668796
     SQL.Append(' ,D.IDMODULO ');
    // fim Ricardo A. SOL 121467-381 KTN 668796

    // William Santana SOL  208257.15307  KIN 2050609
    SQL.Append(',  ''                    '' AS NUMDOCUMENTO_CEDENTE, '' FUNCEF - FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS '' AS RAZAOSOCIAL_CEDENTE, ');
    //MIGRACAO-ORACLE : inicio
    //SQL.Append('  '' SCN - Q. 02 - Bl. A - 12º e 13º andares. Ed. Corporate Financial Center 70712-900 - Brasília - DF Telefone Geral: (61) 3329-1700 '' AS ENDERECO_CEDENTE  ');
    SQL.Append('  CAST(''SCN - Q. 02 - Bl. A - 12º e 13º andares. Ed. Corporate Financial Center 70712-900 - Brasília - DF Telefone Geral: (61) 3329-1700 '' AS VARCHAR(150)) AS ENDERECO_CEDENTE ');
    //MIGRACAO-ORACLE : fim
    // END - William Santana SOL  208257.15307  KIN 2050609

    SQL.Append(' FROM ');
    SQL.Append('  ENDPESS E, CIDADES C, ESTADO ES,  ');
    SQL.Append('  PESSOA P, '); 
    SQL.Append('  PESSOAFISICA PF, '); //Helio - SOL Nº 253577/17906 PPM Nº 1163500
    SQL.Append('  DOCUMENTO D, ');
    SQL.Append('  PORTADORFORMA F , ');
    SQL.Append('  MOEDA M, ');
    SQL.Append('  AGENCIABANCARIA AB, ');
    SQL.Append('  PORTADORCONTA PC ');
    SQL.Append(' WHERE 1=2  ');
    Open;
  end;

  { -----------------------------------------------------------------------------
    Pega o PORTADORFORMA selecionado no DBLCPortador. Só faz isso se a variável
    fCodPortForma < 0
    ----------------------------------------------------------------------------- }
  GetCodPortForma;

  if fCodPortadorForma > 0 then
    fCodPortForma := fCodPortadorForma;

  if trim(IntBancoManager.NossoNumero) = '' then
    IntBancoManager.NossoNumero := '0';

  if CMDBMODULO.LookupValue <> '' then
    iModulo := StrToInt(CMDBMODULO.LookupValue)
  else
    iModulo := -1;

  IntBancoManager.NossoNumero := floatToStr(CtrlConfigbarras.GetNossoNumero(fCodPortForma,
                                            cdsModelo.FieldByName('TAMNOSSONUMERO').asInteger));
  cdsPortForma.Edit;
  cdsPortForma.FieldByName('NOSSONUMERO').asString := IntBancoManager.NossoNumero;

  try
    rNossoNumero := strToFloat(IntBancoManager.NossoNumero);
  except
    rNossoNumero := 0;
  end;

  if (cdsPortForma.IsEmpty = false) and
     (trim(cdsPortForma.FieldByName('NOSSONUMERO').asString) = '') and
     (MsgDlg('Atenção! O campo "Nosso Número" do cadastro de portador forma não está preenchido.'+ #13#10 +
             'Confirma a impressão?', 'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
  begin
    bGravaImpressao := False;
    bImprimeRelat   := False;
    Abort;
  end;

  TestaImpressao;
  {ADICIONA DADOS PARA IMPRESSÃO}
  if bSelecionaBloquetos then
  begin
    { Passa parâmetros para seleção dos bloquetos }
    bGravaImpressao := False;

    Try
      SCREEN.Cursor := crHourGlass;
      if not(PnlDocsImpressos.Visible) then
      begin
        if Trim(dblkTipClie.Text) <> '' then
          DsBloquete.DataSet := CdsBloqueteTipoCli
        else
          DsBloquete.DataSet := CdsBloquete;
      end;

      bGravaImpressao := (DsBloquete.DataSet <> CdsBloqImpressos);

      with (DsBloquete.DataSet As TCMClientDataSet) do
      begin
        if bGravaImpressao then
        begin

          OpenBloquete(DsBloquete.DataSet as TCmClientDataSet);

        end;

        SqlDados.Open;

        { ------------------------------------------------------------------------------ }
                // Inicializar o NossoNumero
        if bGravaImpressao then
        begin
          ListDbg.Add('Nosso Número do portador forma: ' + CdsPortForma.FieldByName('NOSSONUMERO').AsString);
          if CdsPortForma.FieldByName('NOSSONUMERO').IsNull then
            rNossoNumero := 0
          else
            rNossoNumero := CdsPortForma.FieldByName('NOSSONUMERO').AsFloat;
        end
        else
          rNossoNumero := 0;

        if not(IsEmpty) then
        begin
          bImprimeRelat := True;

          CdsDadosCedente.data := CtrlParamBloqueteCobranca.GetDadosCedente;
          //Valida o endereço do cliente no boleto
          CtrlIntBanco.IndiceDoBanco := CdsPortForma.FieldByName('CodArquivoRemessa').AsInteger;

          if (MsgDlg('Existe(m) ' + IntToStr(RecordCount) + ' documentos pendente(s) para impressão' +
            (#13 + #10) + 'Confirma a Impressão da(s) Ficha(s) de Compensação?',
            'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
          begin

            //David - Pendência 26006
            bImprimeRelat := False;

            SCREEN.Cursor := crDefault;
            MsgDlg('Impressão cancelada pelo usuário.', 'Aviso', mtWarning, [mbOK], 0);
            exit;
          end;

          if bGravaImpressao then
          begin
            { ------------------------------------------------------------------
              Testa se o Nosso Numero no PORTADOR FORMA está em Branco e
              configura o tamanho do mesmo de acordo com o que foi informado
              no cadastro de modelo de Ficha de Compensação.
              ------------------------------------------------------------------ }
            if not(NossoNumeroIsEmpty(CdsPortForma.FieldByName('NOSSONUMERO').AsString)) then
              rNossoNumero := StrToFloat(Copy(CdsPortForma.FieldByName('NOSSONUMERO').AsString, 1,
                CdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger))
            else
              rNossoNumero := 0;

            ListDbg.Add('Nosso Número Inicial para impressão: ' + FloatToStr(rNossoNumero));
          end;

          { -----------------------------------------------------------------------------
            Insere os Registros do Bloqueto para Impressão
            ----------------------------------------------------------------------------- }
          First;
          While (not(EOF)) do
          begin
            if not CdsDados.Locate('CODDOCUMENTO',FieldByName('CODDOCUMENTO').Value,[]) then   //IFerreira  27371
            begin
              CdsDados.Append;
              CdsDados.FieldByName('CEP').Value := FieldByName('CEP').Value;
              CdsDados.FieldByName('CODESTADO').Value := FieldByName('CODESTADO').Value;
              CdsDados.FieldByName('CIDADE').Value := FieldByName('CIDADE').Value;
              CdsDados.FieldByName('BAIRRO').Value := FieldByName('BAIRRO').Value;
              CdsDados.FieldByName('COMPLEMENTO').Value := FieldByName('COMPLEMENTO').Value;
              CdsDados.FieldByName('NUMERO').Value := FieldByName('NUMERO').Value;
              CdsDados.FieldByName('LOGRADOURO').Value := FieldByName('LOGRADOURO').Value;
              CdsDados.FieldByName('NUMDOCUMENTO').Value := FieldByName('NUMDOCUMENTO').Value;

              //Inicio - Helio - SOL Nº 253577-17359 PPM Nº 842402
              CdsDados.FieldByName('IDPESSOA').Value := FieldByName('IDPESSOA').Value;
              CdsDados.FieldByName('EMAILFUNCEF').Value := FieldByName('EMAILFUNCEF').Value; //Helio - SOL Nº 253577/17906 PPM Nº 1163500
              CdsDados.FieldByName('MATRICULA').Value := ObtemMatricula(FieldByName('IDPESSOA').AsInteger);
              //Fim - Helio - SOL Nº 253577-17359 PPM Nº 842402

              CdsDados.FieldByName('NOME').Value := FieldByName('NOME').Value;
              CdsDados.FieldByName('VALORDESCONTO').Value := FieldByName('VALORDESCONTO').Value;
              CdsDados.FieldByName('DATALIMITE').Value := FieldByName('DATALIMITE').Value;
              CdsDados.FieldByName('DATAPROGRAMADA').Value := FieldByName('DATAPROGRAMADA').Value;
              CdsDados.FieldByName('CODPORTFORMA').Value := FieldByName('CODPORTFORMA').Value;
              CdsDados.FieldByName('DATAVENCTO').Value := FieldByName('DATAVENCTO').Value;
              CdsDados.FieldByName('DATAEMISSAO').Value := FieldByName('DATAEMISSAO').Value;
              CdsDados.FieldByName('DATADOCUMENTO').Value := FieldByName('DATADOCUMENTO').Value;
              CdsDados.FieldByName('NODOCUMENTO').Value := FieldByName('NODOCUMENTO').Value;
              CdsDados.FieldByName('MOESIGLA').Value := FieldByName('MOESIGLA').Value;
              CdsDados.FieldByName('CODDOCUMENTO').Value := FieldByName('CODDOCUMENTO').Value;
              CdsDados.FieldByName('TIPO').Value := FieldByName('TIPO').Value;
              CdsDados.FieldByName('COMPLDOCUMENTO').Value := FieldByName('COMPLDOCUMENTO').Value;
              CdsDados.FieldByName('TIPOENDERECO').Value := FieldByName('TIPOENDERECO').Value;
              CdsDados.FieldByName('NUMAGENCIA').Value := FieldByName('NUMAGENCIA').Value;
              CdsDados.FieldByName('NUMCONTA').Value := FieldByName('NUMCONTA').Value;
              CdsDados.FieldByName('VALORJUROS').Value := FieldByName('VALORJUROS').Value;
              cdsDados.FieldByName('FLGGRUPO').Value := FieldByName('FLGGRUPO').Value;
              cdsDados.FieldByName('CODBARRADIG').Value := FieldByName('CODBARRADIG').Value;
              CdsDados.FieldByName('RSALDO').Value := FieldByName('VALOR').Value;
              CdsDados.FieldByName('RSALDOOUTRAMOEDA').Value := FieldByName('VALOROM').Value;
              CdsDados.FieldByName('STATUS').AsString := '1';
              CdsDados.FieldByName('EMISBLOQ').AsString := 'S';
              CdsDados.FieldByName('DATAREMESSA').AsDateTime := Date;
              CdsDados.FieldByName('NOSSONUMERO').Value := FieldByName('NOSSONUMERO').Value;
              CdsDados.FieldByName('NUMEMPRESABANCO').Value := FieldByName('NUMEMPRESABANCO').Value;
              //andré tavares - pendência 27408 - 13/02/2008
              CdsDados.FieldByName('AGENCIACONVENIO').Value := FieldByName('AGENCIACONVENIO').Value;

              // Ricardo A. SOL 121467-381 KTN 668796
              CdsDados.FieldByName('IDMODULO').Value := FieldByName('IDMODULO').Value;
              // FIM Ricardo A. SOL 121467-381 KTN 668796

              //William Santana SOL 208257.15307  KIN 2050609
              CdsDados.FieldByName('RAZAOSOCIAL_CEDENTE').AsString  := CdsDadosCedente.FieldByName('RAZAOSOCIAL_CEDENTE').AsString;
              CdsDados.FieldByName('NUMDOCUMENTO_CEDENTE').AsString := CdsDadosCedente.FieldByName('NUMDOCUMENTO_CEDENTE').AsString;
              CdsDados.FieldByName('ENDERECO_CEDENTE').AsString     := CdsDadosCedente.FieldByName('ENDERECO_CEDENTE').AsString;
              //William Santana SOL 208257.15307  KIN 2050609

              ListDbg.Add('Nosso Número do Registro antes do processamento: ' + CdsDados.FieldByName('NOSSONUMERO').AsString + ' - ' +
                CdsDados.FieldByName('FLGGRUPO').AsString + ' - ' + CdsDados.FieldByName('NODOCUMENTO').AsString);


              if not FieldByName('NOSSONUMERO').isNull then  //se o NN do documento está preenchido
                IntBancoManager.NossoNumero := copy(FieldByName('NOSSONUMERO').Value, 4, 7)
              else
              begin
                rNossoNumero := CtrlConfigbarras.GetNossoNumero(fCodPortForma, cdsModelo.FieldByName('TAMNOSSONUMERO').asInteger);  //StrToInt(CMDBMODULO.LookupValue));
                IntBancoManager.NossoNumero := floatToStr(rNossoNumero);
              end;

              { ---------------------------------------------------------------------------------------
                Este CASE determina como será o calculo do DV do Nosso Número de acordo com cada BANCO.
                ------------------------------------------------------------------------------------- }
              case StrTointDef(Copy(CdsModelo.FieldByName('NUMEROBANCO').AsString, 1, 3), -1) Of

                27: begin
                      IntBancoManager.NossoNumero := stringOfChar('0', 7 - length(IntBancoManager.NossoNumero)) + IntBancoManager.NossoNumero;
                      if bGravaImpressao then
                        //se nosso numero do boleto está vazio então
                        if (NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString)) or
                           (CdsDados.FieldByName('NOSSONUMERO').isNull) then
                          CdsDados.FieldByName('NOSSONUMERO').AsString := montaNossoNumeroBESC(IntBancoManager.NossoNumero);
                    end;

                33: begin // banespa

                      IntBancoManager.NossoNumero := stringOfChar('0', 7 - length(IntBancoManager.NossoNumero)) + IntBancoManager.NossoNumero;
                      if bGravaImpressao then
                      //se nosso numero do boleto está vazio então

                      //andré tavares - pendência 27408 - 13/02/2008
                      if (NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString)) or
                         (CdsDados.FieldByName('NOSSONUMERO').isNull) then
                          CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDvBANESPA(copy(intToStr(CdsDados.FieldByName('AGENCIACONVENIO').asInteger), 1, 3) +
                                                                          IntBancoManager.NossoNumero);

                      {if (NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString)) or
                         (CdsDados.FieldByName('NOSSONUMERO').isNull) then
                          CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDvBANESPA(copy(intToStr(CdsDados.FieldByName('NUMAGENCIA').asInteger), 1, 3) +
                                                                                           IntBancoManager.NossoNumero);}
                    end;

                341: begin
                       if bGravaImpressao then
                       begin
                         if NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString) then
                           CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac341(FloatToStr(rNossoNumero))
                       end
                       else
                         CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac341(CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString);
                     end;

                320: begin
                       if bGravaImpressao then
                       begin
                         if NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString) then
                           CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac(
                             //andré tavares - pendência 27408 - 13/02/2008
                             //ZD(Copy(RemoveAllChar(CdsDados.FieldByName('NUMAGENCIA').AsString), 1, 3), 3) +
                             ZD(Copy(RemoveAllChar(CdsDados.FieldByName('AGENCIACONVENIO').AsString), 1, 3), 3) +
                             ZD(Copy(FloatToStr(rNossoNumero), 1, 6), 6), 320)
                       end
                       else
                         CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac(
                           //andré tavares - pendência 27408 - 13/02/2008
                            //ZD(Copy(RemoveAllChar(CdsDados.FieldByName('NUMAGENCIA').AsString), 1, 3), 3) +
                            ZD(Copy(RemoveAllChar(CdsDados.FieldByName('AGENCIACONVENIO').AsString), 1, 3), 3) +
                            ZD(Copy(Trim(CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString), 1, 6), 6), 320);
                     end;

                399: begin
                       if CdsPortForma.FieldByName('CODARQUIVOREMESSA').AsString <> '9' then
                       begin
                         if bGravaImpressao then
                         begin
                           if NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString) then
                             CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaModulo11(Trim(FloatToStr(rNossoNumero)), True, 7)
                           else
                             CdsDados.FieldByName('NOSSONUMERO').AsString :=
                               CalculaModulo11(Trim(CdsDados.FieldByName('NOSSONUMERO').AsString), True, 7);
                         end
                         else
                           CdsDados.FieldByName('NOSSONUMERO').AsString :=
                             CalculaModulo11(Trim(CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString), True, 7);
                       end
                       else
                       begin
                         if bGravaImpressao then
                         begin
                           if NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString) then
                           begin
                             CdsDados.FieldByName('NOSSONUMERO').AsString := FloatToStr(rNossoNumero) +
                               CalculaModulo11HSBC(Trim(FloatToStr(rNossoNumero)));
                             {Soma o NOSSONUMERO + NUMEMPRESABANCO + DATAVENCIMENTO}
                             rNossoNumeroTemp := StrToFloat(CdsDados.FieldByName('NOSSONUMERO').AsString + '4') +
                               CdsPortForma.FieldByName('NUMEMPRESABANCO').AsFloat +
                               StrToFloat(RemoveBarras(CdsDados.FieldByName('DATAPROGRAMADA').AsString));
                             sString := CalculaModulo11HSBC(FloatToStr(rNossoNumeroTemp));
                             CdsDados.FieldByName('NOSSONUMERO').AsString := CdsDados.FieldByName('NOSSONUMERO').AsString + '4' + sString;
                           end
                           else
                           begin
                             CdsDados.FieldByName('NOSSONUMERO').AsString := CdsDados.FieldByName('NOSSONUMERO').AsString +
                               CalculaModulo11HSBC(CdsDados.FieldByName('NOSSONUMERO').AsString);
                             {Soma o NOSSONUMERO + NUMEMPRESABANCO + DATAVENCIMENTO}
                             rNossoNumeroTemp := StrToFloat(CdsDados.FieldByName('NOSSONUMERO').AsString + '4') +
                               CdsPortForma.FieldByName('NUMEMPRESABANCO').AsFloat +
                               StrToFloat(RemoveBarras(CdsDados.FieldByName('DATAPROGRAMADA').AsString));
                             sString := CalculaModulo11HSBC(FloatToStr(rNossoNumeroTemp));
                             CdsDados.FieldByName('NOSSONUMERO').AsString := CdsDados.FieldByName('NOSSONUMERO').AsString + '4' + sString;
                           end
                         end
                         else
                         begin
                           CdsDados.FieldByName('NOSSONUMERO').AsString := CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString +
                             CalculaModulo11HSBC(CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString);
                           {Soma o NOSSONUMERO + NUMEMPRESABANCO + DATAVENCIMENTO}
                           rNossoNumeroTemp := StrToFloat(CdsDados.FieldByName('NOSSONUMERO').AsString + '4') +
                             CdsPortForma.FieldByName('NUMEMPRESABANCO').AsFloat +
                             StrToFloat(RemoveBarras(CdsDados.FieldByName('DATAPROGRAMADA').AsString));
                           sString := CalculaModulo11HSBC(FloatToStr(rNossoNumeroTemp));
                           CdsDados.FieldByName('NOSSONUMERO').AsString := CdsDados.FieldByName('NOSSONUMERO').AsString + '4' + sString;
                         end;
                       end;
                     end;

                641: begin
                       if bGravaImpressao then
                       begin
                         if NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString) then
                         begin
                           sString := ZD(CdsPortForma.FieldByName('NUMEMPRESABANCO').AsString, 7) +
                             ZD(CalculaModulo11(Trim(FloatToStr(rNossoNumero)), True, 8), 8);
                           CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaModulo11(sString, True, 9);
                         end
                         else
                         begin
                           sString := ZD(CdsPortForma.FieldByName('NUMEMPRESABANCO').AsString, 7) +
                             ZD(CalculaModulo11(Trim(CdsDados.FieldByName('NOSSONUMERO').AsString), True, 9), 8);
                           CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaModulo11(sString, True, 9);
                         end;
                       end
                       else
                       begin
                         sString := ZD(CdsPortForma.FieldByName('NUMEMPRESABANCO').AsString, 7) +
                           ZD(CalculaModulo11(Trim(CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString), True, 9), 8);
                         CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaModulo11(sString, True, 9);
                       end;
                     end;

                275, {Serve tanto para COBRANÇA REGISTRADA quanto para COBRANÇA SEM REGISTRO - Fábio Barros 15/03/2002}
                356: begin
                       if NossoNumeroIsEmpty(FieldByName('NOSSONUMERO').AsString) then
                         CdsDados.FieldByName('NOSSONUMERO').AsString := FloatToStr(rNossoNumero) + IntToStr(
                           CalculaDac10(ZD(CdsPortForma.FieldByName('NUMEMPRESABANCO').AsString, 15) +
                           //andré tavares - pendência 27408 - 13/02/2008
                           //ZD(Copy(RemoveAllChar(CdsDados.FieldByName('NUMAGENCIA').AsString), 1, 4), 4) +
                           ZD(Copy(RemoveAllChar(CdsDados.FieldByName('AGENCIACONVENIO').AsString), 1, 4), 4) +
                           ZD(Copy(RemoveAllChar(CdsDados.FieldByName('NUMCONTA').AsString), 1, 7), 7)))
                       else
                         CdsDados.FieldByName('NOSSONUMERO').AsString := Trim(FieldByName('NOSSONUMERO').AsString);
                     end;
                409: {COBRANÇA COM REGISTRO}
                     begin
                       if NossoNumeroIsEmpty(CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString) then
                         CdsDados.FieldByName('NOSSONUMERO').AsString := CalcMod11Unibanco('1' +
                           CalcMod11Unibanco(FloatToStr(rNossoNumero)))
                       else
                         CdsDados.FieldByName('NOSSONUMERO').AsString := CalcMod11Unibanco('1' +
                           CalcMod11Unibanco(Trim(CdsBloqImpressos.FieldByName('NOSSONUMERO').AsString)));
                     end;

                // Ricardo A. SOL 121467-381 KTN 668796
                104: begin
                       if NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString) then
                       begin
                         case CdsDadosIDMODULO.AsInteger of
                            4, // Felipe A. Santos SOL 206258 KTN 1995712
                            15,  // SOL 206258.14662 inicio
                            16,
                            18,
                            54,
                            64,
                            79,
                            113,
                            135,
                            137,
                            454,
                            456,
                            740: begin // SOL 206258.14662 final
                                 // CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac(FloatToStrF(rNossoNumero, ffFixed, 17,0), 11)
                                 // Alterado por Arnaldo V. Scarin em 18/10/2010
                                 // SOL: 145684  Kintana: 984840
                                 If cdsModelo.FieldByName('TAMNOSSONUMERO').asInteger >= 15 then
                                   CdsDados.FieldByName('NOSSONUMERO').AsString := FloatToStr( rNossoNumero )
                                 else
                                   CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac(FloatToStr(rNossoNumero), 11);
                               end;
                         else
                           CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac(FloatToStr(rNossoNumero), 11);
                         end;
                       end
                       else
                       begin
                         // Alterado por Arnaldo V. Scarin em 18/10/2010
                         // SOL: 145684  Kintana: 984840
                         // Essa rotina foi acertada pois ocorreram emissões de boletos com
                         // 10 posicoes no nosso numero, e dessa forma, poderemos recalcular
                         // caso o boleto seja reimpresso.
                         If Length(CdsDados.FieldByName('NossoNumero').asString) = 10 then
                           CdsDados.FieldByName('NossoNumero').asString := CalculaDac(CdsDados.FieldByName('NossoNumero').AsString, 11)
                         // Alterado por Arnaldo V. Scarin em 18/10/2010
                         // SOL: 145684  Kintana: 984840
                         // Essa parte do IF está causando a troca do Nosso Numero, pois no
                         // caso de uma reimpressão, essa rotina está forçando com que o
                         // ultimo numero, que está armazenado no portadorforma seja usado
                         // para emissão do boleto.
                         //  CdsDados.FieldByName('NOSSONUMERO').AsString :=
                         //    CdsPortForma.FieldByName('NOSSONUMERO').AsString;
                       end;
                     end;
                // FIM Ricardo A. SOL 121467-381 KTN 668796

                { Outro tipo de Modelo }
              else
                begin
                  if bGravaImpressao then
                  begin
                    if NossoNumeroIsEmpty(CdsDados.FieldByName('NOSSONUMERO').AsString) then

                      case CdsDadosIDMODULO.AsInteger of
                        64,135,456:
                        CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac(FloatToStrF(rNossoNumero, ffFixed, 17,0), 11)
                      else
                        CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac(FloatToStr(rNossoNumero), 11);
                      end;
                  end
                  else
                    CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDac(CdsPortForma.FieldByName('NOSSONUMERO').AsString, 11);
                end;
              end;
              {  ----------------------------------------------------------------------------- }

              // Ricardo A. SOL 121467-381 KTN 668796
              // CEF - SIGCB
              if ( StrToIntDef(Copy(CdsModelo.FieldByName('NUMEROBANCO').AsString, 1, 3), -1) = 104 ) and
                ( CdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger >= 15 ) then
              begin
                CdsDados.FieldByName('CODBARRA').AsString := MontaBarrasCEFSigcb(True);    //'01234567890123456789012345678901234567890123'
                CdsDados.FieldByName('CODBARRADIG').AsString := MontaBarrasCEFSigcb(False); //00186.99595  90309.403922  00152.059168         123'
              end
              else
              begin // demais
                CdsDados.FieldByName('CODBARRA').AsString := MontaBarras(True);    //'01234567890123456789012345678901234567890123'
                CdsDados.FieldByName('CODBARRADIG').AsString := MontaBarras(False); //00186.99595  90309.403922  00152.059168         123'
              end;
              // FIM Ricardo A. SOL 121467-381 KTN 668796

              if CdsDados.FieldByName('MOESIGLA').IsNull then
                CdsDados.FieldByName('MOESIGLA').AsString := 'R$';
              CdsDadosCalcFields;

              CdsDados.Post;
              ListDbg.Add('Nosso Número do Registro depois do processamento: ' + CdsDados.FieldByName('NOSSONUMERO').AsString + ' - ' +
                CdsDados.FieldByName('FLGGRUPO').AsString + ' - ' + CdsDados.FieldByName('NODOCUMENTO').AsString);
            end;

            Next;
          end; // case

          
          //Inicio - Helio - SOL Nº 253577-17359 PPM Nº 842402
          //abre tela para obter dados para enviar por e-mail
          //caso seja cancelado volta para re-escolher os parametros (RNG19)
          CancelaGeraAquivo := False;
          CarregaDataSetEnvioEmailDoc;
          if CancelaGeraAquivo then
          begin
               bGravaImpressao := False;
               CdsDados.EmptyDataSet;
          end;
          //Fim - Helio - SOL Nº 253577-17359 PPM Nº 842402

          if bGravaImpressao then
          begin

            //David - Pendência 26006
            if bImprimeRelat then
            begin
              CtrlConfigbarras.AtualizaDoc(CdsDados, IntToStr(CdsPortForma.FieldByName('CONTROLEREMESSA').AsInteger + 1), fCodPortForma);

              //Varre o dadaset de dados e valida o preenchimento do NOSSONUMERO
              CdsDados.First;
              while not CdsDados.Eof do
              begin
                sNossoNumero := CtrlConfigbarras.RecuperaNossoNumero( IntToStr(CdsPortForma.FieldByName('CONTROLEREMESSA').AsInteger + 1), CdsDados.FieldByName('CODDOCUMENTO').AsFloat, CdsDados.FieldByName('FLGGRUPO').AsString );

                if trim( sNossoNumero ) = '' then
                  raise Exception.Create( 'O documento ' + CdsDados.FieldByName('NODOCUMENTO').AsString + ' não possui NOSSONUMERO válido.' );

               // Ricardo A. SOL 121467-381 KTN 668796
               // 24999999999999999-9
               // CEF - SIGCB
               if ( StrToIntDef(Copy(CdsModelo.FieldByName('NUMEROBANCO').AsString, 1, 3), -1) = 104 ) and
                ( CdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger >= 15 ) then
                 // Alterado por FHBS - SOL: 121468/388-121467/381  KTN: 668793-668796 
                 //sNossoNumero := sNossoNumero + '-' + IntToStr( CalculaDac11( sNossoNumero ) );
                 sNossoNumero := sNossoNumero + '-' + CalcDVNossoNumeroCefSigCB( sNossoNumero );
                 // Fim - Alterado por FHBS
                // FIM Ricardo A. SOL 121467-381 KTN 668796

                CdsDados.Edit;
                CdsDados.FieldByName('NOSSONUMERO').AsString := sNossoNumero;
                CdsDados.Post;

                CdsDados.Next;
              end;
              CdsDados.First;

            end;

            ListDbg.Add('Gravação do portador forma: ' + FloatToStr(rNossoNumero) + ' -  ' + IntToStr(GetCodPortForma));
          end;
        end // ISEMPTY
        else
        begin
          SCREEN.Cursor := crDefault;
          ShowMessage('Não Existem Documentos pendentes para impressão.');
          bImprimeRelat := False;
        end;
      end;
    Except
      On E: Exception do
      begin
        SCREEN.Cursor := crDefault;

        Raise;
      end;
    end;
  end; //ADICIONA DADOS PARA IMPRESSÃO
end;



procedure TFrmConfigBarrasCMMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept := ( Trim( DeRelatorio.Text ) <> '') and
             ( Trim( EdnNomeBanco.Text ) <> '') and
             ( Trim( EdtNumBanco.Text ) <> '') and
             ( Trim( EdtEspecieDoc.Text ) <> '') and
             ( Trim( EdtNumDig.Text ) <> '') and
             ( Trim( EdtCodMoeda.Text ) <> '') and
             ( Trim( EdtCateira.Text ) <> '');

   if not(Accept) then
   begin
      MsgDlg('Faltam dados pra gravação do modelo', 'Aviso', mtError, [mbOK], 0);
      Repaint;
   end
   else
   begin
      Accept := ( ( EdtAceite.Text = 'S') Or ( EdtAceite.Text = 'N' ) );
      if not Accept then
      begin
         MsgDlg('Aceite deve ser S ou N', 'Aviso', mtError, [mbOK], 0);
         Repaint;
      end
      else
      begin
         inherited;
      end;
   end;
end;



function TFrmConfigBarrasCMMT.TestaImpressao: Boolean;
begin
  Result := ((Trim(CmbModelo.Text) <> '') and
    (Trim(DbLcPortador.Text) <> '')) Or
    (PnlDocsImpressos.Visible);
  bSelecionaBloquetos := Result;
end;



procedure TFrmConfigBarrasCMMT.InsereCdsPrincipal;
begin
   Cds.FieldByName('IDCONFIGBARRAS').AsFloat := -1;
   Cds.FieldByName('IDREPORTS').AsInteger    := -1;
   Cds.FieldByName('ORIGEMCM').AsInteger     := 0;
end;



procedure TFrmConfigBarrasCMMT.MnuLimpaImgClick(Sender: TObject);
begin
  Inherited;
  if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) then
  begin
    ImgBanco.picture := Nil;
    ImgLogo1.picture := Nil;
    ImgLogo2.picture := Nil;
  end;
end;



procedure TFrmConfigBarrasCMMT.MnuUnibancoClick(Sender: TObject);
var
  sBanco: String;
begin
  Inherited;
  if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) and
    (Sender Is TMenuItem) then
  begin
    ImgBanco.picture := Nil;
    ImgLogo1.picture := Nil;
    ImgLogo2.picture := Nil;

    case (Sender As TMenuItem).Tag Of
      0: sBanco := 'BBRASIL';
      1: sBanco := 'UNIBANCO';
      2: sBanco := 'BANERJ';
      3: sBanco := 'BRADESCO';
      4: sBanco := 'CAIXA';
      5: sBanco := 'ITAU';
      6: sBanco := 'MERIDIONAL';
      7: sBanco := 'REAL';
      8: sBanco := 'REAL';
      9: sBanco := 'BAMERINDUS';
    end;
    Try
      ImgBanco.picture.Bitmap.LoadFromResourceName(HInstance, sBanco);
      ImgLogo1.picture.Bitmap.LoadFromResourceName(HInstance, sBanco);
      ImgLogo2.picture.Bitmap.LoadFromResourceName(HInstance, sBanco);
      bMudouImagem := True;
    Except
      MsgDlg('Erro Ao Carregar Imagem do Banco', 'Aviso', mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFrmConfigBarrasCMMT.FormCreate(Sender: TObject);
begin
  Inherited;
  CtrlConfigbarras := TCtrlConfigbarras.Create;
  CtrlConfigbarras.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  CtrlIntBanco := TCtrlIntBanco.Create;
  CtrlIntBanco.InitializeAs( CtrlConfigbarras );

  CtrlParamBloqueteCobranca := TCtrlParamBloqueteCobranca.Create; //andre tavares - 03/06/2006
  CtrlParamBloqueteCobranca.InitializeAs( CtrlConfigbarras );

  sqlMsg.Open;
  SqlEnvioEmailDoc.Open; //Helio - SOL Nº 253577-17359 PPM Nº 842402

  bSelecionaBloquetos := False;
  bMudouImagem := False;
  ListDbg := TStringList.Create;
  fCodPortForma := -1;
  MontaSelect.Filtro.Clear;
end;

procedure TFrmConfigBarrasCMMT.MnuSelecionaClick(Sender: TObject);
begin
  Inherited;
  if OpFoto.Execute then
  begin
    ImgBanco.picture := Nil;
    ImgLogo1.picture := Nil;
    ImgLogo2.picture := Nil;
    ImgBanco.picture.LOADFROMFILE(OpFoto.Filename);
    ImgLogo1.picture.LOADFROMFILE(OpFoto.Filename);
    ImgLogo2.picture.LOADFROMFILE(OpFoto.Filename);
    bMudouImagem := True;
  end;
end;



procedure TFrmConfigBarrasCMMT.CmeCadastroFind(Sender: TObject);
begin
  Inherited;
  if MontaSelect.RetornouValor then
  begin
    ImgBanco.picture := Nil;
  end;
end;

procedure TFrmConfigBarrasCMMT.DsgnCMShow(Sender: TObject);
begin
  Inherited;
  if (ImgBanco.picture <> Nil) and bMudouImagem then
  begin
    bMudouImagem := False;
    ImgLogo1.picture.Bitmap := ImgBanco.picture.Bitmap;
    ImgLogo2.picture.Bitmap := ImgBanco.picture.Bitmap;
  end;

  SetaLabelRpt(EdnNomeBanco, LblNomeBanco1);
  SetaLabelRpt(EdnNomeBanco, LblNomeBanco2);
  SetaLabelRpt(EdtNumBanco, LblNumBanco1);
  SetaLabelRpt(EdtNumBanco, LblNumBanco2);
  SetaLabelRpt(EdtEspecieDoc, LblEspecieDoc1);
  SetaLabelRpt(EdtEspecieDoc, LblEspecieDoc2);
  SetaLabelRpt(EdtCateira, LblCarteira1);
  SetaLabelRpt(EdtCateira, LblCarteira2);
  SetaLabelRpt(EdtAceite, LblAceite1);
  SetaLabelRpt(EdtAceite, LblAceite2);
end;

procedure TFrmConfigBarrasCMMT.SetaLabelRpt(Edt: TwwDBEdit; Lbl: TppLabel);
begin
  Inherited;
  Try
    if Edt.Modified then
      Lbl.CAPTION := Edt.Text;
  Except;

  end;
end;

function TFrmConfigBarrasCMMT.MontaBarras(bCodBarras: Boolean): String;
var
  sCodBarras, sAuxCodBarras, sBanco, sMoeda, sValor, sCampoLivre: String;
  FatorVencimento: real;
  iCdigito: Array[0..3] Of Integer;
begin

  FatorVencimento := CdsDados.FieldByName('DATAPROGRAMADA').AsDateTime - StrToDate('07/10/1997');

  // WO16145 - Inicio
  // Alterado por Arnaldo V. Scarin em 19/12/2024
  // Descrição : A partir de 22/02/2025 o Fator de Vencimento deverá ser reiniciado, pois
  // o Valor dele chegará a 9999 em 21/02/2025, e começará a gerar problemas nos boletos.
  // Para tanto, foi implementada a verificação abaixo, fazendo com que seja ajustado o
  // Fator de Vencimento.
  if FatorVencimento > 9999 then
    FatorVencimento := 1000 + CdsDados.FieldByName('DATAPROGRAMADA').AsDateTime - StrToDate('22/02/2025');
  // WO16145 - Término

  if bCodBarras then
  begin
    // -----------------------------------------------------------------------------
    // Favor comentar as mudanças neste módulo.
    // -----------------------------------------------------------------------------
        {Código do Banco}
    sBanco := Copy(RemoveAllChar(CdsModelo.FieldByName('NUMEROBANCO').AsString), 1, 3);

    {Código da Moeda}
    if CdsModelo.FieldByName('CODMOEDA').IsNull then
      sMoeda := '9'
    else
      sMoeda := Copy(CdsModelo.FieldByName('CODMOEDA').AsString, 1, 1);

    {Valor do Boleto}
    sValor := ZD(RemoveVirgulas(CdsDados.FieldByName('RSALDO').AsFloat, 2), 10);

    {Campo Livre tem 25 posições}
    sCampoLivre := MontaCampoLivre;
    sAuxCodBarras := RemoveAllChar(sBanco + sMoeda + FloatToStr(fatorvencimento) + sValor + sCampoLivre);
    {Calcula o DAC do Código de Barras}
    iDigito11 := CalculaDac11(sAuxCodBarras);
    {Retorna o CÓDIGO DE BARRAS já com o DAC}
    Result := Trim(sBanco + sMoeda + IntToStr(iDigito11) + ZD(FloatToStr(FatorVencimento), 4) + sValor + sCampoLivre);
  end
  else { Linha digitável }
  begin
    sBanco := Copy(RemoveAllChar(CdsModelo.FieldByName('NUMEROBANCO').AsString), 1, 3);
    sMoeda := CdsModelo.FieldByName('CODMOEDA').AsString;
    sCampoLivre := MontaCampoLivre;

    //Calculas os 3 Primeiros Dv's
    sCodBarras := RemoveAllChar(sBanco + sMoeda + sCampoLivre);

    //Cálculo do DV do Campo 1
    sAuxCodBarras := Copy(sCodBarras, 1, 9);
    iCdigito[0] := CalculaDac10(sAuxCodBarras);

    //Cálculo do DV do Campo 2
    sAuxCodBarras := Copy(sCodBarras, 10, 10);
    iCdigito[1] := CalculaDac10(sAuxCodBarras);

    //Cálculo do DV do Campo 3
    sAuxCodBarras := Copy(sCodBarras, 20, 10);
    iCdigito[2] := CalculaDac10(sAuxCodBarras);

    sValor := ZD(RemoveVirgulas(CdsDados.FieldByName('RSALDO').AsFloat, 2), 10);

    //Calculas o Dv Geral
    sCodBarras := sBanco + sMoeda + sCampoLivre;

    sAuxCodBarras := Copy(sCodBarras, 1, 9) + IntToStr(iCdigito[0]) +
      Copy(sCodBarras, 10, 10) + IntToStr(iCdigito[1]) +
      Copy(sCodBarras, 20, 10) + IntToStr(iCdigito[2]) + sValor;

    sAuxCodBarras := sAuxCodBarras + IntToStr(iDigito11) + ZD(FloatToStr(fatorvencimento), 4) + sValor;

    Result := Copy(sAuxCodBarras, 1, 5) + '.' +
      Copy(sAuxCodBarras, 6, 5) + '  ' +
      Copy(sAuxCodBarras, 11, 5) + '.' +
      Copy(sAuxCodBarras, 16, 6) + '  ' +
      Copy(sAuxCodBarras, 22, 5) + '.' +
      Copy(sAuxCodBarras, 27, 6) + '  ' +
      IntToStr(iDigito11) + '  ';
    Result := Result + ZD(FloatToStr(fatorvencimento), 4) + sValor;
  end;


end;

function TFrmConfigBarrasCMMT.CalculaDac(sNossoNumero: String; iModulo: Integer): String;
var
  sNumero, sAuxResult: String;
  iPosicao, iBase, X, iDividendo, iDigito, iTamNum: Integer;
begin
  sNossoNumero := RemoveAllChar(sNossoNumero);

  case iModulo Of
    11:
      begin
        sNumero := ZD(sNossoNumero, CdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger);
        iBase := 9;
        iDividendo := 0;
        iTamNum := Length(sNumero) + 1;
        for X := 1 To Length(sNumero) do
        begin
          iDividendo := iDividendo + (StrToInt(sNumero[iTamNum - X]) * iBase);
          if iBase = 2 then
            iBase := 9
          else
            Dec(iBase);
        end;
        if (iDividendo Mod 11) <> 0 then
        begin
          iDigito := (iDividendo Mod 11)
        end
        else
          iDigito := 0;
        if iDigito = 10 then
        begin
          if Copy(CdsModelo.FieldByName('NUMEROBANCO').AsString, 1, 3) = '001' then
            Result := sNumero + 'X'
          else
            Result := sNumero + '0';
        end
        else
          Result := sNumero + IntToStr(iDigito);
      end;
    10:
      begin
        sNumero := Trim(sNossoNumero);
        iPosicao := Length(sNumero) + 1;
        iBase := 2;
        iDividendo := 0;
        for X := 1 To Length(sNumero) do
        begin
          sAuxResult := IntToStr((StrToInt(sNumero[iPosicao - X]) * iBase));
          if Length(sAuxResult) > 1 then
            iDividendo := iDividendo + StrToInt(sAuxResult[1]) + StrToInt(sAuxResult[2])
          else
            iDividendo := iDividendo + StrToInt(sAuxResult[1]);
          Dec(iBase);
          if iBase = 0 then
            iBase := 2;
        end;
        iDigito := 10 - (iDividendo Mod 10);
        Result := ZD(sNossoNumero + IntToStr(iDigito), 12);
      end;

    320:
      begin
        sNumero := sNossoNumero;
        iBase := 9;
        iDividendo := 0;
        iTamNum := Length(sNumero) + 1;
        for X := 1 To Length(sNumero) do
        begin
          iDividendo := iDividendo + (StrToInt(sNumero[iTamNum - X]) * iBase);
          if iBase = 2 then
            iBase := 9
          else
            Dec(iBase);
        end;
        if (iDividendo Mod 11) <> 0 then
        begin
          iDigito := (iDividendo Mod 11)
        end
        else
          iDigito := 0;
        case iDigito Of
           0: Result := sNumero + '1';  {29/04/2003 Clementino}
           1: Result := sNumero + '0';  {29/04/2003 Clementino}
          10: Result := sNumero + '0';
          11: Result := sNumero + '1';
        else
          Result := sNumero + IntToStr(iDigito);
        end;
        Result := Copy(Trim(Result), 4, Length(Trim(Result)));
      end;
  end;
end;

function TFrmConfigBarrasCMMT.CalculaDac341(sNossoNumero: String): String; //maria 08/2000
var
  sNumero: String;
  Val, Multiplicador, I: Integer;
  Valor: Integer;
begin
  sNumero := ZD(sNossoNumero, CdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger);

  Result :=
    //andré tavares - pendência 27408 - 13/02/2008
    //ZD(CdsDados.FieldByName('NUMAGENCIA').AsString, 4) +
    ZD(CdsDados.FieldByName('AGENCIACONVENIO').AsString, 4) +
    ZD(Copy(Trim(CdsDados.FieldByName('NUMCONTA').AsString), 1, Length(Trim(CdsDados.FieldByName('NUMCONTA').AsString)) - 1), 5)
    +
    ZD(CdsModelo.FieldByName('CARTEIRACOBR').AsString, 3) + sNumero;
  if (Length(Result) Mod 2) <> 0 then
    Multiplicador := 2
  else
    Multiplicador := 1;
  Valor := 0;
  for I := 1 To Length(Result) do
  begin
    Val := StrToInt(Copy(Result, I, 1)) * Multiplicador;
    if Val >= 10 then
      Val := StrToInt(Copy(IntToStr(Val), 1, 1)) + StrToInt(Copy(IntToStr(Val), 2, 1));
    Valor := Valor + Val;
    if Multiplicador = 1 then
      Multiplicador := 2
    else
      Multiplicador := 1;
  end;
  Val := (10 - (Valor Mod 10));
  if Val = 10 then
    Val := 0;
  Result := Copy(Result, Length(Result) - CdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger + 1,
    CdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger) + IntToStr(Val);
end;

procedure TFrmConfigBarrasCMMT.MemMensagem1Print(Sender: TObject);
var
  X: Integer;
begin
  Inherited;
  MemMensagem1.Lines.Clear;
  MemMensagem2.Lines.Clear;
  if (CdsDados.FieldByName('FLGGRUPO').AsString = 'N') then
    SqlAux.Sql.Text :=
//início - André Tavares - 28/08/2003 - pendência 13159
      'SELECT MENSAGEM1,MENSAGEM2,MENSAGEM3,MENSAGEM4,MENSAGEM5,MENSAGEM6,MENSAGEM7,MENSAGEM8,MENSAGEM9, MENSAGEM10 FROM MENSAGENSCNAB WHERE CODDOCUMENTO = ' +
       FloatToStr(CdsDados.FieldByName('CODDOCUMENTO').AsFloat)
//fim - André Tavares - 28/08/2003 - pendência 13159
  else
    SqlAux.Sql.Text :=
//início - André Tavares - 28/08/2003 - pendência 13159
      'SELECT MENSAGEM1,MENSAGEM2,MENSAGEM3,MENSAGEM4,MENSAGEM5,MENSAGEM6,MENSAGEM7,MENSAGEM8,MENSAGEM9, MENSAGEM10 FROM MENSAGENSCNAB WHERE CODGRUPOCNAB = ' +
//fim - André Tavares - 28/08/2003 - pendência 13159
      FloatToStr(CdsDados.FieldByName('CODDOCUMENTO').AsFloat);
  SqlAux.Open;

  if trim(edit1.text) <> '' then  // andre tavares - pendência 18122 - 19/11/2004 - pergunta se a linha está vazia antes de adicionar
    MemMensagem1.Lines.Add(edit1.text);
  if trim(edit2.text) <> '' then
    MemMensagem1.Lines.Add(edit2.text);
  if trim(edit3.text) <> '' then
    MemMensagem1.Lines.Add(edit3.text);
  if trim(edit4.text) <> '' then
    MemMensagem1.Lines.Add(edit4.text);
  if trim(edit5.text) <> '' then
    MemMensagem1.Lines.Add(edit5.text);
  if trim(edit6.text) <> '' then
    MemMensagem1.Lines.Add(edit6.text);
  if trim(edit7.text) <> '' then
    MemMensagem1.Lines.Add(edit7.text);
  if trim(edit8.text) <> '' then
    MemMensagem1.Lines.Add(edit8.text);
  if trim(edit9.text) <> '' then
    MemMensagem1.Lines.Add(edit9.text);

  if trim(edit1.text) <> '' then
    MemMensagem2.Lines.Add(edit1.text);
  if trim(edit2.text) <> '' then
    MemMensagem2.Lines.Add(edit2.text);
  if trim(edit3.text) <> '' then
    MemMensagem2.Lines.Add(edit3.text);
  if trim(edit4.text) <> '' then
    MemMensagem2.Lines.Add(edit4.text);
  if trim(edit5.text) <> '' then
    MemMensagem2.Lines.Add(edit5.text);
  if trim(edit6.text) <> '' then
    MemMensagem2.Lines.Add(edit6.text);
  if trim(edit7.text) <> '' then
    MemMensagem2.Lines.Add(edit7.text);
  if trim(edit8.text) <> '' then
    MemMensagem2.Lines.Add(edit8.text);
  if trim(edit9.text) <> '' then
    MemMensagem2.Lines.Add(edit9.text);

// fim - Andre Tavares - pendência 16555 - 05/05/2004
  if CdsDados.FieldByName('VALORJUROS').AsFloat <> 0 then
  begin
    MemMensagem1.Lines.Add('Após o vencimento cobrar R$ (' + FormatFloat('##0.00', CdsDados.FieldByName('VALORJUROS').AsFloat *
      CdsDados.FieldByName('RSALDO').AsFloat /
      100) + ') por dia de atraso.');
    MemMensagem2.Lines.Add('Após o vencimento cobrar R$ (' + FormatFloat('##0.00', CdsDados.FieldByName('VALORJUROS').AsFloat *
      CdsDados.FieldByName('RSALDO').AsFloat /
      100) + ') por dia de atraso.');
  end;

  if CdsDados.FieldByName('VALORDESCONTO').AsFloat <> 0 then
  begin
    MemMensagem1.Lines.Add('Até ' + CdsDados.FieldByName('DATALIMITE').AsString + ' conceder desconto R$ (' + FormatFloat('##0.00',
      CdsDados.FieldByName('VALORDESCONTO').AsFloat) + ').');
    MemMensagem2.Lines.Add('Até ' + CdsDados.FieldByName('DATALIMITE').AsString + ' conceder desconto R$ (' + FormatFloat('##0.00',
      CdsDados.FieldByName('VALORDESCONTO').AsFloat) + ').');
  end;

  { Pega as Mensagens cadastradas no menu Documentos x Mensagens }
//início - André Tavares - 28/08/2003 - pendência 13159
  for x := 0 To 9 do
//fim - André Tavares - 28/08/2003 - pendência 13159
  begin
//início - André Tavares - 09/09/2003 - pendência 13159
    if CdsAux.Fields[x].AsString <> '' then
    begin
      MemMensagem1.Lines.Add(CdsAux.Fields[x].AsString);
      MemMensagem2.Lines.Add(CdsAux.Fields[x].AsString);
    end;
  end;
//fim - André Tavares - 09/09/2003 - pendência 13159

end;

function TFrmConfigBarrasCMMT.CalculaDac11(sNum: String): Integer;
var
  sNumero: String;
  iBase, iDividendo, iDigito, X, iTamNum: Integer;
begin
  sNumero := sNum;
  iBase := 9;
  iDividendo := 0;
  iTamNum := Length(sNumero) + 1;
  for X := 1 To Length(sNumero) do
  begin
    iDividendo := iDividendo + (StrToInt(sNumero[iTamNum - X]) * iBase);
    if iBase = 2 then
      iBase := 9
    else
      Dec(iBase);
  end;
  iDigito := (iDividendo Mod 11);
  if (iDigito = 0) Or (iDigito > 9) then
    Result := 1
  else
    Result := iDigito;
end;

procedure TFrmConfigBarrasCMMT.CmbModeloCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; Modified: Boolean);
begin
  Inherited;
  TRATACMBMODELO;
end;

procedure TFrmConfigBarrasCMMT.TRATACMBMODELO;
begin
  if (CmbModelo.Text <> '') then
  begin
    diasprotesto := 0;
    SqlBanco.SQL.Text := ' Select PF.CodPortForma, PF.Descricao, PF.CodBloqChe, PF.CodArquivoRemessa, PF.NossoNumero,' +
      ' PF.JurosPorDia, PF.PrazoProtesto, PF.NumEmpresaBanco, PF.ControleRemessa, PF.PathArquivoRem, C.FLGIMPCONDENSADO, PF.IDCONFIGBARRAS ' +
      ' From PortadorForma PF, TEMPLBLOQCHEQUE C' +
      ' Where (PF.RecPag = ''' + ParamIntegra.RecPag + ''') AND ' +
      '       (PF.CodBloqChe = C.CodBloqChe(+)) AND ' +
      '       (PF.idPessoa = ' + IntToStr(sistema.IdEmpresa) + ') AND ' +
      '       (PF.IDCONFIGBARRAS = ' + CmbModelo.LookupValue + ')   ' +
      ' Order by PF.Descricao';
    SqlBanco.Open;
    if not CdsBanco.IsEmpty then
    begin
      if CdsBanco.FieldByName('PrazoProtesto').IsNull then
        diasprotesto := 0
      else
        diasprotesto := CdsBanco.FieldByName('PrazoProtesto').AsFloat;
    end;
    DbLcPortador.ENABLED := True;
  end
  else
    DbLcPortador.ENABLED := False;
end;


function TFrmConfigBarrasCMMT.MontaCampoLivre: String;
var
  iNumBanco, iTamNossoNumero: Longint;
  sDigito, sNumAgencia, sCarteira, sNumConta, sNossoNumero, sNumEmpresaBanco: String;
begin
  //Correção do comprimento do campo livre para 25 posições
  iNumBanco := StrToIntDef(Copy(CdsModelo.FieldByName('NUMEROBANCO').AsString, 1, 3), -1);
  iTamNossoNumero := CdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger;
  //andré tavares - pendência 27408 - 13/02/2008
  //sNumAgencia := RemoveAllChar(CdsDados.FieldByName('NUMAGENCIA').AsString);
  sNumAgencia := RemoveAllChar(CdsDados.FieldByName('AGENCIACONVENIO').AsString);

  sCarteira := RemoveAllChar(CdsModelo.FieldByName('CARTEIRACOBR').AsString);
  // andre tavares - pendencia 20812 - 24/11/2005 - se o código da carteira for letra, então não entra no código de barras.
  sCarteira := intToStr(strToIntDef(sCarteira, 0));
  sNumConta := RemoveAllChar(CdsDados.FieldByName('NUMCONTA').AsString);
  sNossoNumero := RemoveAllChar(CdsDados.FieldByName('NOSSONUMERO').AsString);
  sNumEmpresaBanco := RemoveAllChar(CdsPortForma.FieldByName('NUMEMPRESABANCO').AsString);

  if iNumBanco <> 1 then
  begin
    sDigito := Trim(calculadigd);
    if sDigito = '10' then
      sDigito := '0';
  end;
  case iNumBanco Of

    //andre tavares - monta o campo livre do boleto bancario do besc
    27:
    begin
      result := montaCampolivreBESC(stringOfChar( '0', 5 - length( copy(sNumEmpresaBanco, 1, 5) ) ) + copy(sNumEmpresaBanco, 1, 5) + copy(sNossoNumero, 1, 3) + '25' + copy(sNossoNumero, 4, 10) + '027');
    end;

  //início andre tavares - Montar o campoLivre do banespa
    33: //banespa
    begin
      // composição do campo livre: Código do Cedente + Nosso Número + 00 + 033 + Dv1 + Dv2
      Result := CalculaDv1Dv2CampoLivreBANESPA(sNumEmpresaBanco + IntBancoManager.NossoNumero + '00033');
    end;
  //início andre tavares - Montar o campoLivre do banespa

    237: //Conta Com o DV - Tam 4 + 13 + 7
    // numero da conta sem dv
      Result := ZD(sNumAgencia, 4) +
        ZD(Copy(sNossoNumero, 1, iTamNossoNumero), 13) +
        ZD(copy(sNumConta,1,length(sNumConta)-1), 7) +
        '0';

    275, 356: //Conta e Agencia Sem o DV - Tam 4 + 7 + 1 + 13
      Result := ZD(Copy(sNumAgencia, 1, Length(sNumAgencia) - 1), 4) +
        ZD(Copy(sNumConta, 1, Length(sNumConta) - 1), 7) + sDigito +
        ZD(sNossoNumero, 13);

    341: //Agencia e Conta Com o DV - Tam 3 + 9 + 4 + 6
      begin
        Result := ZD(sCarteira, 3) +
          ZD(Copy(sNossoNumero, 1, iTamNossoNumero + 1), 9) +
          ZD(sNumAgencia, 4) + ZD(sNumConta, 6) + '000';
      end;
    1: //Montar Sem o DV do Num da Empresa no banco - Tam 11 + 4 + 8 + 2
      Result := ZD(Copy(sNossoNumero, 1, iTamNossoNumero), 11) +
        ZD(sNumAgencia, 4) +
        ZD(Copy(sNumConta, 1, Length(sNumConta) - 1), 8) +
        ZD(sCarteira, 2);

    104: begin
      //Cássio - SOL Nº 121467 KINTANA Nº 596922
      //Apenas gera Campo LIvre em layout SIGCB para os Módulos AdminImob, Alienação e ContribuicaoPrev
      {if (StrToInt(CMDBMODULO.LookupValue) = 64) or
         (StrToInt(CMDBMODULO.LookupValue) = 135) or
         (StrToInt(CMDBMODULO.LookupValue) = 456) then}
      if (CdsModelo.FieldByName('TAMNOSSONUMERO').asInteger >= 15) then
        //Definição do Novo Campo Livre CAIXA
        //CCCCNNNNNNNNNNNNNNNNNE, onde C = Cod. Cedente, N = Nosso Numero, E = DV do Campo Livre
        //Result := montaCampoLivreCaixa(sNumEmpresaBanco, sNossoNumero)

      // Ricardo A. SOL 121467-381 KTN 668796
      begin
        if Length( CdsDadosNOSSONUMERO.Value ) <> 17 then
          EditaNossoNumeroCaixa;
        sNossoNumero := CdsDadosNOSSONUMERO.Value;
        Result := montaCampoLivreCaixa( Copy( sNumEmpresaBanco, 1, 6 ), sNossoNumero );
      end
      // FIM Ricardo A. SOL 121467-381 KTN 668796
      else
        //NNNNNNNNNNAAAAYYYXXXXXXXX Onde N - Nosso Número, A - Num Agencia Cedente, Operacao Código Cedente,
        //Código da Agencia Cedenete Fornecido Pela Agência
        //Tam 10 + 4 + 11
        Result := ZD(Copy(sNossoNumero, 1, 10), 10) +
                  ZD(Copy(sNumAgencia, 1, 4), 4) +
                  ZD(Copy(sNumConta, 1, 11), 11);
    end;

    320: //Tam = 3 + 9 + 7 +
      Result := ZD(Copy(sNumAgencia, 1, 3), 3) +
        ZD(Copy(sNumConta, 1, 9), 9) +
        ZD(Copy(sNossoNumero, 1, 7), 7) +
        ZD('0', 3) +
        ZD(sCarteira, 3);
    641:
      begin
        Try
          sNumAgencia := IntToStr(StrToInt(sNumAgencia));
        Except
        end;
        Result := Copy(sNumEmpresaBanco, 1, 7) + ZD(CalculaModulo11(CdsPortForma.FieldByName('NOSSONUMERO').AsString,
          True, 8), 8) +
          ZD(Copy(sNumAgencia, 1, 3), 3) + ZD(Copy(sNumEmpresaBanco, 1, 6), 6) +
          IntToStr(CalculaDac11(Copy(sNumEmpresaBanco, 1, 7) +
          ZD(CalculaModulo11(CdsPortForma.FieldByName('NOSSONUMERO').AsString, True, 8), 8) +
          ZD(Copy(sNumAgencia, 1, 3), 3) +
          Copy(sNumEmpresaBanco, 1, 6)));
      end;
    409:
      begin
        Result := '04' +
          Copy(RemoveBarras3(CdsDados.FieldByName('DATAPROGRAMADA').AsString), 3, 6) +
          zd(sNumAgencia, 5) +
          ZD(copy(sNossoNumero, 2, 12), 12);
      end;

    399: //Tam = 12 + 4 + 7 + 2
      begin
        if CdsPortForma.FieldByName('CODARQUIVOREMESSA').AsString <> '9' then
          Result := Copy(sNossoNumero, 1, 5) + ZD(Copy(sNossoNumero, 6, 6), 6) +
            ZD(Copy(sNumAgencia, 1, 4), 4) +
            ZD(Copy(sNumConta, 1, 7), 7) + '001'
        else
          // O Nosso Numero deve ser colocado sem as 3 ultimas posicoes
          // porque estas sao os DVS.
          // 7 + 13 + 3 + 1 + 2
          Result := ZD(sNumEmpresaBanco, 7) +
            ZD(Copy(sNossoNumero, 1, length(sNossoNumero) - 3), 13) +
            ZD(IntToStr(DayOfTheYear(CdsDados.FieldByName('DATAPROGRAMADA').AsDateTime)), 3) +
            Copy(RemoveBarras2(CdsDados.FieldByName('DATAPROGRAMADA').AsString), 8, 1) + '2';
      end;
  else
    begin
      //Tam - 11 + 4 + 8 + 2
      Result := ZD(Copy(sNossoNumero, 1, iTamNossoNumero), 11) +
        ZD(sNumAgencia, 4) +
        ZD(sNumEmpresaBanco, 8) +
        ZD(sCarteira, 2);
    end;
  end;
end;

procedure TFrmConfigBarrasCMMT.CdsDadosCalcFields;
var
  sNumBanco, sNumAgencia, sNumConta, sDigito: String;
  //Cássio - SOL Nº 121467 KINTANA Nº 596922
  sNumEmpresaBanco : string;
begin
  Inherited;
  sNumBanco := RemoveAllChar(CdsModelo.FieldByName('NUMEROBANCO').AsString);
  //andré tavares - pendência 27408 - 13/02/2008
  //sNumAgencia := RemoveAllChar(CdsDados.FieldByName('NUMAGENCIA').AsString);
  sNumAgencia := RemoveAllChar(CdsDados.FieldByName('AGENCIACONVENIO').AsString);
  sNumConta := RemoveAllChar(CdsDados.FieldByName('NUMCONTA').AsString);

  //Cássio - SOL Nº 121467 KINTANA Nº 596922
  //Armazena o campo NUMEMPRESABANCO para ser usado em boletos emitido pela CAIXA
  sNumEmpresaBanco := RemoveAllChar(CdsDados.FieldByName('NUMEMPRESABANCO').asString);

  if StrToIntDef(Copy(sNumBanco, 1, 3), 0) <> 1 then
  begin
    sDigito := Trim(calculadigd);
    if sDigito = '10' then
      sDigito := '0';
  end;
  case StrToIntDef(Copy(sNumBanco, 1, 3), 0) Of
    33: // andre tavares - banco banespa - monta o código do cedente
      CdsDados.FieldByName('AGENCIACODCEDENTE').AsString :=  copy(CdsPortForma.FieldByName('NUMEMPRESABANCO').asString, 1, 3) + '/' +
                                                             copy(CdsPortForma.FieldByName('NUMEMPRESABANCO').asString, 4, 7)+ '-' +
                                                             copy(CdsPortForma.FieldByName('NUMEMPRESABANCO').asString, 11, 1);
    275, 356:
      CdsDados.FieldByName('AGENCIACODCEDENTE').AsString :=
        ZD(Copy(sNumAgencia, 1, Length(sNumAgencia) - 1), 4) + '/' +
        ZD(Copy(sNumConta, 1, Length(sNumConta) - 1), 7) + '/' +
        sDigito;
    104:
      // Ricardo A. SOL 121467-381 KTN 668796
      case CdsDadosIDMODULO.AsInteger of
        4, // Felipe A. Santos SOL 206258 KTN 1995712
        15, // SOL 206258.14662 inicio
        16,
        18,
        54,
        64,
        79,
        113,
        135,
        137,
        454,
        456,
        740: // SOL 206258.14662 final
        // Troca do Num. da Conta para Num. Empresa Banco
        CdsDados.FieldByName('AGENCIACODCEDENTE').asString := sNumAgencia + '.' + sNumEmpresaBanco;

      else
        CdsDados.FieldByName('AGENCIACODCEDENTE').AsString := sNumAgencia + '.' + sNumConta
      end;
      // FIM Ricardo A. SOL 121467-381 KTN 668796

//         Cássio - SOL Nº 121467 KINTANA Nº 596922
//         if
//
//          (StrToInt(CMDBMODULO.LookupValue) = 64) or
//           (StrToInt(CMDBMODULO.LookupValue) = 135) or
//           (StrToInt(CMDBMODULO.LookupValue) = 456) then
//      else
//        CdsDados.FieldByName('AGENCIACODCEDENTE').AsString := sNumAgencia + '.' + sNumConta;

    399:
      begin
        if CdsPortForma.FieldByName('CODARQUIVOREMESSA').AsString = '9' then
          CdsDados.FieldByName('AGENCIACODCEDENTE').AsString := CdsPortForma.FieldByName('NUMEMPRESABANCO').AsString;

      end
  else
    CdsDados.FieldByName('AGENCIACODCEDENTE').AsString := sNumAgencia + '/' + sNumConta;
  end;
end;

procedure TFrmConfigBarrasCMMT.BtnImprimeClick(Sender: TObject);
begin
  Try
    bGravaImpressao := (DsBloquete.DataSet <> CdsBloqImpressos);
    if bGravaImpressao then

//inicio andre tavares 04/07/2003 resolução da pendência 14324
    if (DbLcPortador.text = '') or (DbLcPortador.lookupValue = '') then
    begin
      if DbLcPortador.Canfocus then DbLcPortador.setfocus;

      //andre tavares - pendência 18844
      Raise Exception.Create('O preenchimento do campo "Contas Caixas X Tipo de Cobrança" é obrigatório.');
    end;
    //CATIA P:19394 20/06/2006
    if (DBcboUsuario.Text = '') then
      begin
      SqlAux.SQL.Text := ' Select FLGOBRIGAUSUARIO from PARAMCAP ' +
                         ' Where (RecPag = ''R'') AND (FLGOBRIGAUSUARIO = ''S'') AND ' +
                         '       (idPessoa = ' + IntToStr(sistema.IdEmpresa) + ')';
      SqlAux.Open;
     if  not CdsAux.IsEmpty then
     begin
      if DBcboUsuario.Canfocus then DBcboUsuario.setfocus;

      //andre tavares - pendência 18844
      Raise Exception.Create('O preenchimento do campo "Usuário que lançou o documento" é obrigatório.');

      end;
    //FIM

    end;

    //Inicio - Helio - SOL Nº 253577-17359 PPM Nº 842402
    //Inherited;
    if HabilitadoOpcGerarArquivoPorDoc then
         ImprimeArquivoSepPorDoc //Imprime arquivo separados por documentos
    else
         inherited; //imprime tudo em um arquivo só
    //Fim - Helio - SOL Nº 253577-17359 PPM Nº 842402

//fim - andre tavares - pendência 24373 - 31/01/2007

      ListDbg.SaveToFile(Sistema.TempDir + 'Remessa.log');

      if cdsDados.RecordCount > 0 then
        MsgDlg('A(s) ' + IntToStr(cdsDados.RecordCount) + ' ficha(s) de compensação foi(ram) impressa(s) e cada Nosso Número atribuído ao(s) respectivo(s) documento(s).'+#13+
               'Caso deseje reimprimí-las, utilize a janela: '+#13+
               'Cobrança\Cobrança Bancária\Libera Reimpressão de Bloqueto.', 'Numeração atribuída com sucesso', mtWarning, [MbOk], 0);
  Except
    On E: Exception do
    begin
      MsgErro( E.Message );

      Abort;
    end;
  end;//try
end;



procedure TFrmConfigBarrasCMMT.bbtnConfirmarClick(Sender: TObject);
begin
  if not PnlCadastro.Visible then
  begin
    if not CdsModelo.IsEmpty then
      CdsModelo.Locate('IDCONFIGBARRAS', StrToIntDef(CmbModelo.LookupValue, -1), []);
    if not CdsBanco.IsEmpty then
      CdsBanco.Locate('CODPORTFORMA', GetCodPortForma, []);
  end;

  Inherited;
end;



function TFrmConfigBarrasCMMT.RemoveAllChar(S: String): String;
begin
   S := Trim(S);
   S := funcaogeral.RemoveChar('-', S);
   S := funcaogeral.RemoveChar('.', S);
   S := funcaogeral.RemoveChar('/', S);
   S := funcaogeral.RemoveChar('_', S);
   S := funcaogeral.RemoveChar('\', S);
   S := funcaogeral.RemoveChar(' ', S);
   Result := S;
end;



function TFrmConfigBarrasCMMT.NossoNumeroIsEmpty(sNossoNumero: String): Boolean;
var
  sAux: String;
begin
   if Trim(sNossoNumero) = '' then
     Result := True
   else
   begin
     sAux := Trim(sNossoNumero);
     While Pos('0', sAux) <> 0 do
       Delete(saux, Pos('0', sAux), 1);
     Result := (Trim(saux) = '');
   end
end;



procedure TFrmConfigBarrasCMMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Inherited;
   ListDbg.Free;
   CtrlConfigbarras.Free;
   CtrlParamBloqueteCobranca.Free; //andre tavares 03/06/2006
end;



function TFrmConfigBarrasCMMT.GetCodPortForma: Integer;
begin
  if fCodPortForma <= 0 then
  begin
    SqlPortForma.Prepare;
    SqlPortForma.Params[0].AsInteger := StrToIntDef(DbLcPortador.LookupValue, -1);
    SqlPortForma.Open;
    if CdsPortForma.IsEmpty then
      fCodPortForma := -1
    else
      fCodPortForma := CdsPortForma.Fields[0].AsInteger;
  end;
  Result := fCodPortForma;
end;



function TFrmConfigBarrasCMMT.CalculaModulo11HSBC(sNossoNumero: String): String;
var
  sNumero: String;
  Divisor, iResto, iBase, x, iDividendo, iDigito: Integer;
begin
   sNumero := sNossoNumero;
   iBase := 9;
   iDividendo := 0;
   Divisor := 11;
   for X := Length(sNumero) downto 1 do
   begin
     iDividendo := iDividendo + (StrToInt(sNumero[x]) * ibase);
     Dec(iBase);
     if iBase < 2 then
       iBase := 9;
   end;
   iResto := (iDividendo Mod Divisor);
   iDigito := iResto;
   case iResto Of
     0, 10: iDigito := 0;
   end;
   Result := IntToStr(iDigito);
end;



procedure TFrmConfigBarrasCMMT.SelModelo;
begin
   sqlModelo.Open;
end;



procedure TFrmConfigBarrasCMMT.AbreCdsPrincipal(iId: Integer);
begin
   Sql.Prepare;
   Sql.Params[0].AsFloat := iId;
   Sql.Open;
end;



procedure TFrmConfigBarrasCMMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  // inherited;
  Accept := CtrlConfigBarras.ProcessaConfig(Cds.Data, CdsReports.Data, OpInserir);
end;



procedure TFrmConfigBarrasCMMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   // inherited;
   Accept := CtrlConfigBarras.ProcessaConfig(Cds.Data, CdsReports.Data, OpAlterar);
end;



procedure TFrmConfigBarrasCMMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   // inherited;
   Accept := CtrlConfigBarras.ProcessaConfig(Cds.Data, CdsReports.Data, OpApagar);
end;



procedure TFrmConfigBarrasCMMT.RptModeloBeforePrint(Sender: TObject);
begin
   inherited;
   Barras.AutoSize := False;
end;

procedure TFrmConfigBarrasCMMT.FormResize(Sender: TObject);
begin
  inherited;
  top := top + 20;
end;

procedure TFrmConfigBarrasCMMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;

  
end;

//início - andre tavares - 28/11/2005 - calcula o DV do NossoNumero do Banco Banespa
function TFrmConfigBarrasCMMT.CalculaDvBANESPA(sNossoNumero: String): String;
var sFatores, sAux : string;
    i, iSomatorio: integer;
begin
  sAux := '';
  iSomatorio := 0;
  sFatores := '7319731973';
  if length(sNossoNumero) < 10 then
    sFatores := copy(sFatores, 11 - length(sNossoNumero) , 10);

  for i := 1 to length(sNossoNumero) do
  begin
    sAux := intToStr(strToIntDef(sNossoNumero[i], 0) * strToInt(sFatores[i]));
    iSomatorio := iSomatorio + strToInt(sAux[length(sAux)]);
  end;
  sAux := intToStr(iSomatorio);
  if (iSomatorio mod 10) = 0 then
    result := sNossoNumero + '0'
  else
    result := sNossoNumero + intToStr(10 - strToInt(sAux[length(sAux)]));
end;

function TFrmConfigBarrasCMMT.CalculaDv1Dv2CampoLivreBANESPA(sCampoLivre: String): String;
var Dv1, Dv2: integer;
    sFatores : string;
    i, S, P, K: integer;
    brecalc : boolean;
begin
  brecalc := false;
  Dv1 := 0;
  Dv2 := 0;
  S := 0;
  K := 0;
  result := sCampoLivre;
  //início do Cálculo do Dv1
  sFatores := '21212121212121212121212'; //pesos
  if length(sCampoLivre) < 23 then
    sFatores := copy(sFatores, 24 - length(sCampoLivre) , 23);

  for i := 1 to length(sCampoLivre) do
  begin
    P := strToInt(sCampoLivre[i]) * strToInt(sFatores[i]);

    if (P > 9) then S := P - 9
    else if (P < 10) then S := P;

    K := K + S; //realizar o somatório de s gerando K
  end;//for

  if (K mod 10) = 0 then Dv1 := 0
  else if (K mod 10) > 0 then Dv1 := 10 - (K mod 10);

  sCampoLivre := sCampoLivre + intToStr(Dv1);
  //fim do Cálculo do Dv1

  //início do Cálculo do Dv2
  while not bRecalc do
  begin
    K := 0;
    sFatores := '765432765432765432765432'; //pesos
    if length(sCampoLivre) < 24 then
      sFatores := copy(sFatores, 25 - length(sCampoLivre), 24);

    for i := 1 to length(sCampoLivre) do
    begin
      P := strToInt(sCampoLivre[i]) * strToInt(sFatores[i]);
      k := k + p;
    end;//for

    if ((K mod 11) = 0) then //andre tavares 28/12/2005 - pendência 21153
    begin
      Dv2 := 0;
      brecalc := true;
    end
    else if ((K mod 11) = 10) or ((K mod 11) > 1) then
    begin
      Dv2 := 11 - (K mod 11);
      brecalc := true;
    end
    else if ((K mod 11) = 1) then
      if Dv1 = 9 then
      begin
        Dv1 := 0;
        sCampoLivre := copy(sCampoLivre, 1, length(sCampoLivre) - 1) + intToStr(Dv1);
        bRecalc := false;
      end
      else if dv1 < 9 then
      begin
        dv1 := dv1 + 1;
        sCampoLivre := copy(sCampoLivre, 1, length(sCampoLivre) - 1) + intToStr(Dv1);
        bRecalc := false;
      end;
  end;//while
  //fim do Cálculo do Dv2

  result := sCampoLivre + intToStr(Dv2);
end;
//fim - andre tavares - 28/11/2005


function TFrmConfigBarrasCMMT.montaNossoNumeroBESC(sNossoNumero: string): string;
const sPesosDV1 = '7890123456789';
const sPesosDV2 = '567890123456789';
var Dv1, Dv2, i: integer;

begin

  if (trim(sNossoNumero) <> '') and (length(sNossoNumero) < 13) then
    sNossoNumero := stringOfChar('0', 13 - length(sNossoNumero)) + sNossoNumero;

  result := sNossoNumero;

//cálculo do primeiro dv
  Dv1 := 0;
  for i := 1 to 13 do
    Dv1 := Dv1 + strToInt(sNossoNumero[i]) * strToInt(sPesosDV1[i]);

  Dv1 := Dv1 mod 11;
  if Dv1 = 10 then
    Dv1 := 0;

  //o sNossoNumero é acrescido do primeiro dv + a constante 3
  result := result + intToStr(Dv1) + '3';

//cálculo do segundo dv
  Dv2 := 0;
  for i := 1 to 15 do
    Dv2 := Dv2 + strToInt(result[i]) * strToInt(sPesosDV2[i]);

  Dv2 := Dv2 mod 11;
  if Dv2 = 10 then
    Dv2 := 0;

  result := result + intToStr(Dv2);
end;




//andré  tavares - 20/10/2007 - monta o campolivre dos boletos do besc que
//irá concatenar com o restante da linha digitável
function TFrmConfigBarrasCMMT.montaCampolivreBESC(sDados: string): string;
const sPesos1 = '21212121212121212121212'; //pesos

var Dv1, Dv2, P, S, i, X, Y, Z: integer;
    sAux: String;

    function SomaP(const sDigs: String): integer;
    var sPesos2 : string ; //pesos
    var i, P: integer;
    begin
      sPesos2 := '765432765432765432765432';
      P := 0;
      for i := 1 to 24 do //calcula o segundo Dv
        P := P + (strToInt(sDigs[i]) * strToInt(sPesos2[i]));
      SomaP := P;
    end;

    function calculaDv2: integer;
    begin
      Z := SomaP(sAux);
      X := Z mod 11;
      if X = 0 then  //se resto = 0
        Y := 0
      else if X = 1 then //se resto = 1 então somar 1 à vigésima-quarta posição e recalcular Z e Y (recursivamente)
      begin
        if sAux[24] = '9' then
          sAux[24] := '0'
        else
          sAux[24] := intToStr(strToInt(sAux[24]) + 1)[1];
        result := calculaDv2;
        exit;
      end
      else if X > 1 then //se resto > 1
      begin
        Y := 11 - X;
      end;

      Y := Y + 2;

      if Y = 10 then //se dv = 10
        Y := 0
      else if Y = 11 then  //se dv = 11
        Y := 1;

      result := Y;
    end;

begin

  result := sDados;
  if length(sDados) <> 23 then
  begin
    result := '';
    raise Exception.Create( ' A chave da linha digitável tem que ser de 23 dígitos. Chave = '+ sDados );
    exit;
  end;


  Dv1:= 0;
  P := 0;
  S := 0;
  for i := 1 to 23 do  //calcula o primeiro Dv
  begin
    P := strToInt(result[i]) * strToInt(sPesos1[i]);

    if P > 9 then
      S := P - 9
    else // se P < 10 
      S := P;

    Dv1 := Dv1 + S;

  end; //for

  Dv1 := Dv1 mod 10;

  if Dv1 > 0 then
    Dv1 := 10 - Dv1;

  result := result + intToStr(Dv1);
  sAux := result;

  result := result + intToStr(calculaDv2);
end;




procedure TFrmConfigBarrasCMMT.Setcodtipodoc(const Value: integer);
begin
  Fcodtipodoc := Value;
end;

procedure TFrmConfigBarrasCMMT.Setidconfigbarras(const Value: integer);
begin
  Fidconfigbarras := Value;
end;

procedure TFrmConfigBarrasCMMT.Setidmodulo(const Value: integer);
begin
  Fidmodulo := Value;
end;

procedure TFrmConfigBarrasCMMT.Setidtipocliente(const Value: integer);
begin
  Fidtipocliente := Value;
end;

procedure TFrmConfigBarrasCMMT.Setidusuario(const Value: integer);
begin
  Fidusuario := Value;
end;

procedure TFrmConfigBarrasCMMT.Setcodportadorforma(const Value: integer);
begin
  Fcodportadorforma := Value;
end;

procedure TFrmConfigBarrasCMMT.Setcoddocumento(const Value: integer);
begin
  Fcoddocumento := Value;
  SqlBloquete.Prepare;
  SqlBloquete.paramByName('CODDOCUMENTO').asInteger := Fcoddocumento;
end;

procedure TFrmConfigBarrasCMMT.dblkmsgCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  if (trim(dblkmsg.text) <> '') and (not cdsMsg.Eof) then
  begin
    edit1.text := cdsMsg.fieldByName('TEXTOLINHA_1').asString;
    edit2.text := cdsMsg.fieldByName('TEXTOLINHA_2').asString;
    edit3.text := cdsMsg.fieldByName('TEXTOLINHA_3').asString;
    edit4.text := cdsMsg.fieldByName('TEXTOLINHA_4').asString;
    edit5.text := cdsMsg.fieldByName('TEXTOLINHA_5').asString;
    edit6.text := cdsMsg.fieldByName('TEXTOLINHA_6').asString;
    edit7.text := cdsMsg.fieldByName('TEXTOLINHA_7').asString;
    edit8.text := cdsMsg.fieldByName('TEXTOLINHA_8').asString;
    edit9.text := cdsMsg.fieldByName('TEXTOLINHA_9').asString;
  end;

end;

procedure TFrmConfigBarrasCMMT.dblkmsgChange(Sender: TObject);
begin
  inherited;
  if trim(dblkmsg.Text) = '' then
  begin
    Edit1.Text := '';
    Edit2.Text := '';
    Edit3.Text := '';
    Edit4.Text := '';
    Edit5.Text := '';
    Edit6.Text := '';
    Edit7.Text := '';
    Edit8.Text := '';
    Edit9.Text := '';
  end;
end;


procedure TFrmConfigBarrasCMMT.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Atenção', mtError, [mbOK], 0 );
end;


function TFrmConfigBarrasCMMT.montaCampoLivreCaixa(sCodCedente,
  sNossoNumero: string): string;
var
  sDVCedente, sDVCampoLivre, sSequencia1,
  sConstante1, sSequencia2, sConstante2,
  sSequencia3, sCampoLivre : string;

  function MontaDV(sNum: String): String;
  var
    iBase, iDividendo, X, iResto: Integer;
  begin
    iBase := 2;
    iDividendo := 0;
    for X := Length(sNum) downto 1 do
    begin
      iDividendo := iDividendo + (StrToInt(sNum[X]) * iBase);
      if iBase = 9 then
        iBase := 2
      else
        Inc(iBase);
    end;
  
    iResto := (iDividendo Mod 11);
  
    if (11 - iResto) > 9 then
      Result := '0'
    else
      Result := Trim( IntToStr( 11 - iResto ) );
  
  end;

begin
  {Montagem do Campo Livre CAIXA}
  sSequencia1 := Copy(sNossoNumero,3,3);
  sSequencia2 := Copy(sNossoNumero,6,3);
  sSequencia3 := Copy(sNossoNumero,9,9);
  sConstante1 := Copy(sNossoNumero,1,1);
  sConstante2 := Copy(sNossoNumero,2,1);

  sDVCedente := MontaDV(sCodCedente);
  sCampoLivre := sCodCedente + sDVCedente + sSequencia1 +
                 sConstante1 + sSequencia2 + sConstante2 + sSequencia3;
  sDVCampoLivre := MontaDV(sCampoLivre);

//  Result := sCodCedente + sDVCedente + sSequencia1 + sConstante1 + sSequencia2 +
//            sConstante2 + sSequencia3 + sDVCampoLivre;
  Result := sCampoLivre + sDVCampoLivre;
end;

procedure TFrmConfigBarrasCMMT.EditaNossoNumeroCaixa;
var
  i, k, index: Integer;
  s, sTemp: string;
  prefixo : string; // William Santana - SIG 29271
begin
  // Ricardo A. SOL 121467-381 KTN 668796
  if Length( CdsDadosNOSSONUMERO.Value ) > 15 then
    index := Length( CdsDadosNOSSONUMERO.Value ) - 14
  else
    index := 1;
  s := Copy( CdsDadosNOSSONUMERO.Value, index, Length( CdsDadosNOSSONUMERO.Value ) );
//  s := IntBancoManager.NossoNumero;

  sTemp := '';
  k := 15 - Length( s );
  for i := 1 to k do
    sTemp := sTemp + '0';

  //Início - William Santana - SIG 29271
  if (CdsModelo.FieldByName('CARTEIRACOBR').AsString = 'RG') then
     prefixo := '14'
  else
  if (CdsModelo.FieldByName('CARTEIRACOBR').AsString = 'SR') then
     prefixo := '24'
  else
     prefixo := CdsModelo.FieldByName('CARTEIRACOBR').AsString;
  //Término - William Santana - SIG 29271

  // carteira + zeros + nossonumero
  //s := '24' + sTemp + s;    //William Santana - SIG 29271
  s := prefixo + sTemp + s;   //William Santana - SIG 29271
//  s := s + CalculaModulo11( s, False, 11 );
  CdsDadosNOSSONUMERO.Value := s;
  // FIM Ricardo A. SOL 121467-381 KTN 668796
end;

// Ricardo A. SOL 121467-381 KTN 668796
function TFrmConfigBarrasCMMT.MontaBarrasCEFSigcb(
  bCodBarra: Boolean): String;
var
  sAuxCodBarras, sCodBarraCompleto, sBanco, sMoeda, sValor, sCampoLivre: String;
  sCampo1, sCampo2, sCampo3, sCampo4, sCampo5: String;
  FatorVencimento: Real;

  // Alterado por FHBS - SOL: 124468/388 121467/381 KTN: 668793 668796
  function CalcDVGeral(sNum: String): String;
  var
    iBase, iDividendo, X, iResto: Integer;
  begin
    iBase := 2;
    iDividendo := 0;
    for X := Length(sNum) downto 1 do
    begin
      iDividendo := iDividendo + (StrToInt(sNum[X]) * iBase);
      if iBase = 9 then
        iBase := 2
      else
        Inc(iBase);
    end;

    iResto := (iDividendo Mod 11);

    if iResto in [0, 10, 1] then
      Result := '1'
    else
      Result := Trim( IntToStr( 11 - iResto ) );

  end;
  // Fim - Alterado por FHBS

  // Alterado por FHBS - SOL: 124468/388 121467/381 KTN: 668793 668796
  function CalcDVCampo123(sNum: String): String;
  var
    iBase, iDividendo, X, iResto, iSoma: Integer;
  begin
    iBase := 2;
    iDividendo := 0;

    for X := Length(sNum) downto 1 do
    begin
      iSoma := (StrToInt(sNum[X]) * iBase );

      if iSoma > 9 then
        iSoma := Trunc( iSoma / 10 ) + ( iSoma mod 10 );

      iDividendo := iDividendo + iSoma;

      if iBase = 2 then
        iBase := 1
      else
        iBase := 2;
    end;

    iResto := ( iDividendo Mod 10 );

    if iResto > 0 then
      Result := Trim( IntToStr( 10 - iResto ) )
    else
      Result := '0';
  end;
  // Fim - Alterado por FHBS

begin
  // fator de vencimento
  FatorVencimento := CdsDados.FieldByName('DATAPROGRAMADA').AsDateTime - StrToDate('07/10/1997');
  // WO16145 - Inicio
  // Alterado por Arnaldo V. Scarin em 19/12/2024
  // Descrição : A partir de 22/02/2025 o Fator de Vencimento deverá ser reiniciado, pois
  // o Valor dele chegará a 9999 em 21/02/2025, e começará a gerar problemas nos boletos.
  // Para tanto, foi implementada a verificação abaixo, fazendo com que seja ajustado o
  // Fator de Vencimento.
  if FatorVencimento > 9999 then
    FatorVencimento := 1000 + CdsDados.FieldByName('DATAPROGRAMADA').AsDateTime - StrToDate('22/02/2025');
  // WO16145 - Término


  {Código do Banco}
  sBanco := Copy(RemoveAllChar(CdsModelo.FieldByName('NUMEROBANCO').AsString), 1, 3);

  {Código da Moeda}
  if CdsModelo.FieldByName('CODMOEDA').IsNull then
    sMoeda := '9'
  else
    sMoeda := Copy(CdsModelo.FieldByName('CODMOEDA').AsString, 1, 1);

  {Valor do Boleto}
  sValor := ZD(RemoveVirgulas(CdsDados.FieldByName('RSALDO').AsFloat, 2), 10);

  {Campo Livre tem 25 posições}
  sCampoLivre := MontaCampoLivre;

  {Calcula o DAC do Código de Barras}
  sAuxCodBarras := RemoveAllChar(sBanco + sMoeda + FloatToStr(FatorVencimento) + sValor + sCampoLivre);

  {Retorna o CÓDIGO DE BARRAS já com o DAC}
  sCodBarraCompleto := Trim(sBanco + sMoeda + CalcDVGeral( sAuxCodBarras ) + ZD(FloatToStr(FatorVencimento), 4) + sValor + sCampoLivre);

  if bCodBarra then
    Result := sCodBarraCompleto
  else { Linha digitável }
  begin

    //Cálculo do DV do Campo 1
    sCampo1 := Copy( sCodBarraCompleto, 1, 4 ) + Copy( sCodBarraCompleto, 20, 5 ) ;
    sCampo1 := sCampo1 + CalcDVCampo123( sCampo1 );

    //Cálculo do DV do Campo 2
    sCampo2 := Copy( sCodBarraCompleto, 25, 10 );
    sCampo2 := sCampo2 + CalcDVCampo123( sCampo2 );

    //Cálculo do DV do Campo 3
    sCampo3 := Copy( sCodBarraCompleto, 35, 10 );
    sCampo3 := sCampo3 + CalcDVCampo123( sCampo3 );

    // DV Geral
    sCampo4 := Copy( sCodBarraCompleto, 5, 1 );

    // fator + valor
    sCampo5 := FloatToStr( FatorVencimento ) + sValor;

    Result :=
      Copy( sCampo1, 1, 5 ) + '.' + Copy( sCampo1, 6, 5 ) + '  ' +
      Copy( sCampo2, 1, 5 ) + '.' + Copy( sCampo2, 6, 6 ) + '  ' +
      Copy( sCampo3, 1, 5 ) + '.' + Copy( sCampo3, 6, 6 ) + '  ' +
      sCampo4 + '  ' +
      sCampo5;
  end;
end;
// FIM Ricardo A. SOL 121467-381 KTN 668796

// Alterado por FHBS - SOL: 121468/388-121467/381  KTN: 668793-668796
function TFrmConfigBarrasCMMT.CalcDVNossoNumeroCefSigCB(sNum: String): String;
var
  iBase, iDividendo, X, iResto: Integer;
begin
  iBase := 2;
  iDividendo := 0;
  for X := Length(sNum) downto 1 do
  begin
    iDividendo := iDividendo + (StrToInt(sNum[X]) * iBase);
    if iBase = 9 then
      iBase := 2
    else
      Inc(iBase);
  end;

  iResto := (iDividendo Mod 11);

  if (11 - iResto) > 9 then
    Result := '0'
  else
    Result := Trim( IntToStr( 11 - iResto ) );

end;
// Fim - Alterado por FHBS


//Helio - SOL Nº 253577-17359 PPM Nº 842402
function TFrmConfigBarrasCMMT.HabilitadoOpcGerarArquivoPorDoc : Boolean;
var
    qryTemp : TwwQuery;
    strCodPortForma : String;
begin

  Result := False;
  qryTemp := TwwQuery.Create(dtmBaseDados);

  try
  strCodPortForma := IntToStr(GetCodPortForma);
  qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

  qryTemp.SQL.Clear;

  qryTemp.SQL.Text := 'SELECT 1 FROM PORTADORFORMA' +
                      ' WHERE FLGAGRUPAANEXOS = 1 AND CODPORTFORMA = ' + strCodPortForma;

  qryTemp.Open;

  if Not qryTemp.IsEmpty then
      Result := True;


  except
      qryTemp.Close;
      qryTemp.Free;
      raise;
  end;

  qryTemp.Close;
  qryTemp.Free;

end;

//Helio - SOL Nº 253577-17359 PPM Nº 842402
function TFrmConfigBarrasCMMT.HabilitadoOpcEnviaEmail : Boolean;
var
    qryTemp : TwwQuery;
    strCodPortForma : String;
begin

  Result := False;
  qryTemp := TwwQuery.Create(dtmBaseDados);

  try
  strCodPortForma := IntToStr(GetCodPortForma);
  qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

  qryTemp.SQL.Clear;

  qryTemp.SQL.Text := 'SELECT 1 FROM PORTADORFORMA' +
                      ' WHERE FLGENVIAEMAIL = 1 AND CODPORTFORMA = ' + strCodPortForma;

  qryTemp.Open;

  if Not qryTemp.IsEmpty then
      Result := True;


  except
      qryTemp.Close;
      qryTemp.Free;
      raise;
  end;

  qryTemp.Close;
  qryTemp.Free;

end;


//Helio - SOL Nº 253577-17359 PPM Nº 842402
function TFrmConfigBarrasCMMT.ObtemMatricula(idPessoa : Integer) : String;
var
    qryTemp : TwwQuery;

begin
  Result := '';
  qryTemp := TwwQuery.Create(dtmBaseDados);

  try
  qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

  qryTemp.SQL.Clear;

  qryTemp.SQL.Text := ' SELECT MATRICULA FROM DEPENTIT ' +
                      ' WHERE IDPESSOA = ' + IntToStr(idPessoa);

  qryTemp.Open;

  if Not qryTemp.IsEmpty then
      Result := qryTemp.FieldByName('MATRICULA').AsString;


  except
      qryTemp.Close;
      qryTemp.Free;
      raise;
  end;

  qryTemp.Close;
  qryTemp.Free;

end;

//Helio - SOL Nº 253577-17359 PPM Nº 842402
function TFrmConfigBarrasCMMT.CriaAbreQryModeloEmail(idModeloEmail : Integer) : TWWQuery;
begin
        Result := TWWQuery.Create(Self);
        Result.DatabaseName := dtmBaseDados.dbBaseDados.DataBaseName;

        Result.SQL.Text := ' SELECT * FROM MODELOEMAIL WHERE IDMODELOEMAIL = ' +
                               IntToStr(idModeloEmail);

        Result.Open;
end;

//Helio - SOL Nº 253577-17359 PPM Nº 842402
procedure TFrmConfigBarrasCMMT.ImprimeArquivoSepPorDoc;
var
     fModEmail : TFrmSelModeloEmail;
     resuDlg : Integer;
     diretorioEscolhido,
     pathArquivo,
     nomeArquivo,
     filtro : String;
     i : Integer;
     gravaBoletoNoDisco : Boolean;
     enviaEmail : Boolean;
     lstMatriculasJaUsadas : TStringList;
begin
       SelDados;

       if CdsDados.RecordCount < 1 then
           Exit;

       lstMatriculasJaUsadas := TStringList.Create;
       enviaEmail := HabilitadoOpcEnviaEmail;
       if (enviaEmail) and (not CancelaGeraAquivo) and (Not CancelaEnvioEmail) then
            PreparaEEnviaEmailDoc;


       resuDlg := MsgDlg('Deseja gravar os boletos gerados?',
                  Sistema.NomeModulo,
                  mtInformation,
                  [mbYes, mbNo],
                  0);


       if resuDlg = mrYes then
            gravaBoletoNoDisco := True
       else
            gravaBoletoNoDisco := False;

       if (gravaBoletoNoDisco) then
         SelectDirectory('Diretório Padrão do Arquivo de Remessa',
                         '',
                         diretorioEscolhido);

       i := 0;
       CdsDados.First;

       if (gravaBoletoNoDisco) then
       begin

         while i < CdsDados.RecordCount do
         begin
                CdsDados.First;
                CdsDados.MoveBy(i);

                if Trim(CdsDadosMATRICULA.AsString) <> '' then //Helio - SOL Nº 258995 PPM Nº 996923
                if lstMatriculasJaUsadas.IndexOf(CdsDadosMATRICULA.AsString) >= 0 then
                   begin
                         Inc(i);
                         continue;
                   end;

                //Inicio - Helio - SOL Nº 258995 PPM Nº 996923
                if Trim(CdsDadosMATRICULA.AsString) = '' then
                     filtro := ' CODDOCUMENTO = ' + CdsDadosCODDOCUMENTO.AsString
                else
                     filtro := ' MATRICULA = ' + CdsDadosMATRICULA.AsString;
                //Fim - Helio - SOL Nº 258995 PPM Nº 996923


                lstMatriculasJaUsadas.Add(CdsDadosMATRICULA.AsString);
                nomeArquivo :=  GeraNomeArquivBoletoDisponivel('',
                                                               cdsDadosMatricula.AsString,
                                                               diretorioEscolhido + '\');
                pathArquivo := diretorioEscolhido + '\' + nomeArquivo;

                ImprimePorRegistro(filtro, false, pathArquivo);


                Inc(i);
         end;

            MsgDlg('Os boletos foram gerados e gravados em ' + diretorioEscolhido + '\', 'Aviso', mtWarning, [MbOk], 0);
       end else
            ImprimePorRegistro('', false, ''); //mostra todos em tela //Helio - SOL Nº 258995 PPM Nº 996923

       FreeAndNil(lstMatriculasJaUsadas);
end;

//Helio - SOL Nº 253577-17359 PPM Nº 842402
procedure TFrmConfigBarrasCMMT.CarregaDataSetEnvioEmailDoc;
var
     resuDlg : Integer;
begin
      cdsEnvioEmailDoc.EmptyDataSet;

       if Not HabilitadoOpcEnviaEmail then
            Exit;


       resuDlg := MsgDlg('Deseja enviá-lo(s) por e-mail?',
                  Sistema.NomeModulo,
                  mtInformation,
                  [mbYes, mbNo],
                  0);

       CancelaEnvioEmail := False;
       if resuDlg = mrNo then
       begin
            CancelaEnvioEmail := True;
            Exit;
       end;

       FrmSelModeloEmail := TFrmSelModeloEmail.Create(Self);
       FrmSelModeloEmail.cdsParticipantes := CdsDados;
       FrmSelModeloEmail.ShowModal;
       CancelaGeraAquivo := FrmSelModeloEmail.TelaCancelada;

       if not CancelaGeraAquivo then
           FrmSelModeloEmail.CarregaCDSParticipantesEnvioEmail(cdsEnvioEmailDoc);

       FreeAndNil(FrmSelModeloEmail);
end;

//Helio - SOL Nº 253577-17359 PPM Nº 842402
procedure TFrmConfigBarrasCMMT.PreparaEEnviaEmailDoc;
var
     i : Integer;
     nomeArquivo,
     filtro,
     pathArquivoEmail : String;
     qryModeloEmail : TWWQuery;
     lstMatriculasJaUsadas : TStringList;
begin
       lstMatriculasJaUsadas := TStringList.Create;
       i := 0;
       CdsDados.First;
       while i < CdsDados.RecordCount do
       begin
                 CdsDados.First;
                 CdsDados.MoveBy(i);

                 if Trim(CdsDadosMATRICULA.AsString) <> '' then //Helio - SOL Nº 258995 PPM Nº 996923
                 if lstMatriculasJaUsadas.IndexOf(CdsDadosMATRICULA.AsString) >= 0 then
                 begin
                       Inc(i);
                       continue;
                 end;

                 //Inicio - Helio - SOL Nº 258995 PPM Nº 996923
                 if Trim(CdsDadosMATRICULA.AsString) = '' then
                      filtro := ' CODDOCUMENTO = ' + CdsDadosCODDOCUMENTO.AsString
                 else
                      filtro := ' MATRICULA = ' + CdsDadosMATRICULA.AsString;
                 //Fim - Helio - SOL Nº 258995 PPM Nº 996923

                 lstMatriculasJaUsadas.Add(CdsDadosMATRICULA.AsString);
                 if cdsEnvioEmailDoc.Locate('NUDOCUMENTO', CdsDadosNODOCUMENTO.AsString, []) then
                 begin
                     if Not assigned(qryModeloEmail) then
                          qryModeloEmail := CriaAbreQryModeloEmail(cdsEnvioEmailDoc.FieldByName('IDMODELOEMAIL').AsInteger);

                     //Inicio - Helio - SOL Nº 258995 PPM Nº 996923
                     if Trim(cdsDadosMatricula.AsString) = '' then
                           nomeArquivo := 'Boleto ' + qryModeloEmail.FieldByName('DESCRICAO').AsString + '.pdf'
                     else
                     //Fim - Helio - SOL Nº 258995 PPM Nº 996923
                        nomeArquivo := 'Boleto ' + qryModeloEmail.FieldByName('DESCRICAO').AsString +
                                        ' - Matricula ' + cdsDadosMatricula.AsString +
                                        '.pdf';
                     pathArquivoEmail := Sistema.TempDir + nomeArquivo;

                     if FileExists(pathArquivoEmail) then DeleteFile(pathArquivoEmail);
                     ImprimePorRegistro(filtro, false, pathArquivoEmail);
                     EnviaEmailDoc(pathArquivoEmail,
                                   nomeArquivo,
                                   qryModeloEmail.FieldByName('CORPOEMAIL').AsString,
                                   qryModeloEmail.FieldByName('ASSUNTO').AsString,
                                   qryModeloEmail.FieldByName('CAIXASAIDA').AsString,
                                   qryModeloEmail.FieldByName('CAIXACCO').AsString);
                     DeleteFile(pathArquivoEmail);
                 end;

                 Inc(i);
       end;

       FreeAndNil(lstMatriculasJaUsadas);
       if assigned(qryModeloEmail) then
       begin
              qryModeloEmail.Close;
              FreeAndNil(qryModeloEmail);
       end;

       MsgDlg('E-mail(s) enviados com sucesso. A(s) ficha(s) de compensação' +
              ' foram gerada(s) e enviada(s) e cada Nosso Número atribuído ' +
              'ao(s) respectivo(s) documento(s). Caso deseje reimprimi-las, '+
              'utilize a janela: Cobrança\Cobrança Bancária\Libera Reimpressão de Bloqueto!',
              'E-mails enviados com sucesso.', mtWarning, [MbOk], 0);
end;

//Helio - SOL Nº 253577-17359 PPM Nº 842402
procedure TFrmConfigBarrasCMMT.EnviaEmailDoc(pathAnexo,
                                             nomeAnexo,
                                             corpoEmail,
                                             assuntoEmail,
                                             caixaSaida,
                                             caixaCopiaOculta : String);
var
     emailPara : String;
begin

       corpoEmail := StringReplace(corpoEmail, '<NOMEPARTICIPANTE>',      cdsEnvioEmailDoc.FieldByName('NOME').AsString, [rfReplaceAll] );
       corpoEmail := StringReplace(corpoEmail, '<MATRICULAPARTICIPANTE>', cdsEnvioEmailDoc.FieldByName('MATRICULA').AsString, [rfReplaceAll] );
       corpoEmail := StringReplace(corpoEmail, '<DATAVENCIMENTO>',        cdsEnvioEmailDoc.FieldByName('DATAVENCIMENTO').AsString, [rfReplaceAll] );
       corpoEmail := StringReplace(corpoEmail, #13#10, '<br />', [rfReplaceAll] );
       corpoEmail := '<HTML><HEAD></HEAD><BODY>' + corpoEmail + '</BODY></HTML>';

       emailPara := cdsEnvioEmailDoc.FieldByName('EMAIL').AsString;
       if (Copy(ansiuppercase(Sistema.AliasServidor),1,8) <> 'PRODUCAO') then  //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
       begin
              emailPara := inputbox('Teste Documento: ' + cdsEnvioEmailDoc.FieldByName('NUDOCUMENTO').AsString, 'Coloque um e-mail de teste', '');

              if Trim(caixaCopiaOculta) <> '' then
                   caixaCopiaOculta := inputbox('Teste Documento: ' + cdsEnvioEmailDoc.FieldByName('NUDOCUMENTO').AsString, 'Coloque um e-mail de teste de copia oculta', '');
       end;

       EmailUtil.EnviaEmailComAnexoPorOracle(caixaSaida,
                                             emailPara,
                                             assuntoEmail,
                                             corpoEmail,
                                             nomeAnexo,
                                             pathAnexo,
                                             'application/pdf',
                                             '',
                                             Trim(caixaCopiaOculta));
end;

function TFrmConfigBarrasCMMT.GeraNomeArquivBoletoDisponivel(descricao,
                                                             matricula,
                                                             diretorio : String) : String;
var
    i : Integer;
begin
       i := 0;
       repeat
               //Inicio - Helio - SOL Nº 258995 PPM Nº 996923
               if Trim(matricula) = '' then
               begin
                    Result := 'Boleto';
                    if Trim(descricao) <> '' then Result := Result + ' ' + descricao;
               end else
               //Fim - Helio - SOL Nº 258995 PPM Nº 996923
                  Result := 'Boleto ' + descricao +
                            ' - Matricula ' + matricula;

               if i > 0 then
                   Result := Result + '(' + IntToStr(i) + ')';

               Result := Result + '.pdf';

               Inc(i);
       until Not FileExists(diretorio + Result);
end;

end.




