unit rArtxConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptArtxConta = class(TFrmCmReport)
    dsArtxConta: TwwDataSource;
    bdeArtxConta: TppBDEPipeline;
    RptArtxConta: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLabel68: TppLabel;
    LblEmpresa: TppLabel;
    RptArtxContaLabel1: TppLabel;
    RptArtxContaLabel2: TppLabel;
    RptArtxContaLabel3: TppLabel;
    RptArtxContaLabel4: TppLabel;
    RptArtxContaLabel5: TppLabel;
    RptArtxContaLine3: TppLine;
    DetArtxConta: TppDetailBand;
    RptArtxContaDBText4: TppDBText;
    RptArtxContaDBText5: TppDBText;
    RptArtxContaDBText6: TppDBText;
    RptArtxContaDBText3: TppDBText;
    RptArtxContaDBText2: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppLine28: TppLine;
    LblSistema: TppLabel;
    ppCalc26: TppSystemVariable;
    ppCalc27: TppSystemVariable;
    RptArtxContaGroup1: TppGroup;
    CabecGrpArtxConta: TppGroupHeaderBand;
    RptArtxContaLine2: TppLine;
    RptArtxContaDBText1: TppDBText;
    RptArtxContaLine1: TppLine;
    RptArtxContaGroupFooterBand1: TppGroupFooterBand;
    SqlArtxConta: TCMSqlParams;
    CdsArtxConta: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptArtxConta: TRptArtxConta;

implementation

{$R *.DFM}

procedure TRptArtxConta.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlArtxConta Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT UN.CODARTIGO, ');
       Sql.Add('       UN.DESCRICAO, ');
       Sql.Add('       UN.CODGRUPOPROD, ');
       Sql.Add('       UN.DESCGRUPO, ');
       Sql.Add('       UN.CONTAENTRADA, ');
       Sql.Add('       UN.CONTASAIDA, ');
       Sql.Add('       UN.CENTCUST ');
       Sql.Add('  FROM ( SELECT A.CODARTIGO, ');
       Sql.Add('                ( P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO ) AS DESCRICAO, ');
       Sql.Add('                G.CODGRUPOPROD, ');
       Sql.Add('                ( RTRIM( G.CODGRUPOPROD ) || ''  '' || G.DESCGRUPOPROD ) AS DESCGRUPO, ');
       Sql.Add('                ( C.CONTAENTRADA || ''  '' || PC.PLANOME ) AS CONTAENTRADA, ');
       Sql.Add('                ( C.CONTASAIDA || ''  '' || PC2.PLANOME ) AS CONTASAIDA, ');
       Sql.Add('                ( C.CODCENTROCUSTO ||''  '' || CC.NOME ) AS CENTCUST ');
       Sql.Add('           FROM ARTIGO A, ');
       Sql.Add('                PRODUTO P, ');
       Sql.Add('                GRUPPROD G, ');
       Sql.Add('                ARTXCONTAXCC C, ');
       Sql.Add('                PLANOCONTA PC, ');
       Sql.Add('                PLANOCONTA PC2, ');
       Sql.Add('                CENTCUST  CC ');
       Sql.Add('          WHERE ( C.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('            AND ( PC.PLANO = C.PLANO ) ');
       Sql.Add('            AND ( PC2.PLANO = C.PLANO ) ');
       Sql.Add('            AND ( A.CODPRODUTO = P.CODPRODUTO ) ');
       Sql.Add('            AND ( P.CODGRUPOPROD = G.CODGRUPOPROD ) ');
       Sql.Add('            AND ( A.CODARTIGO = C.CODARTIGO ) ');
       Sql.Add('            AND ( C.CONTAENTRADA = PC.PLACONTA ) ');
       Sql.Add('            AND ( C.CONTASAIDA = PC2.PLACONTA ) ');
       Sql.Add('            AND ( C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ');
       Sql.Add('            AND ( C.IDEMPRESA = CC.IDEMPRESA(+) ) ');
       Sql.Add('         UNION ');
       Sql.Add('         SELECT A.CODARTIGO, ');
       Sql.Add('                ( P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO ) AS DESCRICAO, ');
       Sql.Add('                G.CODGRUPOPROD, ');
       Sql.Add('                ( RTRIM( G.CODGRUPOPROD ) || ''  '' || G.DESCGRUPOPROD ) AS DESCGRUPO, ');
       Sql.Add('                ( C.CONTAENTRADA || ''  '' || PC.PLANOME ) AS CONTAENTRADA, ');
       Sql.Add('                ( C.CONTASAIDA || ''  ''  || PC2.PLANOME ) AS CONTASAIDA, ');
       Sql.Add('                ( C.CODCENTROCUSTO ||''  '' || CC.NOME ) AS CENTCUST ');
       Sql.Add('           FROM ARTIGO A, ');
       Sql.Add('                PRODUTO P, ');
       Sql.Add('                GRUPPROD G, ');
       Sql.Add('                ARTXCONTAXCC C, ');
       Sql.Add('                PLANOCONTA PC, ');
       Sql.Add('                PLANOCONTA PC2, ');
       Sql.Add('                CENTCUST CC ');
       Sql.Add('          WHERE ( C.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('            AND ( PC.PLANO = C.PLANO ) ');
       Sql.Add('            AND ( PC2.PLANO = C.PLANO ) ');
       Sql.Add('            AND ( A.CODPRODUTO = P.CODPRODUTO ) ');
       Sql.Add('            AND ( P.CODGRUPOPROD = G.CODGRUPOPROD ) ');
       Sql.Add('            AND ( G.CODGRUPOPROD = C.CODGRUPOPROD ) ');
       Sql.Add('            AND ( C.CONTAENTRADA = PC.PLACONTA ) ');
       Sql.Add('            AND ( C.CONTASAIDA = PC2.PLACONTA ) ');
       Sql.Add('            AND ( C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) ) ');
       Sql.Add('            AND ( C.IDEMPRESA = CC.IDEMPRESA(+) ) ');
       Sql.Add('            AND NOT EXISTS ( SELECT X.IDARTXCONTAXCC FROM ARTXCONTAXCC X ');
       Sql.Add('                              WHERE ( X.CODARTIGO = A.CODARTIGO ) ) ');
       Sql.Add('       ) UN ');

       If Not CmpRptCM.ParamValues[ 0 ].IsNull Then 
          Sql.Add(' WHERE ( RTRIM( UN.CODGRUPOPROD ) LIKE ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 0 ].AsString ) + '%' ) + ' )');

       Sql.Add(' ORDER BY UN.CODGRUPOPROD,UN.DESCRICAO');
       Open;
  End;
end;

end.
