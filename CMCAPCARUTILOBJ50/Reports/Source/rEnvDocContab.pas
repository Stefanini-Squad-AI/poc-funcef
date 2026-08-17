unit rEnvDocContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  uCmRptManager, TXComp, TXRB, CmParamReport, ppCtrls, ppPrnabl, ppBands,
  ppCache, Db, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra, ppVar,
  Wwdatsrc, ppDBBDE, ppModule, raCodMod, ppParameter;

type
  TrptEnvDocContab = class(TFrmCmReport)
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    dsDocumentos: TDataSource;
    sqlDocumentos: TCMSqlParams;
    cdsDocumentos: TCMClientDataSet;
    ppBDECabecario: TppBDEPipeline;
    ppBDEPipeline1ppField1: TppField;
    ppBDEPipeline1ppField2: TppField;
    ppBDEPipeline1ppField3: TppField;
    sqlCabecario: TCMSqlParams;
    cdsCabecario: TCMClientDataSet;
    dsCabecario: TwwDataSource;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBImage1: TppDBImage;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppShape3: TppShape;
    ppFooterBand1: TppFooterBand;
    ppShape2: TppShape;
    ppLabel22: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel10: TppLabel;
    ppDBText9: TppDBText;
    ppLabel9: TppLabel;
    ppShape4: TppShape;
    ppDBText8: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptEnvDocContab: TrptEnvDocContab;

implementation

uses uSistema;

{$R *.DFM}

procedure TrptEnvDocContab.CrmRptCMBeforePrint(Sender: TObject);
var
 sSql : string;

begin
  inherited;

  with sqlCabecario do
    Begin
      Prepare;
      SQL.Clear;
      SQL.Add('SELECT                                             ' ) ;
      SQL.Add('  P.RAZAOSOCIAL, P.NUMDOCUMENTO, I.IMAGEM          ' ) ;
      SQL.Add('FROM                                               ' ) ;
      SQL.Add('  PESSOA P, IMAGENS I                              ' ) ;
      SQL.Add('WHERE                                              ' ) ;
      SQL.Add('  ( I.IDIMAGEM = P.IDIMAGEM ) AND                  ' ) ;
      SQL.Add('  (P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +')');
      Open;
    end;

  cdsDocumentos.Active := False;
  sqlDocumentos.sql.clear;

  sSql:= 'SELECT (0) AS SELECIONADO, '+
          ' D.DATAPROGRAMADA, '+
          ' D.DATAEMISSAO, '+
          ' (RTRIM(D.NODOCUMENTO) || '' '' || RTRIM(D.COMPLDOCUMENTO)) As Documento, '+
          ' D.CODDOCUMENTO, '+
          ' DECODE(D.IDENVIODOCUMENTO, NULL,''Não Encaminhado'', ''Encaminhado'') As Status, '+
          ' P.RAZAOSOCIAL, '+
          ' D.NODOCUMENTO, '+
          ' D.NUMAPGR, '+
          ' D.DATAVENCTO, '+
          ' PP.PLNPLANIL, '+
          ' D.IDENVIODOCUMENTO, '+
          ' L.VALOR AS VALORBRUTO, '+
          ' VW.SALDO AS VALORLIQUIDO, '+
          ' DECODE(E.TRGDTINCLUSAO, NULL, ''-----'', TO_CHAR(E.TRGDTINCLUSAO, ''DD/MM/YYYY HH24:MI:SS'')) AS DATAENVIO,'+
          ' NVL(U.NOMEUSUARIO, ''-------'') AS NOMEUSUARIO '+
          ' FROM DOCUMENTO D, PESSOA P, LANCTODOCUM L, PLANILHA PP, VWSALDODOC VW, ENVIODOCUMENTO E, USUARIOSISTEMA U  '+
          'WHERE (D.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +') ' +
          '  AND (D.RECPAG = '+ QuotedStr(ParamIntegra.recpag) +') '+
          '  AND (D.IDFORCLI = P.IDPESSOA) '+
          '  AND (D.CODDOCUMENTO = VW.CODDOCUMENTO) '+
          '  AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '+
          '  AND (D.OPERACAO = L.OPERACAO) '+
          '  AND (L.PLNCODIGO = PP.PLNCODIGO) '+
          '  AND (D.IDENVIODOCUMENTO = E.IDENVIODOCUMENTO) '+
          '  AND (E.IDUSUARIO = U.IDUSUARIO(+)) '+
          '  AND (D.NUMSLIP IS NULL) '+
          '  AND (D.STATUS <> ''2'' OR D.STATUS IS NULL) '+
          '  AND (D.OPERACAO IN (''2'', ''3'', ''14'')) '+
          '  and D.CODTIPDOC in '+
          '      (SELECT CODTIPDOC '+
          '         FROM TIPODOCRECPAG a '+
          '        WHERE a.RECPAG = '+ QuotedStr(ParamIntegra.recpag) + '' +
          '          and not exists (select 1  '+
          '                 from UsuarioxTpdocto b '+
          '                where recpag = '+ QuotedStr(ParamIntegra.recpag) + '' +
          '                  and b.idusuario = '+ IntToStr(Sistema.IdEmpresa) +') ' +
          '       union  '+
          '       SELECT CODTIPDOC '+
          '         FROM TIPODOCRECPAG a  '+
          '        WHERE a.RECPAG = '+ QuotedStr(ParamIntegra.recpag) + '' +
          '          and exists (select 1  '+
          '                 from UsuarioxTpdocto b '+
          '                where recpag = '+ QuotedStr(ParamIntegra.recpag) + '' +
          '                  and a.codtipdoc = b.codtipdoc ' +
          '                  and b.idusuario = ' + IntToStr(Sistema.IdEmpresa) +') ' +') ';

          if CmpRptCM.ParamValues[9].AsString = 'V' then
            begin
              if CmpRptCM.ParamValues[0].AsString <> '' then
                sSql:= sSQL + ' and D.DATAVENCTO >= to_date(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',''dd/mm/yyyy'') ';

              if CmpRptCM.ParamValues[1].AsString <> '' then
                sSql:= sSQL + ' and D.DATAVENCTO <= to_date(' + #39 + CmpRptCM.ParamValues[1].AsString + #39 + ',''dd/mm/yyyy'') ';
            end;

          if CmpRptCM.ParamValues[9].AsString = 'E' then
            begin
              if CmpRptCM.ParamValues[0].AsString <> '' then
                sSql:= sSQL + ' and D.DATAEMISSAO >= to_date(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',''dd/mm/yyyy'') ';

              if CmpRptCM.ParamValues[1].AsString <> '' then
                sSql:= sSQL + ' and D.DATAEMISSAO <= to_date(' + #39 + CmpRptCM.ParamValues[1].AsString + #39 + ',''dd/mm/yyyy'') ';
            end;

          if CmpRptCM.ParamValues[9].AsString = 'L' then
            begin
              if CmpRptCM.ParamValues[0].AsString <> '' then
                sSql:= sSQL + ' and L.DATALANCTO >= to_date(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',''dd/mm/yyyy'') ';

              if CmpRptCM.ParamValues[1].AsString <> '' then
                sSql:= sSQL + ' and L.DATALANCTO <= to_date(' + #39 + CmpRptCM.ParamValues[1].AsString + #39 + ',''dd/mm/yyyy'') ';
            end;

          if CmpRptCM.ParamValues[9].AsString = 'D' then
            begin
              if CmpRptCM.ParamValues[0].AsString <> '' then
                sSql:= sSQL + ' and D.DATADISPONIB >= to_date(' + #39 + CmpRptCM.ParamValues[0].AsString + #39 + ',''dd/mm/yyyy'') ';

              if CmpRptCM.ParamValues[1].AsString <> '' then
                sSql:= sSQL + ' and D.DATADISPONIB <= to_date(' + #39 + CmpRptCM.ParamValues[1].AsString + #39 + ',''dd/mm/yyyy'') ';
            end;

          if CmpRptCM.ParamValues[2].AsString <> '' then
            sSql:= sSQL +  ' AND P.RAZAOSOCIAL = ' + CmpRptCM.ParamValues[2].AsString;

          if CmpRptCM.ParamValues[3].AsString <> '' then
            sSql:= sSQL +  ' AND D.NUMAPGR = ' + CmpRptCM.ParamValues[3].AsString;

          if CmpRptCM.ParamValues[4].AsString <> '' then
            sSql:= sSQL +  ' AND VW.SALDO = ' + CmpRptCM.ParamValues[4].AsString;

          if CmpRptCM.ParamValues[5].AsString <> '' then
            sSql:= sSQL +  ' AND L.VALOR = ' + CmpRptCM.ParamValues[5].AsString;

          if (CmpRptCM.ParamValues[6].AsBoolean = True) and (CmpRptCM.ParamValues[7].AsBoolean = False) then
            sSql:= sSQL +  ' AND D.IDENVIODOCUMENTO IS NOT NULL ';

          if (CmpRptCM.ParamValues[7].AsBoolean = True) and (CmpRptCM.ParamValues[6].AsBoolean = False) then
            sSql:= sSQL +  ' AND D.IDENVIODOCUMENTO IS NULL ';

          if CmpRptCM.ParamValues[8].AsString <> '' then
            sSql:= sSQL +  ' AND E.TRGDINCLUSAO = TO_DATE(' + QuotedStr(CmpRptCM.ParamValues[8].AsString) +', ''DD/MM/YYYY HH24:MI:SS'')';

          sSql:= sSQL + ' ORDER BY P.RAZAOSOCIAL, NODOCUMENTO ';

  sqlDocumentos.SQL.Add(sSql);
  sqlDocumentos.Open;

end;

end.
