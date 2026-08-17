{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina............: btnConfirmar
N. Sol............: 174750
N. Kintana........: 1584344
Data..............: 23/02/2012
Responsável.......: Helen V Bianchi
Descrição.........: Add Verificação para ver se o sistema ja esta em Transação
--------------------------------------------------------------------------------
Rotina............: btnExcluiAlteradorClick
N. Sol............: 174558
N. Kintana........: 1573531
Data..............: 16/02/2012
Responsável.......: Helen V Bianchi
Descrição.........: Add Verificação para ver se o sistema ja esta em Transação
--------------------------------------------------------------------------------
Rotina............: Calcula
N. Sol.............: 137429
N. Kintana......: 831440
Data...............: 17/06/2010
Responsável...: Felipe de Oliveira
Descrição........: Mudança no cáculo do Saldo do recálculo e da diferença,
                   assim como no modo de simulação.
--------------------------------------------------------------------------------


Rotina............: FormCreate
N. Sol.............: 92381
N. Kintana......: 394180
Data...............: 18/09/2008
Responsável...: Cássio Camargo
Descrição........: Inclusão do Control Object CtrlImobDocumento, com o
                     objetivo de internalizar funcionalidades.
--------------------------------------------------------------------------------
Pendência   : 26104
Responsável : Daniel Simões
Data        : 14/08/2007
Descrição   : Métodos relacionados a Parametrização de Multas e Juros passa a
              trazer da CtrlParamMulta no lugar da CtrlContratoImovel...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecRecalculoDocumentoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, FWizard, Grids, Wwdbigrd,
  Wwdbgrid, Mask, DBCtrls, fcButton, fcImgBtn, fcShapeBtn, Spin, 
  CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker, wwdbedit, jclSysUtils,
  Wwdotdot, Wwdbcomb, TREdit, wwdblook, uSistema, Wwdbspin, MontaSelect,
  uCtrlPadroes, uCtrlLookRecalculo, uCtrlParamIntegra, Db, DBClient, uModuloImobiliario,
  uCMClientDataSet, uFuncoesImob, uVerificaPreenchimento, uCtrlContratoImovel,
  uCtrlInadimplencia, uCtrlOperImob, {uCtrlDocumento,} uCtrlEventoImovel,
  uCtrlParamMulta,
  //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
  uCtrlImobDocumento;

type
  TfrmExecRecalculoDocumentoMT = class(TfrmWizardMT)
     Label22: TLabel;
     DBedtTipoRecDes: TDBEdit;
     DBEdit1: TDBEdit;
     Label3: TLabel;
     DBEdit6: TDBEdit;
     DBEdit4: TDBEdit;
     Label16: TLabel;
     DBEdit10: TDBEdit;
     Label5: TLabel;
     pcLancamento: TPageControl;
     tbsLancamentos: TTabSheet;
     DBgrdReajuste: TwwDBGrid;
     tbsAlteradores: TTabSheet;
     wwDBGrid1: TwwDBGrid;
     dbEdtMesCompetencia: TDBEdit;
     Label15: TLabel;
     DBEdit12: TDBEdit;
     DBEdit16: TDBEdit;
     lblDataVencimento: TLabel;
     DBEdit17: TDBEdit;
     Label2: TLabel;
     DBEdit18: TDBEdit;
     Label11: TLabel;
     DBEdit9: TDBEdit;
     Label1: TLabel;
     DBedtNomeExtenso: TDBEdit;
     DBedtNomeUsuario: TDBEdit;
     Label8: TLabel;
     DBedtOrigem: TDBEdit;
     Label4: TLabel;
     DBEdit19: TDBEdit;
     Label12: TLabel;
     Label21: TLabel;
     grpMulta: TGroupBox;
     Label24: TLabel;
     Label25: TLabel;
     Label26: TLabel;
     Label27: TLabel;
     Label28: TLabel;
     DBcboMoedaMulta: TwwDBLookupCombo;
     edtVlrMulta: TRealEdit;
     edtPercentMulta: TRealEdit;
     grpMora: TGroupBox;
     Label17: TLabel;
     Label18: TLabel;
     Label29: TLabel;
     Label30: TLabel;
     Label31: TLabel;
     DBedtMoedaMora: TwwDBLookupCombo;
     edtVlrMora: TRealEdit;
     edtPercentMora: TRealEdit;
     grpPeriodicidadeMora: TGroupBox;
     Label19: TLabel;
     dbCboPeriodicidade: TwwDBComboBox;
     chkMoraProporc: TCheckBox;
     edtDataVencimento: TCMDateTimePicker;
     GroupBox17: TGroupBox;
     Label13: TLabel;
     Label46: TLabel;
     Label55: TLabel;
     cboIndiceReajuste: TCMDBLookupCombo;
     SpinMesesAnteriores: TSpinEdit;
     tbsMensagens: TTabSheet;
     fcLabel2: TfcLabel;
     pnlAlienacao: TPanel;
     pnlAdminImob: TPanel;
     GroupBox1: TGroupBox;
     Label32: TLabel;
     Label33: TLabel;
     Label34: TLabel;
     Label35: TLabel;
     Label36: TLabel;
     Label37: TLabel;
     Label38: TLabel;
     Label39: TLabel;
     Label40: TLabel;
     edtln1: TEdit;
     edtln2: TEdit;
     edtln4: TEdit;
     edtln5: TEdit;
     edtln6: TEdit;
     edtln7: TEdit;
     edtln3: TEdit;
     edtln8: TEdit;
     edtln9: TEdit;
     Label6: TLabel;
     Label9: TLabel;
     Label10: TLabel;
     Label14: TLabel;
     Label20: TLabel;
     Label23: TLabel;
     Label47: TLabel;
     GroupBox2: TGroupBox;
     Label41: TLabel;
     Label42: TLabel;
     Label43: TLabel;
     Label44: TLabel;
     Label45: TLabel;
     Label48: TLabel;
     Label49: TLabel;
     Label50: TLabel;
     Label51: TLabel;
     Edit1: TEdit;
     Edit2: TEdit;
     Edit3: TEdit;
     Edit4: TEdit;
     Edit5: TEdit;
     Edit6: TEdit;
     Edit7: TEdit;
     Edit8: TEdit;
     Edit9: TEdit;
     Label52: TLabel;
     Label53: TLabel;
     Label54: TLabel;
     Label56: TLabel;
     Label57: TLabel;
     Label58: TLabel;
     tbsDadosCalculados: TTabSheet;
     fcLabel3: TfcLabel;
     GroupBox3: TGroupBox;
     GroupBox4: TGroupBox;
     Label63: TLabel;
     wwDBEdit1: TwwDBEdit;
     wwDBEdit3: TwwDBEdit;
     wwDBEdit2: TwwDBEdit;
     Label64: TLabel;
     edtVencto: TCMDateTimePicker;
     edtVO: TRealEdit;
     Label62: TLabel;
     edtDias: TRealEdit;
     Label65: TLabel;
     edtInad: TRealEdit;
     Label68: TLabel;
     edtDataPagto: TCMDateTimePicker;
     Label67: TLabel;
     edtVlrPago: TRealEdit;
     Label66: TLabel;
     lblProporcao: TLabel;
     redtProporcao: TRealEdit;
     Label59: TLabel;
     Label61: TLabel;
     Label60: TLabel;
     Label69: TLabel;
     GroupBox5: TGroupBox;
     edtCM: TRealEdit;
     edtMulta: TRealEdit;
     edtJuros: TRealEdit;
     edtSaldoDoc: TRealEdit;
     GroupBox6: TGroupBox;
     edtCMDif: TRealEdit;
     edtMultaDif: TRealEdit;
     edtJurosDif: TRealEdit;
     edtTotal: TRealEdit;
     TabSheet2: TTabSheet;
     Label70: TLabel;
     DBgrdAlteradoresLanc: TwwDBGrid;
     btnExcluiAlterador: TBitBtn;
     GroupBox7: TGroupBox;
     Label71: TLabel;
     DBcboPortadorForma: TwwDBLookupCombo;
     chkBoleto: TCheckBox;
     cbDataProgramada: TCheckBox;
     GroupBox8: TGroupBox;
     Panel1: TPanel;
     memEvento: TMemo;
     gbAviso: TGroupBox;
     Label80: TLabel;
     spnDiasAviso: TwwDBSpinEdit;
     cbAviso: TCheckBox;
     fcLabel4: TfcLabel;
     DBedtPortadorForma: TDBEdit;
     Label7: TLabel;
     Label72: TLabel;
     DBEdit2: TDBEdit;
     btnBuscaDocumento: TBitBtn;
     MS_Documento: TMontaSelect;
     cdsDocumento: TCMClientDataSet;
     dsDocumento: TDataSource;
     cdsAlteradoresDoc: TCMClientDataSet;
     dsAlteradoresDoc: TDataSource;
     cdsLancamentos: TCMClientDataSet;
     dsLancamentos: TDataSource;
     cdsContratoImovel: TCMClientDataSet;
     cdsUltimaBaixa: TCMClientDataSet;
     cdsTotInadimplencia: TCMClientDataSet;
     cdsEncargos: TCMClientDataSet;
     cdsAlteradores: TCMClientDataSet;
     dsAlteradores: TDataSource;
     cdsAlteradoresLanc: TCMClientDataSet;
     dsAlteradoresLanc: TDataSource;
     cdsPortadorForma: TCMClientDataSet;
     cdsMoedaCM: TCMClientDataSet;
     cdsMoedaMulta: TCMClientDataSet;
     cdsMoedaJuros: TCMClientDataSet;

     procedure btnBuscaDocumentoClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure cdsDocumentoCalcFields(DataSet: TDataSet);
     procedure btnContinuarClick(Sender: TObject);
     procedure btnExcluiAlteradorClick(Sender: TObject);
     procedure btnConfirmarClick(Sender: TObject);
     procedure DBcboPortadorFormaChange(Sender: TObject);
     procedure edtCMExit(Sender: TObject);
  private
     { Private declarations }

     dUltLancBaixa       : TDateTime;
     dDataFechamento     : TDateTime;

     iTipoOperAtualMulta : Integer;
     iTipoOperAtualJuros : Integer;
     iTipoOperAtualCM    : Integer;
     iMoraProp           : Integer;
     iMoedaMora          : Integer;
     iMoedaMulta         : Integer;
     iUsaMesAnterior     : integer;
     iIndReajuste        : Integer;

     fValorCorrecao      : Extended;
     fTotBaixa           : Extended;
     fTotAlterador       : Extended;
     fValorAtual         : Extended;
     fMulta              : Extended;
     fJuros              : Extended;
     fCorrecaoMonet      : Extended;
     fMultaDif           : Extended;
     fJurosDif           : Extended;
     fCorrecaoMonetDif   : Extended;
     fProporcao          : Extended;
     fValorDiverg        : Extended;
     fValorDivergAtual   : Extended;
     dDataCalculo        : TDateTime;

     bAtualizaDiaria     : Boolean;

     function  BuscaEncargosContrato    : Boolean;
     function  EfetuaCalculo            : Boolean;
     function  Calcula                  : Boolean;
     function  VerificaPreenchimento    : Boolean;
     function  VerificaPreenchimentoDoc : Boolean;

     procedure GravaMensagens;
     procedure GravaCalculo;
     procedure GravaPortadorForma;
     procedure SelecionaDocumento(iDocumento : Integer);

  public
    { Public declarations }
    
  protected
     rParamMulta        : TParamMulta;

     CtrlLookRecalculo  : TCtrlLookRecalculo;
     CtrlContratoImovel : TCtrlContratoImovel;
     CtrlInadimplencia  : TCtrlInadimplencia;
     CtrlOperImob       : TCtrlOperImob;
     //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
     //CtrlDocumento      : TCtrlDocumento;
     CtrlImobDocumento  : TCtrlImobDocumento;
     CtrlEventoImovel   : TCtrlEventoImovel;
     CtrlParamMulta     : TCtrlParamMulta;
  end;

var
  frmExecRecalculoDocumentoMT: TfrmExecRecalculoDocumentoMT;

implementation

{$R *.DFM}

uses uMensErro;

procedure TfrmExecRecalculoDocumentoMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlLookRecalculo := TCtrlLookRecalculo.Create(Sistema.IdEmpresa,
                                                  Sistema.IdModulo,
                                                  Sistema.IdUsuario,
                                                  Sistema.IdEspAcesso,
                                                  ParamIntegra.PlanoPrevGlobal,
                                                  ParamIntegra.PatroGlobal,
                                                  sistema.UsaPlanoPatro);

   CtrlContratoImovel := TCtrlContratoImovel.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.IdEspAcesso,Sistema.UsaPlanoPatro);
   CtrlInadimplencia  := TCtrlInadimplencia.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.IdEspAcesso,Sistema.UsaPlanoPatro);
   CtrlOperImob       := TCtrlOperImob.Create(Sistema.IdEmpresa,
                                                  Sistema.IdModulo,
                                                  Sistema.IdUsuario,
                                                  Sistema.IdEspAcesso,
                                                  ParamIntegra.PlanoPrevGlobal,
                                                  ParamIntegra.PatroGlobal,
                                                  sistema.UsaPlanoPatro);

   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //CtrlDocumento := TCtrlDocumento.Create;
   CtrlImobDocumento := TCtrlImobDocumento.Create;
   CtrlEventoImovel := TCtrlEventoImovel.Create;

   // Daniel - 26104
   CtrlParamMulta := TCtrlParamMulta.Create(Sistema.IdEmpresa,
                                            Sistema.IdModulo,
                                            Sistema.IdUsuario,
                                            Sistema.IdEspAcesso,
                                            Sistema.UsaPlanoPatro);
   // Fim.

   CtrlOperImob.cdsEncargos := cdsEncargos;

   CtrlLookRecalculo.InitializeAs(Padroes);
   CtrlContratoImovel.InitializeAs(Padroes);
   CtrlInadimplencia.InitializeAs(Padroes);
   CtrlOperImob.InitializeAs(Padroes);
   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //CtrlDocumento.InitializeAs(Padroes);
   CtrlImobDocumento.InitializeAs(Padroes);
   //CtrlEventoImovel.InitializeAs(CtrlDocumento);
   CtrlEventoImovel.InitializeAs(CtrlImobDocumento);
   CtrlParamMulta.InitializeAs(Padroes);

   dDataFechamento        := Date;

   if Sistema.IdModulo = 64 then
   begin
      pnlAdminImob.Visible := True;
      pnlAdminImob.BringToFront;

      pnlAlienacao.Visible := False;
      pnlAlienacao.SendToBack;

      iTipoOperAtualMulta := ModuloImobiliario.AdminImob.iTipoOperAtualMulta;
      iTipoOperAtualJuros := ModuloImobiliario.AdminImob.iTipoOperAtualJuros;
      iTipoOperAtualCM    := ModuloImobiliario.AdminImob.iTipoOperAtualCM;

   end
   else
   begin
      pnlAdminImob.Visible := False;
      pnlAdminImob.SendToBack;

      pnlAlienacao.Visible := True;
      pnlAlienacao.BringToFront;

      iTipoOperAtualMulta := ModuloImobiliario.Alienacao.iTipoOperAtualMulta;
      iTipoOperAtualJuros := ModuloImobiliario.Alienacao.iTipoOperAtualJuros;
      iTipoOperAtualCM    := ModuloImobiliario.Alienacao.iTipoOperAtualCM;

   end;

   bAtualizaDiaria     := False;

   if (iTipoOperAtualMulta > 0) or
      (iTipoOperAtualJuros > 0) or
      (iTipoOperAtualCM    > 0) then
   begin
      dDataFechamento := CtrlOperImob.UltimoFechamento;
      bAtualizaDiaria := True;
   end;


   edtDataVencimento.Date := dDataFechamento + 1;

   gbAviso.Visible := ( Sistema.IdModulo = 64 );
   cdsPortadorForma.Data := CtrlLookRecalculo.LookupPortadorForma;
end;



procedure TfrmExecRecalculoDocumentoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil( CtrlLookRecalculo );
   FreeAndNil( CtrlContratoImovel );
   FreeAndNil( CtrlInadimplencia );
   FreeAndNil( CtrlOperImob );
   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //FreeAndNil( CtrlDocumento );
   FreeAndNil(CtrlImobDocumento);
   FreeAndNil( CtrlEventoImovel );
   FreeAndNil( CtrlParamMulta );
   inherited;
end;



procedure TfrmExecRecalculoDocumentoMT.cdsDocumentoCalcFields(DataSet: TDataSet);
begin
  inherited;
   Case StrToInt(cdsDocumento.FieldByName('MESCOMPETENCIA').AsString) of
       1: dbEdtMesCompetencia.Text := 'Janeiro';
       2: dbEdtMesCompetencia.Text := 'Fevereiro';
       3: dbEdtMesCompetencia.Text := 'Março';
       4: dbEdtMesCompetencia.Text := 'Abril';
       5: dbEdtMesCompetencia.Text := 'Maio';
       6: dbEdtMesCompetencia.Text := 'Junho';
       7: dbEdtMesCompetencia.Text := 'Julho';
       8: dbEdtMesCompetencia.Text := 'Agosto';
       9: dbEdtMesCompetencia.Text := 'Setembro';
      10: dbEdtMesCompetencia.Text := 'Outubro';
      11: dbEdtMesCompetencia.Text := 'Novembro';
      12: dbEdtMesCompetencia.Text := 'Dezembro';
   end;

   if Sistema.IdModulo = 64 then    DBedtOrigem.Text := OrigemLancamento(cdsDocumento.FieldByName('FLGORIGEMLANC').asString[1])
   else                             DBedtOrigem.Text := 'Alienação';
end;



procedure TfrmExecRecalculoDocumentoMT.btnBuscaDocumentoClick(Sender: TObject);
begin
   inherited;
   MS_Documento.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   if MS_Documento.RetornouValor then
   begin
      SelecionaDocumento(StrToInt(MS_Documento.ValoresChave[0]));
   end;
end;



procedure TfrmExecRecalculoDocumentoMT.btnContinuarClick(Sender: TObject);
begin
   try
     if PagControle.ActivePage = tabSelecao then
     begin
        if cdsDocumento.Eof then
           raise EValidacao.CreateVal('É necessário selecionar um documento',btnBuscaDocumento);
        if not BuscaEncargosContrato then
           raise EValidacao.CreateVal(CtrlContratoImovel.MessageInfo,btnBuscaDocumento);
     end;

     if PagControle.ActivePage = tbsMensagens then
     begin
        if VerificaPreenchimento  then
           if not EfetuaCalculo then
              raise EValidacao.CreateVal('Erro ao efetuar os cálculos', btnBuscaDocumento);
     end;

     inherited;

   except
      on ev:EValidacao do begin
        if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
      end;
   end;

end;



function TfrmExecRecalculoDocumentoMT.BuscaEncargosContrato : Boolean;
begin
   Result := True;

   cdsMoedaCM.Data    := CtrlLookRecalculo.LookupMoeda;
   cdsMoedaMulta.Data := CtrlLookRecalculo.LookupMoeda;
   cdsMoedaJuros.Data := CtrlLookRecalculo.LookupMoeda;

// Daniel - 26104 - Início -----------------------------------------------------
   if not CtrlParamMulta.BuscaParamMulta(rParamMulta,
                                         cdsDocumento.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                         cdsDocumento.FieldByName('IDTIPOCUSTORECIMO').AsInteger,
                                         cdsDocumento.FieldByName('DATAVENCIMENTO').AsDateTime) then
   begin
      Result := False;
      Exit;
   end;
// Daniel - 26104 - Fim --------------------------------------------------------

   with rParamMulta do begin

      cboIndiceReajuste.LookupValue := IntToStr(iIndiceCorrecao);
      SpinMesesAnteriores.Value     := iMesRefCorrecao;
      edtVlrMulta.Text              := FloatToStr(fVlrMulta);
      DBcboMoedaMulta.LookupValue   := IntToStr(iMoeMulta);
      edtPercentMulta.Text          := FloatToStr(fPercMulta);
      edtVlrMora.Text               := FloatToStr(fVlrJuros);
      DBedtMoedaMora.LookupValue    := IntToStr(iMoeJuros);
      edtPercentMora.Text           := FloatToStr(fPercJuros);

      if sPeriodoJuros = 'M' then dbCboPeriodicidade.ItemIndex := 0
      else                        dbCboPeriodicidade.ItemIndex := 1;

      if (sFlgJurosProporc = 'S') then chkMoraProporc.State := cbChecked;

      cdsContratoImovel.Data := CtrlLookRecalculo.LookupContrato(cdsDocumento.FieldByName('IDCONTRATOIMOVEL').AsInteger);
   end;
end;



function TfrmExecRecalculoDocumentoMT.EfetuaCalculo: Boolean;
begin
   Result := Calcula;
end;



function TfrmExecRecalculoDocumentoMT.Calcula: Boolean;
var
   sFlgCalcInadimp : String;
begin
   Result := True;
   try

      sFlgCalcInadimp := 'P';

      if Sistema.IdModulo = 64 then
      begin
         sFlgCalcInadimp := ModuloImobiliario.AdminImob.sFlgCalcInadimp;

         if ( sFlgCalcInadimp = 'P') then
         begin
           lblProporcao.Visible  := True;
           redtProporcao.Visible := True;
         end
         else
         begin
           lblProporcao.Visible  := False;
           redtProporcao.Visible := False;
         end;

      end
      else
      begin
         lblProporcao.Visible  := True;
         redtProporcao.Visible := True;
      end;

      if (chkMoraProporc.Checked) then
         iMoraProp := 1
      else
         iMoraProp := 0;

      iMoedaMora := 0;

      if DBedtMoedaMora.LookupValue <> '' then
      begin
         try
            iMoedaMora := StrToInt(DBedtMoedaMora.LookupValue);
         except
            iMoedaMora := 0;
         end;
      end;

      iIndReajuste := 0;

      if cboIndiceReajuste.LookupValue <> '' then
         iIndReajuste := StrToInt(cboIndiceReajuste.LookupValue);

      iMoedaMulta := 0;

      if DBcboMoedaMulta.LookupValue <> '' then
      begin
         try
            iMoedaMulta := StrToInt(DBcboMoedaMulta.LookupValue);
         except
            iMoedaMulta := 0;
         end;
      end;

      if (iTipoOperAtualMulta <= 0) or
         (iTipoOperAtualJuros <= 0) or
         (iTipoOperAtualCM    <= 0) then
      begin
         // Efetua Calculo
         CtrlInadimplencia.DadosDocsVencidos(cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger,
                                             -1,
                                             edtDataVencimento.DateTime,
                                             SpinMesesAnteriores.Value,
                                             iIndReajuste,
                                             edtVlrMulta.Value,
                                             edtPercentMulta.Value,
                                             iMoedaMulta,
                                             edtVlrMora.Value,
                                             edtPercentMora.Value,
                                             iMoedaMora,
                                             iMoraProp,
                                             cdsContratoImovel.FieldByName('IDCIDADES').AsInteger,
                                             cdsContratoImovel.FieldByName('IDPAIS').AsInteger,
                                             rParamMulta.iDiasTolerancia,
                                             rParamMulta.iDiasRepasse,
                                             (cdsDocumento.FieldByName('VALOR_RECEBIDO').AsFloat > 0),
                                             cdsDocumento.FieldByName('VALOR_TOTAL').AsFloat,
                                             cdsDocumento.FieldByName('VALOR_RECEBIDO').AsFloat,
                                             cdsDocumento.FieldByName('DATAVENCIMENTO').AsDateTime,
                                             cdsDocumento.FieldByName('DATALIMITE').AsDateTime,
                                             dbCboPeriodicidade.Text,
                                             cdsContratoImovel.FieldByName('CODESTADO').AsString,
                                             rParamMulta.sFlgTipoDiasTolera,
                                             rParamMulta.sFlgTipoDiasRepasse,
                                             cdsDocumento.FieldByName('FLGTIPOCONTRATO').AsString,
                                             sFlgCalcInadimp,
                                             True,
                                             fValorAtual,
                                             fMulta,
                                             fJuros,
                                             fCorrecaoMonet,
                                             fMultaDif,
                                             fJurosDif,
                                             fCorrecaoMonetDif,
                                             fProporcao,
                                             fValorDiverg,
                                             fValorDivergAtual,
                                             dDataCalculo);

         // Busca data da última baixa
         cdsUltimaBaixa.Data := CtrlLookRecalculo.LookupUltimaBaixa(cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger);

         if not (cdsUltimaBaixa.IsEmpty) then edtDataPagto.Date := cdsUltimaBaixa.FieldByName('DATABAIXA').AsDateTime;

         cdsTotInadimplencia.Data := CtrlLookRecalculo.LookupTotalInadimplencia(cdsDocumento.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                                DiasUteis.SomaMeses(dDataCalculo,-24),
                                                                                dDataCalculo,
                                                                                cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger);
         edtInad.Value    := cdsTotInadimplencia.FieldByName('QTDE').AsInteger;

         // Carrega Variáveis
         edtVencto.Date    := cdsDocumento.FieldByName('DATAVENCIMENTO').AsDateTime;
         edtDias.Value     := DiasUteis.IntervaloDias(cdsDocumento.FieldByName('DATAVENCIMENTO').AsDateTime, edtDataVencimento.Date);
         edtVO.Value       := cdsDocumento.FieldByName('VALOR_LIQUIDO').AsFloat; // Daniel - 24688
         edtVlrPago.Value  := cdsDocumento.FieldByName('VALOR_RECEBIDO').AsFloat;
         edtSaldoDoc.Value := fValordiverg;
         edtCM.Value       := fCorrecaoMonet;
         edtJuros.Value    := fJuros;
         edtMulta.Value    := fMulta;
         edtCMDif.Value    := fCorrecaoMonetDif;
         edtJurosDif.Value := fJurosDif;
         edtMultaDif.Value := fMultaDif;
         edtTotal.Value    := fValorDivergAtual;

         redtProporcao.Value := fProporcao;

      end
      else
      begin
         CtrlOperImob.iCodDocumentoAjuste := 0;
         CtrlOperImob.MoedaCM             := 0;
         CtrlOperImob.ValorMulta          := 0;
         CtrlOperImob.MoedaMulta          := 0;
         CtrlOperImob.PercentualMulta     := 0;
         CtrlOperImob.ValorJuros          := 0;
         CtrlOperImob.MoedaJuros          := 0;
         CtrlOperImob.PercentualJuros     := 0;
         CtrlOperImob.PeriodoJuros        := '';
         CtrlOperImob.JurosProporc        := '';

         cdsEncargos.EmptyDataSet;

         CtrlOperImob.iCodDocumentoAjuste := cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger;
         CtrlOperImob.MoedaCM             := iIndReajuste;

         if StrToFloat(edtVlrMulta.Text) > 0  then
           CtrlOperImob.ValorMulta := StrToFloat(edtVlrMulta.Text);

         if DBcboMoedaMulta.LookupValue <> '' then
            CtrlOperImob.MoedaMulta := StrToInt(DBcboMoedaMulta.LookupValue);

         if StrToFloat(edtPercentMulta.Text) > 0 then
            CtrlOperImob.PercentualMulta := StrToFloat(edtPercentMulta.Text);

         if StrToFloat(edtVlrMora.Text) > 0  then
            CtrlOperImob.ValorJuros := StrToFloat(edtVlrMora.Text);

         if DBedtMoedaMora.LookupValue <> '' then
            CtrlOperImob.MoedaJuros := StrToInt(DBedtMoedaMora.LookupValue);

         if StrToFloat(edtPercentMora.Text) > 0 then
            CtrlOperImob.PercentualJuros := StrToFloat(edtPercentMora.Text);

         if dbCboPeriodicidade.Text <> '' then
           CtrlOperImob.PeriodoJuros := dbCboPeriodicidade.Value;

         if chkMoraProporc.Checked then CtrlOperImob.JurosProporc := 'S'
         else                           CtrlOperImob.JurosProporc := 'N';

         CtrlOperImob.BuscaParamMultaContrato := False;
         CtrlOperImob.UsaMesAnterior          := SpinMesesAnteriores.Value;

         CtrlOperImob.AtualizaDocsVencidos('',
                                           iTipoOperAtualMulta,
                                           iTipoOperAtualJuros,
                                           iTipoOperAtualCM,
                                           edtDataVencimento.DateTime,
                                           cdsDocumento.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                           True);

         cdsUltimaBaixa.Data := CtrlLookRecalculo.LookupUltimaBaixa(cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger);

         if not (cdsUltimaBaixa.IsEmpty) then edtDataPagto.Date := cdsUltimaBaixa.FieldByName('DATABAIXA').AsDateTime;

         dDataCalculo := edtDataVencimento.Date;

         cdsTotInadimplencia.Data := CtrlLookRecalculo.LookupTotalInadimplencia(cdsDocumento.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                                DiasUteis.SomaMeses(dDataCalculo,-24),
                                                                                dDataCalculo,
                                                                                cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger);
         edtInad.Value    := cdsTotInadimplencia.FieldByName('QTDE').AsInteger;


         // Carrega Variáveis
         edtVencto.Date    := cdsDocumento.FieldByName('DATAVENCIMENTO').AsDateTime;
         edtDias.Value     := DiasUteis.IntervaloDias(cdsDocumento.FieldByName('DATAVENCIMENTO').AsDateTime,edtDataVencimento.Date);
         edtVO.Value       := cdsDocumento.FieldByName('VALOR_LIQUIDO').AsFloat;
         edtVlrPago.Value  := cdsDocumento.FieldByName('VALOR_RECEBIDO').AsFloat;

         edtCMDif.Value    := 0;
         edtJurosDif.Value := 0;
         edtMultaDif.Value := 0;
         edtCM.Value       := 0;
         edtJuros.Value    := 0;
         edtMulta.Value    := 0;

         // SOL137429 Kintana  831440 Felipe de Oliveira início
         //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
         //CtrlDocumento.Saldo.CalculaSaldo(cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger,edtDataVencimento.Date);
         //CtrlImobDocumento.Saldo.CalculaSaldo(cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger, edtDataVencimento.Date);
         //edtSaldoDoc.Value  := CtrlDocumento.Saldo.Valor;
         // SOL137429 Kintana  831440 Felipe de Oliveira Fim


         cdsEncargos.Filter := 'IDCONTRATOIMOVEL   = '+cdsDocumento.FieldByName('IDCONTRATOIMOVEL').AsString+
                               '  AND CODDOCUMENTO = '+cdsDocumento.FieldByName('CODDOCUMENTO').AsString;

         cdsEncargos.Filtered := True;
         cdsEncargos.First;

         while not cdsEncargos.eof do begin
            if (cdsEncargos.FieldByName('DATABAIXA').IsNull) then
            begin

               if (cdsEncargos.FieldByName('IDOPERACAO').AsInteger = iTipoOperAtualMulta) then
                  edtMultaDif.Value := edtMultaDif.Value + cdsEncargos.FieldByName('VLRACUM').AsFloat;

               if (cdsEncargos.FieldByName('IDOPERACAO').AsInteger = iTipoOperAtualJuros) then
                  edtJurosDif.Value := edtJurosDif.Value + cdsEncargos.FieldByName('VLRACUM').AsFloat;

               if (cdsEncargos.FieldByName('IDOPERACAO').AsInteger = iTipoOperAtualCM) then
                  edtCMDif.Value := edtCMDif.Value + cdsEncargos.FieldByName('VLRACUM').AsFloat;

            end
            else
            begin

               if (cdsEncargos.FieldByName('IDOPERACAO').AsInteger = iTipoOperAtualMulta) then
                  edtMulta.Value := edtMulta.Value + cdsEncargos.FieldByName('VLRACUM').AsFloat;

               if (cdsEncargos.FieldByName('IDOPERACAO').AsInteger = iTipoOperAtualJuros) then
                  edtJuros.Value := edtJuros.Value + cdsEncargos.FieldByName('VLRACUM').AsFloat;

               if (cdsEncargos.FieldByName('IDOPERACAO').AsInteger = iTipoOperAtualCM) then
                  edtCM.Value := edtCM.Value + cdsEncargos.FieldByName('VLRACUM').AsFloat;

            end;

            cdsEncargos.Next;
         end;

         // SOL137429 Kintana  831440 Felipe de Oliveira início
         // calcula o valor do saldo considerando juros,multa e correção monetária
         edtSaldoDoc.Value    := (edtVO.Value - edtVlrPago.Value) + edtMulta.Value + edtJuros.Value + edtCM.Value;
         edtTotal.Value       := (edtVO.Value - edtVlrPago.Value) + edtMultaDif.Value + edtJurosDif.Value + edtCMDif.Value +
                                 edtMulta.Value + edtJuros.Value + edtCM.Value;
         // SOL137429 Kintana  831440 Felipe de Oliveira fim                                 
         cdsEncargos.Filter   := '';
         cdsEncargos.Filtered := False;
      end;
   except
      Result := False;
   end;
end;



procedure TfrmExecRecalculoDocumentoMT.btnExcluiAlteradorClick(Sender: TObject);
var
   i : integer;
begin
   DBgrdAlteradoresLanc.SelectAll;

   if MsgDlg('Deseja realmente EXCLUIR esse(es) alterador(es)?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

   Screen.Cursor := crHourGlass;
   //Helen - SOL 174558 Kintana 1573531 Inicio
   if not CtrlLookRecalculo.InTransaction then
      CtrlLookRecalculo.StartTransaction;
   //CtrlLookRecalculo.StartTransaction;
   //Helen - SOL 174558 Kintana 1573531 Fim
   try
      with DBgrdAlteradoresLanc, DBgrdAlteradoresLanc.datasource.dataset do begin
         DisableControls;
         for i:= 0 to SelectedList.Count-1 do begin
            GotoBookmark(SelectedList.items[i]);
            Freebookmark(SelectedList.items[i]);

            //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
            // Some com o LancToDocum e desfaz a contabilização se houver
            {CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);

            CtrlDocumento.UsaPlanoPatro         := Sistema.UsaPlanoPatro;

            CtrlDocumento.IdUsuario             := Sistema.IdUsuario;   // Daniel Simões - P: 22481 - 30/05/2006
            CtrlDocumento.IdEspAcesso           := Sistema.IdEspAcesso; // Daniel Simões - P: 22481 - 30/05/2006

            CtrlDocumento.CodDocumento          := cdsAlteradoresLanc.FieldByName('CODDOCUMENTO').asInteger;
            CtrlDocumento.Lanctodocum.NumLancto := cdsAlteradoresLanc.FieldByName('NUMLANCTO').asInteger;

            if not CtrlDocumento.Delete then
               raise exception.create(CtrlDocumento.MessageInfo);}
            CtrlImobDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);

            CtrlImobDocumento.UsaPlanoPatro         := Sistema.UsaPlanoPatro;

            CtrlImobDocumento.IdUsuario             := Sistema.IdUsuario;   // Daniel Simões - P: 22481 - 30/05/2006
            CtrlIMobDocumento.IdEspAcesso           := Sistema.IdEspAcesso; // Daniel Simões - P: 22481 - 30/05/2006

            CtrlImobDocumento.CodDocumento          := cdsAlteradoresLanc.FieldByName('CODDOCUMENTO').asInteger;
            CtrlImobDocumento.Lanctodocum.NumLancto := cdsAlteradoresLanc.FieldByName('NUMLANCTO').asInteger;

            if not CtrlImobDocumento.Delete then
               raise exception.create(CtrlIMobDocumento.MessageInfo);
         end;
         SelectedList.clear;

         EnableControls;
      end;

      CtrlLookRecalculo.Commit;
      cdsAlteradoresLanc.Data    := CtrlLookRecalculo.LookupAlteradoresLancados(StrToInt(MS_Documento.ValoresChave[0]));
      btnExcluiAlterador.Enabled := not cdsAlteradoresLanc.IsEmpty;

      MsgDlg('Alterador(es) excluído(s) com sucesso.', 'Informação', mtInformation, [mbOk], 0);
      Repaint;

      Screen.Cursor := crDefault;
   except
      //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
      {MsgDlg('Problemas ao se excluir o(s) Alterador(es).' +#13+
             CtrlDocumento.MessageInfo, 'Informação', mtInformation, [mbOk], 0);}
      MsgDlg('Problemas ao se excluir o(s) Alterador(es).' +#13+
              CtrlImobDocumento.MessageInfo, 'Informação', mtInformation, [mbOK], 0);
      CtrlLookRecalculo.RollBack;
      Repaint;
      Screen.Cursor := crDefault;
   end;
end;



function TfrmExecRecalculoDocumentoMT.VerificaPreenchimento: Boolean;
begin
  Result := True;

  try
     if (cboIndiceReajuste.Text <> '') and (SpinMesesAnteriores.Value < 0) then
        raise EValidacao.CreateVal('É necessário indicar a periodicidade da Correção Monetária!', SpinMesesAnteriores);

     if (edtVlrMulta.Value <> 0) and (DBcboMoedaMulta.Text = '') then
        raise EValidacao.CreateVal('É necessário indicar a moeda da multa!', DBcboMoedaMulta);

     if (edtVlrMulta.Value <> 0) and (edtPercentMulta.Value <> 0) then
        raise EValidacao.CreateVal('A multa deve ser escolhida por valor ou percentual!', edtVlrMulta);

     if (edtVlrMora.Value <> 0) and (DBedtMoedaMora.Text = '') then
        raise EValidacao.CreateVal('É necessário indicar a moeda do juros de mora!', DBedtMoedaMora);

     if (edtVlrMora.Value <> 0) and (edtPercentMora.Value <> 0) then
        raise EValidacao.CreateVal('O juros de mora deve ser escolhido por valor ou percentual!', edtVlrMora);

     if ((edtVlrMora.Value <> 0) or (edtPercentMora.Value <> 0)) and (dbCboPeriodicidade.Text = '') then
        raise EValidacao.CreateVal('É necessário indicar a periodicidade do juros de mora!', dbCboPeriodicidade);

     if (iTipoOperAtualMulta > 0) or
        (iTipoOperAtualJuros > 0) or
        (iTipoOperAtualCM    > 0) then
     begin
        if edtDataVencimento.Date <= dDataFechamento then
           raise EValidacao.CreateVal('Data de recálculo deve ser superior ao último fechamento realizado em ' + FormatDateTime('dd/mm/yyyy',dDataFechamento) +'!', edtDataVencimento);
     end;

  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      Result := False;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;

  end;

end;



function TfrmExecRecalculoDocumentoMT.VerificaPreenchimentoDoc: Boolean;
var
   sTipoImovel : String;
begin
   Result := True;

   try

      if (not cdsAlteradoresLanc.IsEmpty) and (bAtualizaDiaria) then
         raise EValidacao.CreateVal('Para recalcular a cobrança é necessário que todos os alteradores sejam excluídos.',btnExcluiAlterador);

      if DBcboPortadorForma.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário informar a Forma de Recebimento.',DBcboPortadorForma);

      if memEvento.Text = '' then
         raise EValidacao.CreateVal('Informe a descrição para o evento do documento.',memEvento);

      sTipoImovel := cdsDocumento.FieldByName('CODTIPIMOVEL').AsString;

      if (edtMulta.Value <> 0) or (edtMultaDif.Value <> 0) then
         if cdsAlteradores.FieldByName('CODALTMULTA').IsNull then
            raise EValidacao.CreateVal('Alterador de Multa para o tipo de imovel ' + sTipoImovel + ' não foi informado.',memEvento);

      if (edtJuros.Value <> 0) or (edtJurosDif.Value <> 0) then
         if cdsAlteradores.FieldByName('CODALTJUROS').IsNull then
            raise EValidacao.CreateVal('Alterador de Juros para o tipo de imovel ' + sTipoImovel + ' não foi informado.',memEvento);

      if (edtCM.Value <> 0) or (edtCMDif.Value <> 0) then
         if cdsAlteradores.FieldByName('CODALTCM').IsNull then
            raise EValidacao.CreateVal('Alterador de Correção Monetária para o tipo de imovel ' + sTipoImovel + ' não foi informado.',memEvento);

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         Result := False;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
end;



procedure TfrmExecRecalculoDocumentoMT.btnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimentoDoc then
   begin
      if MsgDlg('Deseja realmente lançar os valores no Contas a Receber?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
         //Helen - SOL 174750 Kintana 1584344 - Inicio
         //CtrlLookRecalculo.StartTransaction;
         if not CtrlLookRecalculo.InTransaction then
           CtrlLookRecalculo.StartTransaction;
         //Helen - SOL 174750 Kintana 1584344 - Fim
         try
            GravaMensagens;
            GravaCalculo;
            GravaPortadorForma;
            CtrlLookRecalculo.Commit;
            SelecionaDocumento(-1);
            PagControle.ActivePageIndex := 0;
            btnVoltarClick(Self);
            btnContinuarClick(Self);
         except
            CtrlLookRecalculo.RollBack;
            Raise;
            Repaint;
         end;
         inherited;
      end;
   end;
end;



procedure TfrmExecRecalculoDocumentoMT.GravaMensagens;
var
   vMsg: array[0..8] of String;
   sData              : String;
   sParc              : String;
   sVo                : String;
   sCm                : String;
   sJuros             : String;
   sMulta             : String;
   iCodigo            : Integer;
   iDocumento         : Integer;
   i                  : Integer;
begin
   iCodigo    := -1;
   iDocumento := -1;

   for i:= 0 to 8 do
      vMsg[i] := TEdit(FindComponent('edtln'+inttostr(i+1))).Text;

   sData  := FormatDateTime('dd/mm/yyyy', edtDataVencimento.Date);

   sVo    := FormatFloat('#,##0.00', edtVO.Value);
   sCm    := FormatFloat('#,##0.00', edtCm.Value + edtCMDif.Value);
   sJuros := FormatFloat('#,##0.00', edtJuros.Value + edtJurosDif.Value);
   sMulta := FormatFloat('#,##0.00', edtMulta.Value + edtMultaDif.Value);

   if Sistema.IdModulo = 64 then
   begin
      FuncoesImob.SubstituiCuringa(vMsg, ['<dataval>','<vo>','<cm>','<juros>','<multa>'], [sData, sVo, sCm, sJuros, sMulta]);
   end
   else
   begin
      sParc  := cdsDocumento.FieldByName('NUMPARCELA').AsString;

      FuncoesImob.SubstituiCuringa(vMsg, ['<dataval>','<parc>','<vo>','<cm>','<juros>','<multa>'],
                                         [sData, sParc, sVo, sCm, sJuros, sMulta]);
   end;

   if not cdsDocumento.FieldByName('CODGRUPOCNAB').IsNull then
      iCodigo := cdsDocumento.FieldByName('CODGRUPOCNAB').AsInteger
   else
      iDocumento := cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger;

   if not CtrlLookRecalculo.UpdateMensagemCnab(iCodigo,
                                               iDocumento,
                                               vMsg[0],
                                               vMsg[1],
                                               vMsg[2],
                                               vMsg[3],
                                               vMsg[4],
                                               vMsg[5],
                                               vMsg[6],
                                               vMsg[7],
                                               vMsg[8]) then
   begin
      MsgDlg(CtrlLookRecalculo.MessageInfo,'Aviso',mtInformation,[mbOK],0);
      Exit;
   end;

   if not CtrlLookRecalculo.UpdateDocumento(cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger) then
   begin
      MsgDlg(CtrlLookRecalculo.MessageInfo,'Aviso',mtInformation,[mbOK],0);
      Exit;
   end;

   // atualizar as mensagens dos lançamentos
   FuncoesImob.UpdateMsgLanc(cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger,vMsg);
end;



procedure TfrmExecRecalculoDocumentoMT.GravaCalculo;
var
   iErro        : Integer;
   iDocumento   : Integer;
   bContabiliza : Boolean;
   dDtLancto    : TDateTime;
   fTotMulta    : Extended;
   fTotJuros    : Extended;
   fTotCM       : Extended;

   fDifMulta    : Extended;
   fDifJuros    : Extended;
   fDifCM       : Extended;

begin
   Repaint;
   try
      iDocumento  := cdsDocumento.FieldByName('CODDOCUMENTO').asInteger;

      if edtDataPagto.Text <> '' then dDtLancto := edtDataPagto.Date
      else                            dDtLancto := edtDataVencimento.DateTime;

      fTotMulta    := edtMulta.Value + edtMultaDif.Value;
      fTotJuros    := edtJuros.Value + edtJurosDif.Value;
      fTotCM       := edtCM.Value    + edtCMDif.Value;

      fDifMulta    := 0;
      fDifJuros    := 0;
      fDifCM       := 0;

      if bAtualizaDiaria then
      begin
         if edtMulta.Value <> 0 then
         begin
            if iTipoOperAtualMulta > 0 then
                 bContabiliza := False
            else bContabiliza := True;
            //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
            // Prepara a função para lançar o alterador MULTA
            {CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( dDtLancto,
                                                 iDocumento,
                                                 0,
                                                 edtMulta.Value,
                                                 0,
                                                 edtMulta.Value,
                                                 0,
                                                 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTMULTA').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Multa',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlDocumento.Insert then
               raise exception.Create( CtrlDocumento.MessageInfo );}

            CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
            CtrlImobDocumento.OpenTransaction := False;
            CtrlImobDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlImobDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlImobDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlImobDocumento.IdModulo        := Sistema.idModulo;

            CtrlImobDocumento.Lanctodocum.SetValues( dDtLancto,
                                                 iDocumento,
                                                 0,
                                                 edtMulta.Value,
                                                 0,
                                                 edtMulta.Value,
                                                 0,
                                                 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTMULTA').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Multa',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlImobDocumento.Insert then
               raise exception.Create( CtrlImobDocumento.MessageInfo );
         end;

         // MULTA DA DIFERENÇA ------------------------------------------------------------------------
         if edtMultaDif.Value <> 0 then begin
            if iTipoOperAtualMulta > 0 then
                 bContabiliza := False
            else bContabiliza := True;

            {CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                                 iDocumento,
                                                 0,
                                                 edtMultaDif.Value,
                                                 0,
                                                 edtMultaDif.Value,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTMULTA').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Multa sobre a diferença',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlDocumento.Insert then
               raise exception.Create( CtrlDocumento.MessageInfo );}

            CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
            CtrlImobDocumento.OpenTransaction := False;
            CtrlImobDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlImobDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlImobDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlImobDocumento.IdModulo        := Sistema.idModulo;

            CtrlImobDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                                 iDocumento,
                                                 0,
                                                 edtMultaDif.Value,
                                                 0,
                                                 edtMultaDif.Value,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTMULTA').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Multa sobre a diferença',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlImobDocumento.Insert then
               raise exception.Create( CtrlImobDocumento.MessageInfo );
         end;

         // JUROS (MORA) DO PRINCIPAL ------------------------------------------------------------------------
         if edtJuros.Value <> 0 then begin
            if iTipoOperAtualJuros > 0 then
                 bContabiliza := False
            else bContabiliza := True;

            // Prepara a função para lançar o alterador de JUROS
            {CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( dDtLancto,
                                                 iDocumento,
                                                 0,
                                                 edtJuros.Value,
                                                 0,
                                                 edtJuros.Value,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTJUROS').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Juros',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlDocumento.Insert then
               raise exception.Create( CtrlDocumento.MessageInfo );}

            CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
            CtrlImobDocumento.OpenTransaction := False;
            CtrlImobDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlImobDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlImobDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlImobDocumento.IdModulo        := Sistema.idModulo;

            CtrlImobDocumento.Lanctodocum.SetValues( dDtLancto,
                                                 iDocumento,
                                                 0,
                                                 edtJuros.Value,
                                                 0,
                                                 edtJuros.Value,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTJUROS').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Juros',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlImobDocumento.Insert then
               raise exception.Create( CtrlImobDocumento.MessageInfo );
         end;

         // JUROS (MORA) DA DIFERENÇA -------------------------------------------------------------------
         if edtJurosDif.Value <> 0 then begin
            if iTipoOperAtualJuros > 0 then
                 bContabiliza := False
            else bContabiliza := True;

            // Prepara a função para lançar o alterador de JUROS
            {CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                                 iDocumento,
                                                 0,
                                                 edtJurosDif.Value,
                                                 0,
                                                 edtJurosDif.Value,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTJUROS').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Juros sobre a diferença',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlDocumento.Insert then
               raise exception.Create( CtrlDocumento.MessageInfo );}

            CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
            CtrlImobDocumento.OpenTransaction := False;
            CtrlImobDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlImobDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlImobDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlImobDocumento.IdModulo        := Sistema.idModulo;

            CtrlImobDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                                 iDocumento,
                                                 0,
                                                 edtJurosDif.Value,
                                                 0,
                                                 edtJurosDif.Value,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTJUROS').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Juros sobre a diferença',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlImobDocumento.Insert then
               raise exception.Create( CtrlImobDocumento.MessageInfo );
         end;

         // CORREÇÃO MONETÁRIA DO PRINICPAL ------------------------------------------------------------------
         if edtCM.Value <> 0 then begin
            if iTipoOperAtualCM > 0 then
               bContabiliza := False
            else bContabiliza := True;
         
            // Prepara a função para lançar o alterador de CM
            {CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( dDtLancto,
                                                 iDocumento,
                                                 0,
                                                 edtCM.Value,
                                                 0,
                                                 edtCM.Value,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTCM').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Correção Monetária',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlDocumento.Insert then
               raise exception.Create( CtrlDocumento.MessageInfo );}

            CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
            CtrlImobDocumento.OpenTransaction := False;
            CtrlImobDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlImobDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlImobDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlImobDocumento.IdModulo        := Sistema.idModulo;

            CtrlImobDocumento.Lanctodocum.SetValues( dDtLancto,
                                                 iDocumento,
                                                 0,
                                                 edtCM.Value,
                                                 0,
                                                 edtCM.Value,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTCM').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Correção Monetária',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlImobDocumento.Insert then
               raise exception.Create( CtrlImobDocumento.MessageInfo );
         end;

         // CORREÇÃO MONETÁRIA DA DIFERENÇA ------------------------------------------------------------------
         if edtCMDif.Value <> 0 then begin
            if iTipoOperAtualCM > 0 then
                 bContabiliza := False
            else bContabiliza := True;

            {CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                                 iDocumento,
                                                 0,
                                                 edtCMDif.Value,
                                                 0,
                                                 edtCMDif.Value,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTCM').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Correção Monetária sobre a difereça',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlDocumento.Insert then
               raise exception.Create( CtrlDocumento.MessageInfo );}

            CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
            CtrlImobDocumento.OpenTransaction := False;
            CtrlImobDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlImobDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlImobDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlImobDocumento.IdModulo        := Sistema.idModulo;

            CtrlImobDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                                 iDocumento,
                                                 0,
                                                 edtCMDif.Value,
                                                 0,
                                                 edtCMDif.Value,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTCM').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Correção Monetária sobre a difereça',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlImobDocumento.Insert then
               raise exception.Create( CtrlImobDocumento.MessageInfo );
         end;
      end
      else
      begin
         fTotMulta    := edtMulta.Value + edtMultaDif.Value;
         fTotJuros    := edtJuros.Value + edtJurosDif.Value;
         fTotCM       := edtCM.Value    + edtCMDif.Value;

         fDifMulta    := 0;
         fDifJuros    := 0;
         fDifCM       := 0;

         // Calcula a Diferenca para alterador de multa já cadastrado
         if cdsAlteradoresLanc.Locate('CODALTERADOR',cdsAlteradores.FieldByName('CODALTMULTA').AsInteger,[]) then
            fDifMulta := fTotMulta - cdsAlteradoresLanc.FieldByName('VALOR').AsFloat
         else
            fDifMulta := fTotMulta;

         // Calcula a Diferenca para alterador de juros já cadastrado
         if cdsAlteradoresLanc.Locate('CODALTERADOR',cdsAlteradores.FieldByName('CODALTJUROS').AsInteger,[]) then
            fDifJuros := fTotJuros - cdsAlteradoresLanc.FieldByName('VALOR').AsFloat
         else
            fDifJuros := fTotJuros;

         // Calcula a Diferenca para alterador de correção monetária já cadastrado
         if cdsAlteradoresLanc.Locate('CODALTERADOR',cdsAlteradores.FieldByName('CODALTCM').AsInteger,[]) then
            fDifCM := fTotCM - cdsAlteradoresLanc.FieldByName('VALOR').AsFloat 
         else
            fDifCM := fTotCM;

         if fDifMulta <> 0 then
         begin
            if iTipoOperAtualMulta > 0 then
                 bContabiliza := False
            else bContabiliza := True;

            // Prepara a função para lançar o alterador MULTA
            {CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                                 iDocumento,
                                                 0,
                                                 fDifMulta,
                                                 0,
                                                 fDifMulta,
                                                 0,
                                                 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTMULTA').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Multa sobre a diferença',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlDocumento.Insert then
               raise exception.Create( CtrlDocumento.MessageInfo );}

            CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
            CtrlImobDocumento.OpenTransaction := False;
            CtrlImobDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlImobDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlImobDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlImobDocumento.IdModulo        := Sistema.idModulo;

            CtrlImobDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                                 iDocumento,
                                                 0,
                                                 fDifMulta,
                                                 0,
                                                 fDifMulta,
                                                 0,
                                                 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTMULTA').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Multa sobre a diferença',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlImobDocumento.Insert then
               raise exception.Create( CtrlImobDocumento.MessageInfo );
         end;

         // JUROS (MORA) DA DIFERENÇA -------------------------------------------------------------------
         if fDifJuros <> 0 then begin
            if iTipoOperAtualJuros > 0 then
                 bContabiliza := False
            else bContabiliza := True;

            // Prepara a função para lançar o alterador de JUROS
            {CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                                 iDocumento,
                                                 0,
                                                 fDifJuros,
                                                 0,
                                                 fDifJuros,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTJUROS').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Juros sobre a diferença',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlDocumento.Insert then
               raise exception.Create( CtrlDocumento.MessageInfo );}

            CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
            CtrlImobDocumento.OpenTransaction := False;
            CtrlImobDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlImobDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlImobDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlImobDocumento.IdModulo        := Sistema.idModulo;

            CtrlImobDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                                 iDocumento,
                                                 0,
                                                 fDifJuros,
                                                 0,
                                                 fDifJuros,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTJUROS').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Juros sobre a diferença',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlImobDocumento.Insert then
               raise exception.Create( CtrlImobDocumento.MessageInfo );
         end;

         if fDifCM <> 0 then begin
            if iTipoOperAtualCM > 0 then
                 bContabiliza := False
            else bContabiliza := True;

            {CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                                 iDocumento,
                                                 0,
                                                 fDifCM,
                                                 0,
                                                 fDifCM,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTCM').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Correção Monetária sobre a difereça',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlDocumento.Insert then
               raise exception.Create( CtrlDocumento.MessageInfo );}

            CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
            CtrlImobDocumento.OpenTransaction := False;
            CtrlImobDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlImobDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlImobDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlImobDocumento.IdModulo        := Sistema.idModulo;

            CtrlImobDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                                 iDocumento,
                                                 0,
                                                 fDifCM,
                                                 0,
                                                 fDifCM,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTCM').AsInteger,
                                                 '4',
                                                 '', '', '',
                                                 'Correção Monetária sobre a difereça',
                                                 '', '', '',
                                                 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlImobDocumento.Insert then
               raise exception.Create( CtrlImobDocumento.MessageInfo );
         end;


      end;

      // Vinicius - 07/12/2004 - Pendência 17957
      CtrlEventoImovel.RegistraEvento(-1,-1,-1, iDocumento, Sistema.IdUsuario, 'RD',
                                      'Recálculo de Cobrança', memEvento.Text,
                                      edtDataVencimento.Date, -1, -1, 0, 0, 0, False,
                                      iff(cbAviso.Checked, 'S', 'N'),
                                      iff(cbAviso.Checked, StrToInt(spnDiasAviso.Text), 0) );

      MsgDlg('Os valores foram lançados no Contas a Receber.', 'Informação', mtInformation, [mbOk], 0);
      Repaint;

   except
      //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
      //MsgDlg('Houve erro durante a tentativa de integração com o Contas a Receber.'+#13+
      //       'CAR - '+CtrlDocumento.MessageInfo, 'Erro', mtError, [mbOk], 0);
      MsgDlg('Houve erro durante a tentativa de integração com o Contas a Receber.'+#13+
             'CAR - ' + CtrlImobDocumento.MessageInfo, 'Erro', mtError, [mbOK], 0);
      Repaint;
   end;
end;



procedure TfrmExecRecalculoDocumentoMT.GravaPortadorForma;
begin
   CtrlLookRecalculo.UpdatePortadorForma(cdsDocumento.FieldByName('CODDOCUMENTO').asInteger,
                                         cdsDocumento.FieldByName('CODPORTFORMA_LANC').AsInteger,
                                         StrToInt(DBcboPortadorForma.LookupValue),
                                         cbDataProgramada.Checked,
                                         edtDataVencimento.Date);
end;



procedure TfrmExecRecalculoDocumentoMT.DBcboPortadorFormaChange(Sender: TObject);
begin
   chkBoleto.Checked := not(cdsPortadorForma.FieldByName('IDCONFIGBARRAS').IsNull);
end;



procedure TfrmExecRecalculoDocumentoMT.edtCMExit(Sender: TObject);
begin
   edtSaldoDoc.Value := edtVO.Value - edtVlrPago.Value + edtCM.Value + edtJuros.Value + edtMulta.Value;
   edtTotal.Value    := edtSaldoDoc.Value + edtCMDif.Value + edtJurosDif.Value + edtMultaDif.Value;
end;



procedure TfrmExecRecalculoDocumentoMT.SelecionaDocumento(iDocumento: Integer);
begin
   cdsDocumento.Data          := CtrlLookRecalculo.LookupDocumento(iDocumento);
   cdsLancamentos.Data        := CtrlLookRecalculo.LookupLancamentos(iDocumento);
   cdsAlteradoresDoc.Data     := CtrlLookRecalculo.LookupAlteradoresDoc(iDocumento);
   cdsAlteradores.Data        := CtrlLookRecalculo.LookupAlteradores(iDocumento);
   cdsAlteradoresLanc.Data    := CtrlLookRecalculo.LookupAlteradoresLancados(iDocumento);
   btnExcluiAlterador.Enabled := (not cdsAlteradoresLanc.IsEmpty) and (bAtualizaDiaria);
   DBcboPortadorForma.LookupValue := cdsDocumento.FieldByName('CODPORTFORMA_LANC').AsString;

   if iDocumento > 0 then
      cdsDocumentoCalcFields(cdsDocumento);

   TFloatField(cdsDocumento.FieldByName('VALOR_LIQUIDO')).EditMask      := ',0.00';
   TFloatField(cdsDocumento.FieldByName('VALOR_LIQUIDO')).DisplayFormat := ',0.00';
   TFloatField(cdsAlteradoresLanc.FieldByName('VALOR')).EditMask        := ',0.00';
   TFloatField(cdsAlteradoresLanc.FieldByName('VALOR')).DisplayFormat   := ',0.00';
end;



end.
