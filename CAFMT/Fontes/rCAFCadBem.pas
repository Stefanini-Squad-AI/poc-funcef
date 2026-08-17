unit rCAFCadBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport;

type
  TRptCAFCadBem = class(TFrmCmReport)
    qryBem: TwwQuery;
    qryBemPLACA: TFloatField;
    qryBemDESBEM: TStringField;
    qryBemDATAULTDEP: TDateTimeField;
    qryBemDATAINICIODEP: TDateTimeField;
    qryBemIDNOTA: TStringField;
    qryBemCOMPLNOTA: TStringField;
    qryBemNUMSERIE: TStringField;
    qryBemREGISTRO: TStringField;
    qryBemCONTROLE: TStringField;
    qryBemTAXADEP: TFloatField;
    qryBemDESCCCUSTO: TStringField;
    qryBemDESCLOCAL: TStringField;
    qryBemNOMERESP: TStringField;
    qryBemDESCGRUPO: TStringField;
    qryBemDESCCONJUNTO: TStringField;
    qryBemDTAINCLUSAO: TDateTimeField;
    qryBemVALHISTORICO: TFloatField;
    qryBemNOMEFORN: TStringField;
    qryBemIDOPCIONAL: TStringField;
    qryBemDESCCLASSE: TStringField;
    qryBemDESCSITUACAO: TStringField;
    qryBemVALORG0: TFloatField;
    qryBemCMBEM0: TFloatField;
    qryBemDEPLANC0: TFloatField;
    qryBemCMDEP0: TFloatField;
    qryBemVALCTB0: TFloatField;
    dsBem: TwwDataSource;
    ppBem: TppBDEPipeline;
    rpBem: TppReport;
    ppHeaderBand1: TppHeaderBand;
    rpBemCabec: TppLabel;
    ppLabel2: TppLabel;
    rpBemLine3: TppLine;
    ppDetailBand1: TppDetailBand;
    rpBemLabel1: TppLabel;
    rpBemLabel2: TppLabel;
    rpBemDBText2: TppDBText;
    rpBemLabel3: TppLabel;
    rpBemDBText3: TppDBText;
    rpBemLabel4: TppLabel;
    rpBemDBText4: TppDBText;
    rpBemLabel5: TppLabel;
    rpBemDBText5: TppDBText;
    rpBemLabel6: TppLabel;
    rpBemDBText6: TppDBText;
    rpBemLabel7: TppLabel;
    rpBemLabel8: TppLabel;
    rpBemDBText7: TppDBText;
    rpBemLabel9: TppLabel;
    rpBemDBText8: TppDBText;
    rpBemLabel10: TppLabel;
    rpBemDBText9: TppDBText;
    rpBemDBText10: TppDBText;
    rpBemDBText11: TppDBText;
    rpBemLabel11: TppLabel;
    rpBemLabel12: TppLabel;
    rpBemDBText12: TppDBText;
    rpBemLabel13: TppLabel;
    rpBemDBText13: TppDBText;
    rpBemLabel14: TppLabel;
    rpBemLabel15: TppLabel;
    rpBemLabel16: TppLabel;
    rpBemLabel17: TppLabel;
    rpBemLabel18: TppLabel;
    rpBemDBText14: TppDBText;
    rpBemDBText15: TppDBText;
    rpBemDBText16: TppDBText;
    rpBemDBText17: TppDBText;
    rpBemDBText18: TppDBText;
    rpBemLabel19: TppLabel;
    rpBemDBText19: TppDBText;
    rpBemLabel20: TppLabel;
    rpBemLabel21: TppLabel;
    rpBemDBText20: TppDBText;
    rpBemLabel22: TppLabel;
    rpBemLabel23: TppLabel;
    rpBemLine2: TppLine;
    rpBemLine1: TppLine;
    rpBemCalc1: TppVariable;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    qryParamCaf: TwwQuery;
    qryParamCafMOEDAOFICIAL: TFloatField;
    qryParamCafMOEDAFISCAL: TFloatField;
    qryParamCafMOEDAGERENCIAL: TFloatField;
    qryParamCafNUMDIASANO: TFloatField;
    qryParamCafMASCCODGRUPO: TStringField;
    qryParamCafALUGUELINTERNO: TFloatField;
    qryParamCafGERARREQMAT: TFloatField;
    qryParamCafDATAULTDEP: TDateTimeField;
    qryParamCafDATARECALCDEP: TDateTimeField;
    qryParamCafDTAULTALUG: TDateTimeField;
    qryParamCafSEQBEMEMP: TFloatField;
    qryParamCafEDITACODBEM: TFloatField;
    qryParamCafEDITACODGRUPO: TFloatField;
    qryParamCafSISTEMAS: TStringField;
    qryParamCafDATAINICIAL: TDateTimeField;
    qryParamCafULTTXTCONTAB: TDateTimeField;
    qryParamCafFLGCALCCM: TFloatField;
    qryParamCafFLGTIPOCALC: TStringField;
    qryParamCafMASCARACLASSE: TStringField;
    qryParamCafINTEGRACONTAB: TStringField;
    qryParamCafINTEGRACAP: TStringField;
    qryParamCafINTEGRACAR: TStringField;
    qryParamCafPLANOVIGENTE: TFloatField;
    qryParamCafFLGREAVAL: TStringField;
    qryParamCafTIPOPERCTB: TStringField;
    qryParamCafFLGREMOVEPLANCTB: TStringField;
    qryParamCafATIVPROJETO: TFloatField;
    qryParamCafPROXIMAPLACA: TFloatField;
    qryParamCafFLGCLSDESBEM: TFloatField;
    qryParamCafDIGMASCPLACA: TFloatField;
    qryParamCafPATROPADRAO: TFloatField;
    qryParamCafPLANPREVPADRAO: TFloatField;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFCadBem: TRptCAFCadBem;

implementation

{$R *.DFM}

procedure TRptCAFCadBem.CrmRptCMBeforePrint(Sender: TObject);
var
   sMascaraEmpresa, sMascaraPlaca, sMascaraGrupo : String;
   iAux : Integer;
   
begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Inicializa os parâmetros
   //-------------------------------------------------------------------------------------
   with qryParamCaf do
   begin
      ParamByName('PIDPESSOA').AsFloat := crmRptCM.IdEmpresa;
      Open;
      //----------------------------------------------------------------------------------
      sMascaraEmpresa := '';
      for iAux := 1 to length(trim(Floattostr(crmRptCM.IdEmpresa))) do
      begin
         sMascaraEmpresa := sMascaraEmpresa + '#';
      end;
      //----------------------------------------------------------------------------------
      sMascaraGrupo  := FieldByName('MASCCODGRUPO').AsString;
      iAux := 1;
      while iAux <= length(sMascaraGrupo) do
      begin
         if sMascaraGrupo[iAux] = '9' then
            sMascaraGrupo[iAux] := '#';
         iAux := iAux + 1;
      end;
      //----------------------------------------------------------------------------------
      if (FieldByName('SEQBEMEMP').AsFloat = 0) then
      begin
         sMascaraPlaca := sMascaraEmpresa + '.#########;0; ';
      end else
      begin
         sMascaraPlaca := sMascaraGrupo   + '.#######;0; '
      end;
      Close;
   end;
   //-------------------------------------------------------------------------------------
   with qryBem do
   begin
      Close;
      SQL.Clear;
      //----------------------------------------------------------------------------------
      SQL.Add(' SELECT B.PLACA, B.DESBEM, B.DATAULTDEP, B.DATAINICIODEP, B.IDNOTA, B.COMPLNOTA,');
      SQL.Add('        B.NUMSERIE, B.REGISTRO, B.CONTROLE, B.TAXADEP, CC.NOME AS DESCCCUSTO,   ');
      SQL.Add('        L.NOME AS DESCLOCAL, PR.NOME AS NOMERESP, G.NOME AS DESCGRUPO,          ');
      SQL.Add('        C.DESCCONJUNTO, B.DTAINCLUSAO, NVL(B.VALHISTORICO,0) AS VALHISTORICO,   ');
      SQL.Add('        PF.NOME AS NOMEFORN, B.IDOPCIONAL, CB.DESCRICAO AS DESCCLASSE,          ');
      SQL.Add('        S.DESCSITUACAO, B.IDCONJUNTO,                                                        ');
      SQL.Add('        (                                                                       ');
      SQL.Add('        (NVL(BEMACUM.VALBEMACUM,0) +                                            ');
      SQL.Add('         NVL(REAVACUM.VALREAVACUM,0) +                                          ');
      SQL.Add('         NVL(ACRESACUM.VALACRESACUM,0)) -                                       ');
      SQL.Add('        (NVL(BXBEMACUM.BXVALBEMACUM,0) +                                        ');
      SQL.Add('         NVL(BXREAVACUM.BXVALREAVACUM,0) +                                      ');
      SQL.Add('         NVL(BXACRESACUM.BXVALACRESACUM,0))) AS VALORG0,                        ');
      SQL.Add('                                                                                ');
      SQL.Add('        (NVL(CMBEMACUM.VALCMBEMACUM,0) +                                        ');
      SQL.Add('         NVL(CMREAVACUM.VALCMREAVACUM,0) +                                      ');
      SQL.Add('         NVL(CMACRESACUM.VALCMACRESACUM,0) -                                    ');
      SQL.Add('         NVL(BXCMBEMACUM.BXVALCMBEMACUM,0) -                                    ');
      SQL.Add('         NVL(BXCMREAVACUM.BXVALCMREAVACUM,0) -                                  ');
      SQL.Add('         NVL(BXCMACRESACUM.BXVALCMACRESACUM,0)) AS CMBEM0,                      ');
      SQL.Add('                                                                                ');
      SQL.Add('        (NVL(DEPBEMACUM.VALDEPBEMACUM,0) +                                      ');
      SQL.Add('         NVL(DEPREAVACUM.VALDEPREAVACUM,0) +                                    ');
      SQL.Add('         NVL(DEPACRESACUM.VALDEPACRESACUM,0) -                                  ');
      SQL.Add('         NVL(BXDEPBEMACUM.BXVALDEPBEMACUM,0) -                                  ');
      SQL.Add('         NVL(BXDEPREAVACUM.BXVALDEPREAVACUM,0) -                                ');
      SQL.Add('         NVL(BXDEPACRESACUM.BXVALDEPACRESACUM,0)) AS DEPLANC0,                  ');
      SQL.Add('                                                                                ');
      SQL.Add('        (NVL(CMDEPBEMACUM.VALCMDEPBEMACUM,0) +                                  ');
      SQL.Add('         NVL(CMDEPREAVACUM.VALCMDEPREAVACUM,0) +                                ');
      SQL.Add('         NVL(CMDEPACRESACUM.VALCMDEPACRESACUM,0) -                              ');
      SQL.Add('         NVL(BXCMDEPBEMACUM.BXVALCMDEPBEMACUM,0) -                              ');
      SQL.Add('         NVL(BXCMDEPREAVACUM.BXVALCMDEPREAVACUM,0) -                            ');
      SQL.Add('         NVL(BXCMDEPACRESACUM.BXVALCMDEPACRESACUM,0)) AS CMDEP0,                ');
      SQL.Add('        ((                                                                      ');
      SQL.Add('        (NVL(BEMACUM.VALBEMACUM,0) +                                            ');
      SQL.Add('         NVL(REAVACUM.VALREAVACUM,0) +                                          ');
      SQL.Add('         NVL(ACRESACUM.VALACRESACUM,0) +                                        ');
      SQL.Add('         NVL(CMBEMACUM.VALCMBEMACUM,0) +                                        ');
      SQL.Add('         NVL(CMREAVACUM.VALCMREAVACUM,0) +                                      ');
      SQL.Add('         NVL(CMACRESACUM.VALCMACRESACUM,0) ) -                                  ');
      SQL.Add('                                                                                ');
      SQL.Add('        (NVL(DEPBEMACUM.VALDEPBEMACUM,0) +                                      ');
      SQL.Add('         NVL(DEPREAVACUM.VALDEPREAVACUM,0) +                                    ');
      SQL.Add('         NVL(DEPACRESACUM.VALDEPACRESACUM,0) +                                  ');
      SQL.Add('         NVL(CMDEPBEMACUM.VALCMDEPBEMACUM,0) +                                  ');
      SQL.Add('         NVL(CMDEPREAVACUM.VALCMDEPREAVACUM,0) +                                ');
      SQL.Add('         NVL(CMDEPACRESACUM.VALCMDEPACRESACUM,0) )                              ');
      SQL.Add('        ) -                                                                     ');
      SQL.Add('        (                                                                       ');
      SQL.Add('        (NVL(BXBEMACUM.BXVALBEMACUM,0) +                                        ');
      SQL.Add('         NVL(BXREAVACUM.BXVALREAVACUM,0) +                                      ');
      SQL.Add('         NVL(BXACRESACUM.BXVALACRESACUM,0) +                                    ');
      SQL.Add('         NVL(BXCMBEMACUM.BXVALCMBEMACUM,0) +                                    ');
      SQL.Add('         NVL(BXCMREAVACUM.BXVALCMREAVACUM,0) +                                  ');
      SQL.Add('         NVL(BXCMACRESACUM.BXVALCMACRESACUM,0) ) -                              ');
      SQL.Add('                                                                                ');
      SQL.Add('        (NVL(BXDEPBEMACUM.BXVALDEPBEMACUM,0) +                                  ');
      SQL.Add('         NVL(BXDEPREAVACUM.BXVALDEPREAVACUM,0) +                                ');
      SQL.Add('         NVL(BXDEPACRESACUM.BXVALDEPACRESACUM,0) +                              ');
      SQL.Add('         NVL(BXCMDEPBEMACUM.BXVALCMDEPBEMACUM,0) +                              ');
      SQL.Add('         NVL(BXCMDEPREAVACUM.BXVALCMDEPREAVACUM,0) +                            ');
      SQL.Add('         NVL(BXCMDEPACRESACUM.BXVALCMDEPACRESACUM,0) ))) AS VALCTB0             ');
      SQL.Add('                                                                                ');
      SQL.Add(' FROM BEM         B,                                                            ');
      SQL.Add('      GRUPO       G,                                                            ');
      SQL.Add('      CLASSEDEBEM CB,                                                           ');
      SQL.Add('      CONJUNTO    C,                                                            ');
      SQL.Add('      LOCALIZACAO L,                                                            ');
      SQL.Add('      CENTCUST    CC,                                                           ');
      SQL.Add('      PESSOA      PR,                                                           ');
      SQL.Add('      PESSOA      PF,                                                           ');
      SQL.Add('      SITUACAO    S,                                                            ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALBEMACUM                 ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO IN (01,41))                                  ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) BEMACUM,                                   ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALREAVACUM                ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))                               ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) REAVACUM,                                  ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALACRESACUM               ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO IN (09,49))                                  ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) ACRESACUM,                                 ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMBEMACUM               ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO IN (15,42))                                  ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) CMBEMACUM,                                 ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMREAVACUM              ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO IN (22,46))                                        ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) CMREAVACUM,                                ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMACRESACUM             ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO IN (34,50))                                  ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) CMACRESACUM,                               ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPBEMACUM              ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO IN (14,17,43))                               ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMACUM,                                ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPREAVACUM             ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))                               ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) DEPREAVACUM,                               ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPACRESACUM            ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO IN (35,51))                                  ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) DEPACRESACUM,                              ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPBEMACUM            ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO IN (21,44))                                    ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPBEMACUM,                              ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPREAVACUM           ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO IN (19,48))                                  ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPREAVACUM,                             ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPACRESACUM          ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO IN (36,52))                                  ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPACRESACUM,                            ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALBEMACUM               ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO = 6)                                         ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) BXBEMACUM,                                 ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALREAVACUM              ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO = 20)                                        ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) BXREAVACUM,                                ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALACRESACUM             ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO = 37)                                        ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) BXACRESACUM,                               ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMBEMACUM             ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO = 25)                                        ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMBEMACUM,                               ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMREAVACUM            ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO = 28)                                        ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMREAVACUM,                              ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMACRESACUM           ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO = 38)                                        ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMACRESACUM,                             ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPBEMACUM            ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO = 24)                                        ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPBEMACUM,                              ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPREAVACUM           ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO = 27)                                        ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPREAVACUM,                             ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPACRESACUM          ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO = 39)                                        ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPACRESACUM,                            ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPBEMACUM          ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO = 26)                                        ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPBEMACUM,                            ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPREAVACUM         ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO = 29)                                        ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPREAVACUM,                           ');
      SQL.Add('                                                                                ');
      SQL.Add('    (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPACRESACUM        ');
      SQL.Add('     FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM                       ');
      SQL.Add('     WHERE  (HM.IDTIPOMOVIMENTACAO = 40)                                        ');
      SQL.Add('       AND  (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      SQL.Add('       AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))                          ');
      SQL.Add('     GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPACRESACUM                           ');
      SQL.Add(' WHERE ((B.DATAINICIODEP <= TO_DATE(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) OR (B.DATAINICIODEP IS NULL))' );
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[1].AsString = 'Total' then
         SQL.Add('   AND (B.CONTROLE = ' + #39 + 'T' + #39 + ')')
      else
      if CmpRptCM.ParamValues[1].AsString = 'Físico' then
         SQL.Add('   AND (B.CONTROLE = ' + #39 + 'F' + #39 + ')');
      //----------------------------------------------------------------------------------
      if not CmpRptCM.ParamValues[2].IsNull then
         SQL.Add('   AND (B.IDCLASSEBEM = ' + CmpRptCM.ParamValues[2].AsString + ')');
      //----------------------------------------------------------------------------------
      if not CmpRptCM.ParamValues[3].IsNull then
         SQL.Add('   AND (B.IDGRUPO = ' + CmpRptCM.ParamValues[3].AsString + ')');
      //----------------------------------------------------------------------------------
      if not CmpRptCM.ParamValues[4].IsNull then
         SQL.Add('   AND (C.IDLOCALIZACAO = ' + CmpRptCM.ParamValues[4].AsString + ')');
      //----------------------------------------------------------------------------------
      if not CmpRptCM.ParamValues[5].IsNull then
         SQL.Add('   AND (C.IDRESPONSAVEL = ' + CmpRptCM.ParamValues[5].AsString + ')');
      //----------------------------------------------------------------------------------
      if not CmpRptCM.ParamValues[6].IsNull then
         SQL.Add('   AND (B.IDCONJUNTO = ' + CmpRptCM.ParamValues[6].AsString + ')');
      //----------------------------------------------------------------------------------
      if not CmpRptCM.ParamValues[7].IsNull then
         SQL.Add('   AND (B.DTAINCLUSAO >= TO_DATE(' + #39 + CmpRptCM.ParamValues[7].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      //----------------------------------------------------------------------------------
      if not CmpRptCM.ParamValues[8].IsNull then
         SQL.Add('   AND (B.DTAINCLUSAO <= TO_DATE(' + #39 + CmpRptCM.ParamValues[8].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '))' );
      //----------------------------------------------------------------------------------
      SQL.Add('  AND (B.IDCONJUNTO     = C.IDCONJUNTO(+))       ');
      SQL.Add('  AND (B.IDGRUPO        = G.IDGRUPO(+))          ');
      SQL.Add('  AND (C.IDLOCALIZACAO  = L.IDLOCALIZACAO(+))    ');
      SQL.Add('  AND (C.IDRESPONSAVEL  = PR.IDPESSOA(+))        ');
      SQL.Add('  AND (B.IDFORNSERV     = PF.IDPESSOA(+))        ');
      SQL.Add('  AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))  ');
      SQL.Add('  AND (L.IDEMPRESA      = CC.IDEMPRESA(+))       ');
      SQL.Add('  AND (B.IDCLASSEBEM    = CB.IDCLASSEBEM(+))     ');
      SQL.Add('  AND (B.IDSITUACAO     = S.IDSITUACAO(+))       ');
      SQL.Add('  AND (B.IDBEM = BEMACUM.IDBEM(+))               ');
      SQL.Add('  AND (B.IDBEM = REAVACUM.IDBEM(+))              ');
      SQL.Add('  AND (B.IDBEM = ACRESACUM.IDBEM(+))             ');
      SQL.Add('  AND (B.IDBEM = CMBEMACUM.IDBEM(+))             ');
      SQL.Add('  AND (B.IDBEM = DEPBEMACUM.IDBEM(+))            ');
      SQL.Add('  AND (B.IDBEM = CMREAVACUM.IDBEM(+))            ');
      SQL.Add('  AND (B.IDBEM = DEPREAVACUM.IDBEM(+))           ');
      SQL.Add('  AND (B.IDBEM = CMDEPBEMACUM.IDBEM(+))          ');
      SQL.Add('  AND (B.IDBEM = CMDEPREAVACUM.IDBEM(+))         ');
      SQL.Add('  AND (B.IDBEM = CMACRESACUM.IDBEM(+))           ');
      SQL.Add('  AND (B.IDBEM = DEPACRESACUM.IDBEM(+))          ');
      SQL.Add('  AND (B.IDBEM = CMDEPACRESACUM.IDBEM(+))        ');
      SQL.Add('  AND (B.IDBEM = BXBEMACUM.IDBEM(+))             ');
      SQL.Add('  AND (B.IDBEM = BXREAVACUM.IDBEM(+))            ');
      SQL.Add('  AND (B.IDBEM = BXACRESACUM.IDBEM(+))           ');
      SQL.Add('  AND (B.IDBEM = BXCMBEMACUM.IDBEM(+))           ');
      SQL.Add('  AND (B.IDBEM = BXDEPBEMACUM.IDBEM(+))          ');
      SQL.Add('  AND (B.IDBEM = BXCMREAVACUM.IDBEM(+))          ');
      SQL.Add('  AND (B.IDBEM = BXDEPREAVACUM.IDBEM(+))         ');
      SQL.Add('  AND (B.IDBEM = BXCMDEPBEMACUM.IDBEM(+))        ');
      SQL.Add('  AND (B.IDBEM = BXCMDEPREAVACUM.IDBEM(+))       ');
      SQL.Add('  AND (B.IDBEM = BXCMACRESACUM.IDBEM(+))         ');
      SQL.Add('  AND (B.IDBEM = BXDEPACRESACUM.IDBEM(+))        ');
      SQL.Add('  AND (B.IDBEM = BXCMDEPACRESACUM.IDBEM(+))      ');
      //----------------------------------------------------------------------------------
      case CmpRptCM.ParamValues[9].AsInteger of
         0: SQL.Add(' ORDER BY B.DESBEM');
         1: SQL.Add(' ORDER BY B.PLACA');
         2: SQL.Add(' ORDER BY G.NOME');
         3: SQL.Add(' ORDER BY PR.NOME');
         4: SQL.Add(' ORDER BY L.NOME');
         5: SQL.Add(' ORDER BY B.IDCONJUNTO');
      else
         SQL.Add(' ORDER BY G.NOME');
      end;
   end;
   //-------------------------------------------------------------------------------------
   rpBemCalc1.DisplayFormat := sMascaraPlaca;
   rpBemCabec.Caption := 'Cadastro Patrimonial de Bens em ' + CmpRptCM.ParamValues[0].AsString;
   qryBem.Open;
end;

procedure TRptCAFCadBem.CrmRptCMChangeDataBaseName(Sender: TObject; sDataBaseName: String);
begin
   inherited;
   if qryBem.Active then
      qryBem.Close;
   qryBem.DataBaseName := sDataBaseName;
   //-------------------------------------------------------------------------------------
   if qryParamCAF.Active then
      qryParamCAF.Close;
   qryParamCAF.DataBaseName := sDataBaseName;
end;

end.
