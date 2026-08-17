unit rPlanInvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, ppDBPipe, ppDBBDE,
  Db, Wwdatsrc, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, DBClient, uCMClientDataSet,
  uCmSqlParams;

type
  TrptPlanInvent = class(TFrmCmReport)
    sqlPlanInvent: TCMSqlParams;
    cdsPlanInvent: TCMClientDataSet;
    rptPlanInvent: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel12: TppLabel;
    ppLine2: TppLine;
    LblEmpresa: TppLabel;
    rptPlanInventLabel7: TppLabel;
    LBAlmoxPI: TppLabel;
    ppDetailBand5: TppDetailBand;
    rptPlanInventDBText3: TppDBText;
    rptPlanInventDBText4: TppDBText;
    rptPlanInventLine3: TppLine;
    rptPlanInventDBText5: TppDBText;
    rptPlanInventDBText6: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine7: TppLine;
    lblSistema: TppLabel;
    ppCalc8: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    rptPlanInventGroup1: TppGroup;
    rptPlanInventGroupHeaderBand1: TppGroupHeaderBand;
    rptPlanInventLine1: TppLine;
    rptPlanInventDBText1: TppDBText;
    rptPlanInventDBText2: TppDBText;
    rptPlanInventLabel1: TppLabel;
    rptPlanInventLabel2: TppLabel;
    rptPlanInventLabel3: TppLabel;
    rptPlanInventLabel4: TppLabel;
    rptPlanInventLabel5: TppLabel;
    rptPlanInventLine2: TppLine;
    rptPlanInventLabel6: TppLabel;
    rptPlanInventLabel8: TppLabel;
    rptPlanInventGroupFooterBand1: TppGroupFooterBand;
    dsPlanInvent: TwwDataSource;
    bdePlanInvent: TppBDEPipeline;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptPlanInvent: TrptPlanInvent;
  sNomeAlmox: String = '';

implementation

{$R *.DFM}

procedure TrptPlanInvent.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With sqlPlanInvent Do Begin
       Close;
       Sql.Text := 'SELECT I.IDINVENTARIO,   ' +
                   '       I.DATAINVENTARIO, ' +
                   '       D.CODARTIGO,      ' +
                   '       S.LOCALIZACAO,    ' +
                   '       P.CODGRUPOPROD,   ' +
                   '       P.CODMEDCUSTO,    ' +
                   '       (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO ' +
                   '  FROM INVENTAR I, ' +
                   '       QTDECONT D, ' +
                   '       PRODUTO P,  ' +
                   '       ARTIGO A,   ' +
                   '       SALDO S     ' +
                   ' WHERE (I.CONTAGEMENCERRADA = ''F'') ' +
                   '   AND (S.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString  + ')' +
                   '   AND (I.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString  + ')' +
                   '   AND (I.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ')' +
                   '   AND (S.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ')';

       If CmpRptCM.ParamValues[ 4 ].AsBoolean Then
          Sql.Add('  AND (P.ITEMESTOCAVEL = ''S'')');

       If not CmpRptCM.ParamValues[ 1 ].IsNull Then
          Sql.Add(' AND I.IDINVENTARIO = ' + CmpRptCM.ParamValues[ 1 ].AsString )
       Else
          If not CmpRptCM.ParamValues[ 2 ].IsNull Then
             Sql.Add(' AND I.DATAINVENTARIO = TO_DATE(''' + CmpRptCM.ParamValues[ 2 ].AsString + ''',''DD/MM/YYYY'')');

       Sql.Add(' AND I.IDINVENTARIO = D.IDINVENTARIO ' +
               ' AND A.CODARTIGO = D.CODARTIGO       ' +
               ' AND A.CODARTIGO = S.CODARTIGO(+)    ' +
               ' AND P.CODPRODUTO =  A.CODPRODUTO    ' );

       Case CmpRptCM.ParamValues[ 3 ].AsInteger Of
            0: Sql.Add(' ORDER BY I.IDINVENTARIO, D.CODARTIGO ');
            1: Sql.Add(' ORDER BY I.IDINVENTARIO, DESCRICAO   ');
            2: Sql.Add(' ORDER BY I.IDINVENTARIO, P.CODGRUPOPROD ');
            3: Sql.Add(' ORDER BY I.IDINVENTARIO, S.LOCALIZACAO ');
       End;

       lbAlmoxPI.Text := sNomeAlmox;
       Open;
   end;
end;

procedure TrptPlanInvent.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'NumeroInven' ).LookupSettings.SQL.Text  := 'SELECT IDINVENTARIO, DATAINVENTARIO, ABERTOFECHADO ' +
                                                                    '  FROM INVENTAR ' +
                                                                    ' WHERE (CONTAGEMENCERRADA = ''F'') ' +
                                                                    '   AND IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa )+
                                                                    ' ORDER BY IDINVENTARIO';
end;

procedure TrptPlanInvent.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
  end;
end;

end.

