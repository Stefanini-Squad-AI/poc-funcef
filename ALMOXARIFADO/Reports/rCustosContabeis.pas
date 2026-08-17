// andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.
unit rCustosContabeis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl,
  ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE,
  Wwdatsrc, uCtrlIntegracaoContabil, uCtrlContaContabil, TXRB ;

type
  TrptCustosContabeis = class(TFrmCmReport)
    dsCustContab: TwwDataSource;
    bdeCustContab: TppBDEPipeline;
    RptCustContab: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLabel71: TppLabel;
    ppLine27: TppLine;
    LblEmpresa: TppLabel;
    RptCustContabLine2: TppLine;
    RptCustContabLabel5: TppLabel;
    RptCustContabLabel6: TppLabel;
    RptCustContabLabel7: TppLabel;
    RptCustContabLabel8: TppLabel;
    RptCustContabLabel9: TppLabel;
    RptCustContabLabel10: TppLabel;
    RptCustContabLabel11: TppLabel;
    lblPerCust: TppLabel;
    RptCustContabLabel14: TppLabel;
    RptCustContabLine6: TppLine;
    RptCustContabLine7: TppLine;
    RptCustContabLabel15: TppLabel;
    LbCentCust: TppLabel;
    ppDetailBand13: TppDetailBand;
    RptCustContabDBText5: TppDBText;
    RptCustContabDBText6: TppDBText;
    RptCustContabDBText7: TppDBText;
    RptCustContabDBText8: TppDBText;
    RptCustContabDBText9: TppDBText;
    RptCustContabDBText10: TppDBText;
    RptCustContabDBText11: TppDBText;
    RptCustContabDBText13: TppDBText;
    RptCustContabDBText14: TppDBText;
    ppDBText96: TppDBText;
    ppFooterBand15: TppFooterBand;
    ppLine29: TppLine;
    LblSistema: TppLabel;
    ppCalc28: TppSystemVariable;
    ppCalc29: TppSystemVariable;
    RptCustContabGroup1: TppGroup;
    RptCustContabGroupHeaderBand1: TppGroupHeaderBand;
    RptCustContabDBText1: TppDBText;
    RptCustContabLabel1: TppLabel;
    RptCustContabDBText12: TppDBText;
    RptCustContabLine3: TppLine;
    RptCustContabLine5: TppLine;
    RptCustContabGroupFooterBand1: TppGroupFooterBand;
    RptCustContabLabel12: TppLabel;
    RptCustContabLabel13: TppLabel;
    RptCustContabDBCalc2: TppDBCalc;
    RptCustContabLine4: TppLine;
    RptCustContabGroup2: TppGroup;
    RptCustContabGroupHeaderBand2: TppGroupHeaderBand;
    RptCustContabDBText2: TppDBText;
    RptCustContabLabel2: TppLabel;
    RptCustContabLine1: TppLine;
    RptCustContabGroupFooterBand2: TppGroupFooterBand;
    RptCustContabLabel3: TppLabel;
    RptCustContabDBText3: TppDBText;
    RptCustContabDBCalc1: TppDBCalc;
    RptCustContabLabel4: TppLabel;
    CdsCustContab: TCMClientDataSet;
    SqlParCustContab: TCMSqlParams;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
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
  rptCustosContabeis: TrptCustosContabeis;
  sNomeCCusto: String = '';

implementation

{$R *.DFM}

Uses uSistema, uCtrlParamIntegra, fAguarde, uMensErro, dBaseDados;


procedure TrptCustosContabeis.CrmRptCMBeforePrint(Sender: TObject);
var sContaContaRef: String;

  Function AlteraReg(sConta : String) : Boolean;
  begin
    With CdsCustContab Do
    Begin
         Result := ContaContabil.TestaContaContabil( ParamIntegra.Plano,0,0,0,sConta,False,False );
         if Result then
            Begin
               Edit;
               FieldByName( 'CONTA' ).AsString := sConta;
               FieldByName( 'CONTANOME' ).AsString := ContaContabil.NomeConta;
               Post;
               Next;
            end;
         FrmAguarde.Pos := FrmAguarde.Pos + 1;
    End;
  end;
begin
  inherited;
  FrmAguarde.Min := 0;
  FrmAguarde.Max := 1;
  FrmAguarde.Pos := 0;
  FrmAguarde.Mostra( 'Processando Informações' );
  lblPerCust.Caption  := 'De ' + CmpRptCM.ParamValues[ 0 ].AsString + ' a ' + CmpRptCM.ParamValues[ 1 ].AsString;

  With SqlParCustContab Do
     Begin
        If Trim( CmpRptCM.ParamValues[ 3 ].AsString ) <> '' Then
           Begin
              Sql.Add( ' AND (M.CODCENTROCUSTO = ' + QuotedStr( Copy( Trim( CmpRptCM.ParamValues[ 3 ].AsString ) + '          ', 1, 10 ) ) + ') ' );
              lbCentCust.Caption := CmpRptCM.ParamValues[ 3 ].AsString + ' - ' + sNomeCCusto;
           End;

        If CmpRptCM.ParamValues[ 4 ].AsInteger = 0 Then
           Sql.Add( ' AND (M.FLGENTRADACUSTO <> ''S'') ' );

        Prepare;
        ParamByName( 'pDataIni' ).AsDate    := CmpRptCM.ParamValues[ 0 ].AsDateTime;
        ParamByName( 'pDataFim' ).AsDate    := CmpRptCM.ParamValues[ 1 ].AsDateTime;
        ParamByName( 'pIdSistema' ).AsFloat := CrmRptCM.IdEmpresa;
        Open;
     End;
  Try
     With CdsCustContab Do
     Begin
        FrmAguarde.Max := RecordCount;

        While Not Eof Do
        Begin
           CdsAux.Data := IntegracaoContabil.PegaContaContab( Trunc(CrmRptCM.IdEmpresa),
                                                              FieldByName('CODARTIGO').AsString,
                                                              FieldByName('CODCENTROCUSTO').AsString,
                                                              FieldByName('ALMOXORIGEM').AsInteger,
                                                              FieldByName('CODGRUPOPROD').AsString);

           If CmpRptCM.ParamValues[ 4 ].AsInteger = 0 Then
              sContaContaRef := CdsAux.FieldByName('CONTAENTRADA').AsString
           else
              sContaContaRef := CdsAux.FieldByName('CONTASAIDA').AsString;

           If Trim( CmpRptCM.ParamValues[ 2 ].AsString ) = '' Then
              Begin
                 If Not AlteraReg(sContaContaRef) Then
                    Raise Exception.Create('Encontrado Problema com o Artigo '+FieldByName('CODARTIGO').AsString+' do Dia '+FieldByName('DATA').AsString +' Centro de Custo '+FieldByName('CODCENTROCUSTO').AsString+' Codigo do Movimento '+FieldByName('IDMOV').AsString+' Conta '+sContaContaRef+' '+ContaContabil.MessageInfo );
              end
           Else
              Begin
                 If CmpRptCM.ParamValues[ 2 ].AsString <> sContaContaRef Then
                    Delete
                 Else
                    Begin
                        If Not AlteraReg(sContaContaRef) Then
                           Raise Exception.Create('Encontrado Problema com o Artigo '+FieldByName('CODARTIGO').AsString+' do Dia '+FieldByName('DATA').AsString +' Centro de Custo '+FieldByName('CODCENTROCUSTO').AsString+' Codigo do Movimento '+FieldByName('IDMOV').AsString+' Conta '+sContaContaRef+' '+ContaContabil.MessageInfo );
                    end;
              end;

           FrmAguarde.Max := CdsCustContab.RecordCount;
        End;

        AddIndex( 'Idx1', 'CONTA;DATA', [] );
        IndexName := 'Idx1';
        First;
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

procedure TrptCustosContabeis.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  Case Index of
       3: sNomeCCusto := Sender.CtrlLookup.Text;
  End;
end;

procedure TrptCustosContabeis.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName('DATAINICIAL').TextDefault := DateToStr( Date - 1 );
  CmpRptCM.ParamByName('DATAFINAL').TextDefault   := DateToStr( Date - 1 );

  CmpRptCM.ParamByName('CONTACONTABIL').ProcuraCCSettings.Mascara := ParamIntegra.MascaraPlano;
  CmpRptCM.ParamByName('CONTACONTABIL').ProcuraCCSettings.Plano   := ParamIntegra.Plano;

end;

procedure TrptCustosContabeis.FormCreate(Sender: TObject);
begin
  inherited;
  IntegracaoContabil := TCtrlIntegracaoContabil.Create;
  IntegracaoContabil.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  ContaContabil := TCtrlContaContabil.Create;
  ContaContabil.InitializeAs(IntegracaoContabil);
end;

procedure TrptCustosContabeis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IntegracaoContabil.Free;
  ContaContabil.Free;
end;

end.
