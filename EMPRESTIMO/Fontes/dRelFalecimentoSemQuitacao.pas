unit dRelFalecimentoSemQuitacao;

// Alterações:
{--------------------------------------------------------------------------------------------------
Pendência   : -SIG 92063
Responsável : Rafael Vasconcelos
Data        : 16/10/2019
Descrição   : Criação do campo data registro de falecimento
--------------------------------------------------------------------------------------------------
Pendência   : SOL 258985 PPM 1179388
Responsável : Andre Imakawa
Data        : 27/11/2015
Descrição   : Incluido novos campos para a query.
--------------------------------------------------------------------------------------------------
}
interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ADODB, DBClient, Provider, FCmReport, uCmRptManager,
   TXComp, CmParamReport, ppModule, raCodMod, ppMemo, ppStrtch, ppRichTx;

type
   TdtmRelFalecimentoSemQuitacao = class(TdtmReports)
    dtsFalecimentoSemQuitacao: TwwDataSource;
    qryFalecimentoSemQuitacao: TwwQuery;
    rptFalecimentoSemQuitacao: TppReport;
      rptContratosAdminSint_CabecalhoRelat: TppHeaderBand;
      pplbTitulo: TppLabel;
      pplbNomeEmpresa: TppLabel;
      ppItensContrato: TppDetailBand;
      rptContrato: TppShape;
      ppDBText2: TppDBText;
      ppFooterBand12: TppFooterBand;
      ppLine37: TppLine;
      rptContratosAdminSintSummaryBand1: TppSummaryBand;
      pplbNomeSistema: TppLabel;
      ppCalc23: TppSystemVariable;
      ppSystemVariable1: TppSystemVariable;
      ppLine1: TppLine;
      pplFalecimentoSemQuitacao: TppBDEPipeline;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText7: TppDBText;
      ppDBText11: TppDBText;
      ppLabel6: TppLabel;
      ppDBText12: TppDBText;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLine3: TppLine;
      ppShape5: TppShape;
      ppLabel17: TppLabel;
      ppDBCalc2: TppDBCalc;
      qryFalecimentoSemQuitacaoIDCONTRATOEMPTMO: TFloatField;
      qryFalecimentoSemQuitacaoMATRICULA: TStringField;
      qryFalecimentoSemQuitacaoNOME: TStringField;
      qryFalecimentoSemQuitacaoTCEDESCRICAO: TStringField;
      qryFalecimentoSemQuitacaoVLRCONTRATO: TFloatField;
      qryFalecimentoSemQuitacaoDATACREDITO: TDateTimeField;
      qryFalecimentoSemQuitacaoDATAMORTE: TDateTimeField;
    ppShape1: TppShape;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo2: TppMemo;
    ppMemo1: TppMemo;
    situacaocontrato: TppField;
    qryFalecimentoSemQuitacaoSITUAODOCONTRATO: TStringField;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    qryFalecimentoSemQuitacaoDatadeConcesso: TDateTimeField;
    datadeconcessao: TppField;
    // Andre Imakawa SOL 258985 PPM 1179388 - Incluido novos campos para a query - Inicio
    qryFalecimentoSemQuitacaoPLANOORIGEM: TStringField;
    qryFalecimentoSemQuitacaoSALDO_DEVEDOR: TFloatField;
    qryFalecimentoSemQuitacaoSALDO_INAD: TFloatField;
    qryFalecimentoSemQuitacaoQUANT_PREST_ABERTA: TFloatField;
    qryFalecimentoSemQuitacaoPOSSUI_QUITACAO: TStringField;
    qryFalecimentoSemQuitacaoVLR_QUITACAO: TFloatField;
    qryFalecimentoSemQuitacaoVENC_QUITACAO: TDateTimeField;
    PLANOORIGEM: TppField;
    SALDODEVEDOR: TppField;
    SALDOINAD: TppField;
    QUANTPRESTABERTA: TppField;
    POSSUIQUITACAO: TppField;
    VLRQUITACAO: TppField;
    VENCQUITACAO: TppField;
    // Andre Imakawa SOL 258985 PPM 1179388 - Incluido novos campos para a query - Fim
    qryFalecimentoSemQuitacaoDataRegistroMorte: TDateTimeField;  //Rafael -SIG92063
      procedure ppShape1Print(Sender: TObject);
      procedure ppLine1Print(Sender: TObject);


   private { Private declarations }

      //    Cores:
      //    ColorA = $FFFFFF   { branco, clWhite }
      //    ColorC = $00C0FFFF { amarelo - pastel }
      //    ColorD = $00C6F9CC { verde - pastel }
      //    ColorE = $00F3E6CD { azul - pastel }
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3

      //             $00E8E8E8   cinza bem claro


   public { Public declarations }

      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelFalecimentoSemQuitacao: TdtmRelFalecimentoSemQuitacao;



implementation
{$R *.DFM}
uses
   CRelFalecimentoSemQuitacao, USistema;



function TdtmRelFalecimentoSemQuitacao.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelfalecimentosemquitacao') then
   begin
      frm := TcfgRelFalecimentoSemQuitacao.Create(Application);
   end
   else
   begin
      frm := nil;
   end;

   if frm = nil then
   begin
      Result := False;
      Exit;
   end;

   with frm do
   begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;



procedure TdtmRelFalecimentoSemQuitacao.ppShape1Print(Sender: TObject);
begin
   inherited;

   if bCorLinha then
   begin
      if CorAtual = clWhite then
      begin
         CorAtual := CorLinha;
      end
      else
      begin
         CorAtual := clWhite;
      end;
   end
   else
   begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TdtmRelFalecimentoSemQuitacao.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



end.

