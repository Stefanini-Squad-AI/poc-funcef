unit rValidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptValidade = class(TFrmCmReport)
    dsValidade: TwwDataSource;
    pplValidade: TppBDEPipeline;
    rpValidade: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel9: TppLabel;
    LblEmpresa: TppLabel;
    lblDataValidade: TppLabel;
    ppLabel27: TppLabel;
    lblOpcao: TppLabel;
    rpValidadeLabel1: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    rpValidadeDBText7: TppDBText;
    ppFooterBand4: TppFooterBand;
    rpValidadeLine3: TppLine;
    LblSistema: TppLabel;
    ppCalc7: TppSystemVariable;
    rpValidadeCalc1: TppSystemVariable;
    rpValidadeCalc2: TppSystemVariable;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText14: TppDBText;
    ppLabel28: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    rpValidadeShape1: TppShape;
    ppLabel29: TppLabel;
    rpValidadeDBText9: TppDBText;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    rpValidadeLabel7: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    SqlValidade: TCMSqlParams;
    CdsValidade: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptValidade: TRptValidade;
  sNomeAlmox: String = '';
  
implementation

{$R *.DFM}

procedure TRptValidade.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT DISTINCT A.CODALMOXARIFADO, A.DESCALMOX ' +
                         'FROM ALMOX A, LOTEVALI L ' +
                        'WHERE (A.IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa ) + ' ) ' +
                          'AND (A.CODALMOXARIFADO = L.CODALMOXARIFADO) ' +
                        'ORDER BY DESCALMOX';
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

procedure TRptValidade.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       2: sNomeAlmox := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptValidade.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlValidade Do Begin
       Close;
       Sql.Text := ' SELECT AL.DESCALMOX AS ALMOXARIFADO, ' +
                           'AR.CODARTIGO, ' +
                           'PR.DESCPROD ||'' ''|| RTRIM(AR.CODCOR,'' '') ||'' ''|| RTRIM(AR.CODTAMANHO,'' '') AS PRODUTO, ' +
                           'L.DATAVALIDADE, ' +
                           'L.SALDOLOTE ' +
                     'FROM ALMOX AL, ARTIGO AR, PRODUTO PR, LOTEVALI L ' +
                    'WHERE (AL.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ') ' +
                      'AND (L.DATAVALIDADE >= TO_DATE(''' + CmpRptCM.ParamValues[ 0 ].AsString + ''',''DD/MM/YYYY''))'+
                      'AND (L.DATAVALIDADE <= TO_DATE(''' + CmpRptCM.ParamValues[ 1 ].AsString + ''',''DD/MM/YYYY''))';

       If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
          SQL.add(' AND AL.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 2 ].AsString );

       SQL.add( ' AND (AR.FLGATIVO = ''S'')' +
                ' AND (AL.CODALMOXARIFADO = L.CODALMOXARIFADO)' +
                ' AND (L.CODARTIGO = AR.CODARTIGO)' +
                ' AND (AR.CODPRODUTO = PR.CODPRODUTO) ' );

       Case CmpRptCM.ParamValues[ 3 ].AsInteger of
            0: Sql.add('ORDER BY ALMOXARIFADO, DATAVALIDADE, PRODUTO');
            1: Sql.add('ORDER BY DATAVALIDADE, ALMOXARIFADO, PRODUTO');
       End;

       lblDataValidade.Caption := 'De ' + CmpRptCM.ParamValues[ 0 ].AsString + ' à ' + CmpRptCM.ParamValues[ 1 ].AsString;
       lblOpcao.Caption := CmpRptCM.ParamByName( 'Ordenado' ).RadioGroupSettings.Items[ CmpRptCM.ParamValues[ 3 ].AsInteger ];
       Open;
  End;
end;

end.
