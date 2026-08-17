unit rSolCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppCtrls, ppBands, ppClass, ppVar,
  ppStrtch, ppMemo, ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, MontaSelect;

type
  TRptSolCompra = class(TFrmCmReport)
    pplSolCompra: TppBDEPipeline;
    pplSoliCompppField1: TppField;
    pplSoliCompppField2: TppField;
    pplSoliCompppField3: TppField;
    pplSoliCompppField4: TppField;
    pplSoliCompppField5: TppField;
    pplSoliCompppField6: TppField;
    pplSoliCompppField7: TppField;
    pplSoliCompppField8: TppField;
    pplSoliCompppField9: TppField;
    pplSoliCompppField10: TppField;
    pplSoliCompppField11: TppField;
    pplSoliCompppField12: TppField;
    pplSoliCompppField13: TppField;
    pplSoliCompppField14: TppField;
    pplSoliCompppField15: TppField;
    pplSoliCompppField16: TppField;
    pplSoliCompppField17: TppField;
    pplSoliCompppField18: TppField;
    pplSoliCompppField19: TppField;
    pplSoliCompppField20: TppField;
    pplSoliCompppField21: TppField;
    pplSoliCompppField22: TppField;
    pplSoliCompppField23: TppField;
    pplSoliCompppField24: TppField;
    pplSoliCompppField25: TppField;
    pplSoliCompppField26: TppField;
    pplSoliCompppField27: TppField;
    pplSoliCompppField28: TppField;
    dsSolCompra: TwwDataSource;
    ppSolCompra: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLabel65: TppLabel;
    LblEmpresa: TppLabel;
    lbStatus: TppLabel;
    rpSoliCompLabel7: TppLabel;
    ppDetailBand2: TppDetailBand;
    rpSoliCompDBText4: TppDBText;
    rpSoliCompDBText8: TppDBText;
    rpSoliCompDBText5: TppDBText;
    LbPerPreco: TppLabel;
    rpSoliCompDBText3: TppDBText;
    rpSoliCompDBText12: TppDBText;
    ppSoliCompDBText1: TppDBText;
    ppSoliCompDBText2: TppDBText;
    ppSoliCompDBText4: TppDBText;
    ppSoliCompDBText3: TppDBText;
    ppSoliCompDBText5: TppDBText;
    ppSoliCompDBText6: TppDBText;
    ppSoliCompDBText7: TppDBText;
    ppSoliCompDBText8: TppDBText;
    rpSoliCompDBText11: TppDBText;
    ppSoliCompDBMemo1: TppDBMemo;
    ppFooterBand13: TppFooterBand;
    ppLine25: TppLine;
    LblSistema: TppLabel;
    ppCalc24: TppSystemVariable;
    ppCalc25: TppSystemVariable;
    rpSoliCompGroup1: TppGroup;
    rpSoliCompGroupHeaderBand1: TppGroupHeaderBand;
    rpSoliCompLine10: TppLine;
    rpSoliCompLabel1: TppLabel;
    rpSoliCompLabel2: TppLabel;
    LbNumSoliComp: TppDBText;
    rpSoliCompDBText2: TppDBText;
    rpSoliCompLabel8: TppLabel;
    rpSoliCompDBText7: TppDBText;
    rpSoliCompLine1: TppLine;
    rpSoliCompLabel9: TppLabel;
    rpSoliCompLine2: TppLine;
    rpSoliCompLabel11: TppLabel;
    rpSoliCompLabel12: TppLabel;
    rpSoliCompLabel13: TppLabel;
    rpSoliCompLabel14: TppLabel;
    rpSoliCompLabel5: TppLabel;
    rpSoliCompLabel17: TppLabel;
    rpSoliCompLabel20: TppLabel;
    rpSoliCompLine3: TppLine;
    rpSoliCompLine4: TppLine;
    rpSoliCompLine5: TppLine;
    rpSoliCompLabel19: TppLabel;
    rpSoliCompLabel22: TppLabel;
    rpSoliCompLabel23: TppLabel;
    rpSoliCompLine6: TppLine;
    rpSoliCompLabel24: TppLabel;
    rpSoliCompLine7: TppLine;
    rpSoliCompLabel25: TppLabel;
    rpSoliCompLabel26: TppLabel;
    ppSoliCompLabel1: TppLabel;
    rpSoliCompLabel31: TppLabel;
    ppSoliCompLabel2: TppLabel;
    rpSoliCompLabel27: TppLabel;
    ppSoliCompLabel3: TppLabel;
    rpSoliCompGroupFooterBand1: TppGroupFooterBand;
    rpSoliCompLine8: TppLine;
    ppReport2Label8: TppLabel;
    ppReport2Label10: TppLabel;
    ppReport2Label9: TppLabel;
    ppLine26: TppLine;
    rpSoliCompLine9: TppLine;
    Lb4Ult: TppLabel;
    rpSoliCompLine11: TppLine;
    rpSoliCompLabel10: TppLabel;
    rpSoliCompLabel35: TppLabel;
    rpSoliCompLabel34: TppLabel;
    rpSoliCompLabel36: TppLabel;
    rpSoliCompLabel38: TppLabel;
    rpSoliCompLabel39: TppLabel;
    rpSoliCompLabel40: TppLabel;
    rpSoliCompLabel41: TppLabel;
    rpSoliCompLabel37: TppLabel;
    rpSoliCompLine12: TppLine;
    rpSoliCompLine13: TppLine;
    rpSoliCompLine14: TppLine;
    rpSoliCompLine15: TppLine;
    rpSoliCompLine16: TppLine;
    rpSoliCompLine17: TppLine;
    rpSoliCompLine18: TppLine;
    rpSoliCompLine19: TppLine;
    rpSoliCompLine20: TppLine;
    rpSoliCompLine21: TppLine;
    rpSoliCompLine22: TppLine;
    rpSoliCompLine23: TppLine;
    rpSoliCompLine24: TppLine;
    rpSoliCompLine25: TppLine;
    rpSoliCompLine26: TppLine;
    rpSoliCompLine27: TppLine;
    rpSoliCompLine28: TppLine;
    rpSoliCompLine29: TppLine;
    rpSoliCompLine30: TppLine;
    rpSoliCompLine31: TppLine;
    rpSoliCompLabel33: TppLabel;
    rpSoliCompLabel45: TppLabel;
    rpSoliCompLabel47: TppLabel;
    rpSoliCompLabel43: TppLabel;
    rpSoliCompLine33: TppLine;
    rpSoliCompLine34: TppLine;
    rpSoliCompLine35: TppLine;
    rpSoliCompLine36: TppLine;
    LbFornA: TppLabel;
    LbFornB: TppLabel;
    LbFornC: TppLabel;
    LbFornD: TppLabel;
    LbTelA: TppLabel;
    LbTelB: TppLabel;
    LbTelC: TppLabel;
    LbTelD: TppLabel;
    ppSoliCompLabel4: TppLabel;
    ppSoliCompDBCalc1: TppDBCalc;
    SqlSolCompra: TCMSqlParams;
    CdsSolCompra: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    MsSolicitacao: TMontaSelect;
    MsCentroCusto: TMontaSelect;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure rpSoliCompGroupHeaderBand1BeforeGenerate(Sender: TObject);
    procedure ppSolCompraPrintingComplete(Sender: TObject);
    procedure Lb4UltPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptSolCompra: TRptSolCompra;
  bResumida: Boolean = False;
  sNomeStatus: String = '';

implementation

uses uCtrlPadroes;

{$R *.DFM}

procedure TRptSolCompra.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';

  With CmpRptCM.ParamByName( 'Solicitacao' ).MontaSelect.Filtro Do
  Begin
       Clear;
       Add( 'IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) );
       Add( 'IMPRESSO = ''F''' );
  End;

  With CmpRptCM.ParamByName( 'CentroCusto' ).MontaSelect.Filtro Do
  Begin
       Clear;
       Add( 'IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) );
       Add( 'IMPRESSO = ''F''' );
       Add( 'SOLICOMP.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO' );
       Add( 'SOLICOMP.IDPESSOA = CENTCUST.IDEMPRESA' );
  End;
{
  CmpRptCM.ParamByName( 'Solicitacao' ).LookupSettings.SQL.Text := 'SELECT NUMSOLCOMPRA FROM SOLICOMP WHERE ( IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ) AND ( IMPRESSO = ''F'' ) ORDER BY NUMSOLCOMPRA';
  CmpRptCM.ParamByName( 'CentroCusto' ).LookupSettings.SQL.Text := 'SELECT DISTINCT CODCENTROCUSTO FROM SOLICOMP WHERE ( IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ) AND ( IMPRESSO = ''F'' ) ORDER BY CODCENTROCUSTO'; }
end;

procedure TRptSolCompra.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  bResumida := CmpRptCM.ParamValues[ 0 ].AsBoolean;

  CdsAux.Close;
  SqlAux.Sql.Text := 'SELECT CODCUSTEIO FROM ALMOX WHERE CODALMOXARIFADO = ' +
                     FloatToStr( CmpRptCM.ParamValues[ 1 ].AsFloat );
  SqlAux.Open;

  With SqlSolCompra Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT /*+ RULE */ SO.NUMSOLCOMPRA, ');
       Sql.Add('       SO.CODCENTROCUSTO, ');
       Sql.Add('       SO.DATAENTREGA AS DATA, ');
       Sql.Add('       SO.IMPRESSO, ');
       Sql.Add('       SO.IDPESSOA, ');
       Sql.Add('       IT.CODARTIGO, ');
       Sql.Add('       SUBSTR( DECODE( IT.IDPRODVARI, NULL, PR.DESCPROD, PV.DESCPRODVARI ), 1, 60 ) AS PRODUTO, ');
       Sql.Add('       IT.QTDEPEDIDA, ');
       Sql.Add('       IT.CODMEDIDA, ');
       Sql.Add('       IT.OBSITEMSOLIC, ');
       Sql.Add('       SA.SALDOQTDE, ');
       Sql.Add('       SA.ESTMAXIMO, ');
       Sql.Add('       IT.SALDOACOMPRAR AS SALDO, ');
       Sql.Add('       PR.CODMEDCUSTO, ');
       Sql.Add('       PR.CODPRODUTO, ');
       Sql.Add('       U.DATAULTCOMP AS DATAU, ');
       Sql.Add('       U.FORMECEDOR AS FORNECEDOR, ');
       Sql.Add('       U.QTDE, ');
       Sql.Add('       U.UNID, ');
       Sql.Add('       U.VALUNIT AS PRECO, ');
       Sql.Add('       U.PRAZO, ');
       Sql.Add('       U.PERIODO AS PERIDO, ');
       Sql.Add('       CC.NOME AS CENTROCUSTO, ');
       Sql.Add('       DECODE( NVL( U.VALUNIT, 0 ), 0, 0, ( ( ( ( C.CUSTOMEDIO * CF.FATOR / CO.FATOR ) / U.VALUNIT ) - 1 ) * 100 ) ) AS PERCVAR, ');
       Sql.Add('       DECODE( PR.ITEMESTOCAVEL, ''S'', ''SIM'', ''NÃO'' ) AS ITEMESTOCAVEL, ');
       Sql.Add('       ( C.CUSTOMEDIO * CF.FATOR / CO.FATOR ) AS VALORUN, ');
       Sql.Add('       ( C.CUSTOMEDIO * CF.FATOR / CO.FATOR ) * IT.QTDEPEDIDA AS VALORTOTAL, ');
       Sql.Add('       CM.CONSUMO ');
       Sql.Add('  FROM SOLICOMP SO, ');
       Sql.Add('       ITEMSOLI IT, ');
       Sql.Add('       ARTIGO AR, ');
       Sql.Add('       PRODUTO PR, ');
       Sql.Add('       CUSTOMED C, ');
       Sql.Add('       CONVER CO, ');
       Sql.Add('       CONVER CF, ');
       Sql.Add('       SALDO SA, ');
       Sql.Add('       PRODVARI PV, ');
       Sql.Add('       ( SELECT M.CODARTIGO AS CODARTIGO, ');
       Sql.Add('                ROUND( ( SUM( M.QTDEMOV ) * -1 ) / 90, 2 ) AS CONSUMO ');
       Sql.Add('           FROM MOVIMENT M ');
       Sql.Add('          WHERE ( M.DATAMOV >= ( SYSDATE - 90 ) ) ');
       Sql.Add('            AND ( M.DATAMOV <= SYSDATE ) ');
       Sql.Add('            AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa ) + ' ) ');
       Sql.Add('            AND ( M.CODALMOXARIFADO = ' + FloatToStr( CmpRptCM.ParamValues[ 1 ].AsFloat ) + ' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV NOT IN ( ''A'', ''K'', ''B'', ''C'', ''S'', ''Z'' ) ) ');
       Sql.Add('          GROUP BY M.CODARTIGO ');
       Sql.Add('       ) CM, ');
       Sql.Add('       VWULTCOMPRA U, ');
       Sql.Add('       CENTCUST CC ');
       Sql.Add(' WHERE ( SO.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ' );

       If Not CmpRptCM.ParamValues[ 2 ].IsNull then
          SQL.add('   AND ( SO.NUMSOLCOMPRA = ' + CmpRptCM.ParamValues[ 2 ].AsString + ' ) ');

       If Not CmpRptCM.ParamValues[ 3 ].IsNull then
          SQL.add('   AND ( RTRIM( SO.CODCENTROCUSTO ) = ''' + Trim( CmpRptCM.ParamValues[ 3 ].AsString ) + ''' ) ');

       Case CmpRptCM.ParamValues[ 0 ].AsInteger of
            0: Sql.Add('   AND ( SO.IMPRESSO = ''F'' ) ');
            1: Sql.Add('   AND ( SO.IMPRESSO = ''T'' ) ');
       End;

       Sql.Add('   AND ( SA.CODALMOXARIFADO(+) = ' + FloatToStr( CmpRptCM.ParamValues[ 1 ].AsFloat ) + ' ) ');
       Sql.Add('   AND ( C.CODCUSTEIO(+)   = ' + FloatToStr( CdsAux.FieldByName( 'CODCUSTEIO' ).AsFloat ) + ' ) ');
       Sql.add('   AND ( CC.CODCENTROCUSTO = SO.CODCENTROCUSTO ) ');
       Sql.add('   AND ( CC.IDEMPRESA    = SO.IDEMPRESA ) ');
       Sql.Add('   AND ( IT.NUMSOLCOMPRA = SO.NUMSOLCOMPRA )  ');
       Sql.Add('   AND ( IT.CODARTIGO    = AR.CODARTIGO )     ');
       Sql.Add('   AND ( AR.CODPRODUTO   = PR.CODPRODUTO )    ');
       Sql.Add('   AND ( AR.CODARTIGO    = C.CODARTIGO(+) )   ');
       Sql.Add('   AND ( PR.CODPRODUTO   = CO.CODPRODUTO )    ');
       Sql.Add('   AND ( CO.CODMEDIDA    = PR.CODMEDCUSTO )   ');
       Sql.Add('   AND ( PR.CODPRODUTO   = CF.CODPRODUTO )    ');
       Sql.Add('   AND ( CF.CODMEDIDA    = IT.CODMEDIDA )     ');
       Sql.Add('   AND ( IT.IDPRODVARI   = PV.IDPRODVARI(+) ) ');
       Sql.Add('   AND ( IT.CODARTIGO    = SA.CODARTIGO(+) )  ');
       Sql.Add('   AND ( IT.CODARTIGO    = U.CODARTIGO(+) )   ');
       Sql.Add('   AND ( U.IDPESSOA(+)   = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('   AND ( IT.CODARTIGO    = CM.CODARTIGO(+) ) ');

       Case CmpRptCM.ParamValues[ 5 ].AsInteger Of
            0: Sql.Add(' ORDER BY SO.NUMSOLCOMPRA, PRODUTO');
            1: Sql.Add(' ORDER BY SO.NUMSOLCOMPRA, IT.CODARTIGO');
       End;

       lbStatus.caption := sNomeStatus;
       CdsAux.Close;
       SqlAux.Sql.Text := 'SELECT P.RAZAOSOCIAL AS FORNECEDOR, ' +
                                 'MAX( OC.DATAOC ) AS DATAOC, ' +
                                 'MAX( ''Tel. ('' || RTRIM( T.DDD ) || '') '' || RTRIM( T.NUMERO ) ) AS TELEFONE ' +
                            'FROM OC OC, ' +
                                 'ITEMOC IO, ' +
                                 'PESSOA P, ' +
                                 'TELENDPESS T, ' +
                                 '( SELECT CODARTIGO ' +
                                     'FROM ITEMSOLI ' +
                                    'WHERE ( NUMSOLCOMPRA = :NUMSOLCOMPRA ) ' +
                                 ') AR ' +
                           'WHERE ( IO.CODARTIGO = AR.CODARTIGO ) ' +
                             'AND ( OC.IDPESSOA = :IDPESSOA ) ' +
                             'AND ( IO.NUMOC = OC.NUMOC ) ' +
                             'AND ( OC.IDFORCLI = P.IDPESSOA ) ' +
                             'AND ( T.TIPO LIKE ''%C%'' ) ' +
                             'AND ( P.IDENDCOMERCIAL = T.IDENDERECO(+) ) ' +
                           'GROUP BY P.RAZAOSOCIAL ' +
                           'ORDER BY DATAOC DESC';
       Open;
  End;
end;

procedure TRptSolCompra.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
Var
  sSql: String;
begin
  inherited;
  Case Index Of
       0: Begin
          If Sender.CtrlRadioGroup.ItemIndex = 0 Then Begin
             CmpRptCM.ParamByName( 'Solicitacao' ).MontaSelect.Filtro[ 1 ] := '( IMPRESSO = ''F'' )';
             CmpRptCM.ParamByName( 'CentroCusto' ).MontaSelect.Filtro[ 1 ] := '( IMPRESSO = ''F'' )';
          End Else Begin
             CmpRptCM.ParamByName( 'Solicitacao' ).MontaSelect.Filtro[ 1 ] := '( IMPRESSO = ''T'' )';
             CmpRptCM.ParamByName( 'CentroCusto' ).MontaSelect.Filtro[ 1 ] := '( IMPRESSO = ''T'' )';
          End;
       End;
  End;
{
  Case Index Of
       0: Begin
          sNomeStatus := TPainelControles( Sender ).CtrlLookup.Text;
          ssql := 'SELECT NUMSOLCOMPRA FROM SOLICOMP WHERE ( IDPESSOA = ' +
                  FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ';

          If CmpRptCM.ParamValues[ 0 ].AsInteger = 0 Then
             sSql := sSql + 'AND (IMPRESSO = ''F'') '
          Else
             sSql := sSql + 'AND (IMPRESSO = ''T'') ';

          sSql := sSql + 'ORDER BY NUMSOLCOMPRA';
          CmpRptCM.ParamByName( 'Solicitacao' ).LookupSettings.Sql.Text := sSql;

          sSql := 'SELECT DISTINCT CODCENTROCUSTO FROM SOLICOMP WHERE ( IDPESSOA = ' +
                  FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ';

          If CmpRptCM.ParamValues[ 0 ].AsInteger = 0 Then
             sSql := sSql + 'AND (IMPRESSO = ''F'') '
          Else
             sSql := sSql + 'AND (IMPRESSO = ''T'') ';

          sSql := sSql + 'ORDER BY CODCENTROCUSTO';
          CmpRptCM.ParamByName( 'CentroCusto' ).LookupSettings.Sql.Text := sSql;
       End;
  End; }
end;

procedure TRptSolCompra.rpSoliCompGroupHeaderBand1BeforeGenerate(
  Sender: TObject);
begin
  inherited;
  CdsAux.Close;

  If Not bResumida Then Begin
     SqlAux.Prepare;
     SqlAux.ParamByName( 'NUMSOLCOMPRA' ).AsInteger := CdsSolCompra.FieldByName( 'NUMSOLCOMPRA' ).AsInteger;
     SqlAux.ParamByName( 'IDPESSOA' ).AsFloat       := CrmRptCM.idEmpresa;
     SqlAux.Open;
  End;
end;

procedure TRptSolCompra.ppSolCompraPrintingComplete(Sender: TObject);
var
  str: String;
begin
  inherited;
  str := '';
  CdsSolCompra.First;

  While Not CdsSolCompra.Eof Do
  Begin
        If str <> '' Then
           str := str + ',';

        str := str + IntToStr( CdsSolCompra.FieldByName( 'NUMSOLCOMPRA' ).AsInteger );
        CdsSolCompra.Next;
  End;

  If str <> '' Then
     Padroes.ExecSqlAndCommit( 'UPDATE SOLICOMP SET IMPRESSO = ''T'' WHERE NUMSOLCOMPRA IN ( ' + str  + ' ) ' );
end;

procedure TRptSolCompra.Lb4UltPrint(Sender: TObject);
Var
  x: Integer;
begin
  inherited;
  LbFornA.Caption := '';
  LbTelA.Caption  := '';
  LbFornB.Caption := '';
  LbTelB.Caption  := '';
  LbFornC.Caption := '';
  LbTelC.Caption  := '';
  LbFornD.Caption := '';
  LbTelD.Caption  := '';

  If CdsAux.Active Then Begin
     x := 0;
     CdsAux.First;

     While Not CdsAux.Eof Do Begin
           Inc( x );

           Case x Of
                1: Begin
                   LbFornA.Caption := CdsAux.FieldByName( 'FORNECEDOR' ).AsString;
                   LbTelA.Caption  := CdsAux.FieldByName( 'TELEFONE' ).AsString;
                End;

                2: Begin
                   LbFornB.Caption := CdsAux.FieldByName( 'FORNECEDOR' ).AsString;
                   LbTelB.Caption  := CdsAux.FieldByName( 'TELEFONE' ).AsString;
                End;

                3: Begin
                   LbFornC.Caption := CdsAux.FieldByName( 'FORNECEDOR' ).AsString;
                   LbTelC.Caption  := CdsAux.FieldByName( 'TELEFONE' ).AsString;
                End;

                4: Begin
                   LbFornD.Caption := CdsAux.FieldByName( 'FORNECEDOR' ).AsString;
                   LbTelD.Caption  := CdsAux.FieldByName( 'TELEFONE' ).AsString;
                End;
           End;

           CdsAux.Next;
     End;
  End;
end;

end.

