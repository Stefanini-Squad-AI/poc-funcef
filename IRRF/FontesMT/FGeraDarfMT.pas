unit FGeraDarfMT;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina:     GravarDocumento
Data:       15/07/2024
Pendencia:  WO10032 - Contas a Pagar - Remessa eletrônica
Autor:      Arnaldo Vicente Scarin
Descricao:  Quando o documento de origem possui diversas contas de baixa
            (CCBaixasXDocum preenchida), deveriam ser levadas essas contas
            para o Documento de Arrecadação de Impostos que é gerado a partir
            do DARF, mas isso não é feito. Em reunião ocorrida com o Cassio e
            o Depto. Contabil, foi informado que esses documentos podem ser
            criados somente com uma conta de baixa e para tanto será utilizada
            a conta de baixa que está vinculada ao Alterador do Imposto.
----------------------------------------------------------------------------------------------------
Rotina    : dbgLancamentosExit
Data      : 09/11/2012
Autor     : Fernando Xavier
Pendencia : 195827
Descrição : erro na geração das guias de depósito judicial
----------------------------------------------------------------------------------------------------
Rotina    : MontaGrid
Data      : 09/11/2012
Autor     : Higor Nayde Ferreira
Pendencia : 194365
Descrição : Carregar Valores negativos para o modulo 21
----------------------------------------------------------------------------------------------------
Rotina    : MontaGrid
Data      : 20/08/2007
Autor     : André Pontes
Pendencia : 21875
Descrição : Alimentação do campo IDPLANOPREVPREV do cdsLancamentos a partir do cdsLancamentosAux
----------------------------------------------------------------------------------------------------
Rotina    : bbtnGeraClick(...)
Data      : 02/05/2007
Autor     : André Pontes
Pendencia : 24347
Descrição : Não permitir geração de guia para dia não útil
----------------------------------------------------------------------------------------------------
Rotina    : bbtnGeraClick(...)
Data      : 18/04/2007
Autor     : André Pontes
Pendencia : 23882
Descrição : Passagem do Centro de Responsabilidade para a função GeraDarf (sobrescrevendo o rateio
            dos documentos originais)
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 18/04/2007
Autor     : André Pontes
Pendencia : -
Descrição : Pequenos ajustes no layout da tela, motivadas pela introdução de nova combo com
            Centro de Responsabilidade
            Uso do dtmLookIRRF, uCtrlCentRespon
---------------------------------------------------------------------------------------------------}
{
*******************************************************************************
Analista.: Paulo Ramos
Pendencia: 21876
Rotina...: dedDataVencExit
Descrição: Não executar mais qualquer alteração de período se o usuário definir
           uma nova data de pagamento do DARF
*******************************************************************************
Analista.: Claudio Faria
Pendencia: 20984
Rotina...: MontaGrid
Descrição: Opção para emissão de documento de Darf judicial por estado
*******************************************************************************
Analista.: Bruno Bastos
Pendencia: 19099
Rotina...: FlgDarfOnChange
Descrição: Alteração para inserir e deletar o registro do cdscodigos
*******************************************************************************
Analista.: Bruno Bastos
Pendencia: 19122
Rotina...: Várias
Descrição: Alterei a atribuição das variáveis que são testados no while para gravar
           no cdsLancamentos na rotina montagrid.
           Colocamos também uma marcação/desmarcação automática do check para os
           mesmos
*******************************************************************************
Analista.: Bruno Bastos
Pendencia: 19007
Rotina...: Várias
Descrição: Alterei o nome do cdsLancamentosAgrupados para cdsCCBaixasxDocum
*******************************************************************************
Analista.: Marchetti
Pendencia: 17462
Rotina...: CalcProxDiaSemana, CalcDataIni, CalcDataFim
Descrição: Altera o intervalo de busca para quinzenal quando CSLL/PIS/COFINS
*******************************************************************************
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, TREdit, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, Buttons, ComCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, uCtrlModuloIRRF,
  uCtrlNatuRendimento, Db, DBClient, uCMClientDataSet, uCtrlGeraDarf,
  uCtrlParamIntegra, uCtrlCentRespon,  
  Wwdatsrc, uCtrlDARF, DBTables, Wwquery, uCmSqlParams, fcLabel;

type
  TfrmGeraDarfMT = class(TfrmSairAjuda)
    pcDados: TPageControl;
    tbsDados1: TTabSheet;
    plnDados: TPanel;
    lblNatureza: TLabel;
    btnTodas: TSpeedButton;
    btnInverter: TSpeedButton;
    gbPeriodoApu: TGroupBox;
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    deDataIni: TCMDateTimePicker;
    deDataFim: TCMDateTimePicker;
    dblcNatureza: TwwDBLookupCombo;
    rgImposto: TRadioGroup;
    btnFiltra: TBitBtn;
    tbsDados2: TTabSheet;
    LblFormaPag: TLabel;
    Label17: TLabel;
    memObsCap: TMemo;
    edRef: TEdit;
    dbgLancamentos: TwwDBGrid;
    pnlTotalDarf: TPanel;
    gbTotal: TGroupBox;
    lblBase: TLabel;
    lblValorIRRF: TLabel;
    lblINSS: TLabel;
    reBaseImposto: TRealEdit;
    reValorIRRF: TRealEdit;
    reValorINSS: TRealEdit;
    gbDataVenc: TGroupBox;
    dedDataVenc: TCMDateTimePicker;
    cdsLancamentos: TCMClientDataSet;
    cdsLancamentoAux: TCMClientDataSet;
    cdsCodigos: TCMClientDataSet;
    dsLancamentos: TwwDataSource;
    cdsRateio: TCMClientDataSet;
    bbtnGera: TBitBtn;
    cmbModuloOrigem: TComboBox;
    Label1: TLabel;
    cdsCCBaixasxDocum: TCMClientDataSet;
    Label5: TLabel;
    DBcboCentroRespon: TwwDBLookupCombo;
    fcLabel2: TfcLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnTodasClick(Sender: TObject);
    procedure btnInverterClick(Sender: TObject);
    procedure btnFiltraClick(Sender: TObject);
    procedure bbtnGeraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure rgImpostoClick(Sender: TObject);
    procedure dbgLancamentosExit(Sender: TObject);


  private

    Modulo          : TCtrlModuloIRRF;
    NatuRendimento  : TCtrlNatuRendimento;
    GeraDarf        : TCtrlGeraDarf;
    Darf            : TCtrlDARF;
    CtrlCentRespon  : TCtrlCentRespon;


    procedure MontaGrid;
    procedure CalcValores(bPrimVez : Boolean);
    procedure FlgDarfOnChange(Sender: TField);


  public  // Public declarations


  end;



var
  frmGeraDarfMT : TfrmGeraDarfMT;

  sCodCentroCusto, sDataLanc, sCodNatureza, sContaContabil  : string;
  rValorBase, rValorIRRF, rValorINSS                        : Real;
  iCodDarf, iPlanoPrev, iPatro, iPrograma,  iBenefirrf      : LongInt;
  sContaContabRecdes, sCodtiprecdes                         : string;  // p. 15761
  iIdModulo                                                 : Integer;



implementation
{$R *.DFM}
uses
  uMensErro, uDataBase, DBaseDados, uSistema, uString, dLookIRRF, uDiasUteis;




procedure TfrmGeraDarfMT.FormCreate(Sender: TObject);
var
  nqtd : integer;
begin
  inherited;

  pcDados.ActivePageIndex := 0;

  Modulo          := TCtrlModuloIRRF.Create;
  NatuRendimento  := TCtrlNatuRendimento.Create;
  GeraDarf        := TCtrlGeraDarf.Create;
  Darf            := TCtrlDARF.Create;
  CtrlCentRespon  := TCtrlCentRespon.Create;

  Modulo.Initialize(DtmBaseDados.dbBaseDados,
                    True,
                    Sistema.ConnectionType,
                    Sistema.ConnectionSide,
                    Sistema.AppRemoteServer,
                    True,
                    nil,
                    nil,
                   False
                   );

  NatuRendimento.InitializeAs(Modulo);
  GeraDarf.InitializeAs(Modulo);
  Darf.InitializeAs(Modulo);
  CtrlCentRespon.InitializeAs(Modulo);

  dtmLookIRRF.cdsLookNatureza.Data      := NatuRendimento.ListNaturendimento;

  dtmLookIRRF.cdsLookCentroRespon.Data  := CtrlCentRespon.ListaCentRespon(Sistema.IdEmpresa,  // IDPessoa
                                                                          '',                 // IDCentRespon
                                                                          0,                  // iOrdem
                                                                          'A',                // sSintetAnalit
                                                                          ParamIntegra.PlanoCentroRespon,
                                                                          True,               //  bListaCRpadrao
                                                                          True                // bSoAtivos
                                                                          );

  dedDataVenc.Date        := Modulo.CalcProxDiaSemana(Sistema.idempresa, Date,3,True,rgImposto.ItemIndex);
  dedDataVenc.Text        := DateToStr(dedDataVenc.Date);
  pcDados.ActivePageIndex := 0;
  //
  deDataIni.Date          := Modulo.CalcDataIni(dedDataVenc.Date,rgImposto.ItemIndex);
  deDataFim.Date          := Modulo.CalcDataFim(dedDataVenc.Date,rgImposto.ItemIndex);
  deDataIni.Text          := DateToStr(deDataIni.Date);
  deDataFim.Text          := DateToStr(deDataFim.Date);
  //
  cdsLancamentos.Data := GeraDarf.ListLancamentos(-1,
                                                  rgImposto.ItemIndex,
                                                  -1,
                                                  deDataFim.Text,
                                                  deDataIni.Text,
                                                  dblcNatureza.LookupValue
                                                 );

  nqtd := cdsLancamentos.RecordCount;
  //
end;



procedure TfrmGeraDarfMT.btnTodasClick(Sender: TObject);
begin
  inherited;

  cdsLancamentos.First;
  while not(cdsLancamentos.EOF) do
  begin
    cdsLancamentos.Edit;

    if cdsLancamentos.FieldByName('FLGDARF').AsString = 'N' then
       cdsLancamentos.FieldByName('FLGDARF').AsString := 'S';

    cdsLancamentos.Post;
    cdsLancamentos.Next;
  end;
end;



procedure TfrmGeraDarfMT.btnInverterClick(Sender: TObject);
begin
  inherited;

  cdsLancamentos.First;
  while not(cdsLancamentos.EOF) do
  begin
     cdsLancamentos.Edit;
     if cdsLancamentos.FieldByName('FLGDARF').AsString = 'S' then
        cdsLancamentos.FieldByName('FLGDARF').AsString := 'N'
     else
        cdsLancamentos.FieldByName('FLGDARF').AsString := 'S';
     cdsLancamentos.Post;
     cdsLancamentos.Next;
  end;
end;



procedure TfrmGeraDarfMT.btnFiltraClick(Sender: TObject);
begin
  inherited;

  cdsLancamentos.Close;

  if trim(dblcNatureza.lookupvalue) <> '' then
    MontaGrid
  else
    MsgDlg('Obrigatório preencher a Natureza do Rendimento', 'Informação', mtInformation, [mbOk], 0);

  Repaint;

  if cdslancamentos.Active then
    bbtngera.enabled := (cdslancamentos.RecordCount > 0);
end;



procedure TfrmGeraDarfMT.bbtnGeraClick(Sender: TObject);
Var
  DarfComum : Boolean;
begin
  inherited;

  // -----------------------------------------------------------------------------------------------

  if reValorIRRF.Value <= 0 then
  begin
    MsgDlg('O valor tem de ser positivo para gerar o DARF.', 'Informação', mtInformation, [mbOk], 0);
    exit;
  end;

  if trim(deDataIni.Text) = '' then
  begin
    MsgDlg('Obrigatório preencher a Data de Início da Apuração', 'Informação', mtInformation, [mbOk], 0);
    pcDados.ActivePageIndex := 0;
    deDataIni.SetFocus;
    exit;
  end;

  if trim(deDataFim.Text) = '' then
  begin
    MsgDlg('Obrigatório preencher a Data Final da Apuração', 'Informação', mtInformation, [mbOk], 0);
    pcDados.ActivePageIndex := 0;
    deDataFim.SetFocus;
    exit;
  end;

  if trim(dedDataVenc.Text) = '' then
  begin
    MsgDlg('Obrigatório preencher a Data de Vencimento', 'Informação', mtInformation, [mbOk], 0);
    pcDados.ActivePageIndex := 0;
    dedDataVenc.SetFocus;
    exit;
  end;

  if trim(dedDataVenc.Text) = '' then
  begin
    MsgDlg('Obrigatório preencher a Data de Vencimento', 'Informação', mtInformation, [mbOk], 0);
    pcDados.ActivePageIndex := 0;
    dedDataVenc.SetFocus;
    exit;
  end;

  if not(DiasUteis.DiaUtil(Sistema.IdEmpresa, dedDataVenc.Date, True, True, False)) then
  begin
    MsgDlg('A data de vencimento precisa ser dia útil', 'Informação', mtInformation, [mbOk], 0);
    pcDados.ActivePageIndex := 0;
    dedDataVenc.SetFocus;
    exit;
  end;

  // -----------------------------------------------------------------------------------------------

  try
    cdsRateio.Data          := Darf.ProcurarRateio(-1);
    cdsCCBaixasxDocum.Data  := GeraDarf.ListCCBaixasxDocum(-1);

    //Testa se todos os lançamentos marcados são de residentes no exterior ou normais
    //caso sejam marcados lançamentos dos dois tipos, o usuário será avisado que não é possível
    cdsLancamentos.DisableControls;
    cdsLancamentos.First;

    DarfComum := False;

    while not(cdsLancamentos.EOF) do
    begin
      if cdsLancamentos.FieldByName('FLGDARF').Asstring = 'S' then
        if GeraDarf.NaturezaResidExterior(cdsLancamentos.FieldByName('CODNATUREZA').Asstring) then
        begin
          if DarfComum then
          begin
            MsgDlg('Não é possivel gerar Darfs para os códigos selecionados ao mesmo tempo, marque apenas códigos de darfs comuns ou de residentes no exterior para gerar', 'Informação', mtInformation, [mbOk], 0);
            exit;
          end;
        end
        else
        begin
          DarfComum := True;
        end;

      cdsLancamentos.Next;
    end;

    cdsLancamentos.EnableControls;

    //Darfs de residentes no exterior são gerados com todas as datas igual a data de vencimento
    if not(DarfComum) then
    begin
      deDataIni.Text := dedDataVenc.Text;
      deDataFim.Text := dedDataVenc.Text;
    end;

  // -----------------------------------------------------------------------------------------------

    // Foi alterado o nome do cds que guardava as contas grupadas de
    // cdsLancamentosAgrupados para cdsCCBaixasxDocum
    if not(GeraDarf.GeraDarf(Sistema.IdEmpresa,
                             Sistema.IdModulo,
                             Sistema.IdUsuario,
                             Sistema.IdEspAcesso,
                             cdsRateio.Data,
                             cdsLancamentos.Data,
                             cdsCodigos.Data,
                             cdsCCBaixasxDocum.Data,
                             deDataIni.Text,
                             deDataFim.Text,
                             dedDataVenc.Text,
                             memObsCap.Text,
                             edRef.Text,
                             Sistema.UsaPlanoPatro,
                             DBcboCentroRespon.LookupValue
                            )) then
    begin
      MsgDlg('DARF não gerado: ' + #13 + GeraDarf.MessageInfo, Sistema.NomeModulo, mtInformation, [mbOk], 0);
      Repaint;
    end
    else
    begin
      MsgDlg('DARF gerado.', Sistema.NomeModulo, mtInformation, [mbOk], 0);
      Repaint;

      memObsCap.Clear;
      edRef.Clear;
      bbtngera.enabled := False;
    end;

  except
    MsgDlg('DARF não gerado.', Sistema.NomeModulo, mtWarning, [mbOk], 0);
    Repaint;
  end;

  cdsLancamentos.Close;
end;



procedure TfrmGeraDarfMT.MontaGrid;
var
  iLancRef, iMotivo, iVersaoFolha : LongInt;
  iCodigoDarf : Integer;
begin
  cdsLancamentos.Data    := GeraDarf.ListLancamentos(-1, rgImposto.ItemIndex, cmbModuloOrigem.ItemIndex, deDataFim.Text, deDataIni.Text, dblcNatureza.LookupValue);
  cdsCCBaixasxDocum.Data := GeraDarf.ListCCBaixasxDocum(-1);

  TFloatField(cdsLancamentos.FieldByName('VLRBASE')).DisplayFormat := '#,##0.00';
  TFloatField(cdsLancamentos.FieldByName('VLRIRRF')).DisplayFormat := '#,##0.00';
  TFloatField(cdsLancamentos.FieldByName('VLRINSS')).DisplayFormat := '#,##0.00';
  TStringField(cdsLancamentos.FieldByName('FLGDARF')).OnChange     := FlgDarfOnChange;

  cdsLancamentoAux.Data := GeraDarf.ListLancamentoAux(Sistema.IdEmpresa, rgImposto.ItemIndex,cmbModuloOrigem.ItemIndex, deDataFim.Text, deDataIni.Text, dblcNatureza.LookupValue);

  cdsCodigos.Data := GeraDarf.ListCodigos;

  sDataLanc          := '$';
  sCodNatureza       := '$';
  sContaContabil     := '$';
  sContaContabRecDes := '$';
  sCodCentroCusto    := '$';
  iPlanoPrev         := -100;
  iPatro             := -100;
  iPrograma          := -100;
  iBenefirrf         := 0;
  iLancRef           := 0;
  iIdModulo          := 0;
  iMotivo            := -100;
  iVersaoFolha       := -100;
  iCodigoDarf    := -1;

  // Rendimento do Trabalho Assalariado ou resgate de Reserva
  if (cdsLancamentoAux.FieldByName('CODNATUREZA').AsString = '0561') then
    iCodigodarf := 0
  else
    iCodigodarf := 1;

  if (iCodigodarf = 0) then
  begin
    cdsLancamentoAux.First;

    while not cdsLancamentoAux.EOF do
    begin
      if ((cdsLancamentoAux.FieldByName('IDMODULO').AsInteger = 18) or
         (cdsLancamentoAux.FieldByName('IDMODULO').AsInteger = 21)) then
      begin
        if cdsLancamentoAux.FieldByName('VLRIRRF').AsFloat >= 0 then
        begin
          if (sCodNatureza <> cdsLancamentoAux.FieldByName('CODNATUREZA').AsString) or
             (iPatro <> cdsLancamentoAux.FieldByName('IDPATRO').AsInteger) or
             (iPlanoPrev <> cdsLancamentoAux.FieldByName('IDPLANOPREV').AsInteger) or
             (iPrograma <> cdsLancamentoAux.FieldByName('IDPROGRAMA').AsInteger) or
             (iMotivo <> cdsLancamentoAux.FieldByName('IDMOTIVO').AsInteger) or
             (iVersaoFolha <> cdsLancamentoAux.FieldByName('IDHSTFOLHABENEF').AsInteger) or
             (sDataLanc <> cdsLancamentoAux.FieldByName('DATALANCAMENTO').AsString) or
             (sCodCentroCusto <> cdsLancamentoAux.FieldByName('CODCENTROCUSTO').AsString) or
             (sContaContabRecdes <> cdsLancamentoAux.FieldByName('PLACONTARECDES').AsString) or // p. 15761
             (ibenefirrf <>  cdsLancamentoAux.FieldByName('IDBENEFIRRF').AsInteger) or
             (iIdModulo  <> cdsLancamentoAux.FieldByName('IDMODULO').AsInteger)     or
             (sContaContabil <> cdsLancamentoAux.FieldByName('PLACONTA').AsString) then
          begin
            iLancRef := cdsLancamentoAux.FieldByName('IDLANCIRRF').AsInteger;

            if not cdslancamentos.locate('IDLANCIRRF',iLancref,[]) then
            begin
               cdsLancamentos.Insert;
               cdsLancamentos.FieldByName('IDLANCIRRF').AsInteger      := cdsLancamentoAux.FieldByName('IDLANCIRRF').AsInteger;
               cdsLancamentos.FieldByName('DATALANCAMENTO').AsDateTime := cdsLancamentoAux.FieldByName('DATALANCAMENTO').AsDateTime;
               cdsLancamentos.FieldByName('IDPESSOA').AsInteger        := cdsLancamentoAux.FieldByName('IDPESSOA').AsInteger;
               cdsLancamentos.FieldByName('CODNATUREZA').AsString      := cdsLancamentoAux.FieldByName('CODNATUREZA').AsString;
               cdsLancamentos.FieldByName('FLGDARF').AsString          := 'N';
               cdsLancamentos.FieldByName('VLRBASE').AsFloat           := cdsLancamentoAux.FieldByName('VLRBASE').AsFloat;
               cdsLancamentos.FieldByName('VLRIRRF').AsFloat           := cdsLancamentoAux.FieldByName('VLRIRRF').AsFloat;
               cdsLancamentos.FieldByName('VLRINSS').AsFloat           := cdsLancamentoAux.FieldByName('VLRINSS').AsFloat;
               cdsLancamentos.FieldByName('VLRREFERENCIA').AsFloat     := cdsLancamentoAux.FieldByName('VLRREFERENCIA').AsFloat;
               cdsLancamentos.FieldByName('NUMDOCUMENTO').AsString     := cdsLancamentoAux.FieldByName('NUMDOCUMENTO').AsString;
               cdsLancamentos.FieldByName('PERCIRRF').AsFloat          := 0;
               cdsLancamentos.FieldByName('PLANO').AsInteger           := cdsLancamentoAux.FieldByName('PLANO').AsInteger;
               cdsLancamentos.FieldByName('PLACONTA').AsString         := cdsLancamentoAux.FieldByName('PLACONTA').AsString;
               cdsLancamentos.FieldByName('FLGFOLHA').AsString         := cdsLancamentoAux.FieldByName('FLGFOLHA').AsString;
               cdsLancamentos.FieldByName('IDPATRO').AsInteger         := cdsLancamentoAux.FieldByName('IDPATRO').AsInteger;
               cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger     := cdsLancamentoAux.FieldByName('IDPLANOPREV').AsInteger;
               cdsLancamentos.FieldByName('IDPLANOPREVPREV').AsInteger := cdsLancamentoAux.FieldByName('IDPLANOPREVPREV').AsInteger;
               cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger      := cdsLancamentoAux.FieldByName('IDPROGRAMA').AsInteger;
               cdsLancamentos.FieldByName('IDMOTIVO').AsInteger        := cdsLancamentoAux.FieldByName('IDMOTIVO').AsInteger;
               cdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger := cdsLancamentoAux.FieldByName('IDHSTFOLHABENEF').AsInteger;
               cdsLancamentos.FieldByName('DESCRICAO').AsString        := cdsLancamentoAux.FieldByName('DESCRICAO').AsString;
               cdsLancamentos.FieldByName('HISTORICO').AsString        := cdsLancamentoAux.FieldByName('HISTORICO').AsString;
               cdsLancamentos.FieldByName('RAZAOSOCIAL').AsString      := cdsLancamentoAux.FieldByName('RAZAOSOCIAL').AsString;
               cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString   := cdsLancamentoAux.FieldByName('CODCENTROCUSTO').AsString;
               cdsLancamentos.FieldByName('CODCENTRORESPON').AsString  := cdsLancamentoAux.FieldByName('CODCENTRORESPON').AsString;
               cdsLancamentos.FieldByName('CODTIPRECDES').AsString     := cdsLancamentoAux.FieldByName('CODTIPRECDES').AsString;   
               cdsLancamentos.FieldByName('PLACONTARECDES').AsString   := cdsLancamentoAux.FieldByName('PLACONTARECDES').AsString; 
               cdsLancamentos.FieldByName('IDMODULO').AsInteger        := cdsLancamentoAux.FieldByName('IDMODULO').AsInteger; 
               cdsLancamentos.FieldByName('NOMEMODULO').AsString       := cdsLancamentoAux.FieldByName('NOMEMODULO').AsString;
               cdsLancamentos.FieldByName('NOME').AsString             := cdsLancamentoAux.FieldByName('NOME').AsString;
               cdsLancamentos.FieldByName('PATRO').AsString            := cdsLancamentoAux.FieldByName('PATRO').AsString;
               cdsLancamentos.FieldByName('TIPODESEMBOLSO').AsString   := cdsLancamentoAux.FieldByName('TIPODESEMBOLSO').AsString;

               // WO10032 - Contas a Pagar - Remessa eletrônica
               // Alterador por Arnaldo Vicente Scarin em 18/07/2024
               // Apesar do CdsLancamentos ter o Campo "CodDocumento", como ele
               // vem populado a partir do CdsLancamentosAux, em nenhum momento esse
               // campo está sendo preenchido e é necessário que o mesmo esteja
               // preenchido, pois se existir alguma situação que a Conta de Baixa
               // não tenha sido encontrada, a Rotina "LocalizaContaBaixaAlteradorImposto"
               // que foi criada para localizar a conta de baixa do Alterador,
               // precisa do Campo CodDocumento para localizar o alterador do
               // documento de origem, para poder localizar o campo PlaConta e utilizar
               // o que estiver definido nesse campo.
               if cdsLancamentoAux.FieldByName('CodDocumento').AsInteger > 0 then
                 cdsLancamentos.FieldByName('CodDocumento').AsInteger := cdsLancamentoAux.FieldByName('CodDocumento').AsInteger;
               // WO10032

               sCodNatureza       := cdsLancamentoAux.FieldByName('CODNATUREZA').AsString;
               sContaContabil     := cdsLancamentoAux.FieldByName('PLACONTA').AsString;
               sContaContabrecdes := cdsLancamentoAux.FieldByName('PLACONTARECDES').AsString; 
               iPatro             := cdsLancamentoAux.FieldByName('IDPATRO').AsInteger;
               iPlanoPrev         := cdsLancamentoAux.FieldByName('IDPLANOPREV').AsInteger;
               iPrograma          := cdsLancamentoAux.FieldByName('IDPROGRAMA').AsInteger;
               iMotivo            := cdsLancamentoAux.FieldByName('IDMOTIVO').AsInteger;
               iVersaoFolha       := cdsLancamentoAux.FieldByName('IDHSTFOLHABENEF').AsInteger;
               sDataLanc          := cdsLancamentoAux.FieldByName('DATALANCAMENTO').AsString;
               sCodCentroCusto    := cdsLancamentoAux.FieldByName('CODCENTROCUSTO').AsString;
               ibenefirrf         := cdsLancamentoAux.FieldByName('IDBENEFIRRF').asInteger;
               iIdModulo          := cdsLancamentoAux.FieldByName('IDMODULO').asInteger;
            end;
          end
          else
          begin
            cdsLancamentos.Edit;
            cdsLancamentos.FieldByName('VLRBASE').AsFloat           := cdsLancamentos.FieldByName('VLRBASE').AsFloat + cdsLancamentoAux.FieldByName('VLRBASE').AsFloat;
            cdsLancamentos.FieldByName('VLRIRRF').AsFloat           := cdsLancamentos.FieldByName('VLRIRRF').AsFloat + cdsLancamentoAux.FieldByName('VLRIRRF').AsFloat;
            cdsLancamentos.FieldByName('VLRINSS').AsFloat           := cdsLancamentos.FieldByName('VLRINSS').AsFloat + cdsLancamentoAux.FieldByName('VLRINSS').AsFloat;
            cdsLancamentos.FieldByName('VLRREFERENCIA').AsFloat     := cdsLancamentos.FieldByName('VLRREFERENCIA').AsFloat + cdsLancamentoAux.FieldByName('VLRREFERENCIA').AsFloat;
          end;

          cdsLancamentos.Post;

          cdsCodigos.Insert;
          cdsCodigos.FieldByName('IDLANCIRRF').AsInteger := cdsLancamentoAux.FieldByName('IDLANCIRRF').AsInteger;
          cdsCodigos.FieldByName('IDLANCREF').AsInteger  := iLancRef;
          cdsCodigos.Post;

          cdsLancamentoAux.Next;

        end
        else
          cdsLancamentoAux.Next;

      end
      else
      begin
        iLancRef := cdsLancamentoAux.FieldByName('IDLANCIRRF').AsInteger;
        cdsLancamentos.Insert;
        cdsLancamentos.FieldByName('IDLANCIRRF').AsInteger      := cdsLancamentoAux.FieldByName('IDLANCIRRF').AsInteger;
        cdsLancamentos.FieldByName('DATALANCAMENTO').AsDateTime := cdsLancamentoAux.FieldByName('DATALANCAMENTO').AsDateTime;
        cdsLancamentos.FieldByName('IDPESSOA').AsInteger        := cdsLancamentoAux.FieldByName('IDPESSOA').AsInteger;
        cdsLancamentos.FieldByName('CODNATUREZA').AsString      := cdsLancamentoAux.FieldByName('CODNATUREZA').AsString;
        cdsLancamentos.FieldByName('FLGDARF').AsString          := 'N';
        cdsLancamentos.FieldByName('VLRBASE').AsFloat           := cdsLancamentoAux.FieldByName('VLRBASE').AsFloat;
        cdsLancamentos.FieldByName('VLRIRRF').AsFloat           := cdsLancamentoAux.FieldByName('VLRIRRF').AsFloat;
        cdsLancamentos.FieldByName('VLRINSS').AsFloat           := cdsLancamentoAux.FieldByName('VLRINSS').AsFloat;
        cdsLancamentos.FieldByName('VLRREFERENCIA').AsFloat     := cdsLancamentoAux.FieldByName('VLRREFERENCIA').AsFloat;
        cdsLancamentos.FieldByName('NUMDOCUMENTO').AsString     := cdsLancamentoAux.FieldByName('NUMDOCUMENTO').AsString;
        cdsLancamentos.FieldByName('PERCIRRF').AsFloat          := 0;
        cdsLancamentos.FieldByName('PLANO').AsInteger           := cdsLancamentoAux.FieldByName('PLANO').AsInteger;
        cdsLancamentos.FieldByName('PLACONTA').AsString         := cdsLancamentoAux.FieldByName('PLACONTA').AsString;
        cdsLancamentos.FieldByName('FLGFOLHA').AsString         := cdsLancamentoAux.FieldByName('FLGFOLHA').AsString;
        cdsLancamentos.FieldByName('IDPATRO').AsInteger         := cdsLancamentoAux.FieldByName('IDPATRO').AsInteger;
        cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger     := cdsLancamentoAux.FieldByName('IDPLANOPREV').AsInteger;
        cdsLancamentos.FieldByName('IDPLANOPREVPREV').AsInteger := cdsLancamentoAux.FieldByName('IDPLANOPREVPREV').AsInteger;
        cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger      := cdsLancamentoAux.FieldByName('IDPROGRAMA').AsInteger;
        cdsLancamentos.FieldByName('IDMOTIVO').AsInteger        := cdsLancamentoAux.FieldByName('IDMOTIVO').AsInteger;
        cdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger := cdsLancamentoAux.FieldByName('IDHSTFOLHABENEF').AsInteger;
        cdsLancamentos.FieldByName('DESCRICAO').AsString        := cdsLancamentoAux.FieldByName('DESCRICAO').AsString;
        cdsLancamentos.FieldByName('HISTORICO').AsString        := cdsLancamentoAux.FieldByName('HISTORICO').AsString;
        cdsLancamentos.FieldByName('RAZAOSOCIAL').AsString      := cdsLancamentoAux.FieldByName('RAZAOSOCIAL').AsString;
        cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString   := cdsLancamentoAux.FieldByName('CODCENTROCUSTO').AsString;
        cdsLancamentos.FieldByName('CODTIPRECDES').AsString     := cdsLancamentoAux.FieldByName('CODTIPRECDES').AsString;
        cdsLancamentos.FieldByName('PLACONTARECDES').AsString   := cdsLancamentoAux.FieldByName('PLACONTARECDES').AsString;
        cdsLancamentos.FieldByName('IDMODULO').AsInteger        := cdsLancamentoAux.FieldByName('IDMODULO').AsInteger;
        cdsLancamentos.FieldByName('NOMEMODULO').AsString       := cdsLancamentoAux.FieldByName('NOMEMODULO').AsString;
        cdsLancamentos.FieldByName('CODCENTRORESPON').AsString   := cdsLancamentoAux.FieldByName('CODCENTRORESPON').AsString;

        // WO10032 - Contas a Pagar - Remessa eletrônica
        // Alterador por Arnaldo Vicente Scarin em 18/07/2024
        // Apesar do CdsLancamentos ter o Campo "CodDocumento", como ele
        // vem populado a partir do CdsLancamentosAux, em nenhum momento esse
        // campo está sendo preenchido e é necessário que o mesmo esteja
        // preenchido, pois se existir alguma situação que a Conta de Baixa
        // não tenha sido encontrada, a Rotina "LocalizaContaBaixaAlteradorImposto"
        // que foi criada para localizar a conta de baixa do Alterador,
        // precisa do Campo CodDocumento para localizar o alterador do
        // documento de origem, para poder localizar o campo PlaConta e utilizar
        // o que estiver definido nesse campo.
        if cdsLancamentoAux.FieldByName('CodDocumento').AsInteger > 0 then
          cdsLancamentos.FieldByName('CodDocumento').AsInteger := cdsLancamentoAux.FieldByName('CodDocumento').AsInteger;
        // WO10032

        cdsLancamentos.Post;

        cdsCodigos.Insert;
        cdsCodigos.FieldByName('IDLANCIRRF').AsInteger := cdsLancamentoAux.FieldByName('IDLANCIRRF').AsInteger;
        cdsCodigos.FieldByName('IDLANCREF').AsInteger  := iLancRef;

        cdsCodigos.Post;

        sCodNatureza    := cdsLancamentoAux.FieldByName('CODNATUREZA').AsString;
        sContaContabil  := cdsLancamentoAux.FieldByName('PLACONTA').AsString;
        iPatro          := cdsLancamentoAux.FieldByName('IDPATRO').AsInteger;
        iPlanoPrev      := cdsLancamentoAux.FieldByName('IDPLANOPREV').AsInteger;
        iPrograma       := cdsLancamentoAux.FieldByName('IDPROGRAMA').AsInteger;
        iMotivo         := cdsLancamentoAux.FieldByName('IDMOTIVO').AsInteger;
        iVersaoFolha    := cdsLancamentoAux.FieldByName('IDHSTFOLHABENEF').AsInteger;
        sDataLanc       := cdsLancamentoAux.FieldByName('DATALANCAMENTO').AsString;
        sCodCentroCusto := cdsLancamentoAux.FieldByName('CODCENTROCUSTO').AsString;

        cdsLancamentoAux.Next;
      end;
    end;

    cdsLancamentoAux.First;

    while not cdsLancamentoAux.EOF do
    begin
      if ((cdsLancamentoAux.FieldByName('IDMODULO').AsInteger = 18) or
          (cdsLancamentoAux.FieldByName('IDMODULO').AsInteger = 21)) then  //Higor Nayde Ferreira  SOL 194365 KTN 1853220
      begin
        if cdsLancamentoAux.FieldByName('VLRIRRF').AsFloat < 0 then
        begin
          cdsLancamentos.Insert;
          cdsLancamentos.FieldByName('IDLANCIRRF').AsInteger      := cdsLancamentoAux.FieldByName('IDLANCIRRF').AsInteger;
          cdsLancamentos.FieldByName('DATALANCAMENTO').AsDateTime := cdsLancamentoAux.FieldByName('DATALANCAMENTO').AsDateTime;
          cdsLancamentos.FieldByName('IDPESSOA').AsInteger        := cdsLancamentoAux.FieldByName('IDPESSOA').AsInteger;
          cdsLancamentos.FieldByName('CODNATUREZA').AsString      := cdsLancamentoAux.FieldByName('CODNATUREZA').AsString;
          cdsLancamentos.FieldByName('FLGDARF').AsString          := 'N';
          cdsLancamentos.FieldByName('VLRBASE').AsFloat           := cdsLancamentoAux.FieldByName('VLRBASE').AsFloat;
          cdsLancamentos.FieldByName('VLRIRRF').AsFloat           := cdsLancamentoAux.FieldByName('VLRIRRF').AsFloat;
          cdsLancamentos.FieldByName('VLRINSS').AsFloat           := cdsLancamentoAux.FieldByName('VLRINSS').AsFloat;
          cdsLancamentos.FieldByName('VLRREFERENCIA').AsFloat     := cdsLancamentoAux.FieldByName('VLRREFERENCIA').AsFloat;
          cdsLancamentos.FieldByName('NUMDOCUMENTO').AsString     := cdsLancamentoAux.FieldByName('NUMDOCUMENTO').AsString;
          cdsLancamentos.FieldByName('PERCIRRF').AsFloat          := 0;
          cdsLancamentos.FieldByName('PLANO').AsInteger           := cdsLancamentoAux.FieldByName('PLANO').AsInteger;
          cdsLancamentos.FieldByName('PLACONTA').AsString         := cdsLancamentoAux.FieldByName('PLACONTA').AsString;
          cdsLancamentos.FieldByName('FLGFOLHA').AsString         := cdsLancamentoAux.FieldByName('FLGFOLHA').AsString;
          cdsLancamentos.FieldByName('IDPATRO').AsInteger         := cdsLancamentoAux.FieldByName('IDPATRO').AsInteger;
          cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger     := cdsLancamentoAux.FieldByName('IDPLANOPREV').AsInteger;
          cdsLancamentos.FieldByName('IDPLANOPREVPREV').AsInteger := cdsLancamentoAux.FieldByName('IDPLANOPREVPREV').AsInteger;
          cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger      := cdsLancamentoAux.FieldByName('IDPROGRAMA').AsInteger;
          cdsLancamentos.FieldByName('IDMOTIVO').AsInteger        := cdsLancamentoAux.FieldByName('IDMOTIVO').AsInteger;
          cdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger := cdsLancamentoAux.FieldByName('IDHSTFOLHABENEF').AsInteger;
          cdsLancamentos.FieldByName('DESCRICAO').AsString        := cdsLancamentoAux.FieldByName('DESCRICAO').AsString;
          cdsLancamentos.FieldByName('HISTORICO').AsString        := cdsLancamentoAux.FieldByName('HISTORICO').AsString;
          cdsLancamentos.FieldByName('RAZAOSOCIAL').AsString      := cdsLancamentoAux.FieldByName('RAZAOSOCIAL').AsString;
          cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString   := cdsLancamentoAux.FieldByName('CODCENTROCUSTO').AsString;
          cdsLancamentos.FieldByName('CODTIPRECDES').AsString     := cdsLancamentoAux.FieldByName('CODTIPRECDES').AsString;
          cdsLancamentos.FieldByName('PLACONTARECDES').AsString   := cdsLancamentoAux.FieldByName('PLACONTARECDES').AsString;
          cdsLancamentos.FieldByName('IDMODULO').AsInteger        := cdsLancamentoAux.FieldByName('IDMODULO').AsInteger;
          cdsLancamentos.FieldByName('NOMEMODULO').AsString       := cdsLancamentoAux.FieldByName('NOMEMODULO').AsString;
          cdsLancamentos.FieldByName('CODCENTRORESPON').AsString  := cdsLancamentoAux.FieldByName('CODCENTRORESPON').AsString;
          cdsLancamentos.Post;

          // WO10032 - Contas a Pagar - Remessa eletrônica
          // Alterador por Arnaldo Vicente Scarin em 18/07/2024
          // Apesar do CdsLancamentos ter o Campo "CodDocumento", como ele
          // vem populado a partir do CdsLancamentosAux, em nenhum momento esse
          // campo está sendo preenchido e é necessário que o mesmo esteja
          // preenchido, pois se existir alguma situação que a Conta de Baixa
          // não tenha sido encontrada, a Rotina "LocalizaContaBaixaAlteradorImposto"
          // que foi criada para localizar a conta de baixa do Alterador,
          // precisa do Campo CodDocumento para localizar o alterador do
          // documento de origem, para poder localizar o campo PlaConta e utilizar
          // o que estiver definido nesse campo.
          if cdsLancamentoAux.FieldByName('CodDocumento').AsInteger > 0 then
            cdsLancamentos.FieldByName('CodDocumento').AsInteger := cdsLancamentoAux.FieldByName('CodDocumento').AsInteger;
          // WO10032

          //
          cdsCodigos.Insert;
          cdsCodigos.FieldByName('IDLANCIRRF').AsInteger := cdsLancamentoAux.FieldByName('IDLANCIRRF').AsInteger;
          cdsCodigos.FieldByName('IDLANCREF').AsInteger  := iLancRef;
          cdsCodigos.Post;
        end;
      end;
      cdsLancamentoAux.Next;
    end;

  end
  else
  begin   // icodigodarf = -1
    cdsLancamentoAux.First;

    while not cdsLancamentoAux.EOF do
    begin
      iLancRef := cdsLancamentoAux.FieldByName('IDLANCIRRF').AsInteger;
      cdsLancamentos.Insert;
      cdsLancamentos.FieldByName('IDBENEFIRRF').AsInteger     := cdsLancamentoAux.FieldByName('IDBENEFIRRF').AsInteger;
      cdsLancamentos.FieldByName('IDLANCIRRF').AsInteger      := cdsLancamentoAux.FieldByName('IDLANCIRRF').AsInteger;
      cdsLancamentos.FieldByName('DATALANCAMENTO').AsDateTime := cdsLancamentoAux.FieldByName('DATALANCAMENTO').AsDateTime;
      cdsLancamentos.FieldByName('IDPESSOA').AsInteger        := cdsLancamentoAux.FieldByName('IDPESSOA').AsInteger;
      cdsLancamentos.FieldByName('CODNATUREZA').AsString      := cdsLancamentoAux.FieldByName('CODNATUREZA').AsString;
      cdsLancamentos.FieldByName('FLGDARF').AsString          := 'N';
      cdsLancamentos.FieldByName('VLRBASE').AsFloat           := cdsLancamentoAux.FieldByName('VLRBASE').AsFloat;
      cdsLancamentos.FieldByName('VLRIRRF').AsFloat           := cdsLancamentoAux.FieldByName('VLRIRRF').AsFloat;
      cdsLancamentos.FieldByName('VLRINSS').AsFloat           := cdsLancamentoAux.FieldByName('VLRINSS').AsFloat;
      cdsLancamentos.FieldByName('VLRREFERENCIA').AsFloat     := cdsLancamentoAux.FieldByName('VLRREFERENCIA').AsFloat;
      cdsLancamentos.FieldByName('NUMDOCUMENTO').AsString     := cdsLancamentoAux.FieldByName('NUMDOCUMENTO').AsString;
      cdsLancamentos.FieldByName('PERCIRRF').AsFloat          := 0;
      cdsLancamentos.FieldByName('PLANO').AsInteger           := cdsLancamentoAux.FieldByName('PLANO').AsInteger;
      cdsLancamentos.FieldByName('PLACONTA').AsString         := cdsLancamentoAux.FieldByName('PLACONTA').AsString;
      cdsLancamentos.FieldByName('FLGFOLHA').AsString         := cdsLancamentoAux.FieldByName('FLGFOLHA').AsString;
      cdsLancamentos.FieldByName('IDPATRO').AsInteger         := cdsLancamentoAux.FieldByName('IDPATRO').AsInteger;
      cdsLancamentos.FieldByName('IDPLANOPREV').AsInteger     := cdsLancamentoAux.FieldByName('IDPLANOPREV').AsInteger;
      cdsLancamentos.FieldByName('IDPLANOPREVPREV').AsInteger := cdsLancamentoAux.FieldByName('IDPLANOPREVPREV').AsInteger;
      cdsLancamentos.FieldByName('IDPROGRAMA').AsInteger      := cdsLancamentoAux.FieldByName('IDPROGRAMA').AsInteger;
      cdsLancamentos.FieldByName('IDMOTIVO').AsInteger        := cdsLancamentoAux.FieldByName('IDMOTIVO').AsInteger;
      cdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger := cdsLancamentoAux.FieldByName('IDHSTFOLHABENEF').AsInteger;
      cdsLancamentos.FieldByName('DESCRICAO').AsString        := cdsLancamentoAux.FieldByName('DESCRICAO').AsString;
      cdsLancamentos.FieldByName('HISTORICO').AsString        := cdsLancamentoAux.FieldByName('HISTORICO').AsString;
      cdsLancamentos.FieldByName('RAZAOSOCIAL').AsString      := cdsLancamentoAux.FieldByName('RAZAOSOCIAL').AsString;
      cdsLancamentos.FieldByName('CODCENTROCUSTO').AsString   := cdsLancamentoAux.FieldByName('CODCENTROCUSTO').AsString;
      cdsLancamentos.FieldByName('CODTIPRECDES').AsString     := cdsLancamentoAux.FieldByName('CODTIPRECDES').AsString;
      cdsLancamentos.FieldByName('PLACONTARECDES').AsString   := cdsLancamentoAux.FieldByName('PLACONTARECDES').AsString;
      cdsLancamentos.FieldByName('IDMODULO').AsInteger        := cdsLancamentoAux.FieldByName('IDMODULO').AsInteger;
      cdsLancamentos.FieldByName('NOMEMODULO').AsString       := cdsLancamentoAux.FieldByName('NOMEMODULO').AsString;
      cdsLancamentos.FieldByName('CODCENTRORESPON').AsString  := cdsLancamentoAux.FieldByName('CODCENTRORESPON').AsString;
      cdsLancamentos.FieldByName('NOME').AsString             := cdsLancamentoAux.FieldByName('NOME').AsString;
      cdsLancamentos.FieldByName('PATRO').AsString            := cdsLancamentoAux.FieldByName('PATRO').AsString;
      cdsLancamentos.FieldByName('TIPODESEMBOLSO').AsString   := cdsLancamentoAux.FieldByName('TIPODESEMBOLSO').AsString;

      if (dblcNatureza.LookupValue = '7431') or
         (dblcNatureza.LookupValue = '7416') then
        cdsLancamentos.FieldByName('UFSECAO').AsString   := cdsLancamentoAux.FieldByName('UFSECAO').AsString;
      // WO10032 - Contas a Pagar - Remessa eletrônica
      // Alterador por Arnaldo Vicente Scarin em 18/07/2024
      // Apesar do CdsLancamentos ter o Campo "CodDocumento", como ele
      // vem populado a partir do CdsLancamentosAux, em nenhum momento esse
      // campo está sendo preenchido e é necessário que o mesmo esteja
      // preenchido, pois se existir alguma situação que a Conta de Baixa
      // não tenha sido encontrada, a Rotina "LocalizaContaBaixaAlteradorImposto"
      // que foi criada para localizar a conta de baixa do Alterador,
      // precisa do Campo CodDocumento para localizar o alterador do
      // documento de origem, para poder localizar o campo PlaConta e utilizar
      // o que estiver definido nesse campo.
      if cdsLancamentoAux.FieldByName('CodDocumento').AsInteger > 0 then
        cdsLancamentos.FieldByName('CodDocumento').AsInteger := cdsLancamentoAux.FieldByName('CodDocumento').AsInteger;
      // WO10032

      cdsLancamentos.Post;

      cdsCodigos.Insert;
      cdsCodigos.FieldByName('IDLANCIRRF').AsInteger := cdsLancamentoAux.FieldByName('IDLANCIRRF').AsInteger;
      cdsCodigos.FieldByName('IDLANCREF').AsInteger  := iLancRef;
      cdsCodigos.Post;

      cdsLancamentoAux.Next;
    end;
  end; // case

  CalcValores(True);
end;



procedure TfrmGeraDarfMT.CalcValores(bPrimVez: Boolean);
begin
  rValorBase := 0;
  rValorIRRF := 0;
  rValorINSS := 0;

  cdsLancamentos.DisableControls;
  cdsLancamentos.First;

  while not(cdsLancamentos.EOF) do
  begin
    if (cdsLancamentos.FieldByName('DATALANCAMENTO').AsDateTime >= deDataIni.Date) and
       (cdsLancamentos.FieldByName('DATALANCAMENTO').AsDateTime <= deDataFim.Date) and
       (bPrimvez) then
    begin
      cdsLancamentos.Edit;
      cdsLancamentos.FieldByName('FLGDARF').AsString := 'S';
      cdsLancamentos.Post;
    end
    else
    begin
      if cdsLancamentos.FieldByName('FLGDARF').AsString = 'S' then
      begin
        rValorBase  := rValorBase + cdsLancamentos.FieldByName('VLRBASE').AsFloat;
        rValorIRRF  := rValorIRRF + cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
        rValorINSS  := rValorINSS + cdsLancamentos.FieldByName('VLRINSS').AsFloat;
      end;
    end;
    cdsLancamentos.Next;
  end;

  cdsLancamentos.First;
  cdsLancamentos.EnableControls;

  reBaseImposto.Value := rValorBase;
  reValorIRRF.Value   := rValorIRRF;
  reValorINSS.Value   := rValorINSS;
end;



procedure TfrmGeraDarfMT.FlgDarfOnChange(Sender: TField);
begin
  if cdsLancamentos.FieldByName('FLGDARF').AsString = 'N' then
  begin
     rValorBase := rValorBase - cdsLancamentos.FieldByName('VLRBASE').AsFloat;
     rValorIRRF := rValorIRRF - cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
     rValorINSS := rValorINSS - cdsLancamentos.FieldByName('VLRINSS').AsFloat;

     if cdsCodigos.Locate('IDLANCIRRF', cdsLancamentos.FieldByName('IDLANCIRRF').AsString, []) then
       cdsCodigos.Delete;
  end
  else
  begin
     rValorBase := rValorBase + cdsLancamentos.FieldByName('VLRBASE').AsFloat;
     rValorIRRF := rValorIRRF + cdsLancamentos.FieldByName('VLRIRRF').AsFloat;
     rValorINSS := rValorINSS + cdsLancamentos.FieldByName('VLRINSS').AsFloat;

     if not cdsCodigos.Locate('IDLANCIRRF', cdsLancamentos.FieldByName('IDLANCIRRF').AsInteger,[]) then
     begin
       cdsCodigos.Insert;
       cdsCodigos.FieldByName('IDLANCIRRF').AsInteger := cdsLancamentos.FieldByName('IDLANCIRRF').AsInteger;
       cdsCodigos.FieldByName('IDLANCREF').AsInteger  := cdsLancamentos.FieldByName('IDLANCIRRF').AsInteger;
       cdsCodigos.Post;
     end;
  end;

  reBaseImposto.Value := rValorBase;
  reValorIRRF.Value   := rValorIRRF;
  reValorINSS.Value   := rValorINSS;
end;



procedure TfrmGeraDarfMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Modulo.Free;
  NatuRendimento.Free;
  GeraDarf.Free;
  Darf.Free;
end;



procedure TfrmGeraDarfMT.FormShow(Sender: TObject);
begin
  inherited;
  bbtnGera.Enabled := (cdslancamentos.RecordCount > 0);
end;



procedure TfrmGeraDarfMT.rgImpostoClick(Sender: TObject);
begin
  inherited;

  dedDataVenc.Date  := Modulo.CalcProxDiaSemana(Sistema.IdEmpresa, Date, 3, True, rgImposto.ItemIndex);
  dedDataVenc.Text  := DateToStr(dedDataVenc.Date);

  deDataIni.Date    := Modulo.CalcDataIni(dedDataVenc.Date, rgImposto.ItemIndex);
  deDataFim.Date    := Modulo.CalcDataFim(dedDataVenc.Date, rgImposto.ItemIndex);
  deDataIni.Text    := DateToStr(deDataIni.Date);
  deDataFim.Text    := DateToStr(deDataFim.Date);
end;



procedure TfrmGeraDarfMT.dbgLancamentosExit(Sender: TObject);
var
  idVersao : Integer;
  sFlgDarf : string;
  bAlterou : Boolean;
begin
  inherited;
  // 195827
  if ((cdsLancamentos.FieldByName('IDMODULO').AsInteger     = 18)      and
     ((cdsLancamentos.FieldByName('CODNATUREZA').AsString <> '7416')  or
      (cdsLancamentos.FieldByName('CODNATUREZA').AsString <> '7416'))) and
     ((cdsLancamentos.FieldByName('IDMODULO').AsInteger     = 18)      and
     ((cdsLancamentos.FieldByName('CODNATUREZA').AsString <> '7431')  or
      (cdsLancamentos.FieldByName('CODNATUREZA').AsString <> '7431')))  then
  begin // 195827
    bAlterou := False;
    sFlgDarf := cdsLancamentos.FieldByName('FLGDARF').AsString;
    idVersao := cdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger;

    if cdsLancamentos.FieldByName('VLRIRRF').AsFloat > 0 then
    begin
      cdsLancamentos.First;
      while not cdsLancamentos.EOF do
      begin
        if (cdsLancamentos.FieldByName('IDHSTFOLHABENEF').AsInteger = idVersao) and
           (cdsLancamentos.FieldByName('FLGDARF').AsString         <> sFlgDarf) and
           (cdsLancamentos.FieldByName('VLRIRRF').AsFloat           > 0)        then
        begin
          cdsLancamentos.Edit;
          cdsLancamentos.FieldByName('FLGDARF').AsString := sFlgDarf;
          cdsLancamentos.Post;
          bAlterou := True;
        end;
        cdsLancamentos.Next;
      end;
    end;
    if bAlterou then
    begin
      if sFlgDarf = 'N' then
        MsgDlg('Todos os registros da mesma versão de pagamento da Folha de Benefícios foram desmarcados para geração do DARF.',
               'Informação', mtInformation, [mbOK], 0)
      else
        MsgDlg('Todos os registros da mesma versão de pagamento da Folha de Benefícios foram marcados para geração do DARF.',
               'Informação', mtInformation, [mbOK], 0);

      Repaint;

      dbgLancamentos.SetFocus;
      cdsLancamentos.Locate('IDHSTFOLHABENEF', IntToStr(idVersao),[]);
    end;
  end;
end;



end.
