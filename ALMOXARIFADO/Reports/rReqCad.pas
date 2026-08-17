unit rReqCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppCtrls, ppBands, ppClass, ppVar,
  ppStrtch, ppMemo, ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, MontaSelect;

type
  TRptReqCad = class(TFrmCmReport)
    bdeReqCad: TppBDEPipeline;
    bdeReqCadppField1: TppField;
    bdeReqCadppField2: TppField;
    bdeReqCadppField3: TppField;
    bdeReqCadppField4: TppField;
    bdeReqCadppField5: TppField;
    bdeReqCadppField6: TppField;
    bdeReqCadppField7: TppField;
    bdeReqCadppField8: TppField;
    bdeReqCadppField9: TppField;
    bdeReqCadppField10: TppField;
    bdeReqCadppField11: TppField;
    bdeReqCadppField12: TppField;
    bdeReqCadppField13: TppField;
    bdeReqCadppField14: TppField;
    bdeReqCadppField15: TppField;
    bdeReqCadppField16: TppField;
    bdeReqCadppField17: TppField;
    bdeReqCadppField18: TppField;
    dsReqCad: TwwDataSource;
    RptReqCad: TppReport;
    ppHeaderBand29: TppHeaderBand;
    ppLabel180: TppLabel;
    LblEmpresa: TppLabel;
    ppLine77: TppLine;
    ppLabel184: TppLabel;
    ppLabel185: TppLabel;
    ppLabel186: TppLabel;
    ppLabel187: TppLabel;
    LbCCust: TppLabel;
    ppLabel190: TppLabel;
    ppLine76: TppLine;
    LbPer15: TppLabel;
    RptReqCadLabel5: TppLabel;
    RptReqCadDBText6: TppDBText;
    RptReqCadLabel9: TppLabel;
    ppDetailBand23: TppDetailBand;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    RptReqCadDBText5: TppDBText;
    RptReqCadDBText9: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppFooterBand29: TppFooterBand;
    LblSistema: TppLabel;
    RptReqCadShape1: TppShape;
    RptReqCadLine3: TppLine;
    RptReqCadLine4: TppLine;
    RptReqCadLine5: TppLine;
    LbAssinatura1: TppLabel;
    LbAssinatura2: TppLabel;
    LbAssinatura3: TppLabel;
    LbAssinatura4: TppLabel;
    ppCalc56: TppSystemVariable;
    ppCalc57: TppSystemVariable;
    RptReqCadGroup1: TppGroup;
    RptReqCadGroupHeaderBand1: TppGroupHeaderBand;
    RptReqCadLabel1: TppLabel;
    RptReqCadLine1: TppLine;
    RptReqCadDBText1: TppDBText;
    RptReqCadLabel3: TppLabel;
    RptReqCadLabel4: TppLabel;
    RptReqCadDBText3: TppDBText;
    RptReqCadDBText4: TppDBText;
    RptReqCadLabel2: TppLabel;
    RptReqCadDBText2: TppDBText;
    RptReqCadLabel10: TppLabel;
    RptReqCadDBText10: TppDBText;
    ppLabel256: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppLabel274: TppLabel;
    ppDBText140: TppDBText;
    RptReqCadGroupFooterBand1: TppGroupFooterBand;
    RptReqCadLine2: TppLine;
    RptReqCadLabel6: TppLabel;
    RptReqCadDBCalc1: TppDBCalc;
    RptReqCadLabel7: TppLabel;
    RptReqCadDBText7: TppDBText;
    RptReqCadLabel8: TppLabel;
    RptReqCadDBText8: TppDBText;
    SqlReqCad: TCMSqlParams;
    CdsReqCad: TCMClientDataSet;
    MsReqCad: TMontaSelect;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure RptReqCadPrintingComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptReqCad: TRptReqCad;
  sNomeAlmox:  String = '';
  sNomeRequis: String = '';
  sNomeCCusto: String = '';
  sNomeGrupo:  String = '';

implementation

Uses uCtrlPadroes;

{$R *.DFM}

procedure TRptReqCad.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'ALMOXARIFADO' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'CCUSTO' ).LookupSettings.SQL.Text := 'SELECT CODCENTROCUSTO, NOME FROM CENTCUST WHERE (IDEMPRESA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ') AND (STATUSGRUPOCDC = ''A'') ORDER BY 2';
  CmpRptCM.ParamByName( 'GRUPO' ).LookupSettings.SQL.Text := 'SELECT CODGRUPOPROD, DESCGRUPOPROD FROM GRUPPROD WHERE (IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ') ORDER BY DESCGRUPOPROD';
  CmpRptCM.ParamByName( 'DATAINICIAL' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DATAFINAL' ).TextDefault   := DateToStr( Date );

  With CmpRptCM.ParamByName( 'REQUISICAO' ).MontaSelect.Filtro Do
     Begin
        Clear;
        Add( 'REQATENDIDA = ''F''' );
        Add( 'IMPRESSO = ''F''' );
     End;
end;

procedure TRptReqCad.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
var
  s: String;
begin
  inherited;
  Case Index of
       2: sNomeAlmox  := Sender.CtrlLookup.Text;
       3: sNomeCCusto := Sender.CtrlLookup.Text;
       4: Begin
          If Sender.CtrlRadioGroup.ItemIndex = 0 Then
             s := 'T'
          Else
             s := 'F';

          cmpRptCM.ParamByName( 'Requisicao' ).MontaSelect.Filtro[ 1 ] := 'IMPRESSO = ' + QuotedStr( s );
       End;

       5: sNomeRequis := Sender.CtrlLookup.Text;
       6: sNomeGrupo  := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptReqCad.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  lbCCust.Caption := 'Todos';
  lbPer15.Caption := '';

  With SqlReqCad Do
  Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT RQ.NUMREQUISICAO, ');
       Sql.Add('       DECODE( RQ.CUSTOTRANSF, ''T'', AD.DESCALMOX, CC.NOME ) AS DESTINO, ');
       Sql.Add('       RQ.DATAEMISSAO, ');
       Sql.Add('       RQ.DATANECESSIDADE, ');
       Sql.Add('       DECODE( RQ.REQATENDIDA, ''F'', ''PENDENTE'', DECODE( RQ.REQATENDIDA, ''T'', ''ATEND. TOTAL'', ''ATEND. PARCIAL'' ) ) AS STATUS, ');
       Sql.Add('       AO.DESCALMOX AS ORIGEM, ');
       Sql.Add('       SL.LOCALIZACAO, ');
       Sql.Add('       IP.CODARTIGO, ');
       Sql.Add('       ( P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR ) AS DESCRICAO, ');
       Sql.Add('       IP.CODMEDIDA, ');
       Sql.Add('       IP.QTDEPEDIDA, ');
       Sql.Add('       IP.QTDEPENDENTE, ');
       Sql.Add('       ( IP.VALORUN ) AS VALORUN, ');
       Sql.Add('       ( IP.VALORUN * IP.QTDEPEDIDA ) AS VALOR, ');
       Sql.Add('       PE.RAZAOSOCIAL, ');
       Sql.Add('       RQ.TRGDTINCLUSAO, ');
       Sql.Add('       RQ.OBS, ');
       Sql.Add('       IP.OBS AS OBSITEM, ');
       Sql.Add('       U.NOME AS UNIDNEGOC ');
       Sql.Add('  FROM PESSOA PE, ');
       Sql.Add('       ITEMPEDI IP, ');
       Sql.Add('       REQMAT RQ, ');
       Sql.Add('       SALDO SL, ');
       Sql.Add('       ARTIGO A, ');
       Sql.Add('       PRODUTO P, ');
       Sql.Add('       CENTCUST CC, ');
       Sql.Add('       ALMOX AD, ');
       Sql.Add('       ALMOX AO, ');
       Sql.Add('       UNIDNEGOCIO U ');
       Sql.Add(' WHERE ( RQ.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');

       Case CmpRptCM.ParamValues[ 7 ].AsInteger Of
            1: Sql.Add('   AND ( RQ.REQATENDIDA = ''F'' )');
            2: Sql.Add('   AND ( RQ.REQATENDIDA = ''T'' )');
            3: Sql.Add('   AND ( RQ.REQATENDIDA = ''P'' )');
       End;

      If Not CmpRptCM.ParamValues[ 5 ].IsNull Then
         Sql.Add('   AND ( RQ.NUMREQUISICAO = ' + CmpRptCM.ParamValues[ 5 ].AsString + ' ) ')
      Else
      Begin
         If Not CmpRptCM.ParamValues[ 0 ].IsNull Then
         Begin
            Sql.Add('   AND ( RQ.DATAEMISSAO >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
            lbPer15.Caption := 'A partir de ' + CmpRptCM.ParamValues[ 0 ].AsString;
         End;

         If Not CmpRptCM.ParamValues[ 1 ].IsNull Then
         Begin
            Sql.Add('   AND ( RQ.DATAEMISSAO <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
            lbPer15.Caption := 'Até ' + CmpRptCM.ParamValues[ 1 ].AsString;
         End;

         If Not CmpRptCM.ParamValues[ 3 ].IsNull Then
         Begin
            Sql.Add('   AND ( RTRIM( RQ.CODCENTROCUSTO ) = ' + Trim( CmpRptCM.ParamValues[ 3 ].AsString ) + ' ) ');
            lbCCust.Caption := CmpRptCM.ParamValues[ 3 ].AsString;
         End;

         If Not CmpRptCM.ParamValues[ 6 ].IsNull Then
            sql.Add('   AND ( RTRIM( P.CODGRUPOPROD ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 6 ].AsString ) ) + ' ) ');

         If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
            Sql.Add('   AND ( RQ.CODALMOXAORIGEM = ' + CmpRptCM.ParamValues[ 2 ].AsString + ' ) ');
      End;

      Sql.Add('   AND ( RQ.CODALMOXADESTINO  = AD.CODALMOXARIFADO(+) ) ');
      Sql.Add('   AND ( RQ.CODALMOXAORIGEM   = AO.CODALMOXARIFADO ) ');
      Sql.Add('   AND ( RQ.CODCENTROCUSTO    = CC.CODCENTROCUSTO ) ');
      Sql.Add('   AND ( RQ.IDEMPRESA         = CC.IDEMPRESA ) ');
      Sql.Add('   AND ( RQ.IDUSUARIOINCLUSAO = PE.IDPESSOA ) ');
      Sql.Add('   AND ( RQ.UNIDNEGOC     = U.UNIDNEGOC(+) ) ');
      Sql.Add('   AND ( RQ.IDPESSOA      = U.IDPESSOA(+) ) ');
      Sql.Add('   AND ( RQ.NUMREQUISICAO = IP.NUMREQUISICAO ) ');
      Sql.Add('   AND ( P.CODPRODUTO     = A.CODPRODUTO ) ');
      Sql.Add('   AND ( A.CODARTIGO      = IP.CODARTIGO ) ');
      Sql.Add('   AND ( SL.CODARTIGO = A.CODARTIGO(+) ) ');
      Sql.Add('   AND ( SL.CODALMOXARIFADO = AO.CODALMOXARIFADO(+) ) ');

      Case CmpRptCM.ParamValues[ 8 ].AsInteger Of
           0: Sql.Add(' ORDER BY ORIGEM, RQ.NUMREQUISICAO, ( P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR )');
           1: Sql.Add(' ORDER BY ORIGEM, RQ.NUMREQUISICAO');
      End;

      If ( Not CmpRptCM.ParamValues[ 0 ].IsNull ) And ( Not CmpRptCM.ParamValues[ 1 ].IsNull ) Then
         lbPer15.Caption := 'De ' + CmpRptCM.ParamValues[ 0 ].AsString + ' a ' + CmpRptCM.ParamValues[ 1 ].AsString;

      Open;
  End;
end;

procedure TRptReqCad.RptReqCadPrintingComplete(Sender: TObject);
var
  str: String;
begin
  inherited;
  str := '';
  CdsReqCad.First;

  While Not CdsReqCad.Eof Do Begin
        If str <> '' Then
           str := str + ',';

        str := str + IntToStr( CdsReqCad.FieldByName( 'NUMREQUISICAO' ).asInteger );
        CdsReqCad.Next;
  End;

  If str <> '' Then
     Padroes.ExecSqlAndCommit( 'UPDATE REQMAT SET IMPRESSO = ''T'' WHERE NUMREQUISICAO IN ( ' + str  + ' ) ' );
end;

end.
