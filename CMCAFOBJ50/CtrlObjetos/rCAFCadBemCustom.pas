unit rCAFCadBemCustom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCmReport, uCmRptManager, TXComp, CmParamReport, ppProd,
  ppClass, ppReport, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppVar,
  ppStrtch, ppMemo, ppPrnabl, ppComm, ppRelatv, ppCache, DB, Wwdatsrc,
  DBClient, uCMClientDataSet, uCmSqlParams, uCMfileUtils, uCtrlPadroes,
  IvDictio, IvMulti;

type
  TRptCAFCadBemCustom = class(TFrmCmReport)
    dsSelBensCustom: TwwDataSource;
    ppSelBensCustom: TppBDEPipeline;
    rpSelBensCustom: TppReport;
    ppHeaderBand7: TppHeaderBand;
    lblTituloRelat: TppLabel;
    ppLine13: TppLine;
    LblEmpresa: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLine15: TppLine;
    ppLabel121: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppFooterBand7: TppFooterBand;
    ppLine14: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    LblSistema: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppLine45: TppLine;
    ppDBCalc7: TppDBCalc;
    ppLabel120: TppLabel;
    ppLine47: TppLine;
    sqlSelBensCustom: TCMSqlParams;
    cdsSelBensCustom: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure sqlSelBensCustomFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFCadBemCustom: TRptCAFCadBemCustom;

implementation

{$R *.dfm}

procedure TRptCAFCadBemCustom.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      sqlSelBensCustom.SQL.Clear;
      sqlSelBensCustom.SQL.Add('SELECT /*+ RULE */ B.IDBEM, B.IDPESSOA, B.PLACA, B.DESBEM, B.DATAULTDEP,     ');
      sqlSelBensCustom.SQL.Add('       B.DATAINICIODEP, B.IDNOTA, B.COMPLNOTA,                               '); 
      sqlSelBensCustom.SQL.Add('       B.NUMSERIE, B.REGISTRO, B.CONTROLE, B.TAXADEP, CC.NOME AS DESCCCUSTO, '); 
      sqlSelBensCustom.SQL.Add('       L.NOME AS DESCLOCAL, PR.NOME AS NOMERESP, G.NOME AS DESCGRUPO,        '); 
      sqlSelBensCustom.SQL.Add('       C.DESCCONJUNTO, B.DTAINCLUSAO, NVL(B.VALHISTORICO,0) AS VALHISTORICO, '); 
      sqlSelBensCustom.SQL.Add('       PF.NOME AS NOMEFORN, B.IDOPCIONAL, CB.DESCRICAO AS DESCCLASSE,        '); 
      sqlSelBensCustom.SQL.Add('       S.DESCSITUACAO,                                                       '); 
      sqlSelBensCustom.SQL.Add('       (SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG)    AS VALORG0,         '); 
      sqlSelBensCustom.SQL.Add('       (SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM)       AS CMBEM0,          '); 
      sqlSelBensCustom.SQL.Add('       (SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC) AS DEPLANC0,        '); 
      sqlSelBensCustom.SQL.Add('       (SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP)       AS CMDEP0,          '); 
      sqlSelBensCustom.SQL.Add('       (SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +                       '); 
      sqlSelBensCustom.SQL.Add('        SB.REAVVALORG + SB.REAVCMBEM -                                       '); 
      sqlSelBensCustom.SQL.Add('        SB.REAVDEPLANC - SB.REAVCMDEP +                                      '); 
      sqlSelBensCustom.SQL.Add('        SB.ULTREAVVALORG + SB.ULTREAVCMBEM -                                 '); 
      sqlSelBensCustom.SQL.Add('        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)             AS VALCTB0          ');
      sqlSelBensCustom.SQL.Add('FROM BEM         B,   ');
      sqlSelBensCustom.SQL.Add('     GRUPO       G,   ');
      sqlSelBensCustom.SQL.Add('     CLASSEDEBEM CB,  ');
      sqlSelBensCustom.SQL.Add('     CONJUNTO    C,   ');
      sqlSelBensCustom.SQL.Add('     LOCALIZACAO L,   ');
      sqlSelBensCustom.SQL.Add('     CENTCUST    CC,  ');
      sqlSelBensCustom.SQL.Add('     PESSOA      PR,  ');
      sqlSelBensCustom.SQL.Add('     PESSOA      PF,  ');
      sqlSelBensCustom.SQL.Add('     SITUACAO    S,   ');
      sqlSelBensCustom.SQL.Add('     (SELECT /*+ RULE */ SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, ');
      sqlSelBensCustom.SQL.Add('             SCB1.VALORG,  SCB1.REAVVALORG,    SCB1.ULTREAVVALORG,   ');
      sqlSelBensCustom.SQL.Add('             SCB1.CMBEM,   SCB1.REAVCMBEM,     SCB1.ULTREAVCMBEM,    ');
      sqlSelBensCustom.SQL.Add('             SCB1.DEPLANC, SCB1.REAVDEPLANC,   SCB1.ULTREAVDEPLANC,  ');
      sqlSelBensCustom.SQL.Add('             SCB1.CMDEP,   SCB1.REAVCMDEP,     SCB1.ULTREAVCMDEP,    ');
      sqlSelBensCustom.SQL.Add('             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVEL    ');
      sqlSelBensCustom.SQL.Add('      FROM SALDOCONTABBEM SCB1,                   ');
      sqlSelBensCustom.SQL.Add('           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA ');
      sqlSelBensCustom.SQL.Add('            FROM SALDOCONTABBEM                   ');
      sqlSelBensCustom.SQL.Add('            WHERE DATASLDBEM <= :DATASLD          ');
      sqlSelBensCustom.SQL.Add(CmpRptCM.ParamValues[3].AsString);
      sqlSelBensCustom.SQL.Add('              AND IDPESSOA = :IDPESSOA    ');
      sqlSelBensCustom.SQL.Add('            GROUP BY IDBEM) DTAMAX        ');
      sqlSelBensCustom.SQL.Add('      WHERE SCB1.IDPESSOA = :IDPESSOA     ');
      sqlSelBensCustom.SQL.Add('        AND SCB1.DATASLDBEM = DTAMAX.DATA ');
      sqlSelBensCustom.SQL.Add('        AND SCB1.IDBEM = DTAMAX.IDBEM) SB ');
      sqlSelBensCustom.SQL.Add('WHERE B.DATAINICIODEP <= :DATASLD         ');
      sqlSelBensCustom.SQL.Add('  AND G.FLGIMOVEL = 0                     ');
      sqlSelBensCustom.SQL.Add(CmpRptCM.ParamValues[2].AsString);
      sqlSelBensCustom.SQL.Add('  AND B.IDPESSOA = :IDPESSOA              ');
      sqlSelBensCustom.SQL.Add('  AND B.IDBEM = SB.IDBEM                  ');
      sqlSelBensCustom.SQL.Add('  AND B.IDPESSOA = SB.IDPESSOA            ');
      sqlSelBensCustom.SQL.Add('  AND SB.IDGRUPO = G.IDGRUPO              ');
      sqlSelBensCustom.SQL.Add('  AND SB.IDLOCALIZACAO = L.IDLOCALIZACAO  ');
      sqlSelBensCustom.SQL.Add('  AND SB.IDPESSOA = L.IDPESSOA            ');
      sqlSelBensCustom.SQL.Add('  AND L.CODCENTROCUSTO = CC.CODCENTROCUSTO');
      sqlSelBensCustom.SQL.Add('  AND L.IDEMPRESA = CC.IDEMPRESA          ');
      sqlSelBensCustom.SQL.Add('  AND SB.IDRESPONSAVEL = PR.IDPESSOA      ');
      sqlSelBensCustom.SQL.Add('  AND B.IDCONJUNTO = C.IDCONJUNTO         ');
      sqlSelBensCustom.SQL.Add('  AND B.IDCLASSEBEM = CB.IDCLASSEBEM      ');
      sqlSelBensCustom.SQL.Add('  AND B.IDSITUACAO = S.IDSITUACAO         ');
      sqlSelBensCustom.SQL.Add('  AND B.IDFORNSERV = PF.IDPESSOA(+)       ');
      sqlSelBensCustom.SQL.Add('ORDER BY B.PLACA                          ');
      //----------------------------------------------------------------------------------
      sqlSelBensCustom.Prepare;
      sqlSelBensCustom.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlSelBensCustom.ParamByName('DATASLD').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlSelBensCustom.Open;
      //----------------------------------------------------------------------------------
      if cdsSelBensCustom.IsEmpty then
         Raise Exception.Create('Não existem bens com os parâmetros fornecidos!');
      //----------------------------------------------------------------------------------
      ppLabel121.Caption := CmpRptCM.ParamValues[1].AsString;
      lblTituloRelat.Caption := 'Relatório Customizado de Bens em ' + DateToStr(CmpRptCM.ParamValues[0].AsDateTime);
   except
      On E : Exception do
      begin
         CMDebugToFile('Relatório CADASTRO DE BENS CUSTOMIZÁVEL : ' + E.Message);
      end;
   end;
   Screen.Cursor := crDefault;
   Application.ProcessMessages;
end;

procedure TRptCAFCadBemCustom.sqlSelBensCustomFormartParam(sParamName, sOldValue: String; var sNewValue: String);
begin
   inherited;
   if AnsiUpperCase(sParamName) = 'SQLSELBENS' then
      sNewValue := Copy(sOldValue,1,Length(sOldValue));
end;

end.
