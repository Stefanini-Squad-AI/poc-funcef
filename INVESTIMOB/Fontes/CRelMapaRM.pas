{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelMapaRM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, ComCtrls, ExtCtrls, StdCtrls, Mask, wwdbedit, Wwdbspin, TREdit,
  wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  Db, DBTables, Wwquery, Pptypes, ppPrvDlg, ppforms, fcCombo, fcColorCombo;

type
  TcfgRelMapaRM = class(TcfgRel)
    grpAtuarial: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Image2: TImage;
    edtAtuarialPrevisto: TRealEdit;
    edtAtuarialSoma: TRealEdit;
    grpReferencia: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    qryIndice: TwwQuery;
    qryIndiceMOESIGLA: TStringField;
    qryIndiceMOECODIGO: TFloatField;
    qryIndiceMOEDESC: TStringField;
    qryIndiceMOEPERIODICIDADE: TStringField;
    qryIndiceMOEINATIVO: TStringField;
    qryIndiceFLGPERCVALOR: TStringField;
    qryIndiceDATAINICIO: TDateTimeField;
    qryIndiceDATAFIM: TDateTimeField;
    Label6: TLabel;
    DBcboIndiceCorrecao: TwwDBLookupCombo;
    chkVlrCorrigido: TCheckBox;
    rdgAtuarial: TRadioGroup;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    Bevel2: TBevel;
    Panel1: TPanel;
    lblProgress: TLabel;
    ProgressBar: TProgressBar;

    // procedimentos definidos
    function VerificaPreenchimento: boolean;

    procedure MontaQuery;   override;
    procedure FechaQueries; override;

    procedure ProcessaAtualizacao;

    function DataMaisAntigaAquisicao: TDateTime;
    function VlrAquisicaoCorrigidoMestre(iMestre: integer): extended;
    function AluguelMestre(iMestre: integer; iAnoAluguel, iMesAluguel: word): currency;

    // outros procedimentos
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure chkVlrCorrigidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);



  private { Private declarations }
   iIndiceCorrecao   : integer;
   fFatorAtuarial    : extended;
   dDataContabil     : TDateTime;
   iAnoAlug,iMesAlug : word;

  public { Public declarations }

  end;



var
  cfgRelMapaRM: TcfgRelMapaRM;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDiasInUteis, uComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobRentab, uFuncoesImob, FEspera, uModuloImobiliario;



function TcfgRelMapaRM.VerificaPreenchimento: boolean;
var  dDataIniCorrecao : TDateTime;
begin
   Result := False;

   try
      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Mês!', cboMes);

      if DBspnAno.Value <= 0 then
         raise EValidacao.CreateVal('É necessário indicar o Ano!', DBspnAno);

      if (not chkVlrCorrigido.Checked) and (DBcboIndiceCorrecao.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o Índice de Correção!', DBcboIndiceCorrecao);

      if (not chkVlrCorrigido.Checked) and (DBcboIndiceCorrecao.LookupValue <> '') then begin
         dDataIniCorrecao := DataMaisAntigaAquisicao;
         if FuncoesImob.BuscaCotacao(StrToInt(DBcboIndiceCorrecao.LookupValue), dDataIniCorrecao , False) = -1 then
            raise EValidacao.CreateVal('O Índice de Correção selecionado não pode ser aplicado! '+#13+
                                       'Existem imóveis adquiridos com data inferior ao início  '+#13+
                                       'da cotação do indice selecionado. ( '+ DateToStr(dDataIniCorrecao)+' )'+#13+
                                       'Favor selecionar outro Índice.', DBcboIndiceCorrecao);
      end;
   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TcfgRelMapaRM.MontaQuery;
var dDataPeriodo,dRecIni,dRecFim : TDateTime;
    iAnoRec,iMesRec : word;
begin
   // Define competência de Recebimento
   iMesRec := (cboMes.ItemIndex + 1);
   iAnoRec := StrToInt(IntToStr(trunc(DBspnAno.Value)));
   dRecIni := EncodeDate(iAnoRec, iMesRec, 1);
   dRecFim := DiasInUteis.UltDiaMes(iAnoRec, iMesRec);

   // Define competência de Aluguel
   iMesAlug := iMesRec - 1;
   iAnoAlug := iAnoRec;
   if iMesAlug <= 0 then begin
     iMesAlug := 12;
     iAnoAlug := iAnoAlug - 1;
   end;

   // baseia o custo contábil no último dia do mês anterior a competencia do Aluguel
   dDataPeriodo  := DiasInUteis.SomaMeses(EncodeDate(iAnoAlug, iMesAlug, 1), -1);
   dDataContabil := DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(dDataPeriodo), DiasInUteis.ExtraiMes(dDataPeriodo));

   with dtmRelAdminImobRentab do begin

      fFatorAtuarial := ( 1 + edtAtuarialPrevisto.Value / 100) * ( 1 + edtAtuarialSoma.Value / 100) - 1;

      // verifica se é necessária a correção do Vlr de Aquisição
      if not(chkVlrCorrigido.Checked) then iIndiceCorrecao  := StrToInt(DBcboIndiceCorrecao.LookupValue);

      // preenche as labels do relatório
      case rdgAtuarial.ItemIndex of
         0: rptMapaRM_lblCalculoAtuarial.Caption := 'Mínimo Atuarial baseado no Custo Contábil';
         1: rptMapaRM_lblCalculoAtuarial.Caption := 'Mínimo Atuarial baseado no Valor Corrigido';
      end;
      rptMapaRM_lblMesRecebto.Caption        := cboMes.Items.Strings[iMesRec  - 1] + ' / ' + IntToStr(iAnoRec);
      rptMapaRM_lblMesAluguel.Caption        := cboMes.Items.Strings[iMesAlug - 1] + ' / ' + IntToStr(iAnoAlug);
      rptMapaRM_lblDataContabil.Caption      := FormatDateTime('dd/mm/yyyy', dDataContabil);
      rptMapaRM_lblAtuarialProjetado.Caption := FormatFloat('##0.00 %;(##0.00 %)', fFatorAtuarial * 100);
      rptMapaRM_lblIndiceCorrecao.Caption    := DBcboIndiceCorrecao.Text;
      if chkVlrCorrigido.Checked then rptMapaRM_lblIndiceCorrecao.Caption := ' < NÃO >';

      // determina se imprime linha separadora ou em cores alternadas no relatorio
      bSeparador := chkLinhas.Checked;
      bCorlinha  := chkCorLinha.Checked;
      CorLinha   := cboCorLinha.SelectedColor;

      // carrega parâmetros e abre a query
      LimpaParametros(dtmRelAdminImobRentab.qryMapaRM);
      qryMapaRM.ParamByName('PDATARECINI').asDateTime := dRecIni;
      qryMapaRM.ParamByName('PDATARECFIM').asDateTime := dRecFim;
      qryMapaRM.ParamByName('PDATAMOV').asDateTime    := dDataContabil;
      qryMapaRM.ParamByName('PIDPESSOA').asInteger    := Sistema.idEmpresa;
      qryMapaRM.ParamByName('PIDMOEDACAF').asInteger  := ModuloImobiliario.InvestImob.iIdMoedaCAF;
      qryMapaRM.ParamByName('PIDPAISCAF').asInteger   := ModuloImobiliario.InvestImob.iIdPaisCAF;
      qryMapaRM.Open;
   end;
end;



procedure TcfgRelMapaRM.ProcessaAtualizacao;
begin
   with dtmRelAdminImobRentab.qryMapaRM do begin
      ProgressBar.Max      := RecordCount;
      lblProgress.Visible  := True;
      ProgressBar.Visible  := True;
      ProgressBar.Position := 0;
      Repaint;
      Application.ProcessMessages;

      First;
      while not(EOF) do begin
         Edit;

         // calcula o valor corrigido
         dtmRelAdminImobRentab.qryMapaRMVLR_CORRIGIDO.AsFloat    := VlrAquisicaoCorrigidoMestre(dtmRelAdminImobRentab.qryMapaRMIDIMOVEL.asInteger);

         // calcula o Mínimo Atuarial de acordo com o método escolhido
         case rdgAtuarial.ItemIndex of
            0: dtmRelAdminImobRentab.qryMapaRMMINIMO_ATUARIAL.AsFloat  := dtmRelAdminImobRentab.qryMapaRMCUSTO_CONTABIL.AsFloat * fFatorAtuarial / 12;
            1: dtmRelAdminImobRentab.qryMapaRMMINIMO_ATUARIAL.AsFloat  := dtmRelAdminImobRentab.qryMapaRMVLR_CORRIGIDO.AsFloat * fFatorAtuarial / 12;
         end;

         dtmRelAdminImobRentab.qryMapaRMVLR_ALUGUEL.AsFloat := AluguelMestre(dtmRelAdminImobRentab.qryMapaRMIDIMOVEL.asInteger, iAnoAlug, iMesAlug);

         // se houer custo contábil faz a conta, para evitar divisão por ZERO
         if dtmRelAdminImobRentab.qryMapaRMCUSTO_CONTABIL.AsFloat <> 0 then begin
            dtmRelAdminImobRentab.qryMapaRMALUGUELXCC.AsFloat := dtmRelAdminImobRentab.qryMapaRMVLR_ALUGUEL.asFloat / dtmRelAdminImobRentab.qryMapaRMCUSTO_CONTABIL.AsFloat * 100;
            dtmRelAdminImobRentab.qryMapaRMRECEITAXCC.AsFloat := dtmRelAdminImobRentab.qryMapaRMVLR_LIQUIDO.asFloat / dtmRelAdminImobRentab.qryMapaRMCUSTO_CONTABIL.AsFloat * 100;
         end else begin
            dtmRelAdminImobRentab.qryMapaRMALUGUELXCC.AsFloat := 0;
            dtmRelAdminImobRentab.qryMapaRMRECEITAXCC.AsFloat := 0;
         end;

         // se houver custo de aquisição corrigido faz a conta, para evitar divisão por ZERO
         if dtmRelAdminImobRentab.qryMapaRMVLR_CORRIGIDO.AsFloat <> 0 then begin
            dtmRelAdminImobRentab.qryMapaRMALUGUELXVLR.AsFloat   := dtmRelAdminImobRentab.qryMapaRMVLR_ALUGUEL.asFloat / dtmRelAdminImobRentab.qryMapaRMVLR_CORRIGIDO.AsFloat * 100;
            dtmRelAdminImobRentab.qryMapaRMRECEITAXVLR.AsFloat   := dtmRelAdminImobRentab.qryMapaRMVLR_LIQUIDO.asFloat / dtmRelAdminImobRentab.qryMapaRMVLR_CORRIGIDO.AsFloat * 100;
         end else begin
            dtmRelAdminImobRentab.qryMapaRMALUGUELXVLR.AsFloat   := 0;
            dtmRelAdminImobRentab.qryMapaRMRECEITAXVLR.AsFloat   := 0;
         end;

         Post;

         ProgressBar.Position := ProgressBar.Position + 1;
         Application.ProcessMessages;

         Next;
      end;

      lblProgress.Visible  := False;
      ProgressBar.Visible  := False;
      Repaint;
      Application.ProcessMessages;
   end;
end;



function TcfgRelMapaRM.DataMaisAntigaAquisicao: TDateTime;
begin
   with dtmRelAdminImobRentab.qryDataAntiga do begin
      Close;

      SQL.Text :=
      'SELECT ' + #13 +
      '   MIN(I.IMODATACOMPRA) ' + #13 +
      'FROM ' + #13 +
      '   IMOVEL I ' + #13 +
      'WHERE ' + #13 +
      '   ( I.FLGTIPOIMOVEL = 1 ) ' + #13 +
      '   AND ( I.IMODATACOMPRA IS NOT NULL ) ' + #13 +
      '   AND ( I.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ' ) ';

      Open;

      Result := Fields[0].asDateTime;

      Close;
   end;
end;



function TcfgRelMapaRM.AluguelMestre(iMestre: integer; iAnoAluguel, iMesAluguel: word): currency;
begin
   with dtmRelAdminImobRentab.qryAluguelMestre do begin
      LimpaParametros(dtmRelAdminImobRentab.qryAluguelMestre);
      ParamByName('MESTRE').AsInteger := iMestre;
      ParamByName('MES').AsInteger    := iMesAluguel;
      ParamByName('ANO').AsInteger    := iAnoAluguel;
      Open;

      Result := dtmRelAdminImobRentab.qryAluguelMestreALUGUEL_MESTRE.asFloat;
      Close;
   end;
end;



function TcfgRelMapaRM.VlrAquisicaoCorrigidoMestre(iMestre: integer): extended;
var
   fTotalCorrigido: extended;
begin
   with dtmRelAdminImobRentab.qryImovelXMestre do begin
      LimpaParametros(dtmRelAdminImobRentab.qryImovelXMestre);
      ParamByName('MESTRE').AsInteger   := iMestre;
      Open;

      First;
      fTotalCorrigido := 0;
      while not(EOF) do begin
         fTotalCorrigido := fTotalCorrigido + dtmRelAdminImobRentab.VlrAquisicaoImovel(FieldByName('IDIMOVEL').AsInteger, iIndiceCorrecao, dDataContabil, not(chkVlrCorrigido.Checked));
         Next;
      end;

      Close;
   end;

   Result := fTotalCorrigido;
end;



procedure TcfgRelMapaRM.FechaQueries;
begin
   qryIndice.Close;
   with dtmRelAdminImobRentab do begin
      qryMapaRM.Close;
      qryDataAntiga.Close;
      qryAluguelMestre.Close;
      qryImovelxMestre.Close;
   end;
end;


procedure TcfgRelMapaRM.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin
      try
         DesabilitaBotoes;

         frmEspera.Config('Aguarde', 'Selecionando Imóveis...', False);
         frmEspera.Show;
         Application.ProcessMessages;

         MontaQuery;

         frmEspera.Hide;
         frmEspera.Config('', '', False);

         // processa o cálculo de atualização monetária e do rateio do custo contábil
         ProcessaAtualizacao;

         dtmRelAdminImobRentab.rptMapaRM.Print;
         Repaint;
      finally
         dtmRelAdminImobRentab.qryMapaRM.Close;
         HabilitaBotoes;
      end;
   end;
end;



procedure TcfgRelMapaRM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if ( (dtmRelAdminImobRentab.qryMapaRM.Active) and (dtmRelAdminImobRentab.qryMapaRM.UpdatesPending) ) then begin
      dtmRelAdminImobRentab.qryMapaRM.CancelUpdates;
   end;
   inherited;
end;


procedure TcfgRelMapaRM.FormShow(Sender: TObject);
begin
   inherited;
   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex      := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value        := DiasInUteis.ExtraiAno(Date);
   edtAtuarialSoma.Value := 6;
   qryIndice.Open;
   Screen.Cursor         := crDefault;
end;



procedure TcfgRelMapaRM.chkVlrCorrigidoClick(Sender: TObject);
begin
   inherited;
   if chkVlrCorrigido.Checked then DBcboIndiceCorrecao.Clear;
end;



procedure TcfgRelMapaRM.FormCreate(Sender: TObject);
begin
   inherited;
   ppRegisterForm(TppCustomPreviewer, TppPrintPreview);
end;



end.
