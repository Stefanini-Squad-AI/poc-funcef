unit rCustContabSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppCtrls, ppBands, ppClass, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, Wwdatsrc, uCtrlIntegracaoContabil,uCtrlContaContabil, StdCtrls,
  ExtCtrls;

type
  TRptCustContabSint = class(TFrmCmReport)
    dsCustContabSint: TwwDataSource;
    bdeCustContabSint: TppBDEPipeline;
    RptCustContabSint: TppReport;
    ppHeaderBand22: TppHeaderBand;
    ppLabel118: TppLabel;
    ppLine47: TppLine;
    LblEmpresa: TppLabel;
    ppLine50: TppLine;
    LbGrupo: TppLabel;
    LbCentCust3: TppLabel;
    ppLabel127: TppLabel;
    lbPer14: TppLabel;
    ppDetailBand18: TppDetailBand;
    ppFooterBand22: TppFooterBand;
    ppLine53: TppLine;
    LblSistema: TppLabel;
    ppCalc42: TppSystemVariable;
    ppCalc43: TppSystemVariable;
    ppGroup7: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppDBText51: TppDBText;
    ppLabel134: TppLabel;
    ppDBText52: TppDBText;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppLine56: TppLine;
    ppGroup8: TppGroup;
    CabecCustContabSint: TppGroupHeaderBand;
    ppDBText53: TppDBText;
    ppLabel137: TppLabel;
    ppLine57: TppLine;
    RodapeCustContabSint: TppGroupFooterBand;
    ppLabel138: TppLabel;
    ppDBText54: TppDBText;
    ppDBCalc14: TppDBCalc;
    ppLabel139: TppLabel;
    RptCustContabSintGroup1: TppGroup;
    RptCustContabSintGroupHeaderBand1: TppGroupHeaderBand;
    RptCustContabSintGroupFooterBand1: TppGroupFooterBand;
    ppDBText40: TppDBText;
    ppDBText49: TppDBText;
    ppDBText44: TppDBText;
    RptCustContabSintDBCalc1: TppDBCalc;
    SqlCustContabSint: TCMSqlParams;
    CdsCustContabSint: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    CdsProcess: TCMClientDataSet;
    procedure CriaCampo( sNome: String; ft: TFieldType; itam: Integer = 0 );
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  IntegracaoContabil : TCtrlIntegracaoContabil;
  ContaContabil      : TCtrlContaContabil;
  public
    { Public declarations }
  end;

var
  RptCustContabSint: TRptCustContabSint;

implementation

uses fAguarde, uModulo, uSistema, uCtrlParamIntegra,dBaseDados, uMensErro;

{$R *.DFM}

procedure TRptCustContabSint.CriaCampo( sNome: String; ft: TFieldType; itam: Integer = 0 );
begin
  With CdsCustContabSint.FieldDefs.AddFieldDef Do Begin
       Name := sNome;
       DataType := ft;

       If ft in [ ftString, ftFixedChar, ftWideString ] Then
          Size := iTam;
  End;
end;

procedure TRptCustContabSint.CrmRptCMBeforePrint(Sender: TObject);
Var sContaContaRef : String;
  Function AlteraReg(sConta : String) : Boolean;
  begin
    With CdsProcess Do
    Begin
         Result := ContaContabil.TestaContaContabil( ParamIntegra.Plano,sConta,False,False );
         if Result then
            Begin
               Edit;
               FieldByName('CONTA').AsString := sConta;
               FieldByName('CONTANOME').AsString := ContaContabil.NomeConta;
               Post;
               Next;
            end;
         FrmAguarde.Pos := FrmAguarde.Pos + 1;
    End;
  end;
begin
  inherited;
  With SqlCustContabSint Do Begin
       Sql.Clear;
       Sql.Add( 'SELECT G.CODGRUPOPROD, ' +
                       'G.DESCGRUPOPROD, ' +
                       'C.NOME, M.CODARTIGO, ');

       If Not CmpRptCM.ParamValues[ 3 ].AsBoolean Then
          Sql.Add( 'M.DATAMOV, ' )
       Else
          Sql.Add( 'TO_DATE(' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''DD/MM/YYYY'') AS DATAMOV, ' );

       Sql.Add( 'M.CODCENTROCUSTO, ' +
                '''                '' As CONTA, '+
                '''                                        '' As CONTANOME, '+
                '( SUM( M.VALORMOV ) * -1 ) AS VALOR, ' );
       Sql.Add(' (''                                       '')  AS DESCARTIGO ');

       Sql.Add('FROM MOVIMENT M, ' +
                  'ALMOX A, ' +
                  'PRODUTO P, ' +
                  'ARTIGO AR, ' +
                  'ALMOX T, ' +
                  'GRUPPROD G, ' +
                  'CENTCUST C ' +
            'WHERE ( M.CODTIPOMOV <> ''A'' ) ' +
              'AND ( M.CODTIPOMOV <> ''K'' ) ' +
              'AND ( M.CODTIPOMOV <> ''Z'' ) ' );

       If CmpRptCM.ParamValues[ 4 ].AsInteger = 0 Then
          Sql.Add( 'AND ( M.FLGENTRADACUSTO <> ''S'' ) ' );

       Sql.Add( 'AND ( M.DATAMOV BETWEEN TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) +
                       ', ''DD/MM/YYYY'' ) AND TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ' +
                'AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ' +
                'AND ( A.CONTABIL = ''T'' ) ' +
                'AND ( M.CODALMOXARIFADO = A.CODALMOXARIFADO ) ' +
                'AND ( M.CODALMOXTRANSF = T.CODALMOXARIFADO(+) ) ' +
                'AND ( ( M.CODALMOXTRANSF IS NULL ) OR ' +
                      '( ( M.CODALMOXTRANSF IS NOT NULL ) AND ( A.CODCUSTEIO <> T.CODCUSTEIO ) AND ' +
                        '( ( T.CONTABIL <> ''T'' ) OR ( T.CONTABIL IS NULL ) ) ) ) ' +
                'AND ( M.CODARTIGO = AR.CODARTIGO ) ' +
                'AND ( AR.CODPRODUTO = P.CODPRODUTO ) ' +
                'AND ( P.CODGRUPOPROD = G.CODGRUPOPROD ) ' +
                'AND ( M.CODCENTROCUSTO = C.CODCENTROCUSTO ) ' +
                'AND ( M.IDEMPRESA = C.IDEMPRESA ) ' +
              'GROUP BY G.CODGRUPOPROD, ' +
                       'G.DESCGRUPOPROD, ' +
                       'C.NOME, ' +
                       'M.CODARTIGO, ' );

       If Not CmpRptCM.ParamValues[ 3 ].AsBoolean Then
          Sql.Add( 'M.DATAMOV, ' );

       Sql.Add( 'M.CODCENTROCUSTO ' );

       lbPer14.Caption := 'De ' + CmpRptCM.ParamValues[0].AsString + ' a '+ CmpRptCM.ParamValues[1].AsString;

       // Ajusta o LayOut do Relatorio para o Resumido
        If Not CmpRptCM.ParamValues[ 3 ].AsBoolean Then
          Begin
             Sql.Add( 'ORDER BY DATAMOV' );

             CabecCustContabSint.Visible  := True;
             RodapeCustContabSint.Visible := True;
             LbCentCust3.Visible          := True;
             LbGrupo.Caption              := 'GRUPO';
          End
       Else
          Begin
             CabecCustContabSint.Visible  := False;
             RodapeCustContabSint.Visible := False;
             LbCentCust3.Visible          := False;
             LbGrupo.Caption              := 'CENTRO DE CUSTO';
          End;
          
       Open;
  End;

  Try
     With CdsProcess Do
     Begin
        FrmAguarde.Min := 0;
        FrmAguarde.Pos := 0;
        FrmAguarde.Max := RecordCount;
        FrmAguarde.Mostra('Processando Informações');
        First;
        While Not Eof Do
        Begin
           CdsAux.Data := IntegracaoContabil.PegaContaContab( Trunc(CrmRptCM.IdEmpresa),
                                                              FieldByName('CODARTIGO').AsString,
                                                              FieldByName('CODCENTROCUSTO').AsString,
                                                              0,
                                                              FieldByName('CODGRUPOPROD').AsString);
           Edit;
           If Not CmpRptCM.ParamValues[ 3 ].AsBoolean Then
              Begin
                 FieldByName('CODCENTROCUSTO').asString := FieldByName('CODCENTROCUSTO').asString;
                 FieldByName('CODARTIGO').asString      := FieldByName('CODGRUPOPROD').asString;
                 FieldByName('DESCARTIGO').asString     := FieldByName('DESCGRUPOPROD').asString;
              End
           Else
              Begin
                 FieldByName('CODCENTROCUSTO').asString := '';
                 FieldByName('CODARTIGO').asString      := FieldByName('CODCENTROCUSTO').asString;
                 FieldByName('DESCARTIGO').asString     := FieldByName('NOME').asString;
              End;
           Post;

           If CmpRptCM.ParamValues[ 4 ].AsInteger = 0 Then
              sContaContaRef := CdsAux.FieldByName('CONTAENTRADA').AsString
           else
              sContaContaRef := CdsAux.FieldByName('CONTASAIDA').AsString;

           If Trim( CmpRptCM.ParamValues[ 2 ].AsString ) = '' Then
              Begin
                 If Not AlteraReg(sContaContaRef) Then
                    Raise Exception.Create('Encontrado Problema com o Artigo '+FieldByName('CODARTIGO').AsString+' do Dia '+FieldByName('DATAMOV').AsString +' Centro de Custo '+FieldByName('CODCENTROCUSTO').AsString+' Codigo do Movimento '+FieldByName('IDMOV').AsString+' Conta '+sContaContaRef+' '+ContaContabil.MessageInfo );
              end
           Else
              Begin
                 If CmpRptCM.ParamValues[ 2 ].AsString <> sContaContaRef Then
                    Delete
                 Else
                    Begin
                        If Not AlteraReg(sContaContaRef) Then
                           Raise Exception.Create('Encontrado Problema com o Artigo '+FieldByName('CODARTIGO').AsString+' do Dia '+FieldByName('DATAMOV').AsString +' Centro de Custo '+FieldByName('CODCENTROCUSTO').AsString+' Codigo do Movimento '+FieldByName('IDMOV').AsString+' Conta '+sContaContaRef+' '+ContaContabil.MessageInfo );
                    end;
              end;

           FrmAguarde.Max := RecordCount;
        End;

        With CdsCustContabSint DO
           Begin
            CloneCursor(CdsProcess,True);
            AddIndex( 'Idx1', 'CONTA;DATAMOV;CODARTIGO;CODCENTROCUSTO', [], '' );
            IndexName := 'Idx1';
            First;
        End;
        FrmAguarde.Apaga;
     End;
  except
     On E:Exception Do
        Begin
           FrmAguarde.Apaga;
           MsgDlg(E.Message,'Erro',mtError,[mbOK],0);
        End;
  end;
end;

procedure TRptCustContabSint.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName('DATAINICIAL').TextDefault := DateToStr( Date - 1 );
  CmpRptCM.ParamByName('DATAFINAL').TextDefault   := DateToStr( Date - 1 );

  CmpRptCM.ParamByName('CONTACONTABIL').ProcuraCCSettings.Mascara := ParamIntegra.MascaraPlano;
  CmpRptCM.ParamByName('CONTACONTABIL').ProcuraCCSettings.Plano   := ParamIntegra.Plano;
end;

procedure TRptCustContabSint.FormCreate(Sender: TObject);
begin
  inherited;
  IntegracaoContabil := TCtrlIntegracaoContabil.Create;
  IntegracaoContabil.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  ContaContabil := TCtrlContaContabil.Create;
  ContaContabil.InitializeAs(IntegracaoContabil);
end;

procedure TRptCustContabSint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IntegracaoContabil.Free;
  ContaContabil.Free;
end;

end.
