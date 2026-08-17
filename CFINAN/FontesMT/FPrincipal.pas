unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, ExtCtrls, Buttons, ComCtrls,
  TB97,dbTables,Db, Wwquery, Wwdatsrc, wwdblook, StdCtrls, Mask, wwdbedit,
  DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
  IvMulti, IvEMulti, ppCtrls, CorreioCM, fcLabel, AppEvnts,
  CMApplicationEvents, StdActns, ActnList, ImgList, fcStatusBar, SConnect,
  MConnect, DBClient, uCMClientDataSet, uCmSqlParams;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    HistricoPadro1: TMenuItem;
    AtualizaFluxo1: TMenuItem;
    N3: TMenuItem;
    Banco1: TMenuItem;
    Agncia1: TMenuItem;
    ContasBancriasCaixas1: TMenuItem;
    N4: TMenuItem;
    MontagemdoFluxo1: TMenuItem;
    TipodeAplicao1: TMenuItem;
    Movimentao1: TMenuItem;
    ContaCorrente1: TMenuItem;
    TransfernciaBancria1: TMenuItem;
    EmprstimoBancrio1: TMenuItem;
    ConciliaoBancria1: TMenuItem;
    N5: TMenuItem;
    Fluxo2: TMenuItem;
    Previsto1: TMenuItem;
    Real1: TMenuItem;
    Gerao1: TMenuItem;
    Orado1: TMenuItem;
    CurtoPrazo1: TMenuItem;
    MdioPrazo1: TMenuItem;
    LongoPrazo1: TMenuItem;
    GeraoapartirdoPrevisto1: TMenuItem;
    Movimentao4: TMenuItem;
    N01FluxoPrevisto1: TMenuItem;
    FluxoRealizado1: TMenuItem;
    FluxoOrado2: TMenuItem;
    RegularizaodeLanamentosNoIdentificados1: TMenuItem;
    NoLanados1: TMenuItem;
    JLanados1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    TipodeRecebimento1: TMenuItem;
    TipodeDesembolso1: TMenuItem;
    Movimentao2: TMenuItem;
    GeraoaPartirdoOramento1: TMenuItem;
    AcertaImposto1: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    ExportaArquivoparaJurere1: TMenuItem;
    GeracaoPartirMedioPrazo: TMenuItem;
    GeracaoPartirLongoPrazo: TMenuItem;
    mnuMovFluxoMedioPrazo: TMenuItem;
    N11: TMenuItem;
    SaldoFinanceiro: TMenuItem;
    N12: TMenuItem;
    CadCRxTRecDesemb: TMenuItem;
    mnuDispFinan: TMenuItem;
    mnuMontagem: TMenuItem;
    mnuConsultaDisp: TMenuItem;
    N2: TMenuItem;
    N13: TMenuItem;
    mnuConferDocRegular: TMenuItem;
    spAux: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    mnuFluxoOrcadoXRealizado: TMenuItem;
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure HistricoPadro1Click(Sender: TObject);
    procedure AtualizaFluxo1Click(Sender: TObject);
    procedure Banco1Click(Sender: TObject);
    procedure Agncia1Click(Sender: TObject);
    procedure ContasBancriasCaixas1Click(Sender: TObject);
    procedure ContaCorrente1Click(Sender: TObject);
    procedure TransfernciaBancria1Click(Sender: TObject);
    procedure TipodeAplicao1Click(Sender: TObject);
    procedure ConciliaoBancria1Click(Sender: TObject);
    procedure Gerao1Click(Sender: TObject);
    procedure GeraoapartirdoPrevisto1Click(Sender: TObject);
    procedure Movimentao4Click(Sender: TObject);
    procedure MontagemdoFluxo1Click(Sender: TObject);
    procedure N01FluxoPrevisto1Click(Sender: TObject);
    procedure FluxoRealizado1Click(Sender: TObject);
    procedure FluxoOrado2Click(Sender: TObject);
    procedure NoLanados1Click(Sender: TObject);
    procedure JLanados1Click(Sender: TObject);
    procedure mnuUtilitarioClick(Sender: TObject);
    procedure TipodeRecebimento1Click(Sender: TObject);
    procedure TipodeDesembolso1Click(Sender: TObject);
    procedure Movimentao2Click(Sender: TObject);
    procedure GeraoaPartirdoOramento1Click(Sender: TObject);
    procedure AcertaImposto1Click(Sender: TObject);
    procedure ExportaArquivoparaJurere1Click(Sender: TObject);
    procedure GeracaoPartirMedioPrazoClick(Sender: TObject);
    procedure GeracaoPartirLongoPrazoClick(Sender: TObject);
    procedure mnuMovFluxoMedioPrazoClick(Sender: TObject);
    procedure SaldoFinanceiroClick(Sender: TObject);
    procedure CadCRxTRecDesembClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuMontagemClick(Sender: TObject);
    procedure mnuConsultaDispClick(Sender: TObject);
    procedure mnuConferDocRegularClick(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure mnuFluxoOrcadoXRealizadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

uses
   fTelaAut,FCadBanco,fCadAgencia,USistema,UMensErro,DBaseDados,
   FCadContasMT,FCadTipoDesembMT,uDataBase,
   uOrcamento,FCadHistPadraoMT,FCadMontaFluxoMT,
   FCadTiposAplicMT,FCadTRDxCResponMT,FParamFinancMT,
   FMovimFinancMT,FTransfFundosMT,FConcBancariaMT,
   FConfDocRegMT,FRegNIDuplicadosMT,FGeraLgoPrzOrcamMT,
   FConsSaldoFinancMT,FGeraFluxoPrevMT,FGeraFluxoRealMT,
   FMovimFluxoOrcMT,FMultiGerFluxoOrcMT,FGerCurtoPzoPrevMT,
   FMontaDispFinancMT,FDispDivergentesMT,FConsDispFinancMT,
   FConsultaFluxoMT,uCtrlRptCFinan,uCtrlParamIntegra,
   FAcertoImpostoMT,FExpArqJurereMT;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
   inherited;
   if Sistema.FezLogin then
    begin

       if Sistema.MudouEmpresa then
          ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMFINANC', tiSistema);

       // Verifica se a Atualização Automática de Fluxo está ativada
       cdsAux.Close;
       spAux.SQL.Text:='SELECT * FROM PARAMFINANC WHERE (IDPESSOA='+IntToStr(Sistema.idEmpresa) +' )';
       spAux.Open;
       if Trim(cdsAux.FieldByName('FLGATUALFLX').AsString)='S' then
        if MsgDlg('Deseja atualizar o Fluxo de Curto Prazo com o de Médio Prazo ?',
                  'Atenção',mtWarning,[mbYes,mbNo],0)=mrYES then
           with TfrmMultiGerFluxoOrcMT.Create(Self,'MCTOT') do
           try
              ShowModal;
           finally
              Free;
           end;
        cdsAux.Close;

       {
       //Rever a necessidade de todo esse código comentado
       
       qryAux.Close;
       qryAux.SQL.Text:='SELECT FLGCONFIRMARECPAG FROM PARAMFINANC WHERE IDPESSOA='+inttostr(Sistema.idEmpresa);
       qryAux.Open;
       Modulo.sConfirmaRecPag := 'N';
       if not qryAux.FieldByName('FLGCONFIRMARECPAG').isNull then
          Modulo.sConfirmaRecPag :=  qryAux.FieldByName('FLGCONFIRMARECPAG').AsString;

       if FazQuery(DtmBaseDados.Qry,'SELECT NOMECOMPO,VALOR FROM PARAMRELATS WHERE (IDMODULO = '+ IntToStr(Sistema.IdModulo)  + ') AND '+
                                    '(IDPESSOA = '+ IntToStr(Sistema.idEmpresa) + ')' ) then
        begin
           while not DtmBaseDados.Qry.Eof do
           begin
             try
              (dtmRelatoriosCFinan.FindComponent(DtmBaseDados.Qry.FieldByName('NOMECOMPO').AsString) As TppLabel).Caption := DtmBaseDados.Qry.FieldByName('VALOR').AsString;
             finally
              DtmBaseDados.Qry.Next;
             end;
           end;
        end;
        }
    end;
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
   inherited;
   //AbrirForm(frmParamFinanc,TfrmParamFinanc,False);
   AbrirForm(frmParamFinancMT,TfrmParamFinancMT,False);
end;

procedure TfrmPrincipal.HistricoPadro1Click(Sender: TObject);
begin
   inherited;
   //Cadastro de Históricos Padrões
   AbrirForm(FrmCadHistPadraoMT,TFrmCadHistPadraoMT,False);
end;

procedure TfrmPrincipal.AtualizaFluxo1Click(Sender: TObject);
begin
   inherited;
   //Geração de Fluxo Previsto
   AbrirForm(frmGeraFluxoPrevMT,TfrmGeraFluxoPrevMT, False);
end;

procedure TfrmPrincipal.Banco1Click(Sender: TObject);
begin
   inherited;
   //Cadstro de bancos
   AbrirForm(frmCadBanco,TfrmCadBanco,False);
end;

procedure TfrmPrincipal.Agncia1Click(Sender: TObject);
begin
   inherited;
   //Cadastro de Agências
   AbrirForm(frmCadAgencia,TfrmCadAgencia,False);
end;

procedure TfrmPrincipal.ContasBancriasCaixas1Click(Sender: TObject);
begin
   inherited;
   //Cadastro de Contas
   AbrirForm(frmCadContasMT,TfrmCadContasMT,False);
end;

procedure TfrmPrincipal.ContaCorrente1Click(Sender: TObject);
begin
   inherited;
   //Modulo.sNaoIdent:='N';
   with TfrmMovimFinancMT.Create(Self,False) do Show;
end;

procedure TfrmPrincipal.TransfernciaBancria1Click(Sender: TObject);
begin
   inherited;
   //Transferência Bancária
   AbrirForm(frmTransfFundosMT,TfrmTransfFundosMT,False);
end;

procedure TfrmPrincipal.TipodeAplicao1Click(Sender: TObject);
begin
   inherited;
   //Cadastro de Tipos de Aplicação
   AbrirForm(FrmCadTiposAplicMT,TFrmCadTiposAplicMT,False);
end;

procedure TfrmPrincipal.ConciliaoBancria1Click(Sender: TObject);
begin
   inherited;
   //Conciliação Bancária
   AbrirForm(frmConcBancariaMT,TfrmConcBancariaMT,False);
end;

procedure TfrmPrincipal.Gerao1Click(Sender: TObject);
begin
   inherited;
   //Geração de Fluxo Real
   AbrirForm(frmGeraFluxoRealMT,TfrmGeraFluxoRealMT,False);
end;

procedure TfrmPrincipal.GeraoapartirdoPrevisto1Click(Sender: TObject);
begin
   inherited;
   //Geração de Fluxo Orçado de Curto Prazo a partir do Previsto
   AbrirForm(frmGerCurtoPzoPrevMT,TfrmGerCurtoPzoPrevMT,False);
end;

procedure TfrmPrincipal.Movimentao4Click(Sender: TObject);
begin
   inherited;
   //Movimentação de Fluxo Orçado de Curto Prazo
   with TfrmMovimFluxoOrcMT.Create(Self,'C') do Show;
end;

procedure TfrmPrincipal.mnuMovFluxoMedioPrazoClick(Sender: TObject);
begin
   inherited;
   //Movimentação de Fluxo Orçado de Médio Prazo
   with TfrmMovimFluxoOrcMT.Create(Self,'M') do Show;
end;

procedure TfrmPrincipal.Movimentao2Click(Sender: TObject);
begin
   inherited;
   //Movimentação de Fluxo Orçado de Longo Prazo
   with TfrmMovimFluxoOrcMT.Create(Self,'L') do Show;
end;

procedure TfrmPrincipal.MontagemdoFluxo1Click(Sender: TObject);
begin
   inherited;
   //Cadastro de Montagem de Fluxo de Caixa
   AbrirForm(FrmCadMontaFluxoMT,TFrmCadMontaFluxoMT,False);
end;

procedure TfrmPrincipal.N01FluxoPrevisto1Click(Sender: TObject);
begin
   inherited;
   //Consulta Fluxo Previsto
   with TfrmConsultaFluxoMT.Create(Self,'P') do Show;
end;

procedure TfrmPrincipal.FluxoRealizado1Click(Sender: TObject);
begin
   inherited;
   //Consulta Fluxo Realizado   
   with TfrmConsultaFluxoMT.Create(Self,'R') do Show;
end;

procedure TfrmPrincipal.FluxoOrado2Click(Sender: TObject);
begin
   inherited;
   //Consulta Fluxo Orçado
   with TfrmConsultaFluxoMT.Create(Self,'O') do Show;
end;

procedure TfrmPrincipal.mnuFluxoOrcadoXRealizadoClick(Sender: TObject);
begin
   inherited;
   //Consulta Fluxo Comparativo - Orçado x Realizado
   with TfrmConsultaFluxoMT.Create(Self,'OXR') do Show;
end;

procedure TfrmPrincipal.NoLanados1Click(Sender: TObject);
begin
   inherited;
   //Regularização de Documentos Exclusiva do Financeiro
   with TfrmMovimFinancMT.Create(Self,True) do Show;
end;

procedure TfrmPrincipal.JLanados1Click(Sender: TObject);
begin
   inherited;
   //Regularização de Lançamentos não Identificados do CAP/CAR
   AbrirForm(frmRegNIDuplicadosMT,TfrmRegNIDuplicadosMT,False);
end;

procedure TfrmPrincipal.mnuUtilitarioClick(Sender: TObject);
begin
   inherited;
   //AbrirForm(frmExcluiPgto,TfrmExcluiPgto,False);
end;

procedure TfrmPrincipal.TipodeRecebimento1Click(Sender: TObject);
begin
   inherited;
   //Cadastro de Recebimentos
   with TfrmCadTipoDesembMT.Create(Self,'R') do Show;
end;

procedure TfrmPrincipal.TipodeDesembolso1Click(Sender: TObject);
begin
   inherited;
   //Cadastro de Pagamentos
   with TfrmCadTipoDesembMT.Create(Self,'P') do Show;
end;

procedure TfrmPrincipal.GeraoaPartirdoOramento1Click(Sender: TObject);
begin
   inherited;
   //Geração do Fluco Orçado de Longo Prazo a partir do Orçamento
   AbrirForm(frmGeraLgoPrzOrcamMT,TfrmGeraLgoPrzOrcamMT,False);
end;

procedure TfrmPrincipal.AcertaImposto1Click(Sender: TObject);
begin
   inherited;
   //Acerto de Imposto
   AbrirForm(frmAcertoImpostoMT,TfrmAcertoImpostoMT,False);
end;

procedure TfrmPrincipal.ExportaArquivoparaJurere1Click(Sender: TObject);
begin
   inherited;
   //Exporta para Arquivo Jurerê
   AbrirForm(frmExpArqJurereMT,TfrmExpArqJurereMT,False);
end;

procedure TfrmPrincipal.GeracaoPartirMedioPrazoClick(
  Sender: TObject);
begin
   inherited;
   //Geração de Fluxo Orçado de Curto Prazo a Partir do Orçado de Médio Prazo
   with TfrmMultiGerFluxoOrcMT.Create(Self,'MC') do Show;
end;

procedure TfrmPrincipal.GeracaoPartirLongoPrazoClick(Sender: TObject);
begin
   inherited;
   //Geração de Fluxo Orçado de Médio Prazo a Partir do Orçado de Longo Prazo
   with TfrmMultiGerFluxoOrcMT.Create(Self,'LM') do Show;
end;

procedure TfrmPrincipal.SaldoFinanceiroClick(Sender: TObject);
begin
   inherited;
   //Consulta Saldo Financeiro
   AbrirForm(frmConsSaldoFinancMT,TfrmConsSaldoFinancMT,False);
end;

procedure TfrmPrincipal.CadCRxTRecDesembClick(Sender: TObject);
begin
   inherited;
   //Cadastro de Tipos de REC/DES x Centro de Responsabilidade
   AbrirForm(FrmCadTRDxCResponMT,TFrmCadTRDxCResponMT,False)
end;

procedure TfrmPrincipal.mnuMontagemClick(Sender: TObject);
begin
   inherited;
   //Application.CreateForm(TfrmSeleDocumentos,frmSeleDocumentos);
   //Montagem da Disponibilidade Financeira
   AbrirForm(frmMontaDispFinancMT,TfrmMontaDispFinancMT,False);
end;

procedure TfrmPrincipal.mnuConsultaDispClick(Sender: TObject);
begin
   inherited;
   //Application.CreateForm(TfrmConsDisp,frmConsDisp);
   //Consulta da Disponibilidade Financeira
   AbrirForm(frmConsDispFinancMT,TfrmConsDispFinancMT,False);
end;

procedure TfrmPrincipal.mnuConferDocRegularClick(
  Sender: TObject);
begin
   //Conferência de Documentos Regularizados
   AbrirForm(frmConfDocRegMT,TfrmConfDocRegMT,False);
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
var
  CtrlRptCFinan : TCtrlRptCFinan;
begin
   inherited;
   CtrlRptCFinan:=TCtrlRptCFinan.Create;
   try
      Printed:=Self.ShowReport(IDReports,CtrlRptCFinan);
      CtrlRptCFinan.Free;
   except
      CtrlRptCFinan.Free;
      raise;
   end;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
   //Telas de parâmetro personalizadas
   {case IdReports of
   end;}
   inherited;
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
  liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
var
  CtrlRptCFinan : TCtrlRptCFinan;
begin                                           
   inherited;
   CtrlRptCFinan:=TCtrlRptCFinan.Create;
   try
      Config:=ConfigReport(liIdReports,liOrigemCm,CtrlRptCFinan,DesReport);
      CtrlRptCFinan.Free;
   except
      CtrlRptCFinan.Free;
      raise;
   end;
end;

initialization
   Sistema.NomeModulo    := 'Controle Financeiro';  // Nome do Módulo
   Sistema.IdModulo      := 9 ;                   // IdModulo cadastrado no SAD
   Sistema.Versao := '3.07.47';
   Sistema.NomeAplicativo:='Controle Financeiro';
   OrcamentoBack := TOrcamentoBack.Create;

Finalization

end.
