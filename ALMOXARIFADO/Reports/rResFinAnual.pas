// andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.
unit rResFinAnual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands,
  ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, Db, Wwdatsrc, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, DBClient, uCMClientDataSet,
  uCmSqlParams, TXRB;

type
  TRptResFinAnual = class(TFrmCmReport)
    SqlResFinAnual: TCMSqlParams;
    CdsResFinAnual: TCMClientDataSet;
    bdeResFinAnual: TppBDEPipeline;
    dsResFinAnual: TwwDataSource;
    RptResFinAnual: TppReport;
    ppHeaderBand27: TppHeaderBand;
    lbTitulo: TppLabel;
    ppLine72: TppLine;
    LblEmpresa: TppLabel;
    RptResFinAnualLine1: TppLine;
    RptResFinAnualLabel1: TppLabel;
    lbCentCust2: TppLabel;
    RptResFinAnualLabel3: TppLabel;
    RptResFinAnualLine4: TppLine;
    RptResFinAnualLabel4: TppLabel;
    RptResFinAnualLine5: TppLine;
    RptResFinAnualLabel5: TppLabel;
    RptResFinAnualLabel6: TppLabel;
    RptResFinAnualLine6: TppLine;
    RptResFinAnualLine8: TppLine;
    RptResFinAnualLabel7: TppLabel;
    RptResFinAnualLabel8: TppLabel;
    RptResFinAnualLine9: TppLine;
    RptResFinAnualLabel9: TppLabel;
    RptResFinAnualLine10: TppLine;
    RptResFinAnualLabel10: TppLabel;
    RptResFinAnualLine11: TppLine;
    RptResFinAnualLabel11: TppLabel;
    RptResFinAnualLine12: TppLine;
    RptResFinAnualLabel12: TppLabel;
    RptResFinAnualLine13: TppLine;
    RptResFinAnualLabel13: TppLabel;
    RptResFinAnualLine14: TppLine;
    RptResFinAnualLabel14: TppLabel;
    RptResFinAnualLine15: TppLine;
    RptResFinAnualLabel15: TppLabel;
    RptResFinAnualLine16: TppLine;
    RptResFinAnualLabel16: TppLabel;
    RptResFinAnualLine17: TppLine;
    RptResFinAnualLine7: TppLine;
    RptResFinAnualLabel17: TppLabel;
    RptResFinAnualLabel2: TppLabel;
    lbGrpProd: TppLabel;
    ppDetailBand21: TppDetailBand;
    RptResFinAnualDBText5: TppDBText;
    RptResFinAnualDBText6: TppDBText;
    RptResFinAnualLine18: TppLine;
    RptResFinAnualLabel18: TppLabel;
    RptResFinAnualLabel19: TppLabel;
    RptResFinAnualLine19: TppLine;
    RptResFinAnualDBText7: TppDBText;
    RptResFinAnualDBText8: TppDBText;
    RptResFinAnualDBText9: TppDBText;
    RptResFinAnualDBText10: TppDBText;
    RptResFinAnualDBText11: TppDBText;
    RptResFinAnualDBText12: TppDBText;
    RptResFinAnualDBText13: TppDBText;
    RptResFinAnualDBText14: TppDBText;
    RptResFinAnualDBText15: TppDBText;
    RptResFinAnualDBText16: TppDBText;
    RptResFinAnualDBText17: TppDBText;
    RptResFinAnualDBText18: TppDBText;
    RptResFinAnualDBText19: TppDBText;
    RptResFinAnualDBText20: TppDBText;
    RptResFinAnualDBText21: TppDBText;
    RptResFinAnualDBText22: TppDBText;
    RptResFinAnualDBText23: TppDBText;
    RptResFinAnualDBText24: TppDBText;
    RptResFinAnualDBText25: TppDBText;
    RptResFinAnualDBText26: TppDBText;
    RptResFinAnualDBText27: TppDBText;
    RptResFinAnualDBText28: TppDBText;
    RptResFinAnualDBText29: TppDBText;
    RptResFinAnualDBText30: TppDBText;
    RptResFinAnualDBText31: TppDBText;
    RptResFinAnualDBText32: TppDBText;
    RptResFinAnualDBText33: TppDBText;
    RptResFinAnualLine24: TppLine;
    ppFooterBand27: TppFooterBand;
    ppLine73: TppLine;
    LblSistema: TppLabel;
    ppCalc52: TppSystemVariable;
    ppCalc53: TppSystemVariable;
    RptResFinAnualSummaryBand1: TppSummaryBand;
    RptResFinAnualLine23: TppLine;
    RptResFinAnualLabel22: TppLabel;
    RptResFinAnualDBCalc27: TppDBCalc;
    RptResFinAnualDBCalc28: TppDBCalc;
    RptResFinAnualDBCalc29: TppDBCalc;
    RptResFinAnualDBCalc30: TppDBCalc;
    RptResFinAnualDBCalc31: TppDBCalc;
    RptResFinAnualDBCalc32: TppDBCalc;
    RptResFinAnualDBCalc33: TppDBCalc;
    RptResFinAnualDBCalc34: TppDBCalc;
    RptResFinAnualDBCalc35: TppDBCalc;
    RptResFinAnualDBCalc36: TppDBCalc;
    RptResFinAnualDBCalc37: TppDBCalc;
    RptResFinAnualDBCalc38: TppDBCalc;
    RptResFinAnualDBCalc39: TppDBCalc;
    RptResFinAnualGroup1: TppGroup;
    RptResFinAnualGroupHeaderBand1: TppGroupHeaderBand;
    RptResFinAnualDBText1: TppDBText;
    RptResFinAnualDBText2: TppDBText;
    RptResFinAnualLine2: TppLine;
    RptResFinAnualLine21: TppLine;
    RptResFinAnualGroupFooterBand1: TppGroupFooterBand;
    RptResFinAnualLine22: TppLine;
    RptResFinAnualLabel21: TppLabel;
    RptResFinAnualDBCalc14: TppDBCalc;
    RptResFinAnualDBCalc15: TppDBCalc;
    RptResFinAnualDBCalc16: TppDBCalc;
    RptResFinAnualDBCalc17: TppDBCalc;
    RptResFinAnualDBCalc18: TppDBCalc;
    RptResFinAnualDBCalc19: TppDBCalc;
    RptResFinAnualDBCalc20: TppDBCalc;
    RptResFinAnualDBCalc21: TppDBCalc;
    RptResFinAnualDBCalc22: TppDBCalc;
    RptResFinAnualDBCalc23: TppDBCalc;
    RptResFinAnualDBCalc24: TppDBCalc;
    RptResFinAnualDBCalc25: TppDBCalc;
    RptResFinAnualDBCalc26: TppDBCalc;
    RptResFinAnualGroup2: TppGroup;
    RptResFinAnualGroupHeaderBand2: TppGroupHeaderBand;
    RptResFinAnualDBText3: TppDBText;
    RptResFinAnualDBText4: TppDBText;
    RptResFinAnualLine3: TppLine;
    RptResFinAnualGroupFooterBand2: TppGroupFooterBand;
    RptResFinAnualLine20: TppLine;
    RptResFinAnualLabel20: TppLabel;
    RptResFinAnualDBCalc1: TppDBCalc;
    RptResFinAnualDBCalc2: TppDBCalc;
    RptResFinAnualDBCalc3: TppDBCalc;
    RptResFinAnualDBCalc4: TppDBCalc;
    RptResFinAnualDBCalc5: TppDBCalc;
    RptResFinAnualDBCalc6: TppDBCalc;
    RptResFinAnualDBCalc7: TppDBCalc;
    RptResFinAnualDBCalc8: TppDBCalc;
    RptResFinAnualDBCalc9: TppDBCalc;
    RptResFinAnualDBCalc10: TppDBCalc;
    RptResFinAnualDBCalc11: TppDBCalc;
    RptResFinAnualDBCalc12: TppDBCalc;
    RptResFinAnualDBCalc13: TppDBCalc;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptResFinAnual: TRptResFinAnual;
  sNomeGrupo: String = '';
  sNomeCCusto: String = '';

implementation

uses fAguarde;

{$R *.DFM}

procedure TRptResFinAnual.CrmRptCMBeforePrint(Sender: TObject);
Var
   Vet             : Array[1..13,1..2] of Double;
   x,J             : Byte;
   sCodGrupoProd   : String;
   sDescProd       : string;
   sCodArt         : String;
   sDescricao      : String;
   sCodCentroCusto : String;
   sNome           : String;
   sUnid           : String;
begin
  inherited;
  LbCentCust2.Caption := 'Todos';
  LbGrpProd.Caption   := 'Todos';

  With SqlAux Do Begin
       CdsAux.Close;
       Sql.Clear;
       Sql.Add('SELECT DECODE( M.CODCENTROCUSTO, NULL, ''99999999999'', M.CODCENTROCUSTO ) AS CODCENTROCUSTO, ');
       Sql.Add('       DECODE( C.NOME, NULL, ''CENTRO DE CUSTO NÃO CADASTRADO'', C.NOME ) AS NOME, ');
       Sql.Add('       G.CODGRUPOPROD, ');
       Sql.Add('       G.DESCGRUPOPROD, ');
       Sql.Add('       TO_CHAR( M.DATAMOV, ''MM'' ) AS MES, ');
       Sql.Add('       M.CODARTIGO, ');
       Sql.Add('       ( P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR ) AS DESCRICAO, ');
       Sql.Add('       M.DATAMOV, ');
       Sql.Add('       ( round(M.VALORMOV, 2) * -1 ) AS VALORMOV, ');
       Sql.Add('       ( M.QTDEMOV * -1 )  AS QTDEMOV, ');
       Sql.Add('       P.CODMEDCUSTO ');
       Sql.Add('  FROM MOVIMENT M, ');
       Sql.Add('       ARTIGO A, ');
       Sql.Add('       PRODUTO P, ');
       Sql.Add('       CENTCUST C, ');
       Sql.Add('       ALMOX A, ');
       Sql.Add('       ALMOX T, ');
       Sql.Add('       GRUPPROD G ');
       Sql.Add(' WHERE ( M.CODTIPOMOV <> ''A'' ) ');
       Sql.Add('   AND ( M.CODTIPOMOV <> ''K'' ) ');
       Sql.Add('   AND ( M.CODALMOXARIFADO = A.CODALMOXARIFADO ) ');
       Sql.Add('   AND ( M.CODALMOXTRANSF = T.CODALMOXARIFADO(+) ) ');
       Sql.Add('   AND ( ( M.CODALMOXTRANSF IS NULL ) OR ');
       Sql.Add('         ( ( M.CODALMOXTRANSF IS NOT NULL ) AND ( A.CODCUSTEIO <> T.CODCUSTEIO ) AND ');
       Sql.Add('           ( ( T.CONTABIL <> ''T'' ) OR ( T.CONTABIL IS NULL ) ) ) ) ');
       Sql.Add('   AND ( TO_CHAR( M.DATAMOV, ''YYYY'' ) = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('   AND ( M.DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');

       If Not CmpRptCM.ParamValues[ 2 ].IsNull Then Begin
          Sql.Add('   AND ( RTRIM( M.CODCENTROCUSTO ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 2 ].AsString ) ) + ' ) ' );
          LbCentCust2.Caption := sNomeCCusto;
       End;

       If Not CmpRptCM.ParamValues[ 3 ].IsNull Then Begin
          Sql.Add('   AND ( RTRIM( P.CODGRUPOPROD ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 3 ].AsString ) ) + ' ) ' );
          LbGrpProd.Caption := sNomeGrupo;
       End;

       Sql.Add('   AND ( M.CODARTIGO = A.CODARTIGO ) ');
       Sql.Add('   AND ( A.CODPRODUTO = P.CODPRODUTO ) ');
       Sql.Add('   AND ( P.CODGRUPOPROD = G.CODGRUPOPROD ) ');
       Sql.Add('   AND ( M.CODCENTROCUSTO = C.CODCENTROCUSTO(+) ) ');
       Sql.Add('   AND ( M.IDEMPRESA = C.IDEMPRESA(+) ) ');

       Case CmpRptCM.ParamValues[ 4 ].AsInteger Of
            0: Sql.Add('ORDER BY CODCENTROCUSTO, G.CODGRUPOPROD, M.CODARTIGO, M.DATAMOV, MES');

            1: Sql.Add('ORDER BY CODCENTROCUSTO, G.CODGRUPOPROD, M.CODARTIGO, M.DATAMOV, MES');
       End;

       LbTitulo.Caption := 'CUSTO POR CENTRO DE CUSTO DO ANO ' + CmpRptCM.ParamValues[ 0 ].AsString;
       Open;
  End;

  For x := 1 To 13 Do Begin
      Vet[ x, 1 ] := 0;
      Vet[ x, 2 ] := 0;
  End;

  J              := 0;
  FrmAguarde.Min := 0;
  FrmAguarde.Max := CdsAux.RecordCount;
  FrmAguarde.Pos := J;
  FrmAguarde.Mostra('Processando Informações');

  With CdsResFinAnual Do Begin
       If Active Then
          Close;

       SqlResFinAnual.Open;
  End;

  CdsAux.First;
  sCodCentroCusto := CdsAux.FieldByName( 'CODCENTROCUSTO' ).AsString;
  sNome           := CdsAux.FieldByName( 'NOME' ).AsString;
  sCodGrupoProd   := CdsAux.FieldByName( 'CODGRUPOPROD' ).AsString;
  sDescProd       := CdsAux.FieldByName( 'DESCGRUPOPROD' ).AsString;
  sCodArt         := CdsAux.FieldByName( 'CODARTIGO' ).AsString;
  sDescricao      := CdsAux.FieldByName( 'DESCRICAO' ).AsString;
  sUnid           := CdsAux.FieldByName( 'CODMEDCUSTO' ).AsString;

  While Not CdsAux.Eof Do Begin
        If ( Trim( CdsAux.FieldByName( 'CODCENTROCUSTO' ).AsString ) <> Trim( sCodCentroCusto ) ) Or
               ( Trim( CdsAux.FieldByName( 'CODGRUPOPROD' ).AsString ) <> Trim( sCodGrupoProd ) ) Or
               ( Trim( CdsAux.FieldByName( 'CODARTIGO' ).AsString ) <> Trim( sCodArt ) ) Then Begin
           // Faz o Calculo de Total de Meses
           For x:= 1 To 12 Do Begin
               Vet[ 13, 1 ] := Vet[ 13, 1 ] + Vet[ x, 1 ];
               Vet[ 13, 2 ] := Vet[ 13, 2 ] + Vet[ x, 2 ];
           End;

           With CdsResFinAnual Do Begin
                Append;
                FieldByName( 'CODCENTROCUSTO' ).AsString := sCodCentroCusto;
                FieldByName( 'NOME' ).AsString           := sNome;
                FieldByName( 'CODGRUPOPROD' ).AsString   := sCodGrupoProd;
                FieldByName( 'DESCGRUPOPROD' ).AsString  := sDescProd;
                FieldByName( 'CODARTIGO' ).AsString      := sCodArt;
                FieldByName( 'DESCRICAO' ).AsString      := sDescricao;
                FieldByName( 'UNID' ).AsString           := sUnid;
                // TOTAL DE VALORES DOS MESES
                FieldByName( 'VALJAN' ).AsFloat := vet[  1, 1 ];
                FieldByName( 'VALFEV' ).AsFloat := vet[  2, 1 ];
                FieldByName( 'VALMAR' ).AsFloat := vet[  3, 1 ];
                FieldByName( 'VALABR' ).AsFloat := vet[  4, 1 ];
                FieldByName( 'VALMAI' ).AsFloat := vet[  5, 1 ];
                FieldByName( 'VALJUN' ).AsFloat := vet[  6, 1 ];
                FieldByName( 'VALJUL' ).AsFloat := vet[  7, 1 ];
                FieldByName( 'VALAGO' ).AsFloat := vet[  8, 1 ];
                FieldByName( 'VALSEB' ).AsFloat := vet[  9, 1 ];
                FieldByName( 'VALOUT' ).AsFloat := vet[ 10, 1 ];
                FieldByName( 'VALNOV' ).AsFloat := vet[ 11, 1 ];
                FieldByName( 'VALDEZ' ).AsFloat := vet[ 12, 1 ];
                FieldByName( 'VALTOT' ).AsFloat := vet[ 13, 1 ];
                // TOTAL DE QUANTIDADE DOS MESES
                FieldByName( 'QTDEJAN' ).AsFloat := vet[  1, 2 ];
                FieldByName( 'QTDEFEV' ).AsFloat := vet[  2, 2 ];
                FieldByName( 'QTDEMAR' ).AsFloat := vet[  3, 2 ];
                FieldByName( 'QTDEABR' ).AsFloat := vet[  4, 2 ];
                FieldByName( 'QTDEMAI' ).AsFloat := vet[  5, 2 ];
                FieldByName( 'QTDEJUN' ).AsFloat := vet[  6, 2 ];
                FieldByName( 'QTDEJUL' ).AsFloat := vet[  7, 2 ];
                FieldByName( 'QTDEAGO' ).AsFloat := vet[  8, 2 ];
                FieldByName( 'QTDESEB' ).AsFloat := vet[  9, 2 ];
                FieldByName( 'QTDEOUT' ).AsFloat := vet[ 10, 2 ];
                FieldByName( 'QTDENOV' ).AsFloat := vet[ 11, 2 ];
                FieldByName( 'QTDEDEZ' ).AsFloat := vet[ 12, 2 ];
                FieldByName( 'QTDETOT' ).AsFloat := vet[ 13, 2 ];
                Post;
                // Troca as variaveis de Flag do Lote Encaixantes
                sCodCentroCusto := CdsAux.FieldByName( 'CODCENTROCUSTO' ).AsString;
                sNome           := CdsAux.FieldByName( 'NOME' ).AsString;
                sCodGrupoProd   := CdsAux.FieldByName( 'CODGRUPOPROD' ).AsString;
                sDescProd       := CdsAux.FieldByName( 'DESCGRUPOPROD' ).AsString;
                sCodArt         := CdsAux.FieldByName( 'CODARTIGO' ).AsString;
                sDescricao      := CdsAux.FieldByName( 'DESCRICAO' ).AsString;
                sUnid           := CdsAux.FieldByName( 'CODMEDCUSTO' ).AsString;

                // Limpa o Vetor
                For x := 1 To 13 Do Begin
                    Vet[ x, 1 ] := 0;
                    Vet[ x, 2 ] := 0;
               End;
           End;
        End Else Begin
           Vet[ CdsAux.FieldByName( 'MES' ).asInteger, 1 ] := Vet[ CdsAux.FieldByName( 'MES' ).asInteger, 1 ] +
                CdsAux.FieldByName( 'VALORMOV' ).asFloat;
           Vet[ CdsAux.FieldByName( 'MES' ).asInteger, 2 ] := Vet[ CdsAux.FieldByName( 'MES' ).asInteger, 2 ] +
                CdsAux.FieldByName( 'QTDEMOV' ).asFloat;
        End;

        Inc( J );
        FrmAguarde.Pos := J;
        CdsAux.Next;
  End;

  With CdsResFinAnual Do Begin
       Append;
       FieldByName( 'CODCENTROCUSTO' ).AsString := CdsAux.FieldByName( 'CODCENTROCUSTO' ).AsString;
       FieldByName( 'NOME' ).AsString           := CdsAux.FieldByName( 'NOME' ).AsString;
       FieldByName( 'CODGRUPOPROD' ).AsString   := CdsAux.FieldByName( 'CODGRUPOPROD' ).AsString;
       FieldByName( 'DESCGRUPOPROD' ).AsString  := CdsAux.FieldByName( 'DESCGRUPOPROD' ).AsString;
       FieldByName( 'CODARTIGO' ).AsString      := CdsAux.FieldByName( 'CODARTIGO' ).AsString;
       FieldByName( 'DESCRICAO' ).AsString      := CdsAux.FieldByName( 'DESCRICAO' ).AsString;
       FieldByName( 'UNID' ).AsString           := CdsAux.FieldByName( 'CODMEDCUSTO' ).AsString;
       // TOTAL DE VALORES DOS MESES
       FieldByName( 'VALJAN' ).AsFloat := vet[  1, 1 ];
       FieldByName( 'VALFEV' ).AsFloat := vet[  2, 1 ];
       FieldByName( 'VALMAR' ).AsFloat := vet[  3, 1 ];
       FieldByName( 'VALABR' ).AsFloat := vet[  4, 1 ];
       FieldByName( 'VALMAI' ).AsFloat := vet[  5, 1 ];
       FieldByName( 'VALJUN' ).AsFloat := vet[  6, 1 ];
       FieldByName( 'VALJUL' ).AsFloat := vet[  7, 1 ];
       FieldByName( 'VALAGO' ).AsFloat := vet[  8, 1 ];
       FieldByName( 'VALSEB' ).AsFloat := vet[  9, 1 ];
       FieldByName( 'VALOUT' ).AsFloat := vet[ 10, 1 ];
       FieldByName( 'VALNOV' ).AsFloat := vet[ 11, 1 ];
       FieldByName( 'VALDEZ' ).AsFloat := vet[ 12, 1 ];
       FieldByName( 'VALTOT' ).AsFloat := vet[ 13, 1 ];
       // TOTAL DE QUANTIDADE DOS MESES
       FieldByName( 'QTDEJAN' ).AsFloat := vet[  1, 2 ];
       FieldByName( 'QTDEFEV' ).AsFloat := vet[  2, 2 ];
       FieldByName( 'QTDEMAR' ).AsFloat := vet[  3, 2 ];
       FieldByName( 'QTDEABR' ).AsFloat := vet[  4, 2 ];
       FieldByName( 'QTDEMAI' ).AsFloat := vet[  5, 2 ];
       FieldByName( 'QTDEJUN' ).AsFloat := vet[  6, 2 ];
       FieldByName( 'QTDEJUL' ).AsFloat := vet[  7, 2 ];
       FieldByName( 'QTDEAGO' ).AsFloat := vet[  8, 2 ];
       FieldByName( 'QTDESEB' ).AsFloat := vet[  9, 2 ];
       FieldByName( 'QTDEOUT' ).AsFloat := vet[ 10, 2 ];
       FieldByName( 'QTDENOV' ).AsFloat := vet[ 11, 2 ];
       FieldByName( 'QTDEDEZ' ).AsFloat := vet[ 12, 2 ];
       FieldByName( 'QTDETOT' ).AsFloat := vet[ 13, 2 ];
       Post;
  End;

  FrmAguarde.Apaga;
end;

procedure TRptResFinAnual.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  Case Index Of
       2: sNomeCCusto := Sender.CtrlLookup.Text;
       3: sNomeGrupo  := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptResFinAnual.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
  Ano, Mes, Dia: Word;
begin
  inherited;
  DecodeDate( Date, Ano, Mes, Dia);
  CmpRptCM.ParamByName( 'Data' ).TextDefault := '31/12/' + IntToStr( ano );
  CmpRptCM.ParamByName( 'Ano' ).SpinEditSettings.Value     := ano;
  CmpRptCM.ParamByName( 'Centro' ).LookupSettings.SQL.Text := 'Select CODCENTROCUSTO, Nome From CentCust ' +
                        'Where ( IDEMPRESA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) AND ( STATUSGRUPOCDC = ''A'' ) order by 2';
end;

end.
