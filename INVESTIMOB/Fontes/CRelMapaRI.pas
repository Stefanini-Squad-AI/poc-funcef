unit CRelMapaRI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, ComCtrls, ExtCtrls, StdCtrls, Mask, wwdbedit, Wwdbspin, TREdit,
  wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  Db, DBTables, Wwquery, Pptypes, ppPrvDlg, ppforms, fcCombo, fcColorCombo;

type
  TcfgRelMapaRI = class(TcfgRel)
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
    Label1: TLabel;
    qryIndice: TwwQuery;
    qryIndiceMOESIGLA: TStringField;
    qryIndiceMOECODIGO: TFloatField;
    qryIndiceMOEDESC: TStringField;
    qryIndiceMOEPERIODICIDADE: TStringField;
    qryIndiceMOEINATIVO: TStringField;
    qryIndiceFLGPERCVALOR: TStringField;
    qryIndiceDATAINICIO: TDateTimeField;
    qryIndiceDATAFIM: TDateTimeField;
    chkImprimeSoComValor: TCheckBox;
    rdgAtuarial: TRadioGroup;
    Label6: TLabel;
    DBcboIndiceCorrecao: TwwDBLookupCombo;
    chkVlrCorrigido: TCheckBox;
    Bevel1: TBevel;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    Bevel2: TBevel;
    edtImovelMestre: TEdit;
    btnBuscaImovelMestre: TBitBtn;
    btnLimpaImovelMestre: TBitBtn;
    Panel1: TPanel;
    lblProgress: TLabel;
    ProgressBar: TProgressBar;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure chkVlrCorrigidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);


  private { Private declarations }
    iIndiceCorrecao  : integer;
    fFatorAtuarial   : extended;
    dDataContabil    : TDateTime;
    iAno, iMes       : word;
    iImovelMestre    : integer;

    function VerificaPreenchimento: boolean;

    procedure MontaQuery; override;
    procedure Fecha; override;

    procedure ProcessaAtualizacao;
    function DataMaisAntigaAquisicao: TDateTime;
    function AluguelImovel(iImovel: integer; iAnoAluguel, iMesAluguel: word): currency;

    procedure FechaQueriesModulo;

  public { Public declarations }

  end;



var
  cfgRelMapaRI: TcfgRelMapaRI;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDiasInUteis, uComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobRentab, uFuncoesImob, dLookImobiliario, DMS;



function TcfgRelMapaRI.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Mês!', cboMes);

      if DBspnAno.Value <= 0 then
         raise EValidacao.CreateVal('É necessário indicar o Ano!', DBspnAno);

      if not(chkVlrCorrigido.Checked) then
         if DBcboIndiceCorrecao.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário indicar o Índice de Correção!', DBcboIndiceCorrecao);

      if not(chkVlrCorrigido.Checked) then
         if DBcboIndiceCorrecao.LookupValue <> '' then
            if FuncoesImob.BuscaCotacao(StrToInt(DBcboIndiceCorrecao.LookupValue), DataMaisAntigaAquisicao, False) = -1 then
               raise EValidacao.CreateVal('O Índice de Correção selecionado não pode ser aplicado! Favor selecionar outro Índice.', DBcboIndiceCorrecao);

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



procedure TcfgRelMapaRI.MontaQuery;
var
   dDataIniPeriodo   : TDateTime;
   dDataFimPeriodo   : TDateTime;
begin
   iAno              := StrToInt(IntToStr(trunc(DBspnAno.Value)));
   iMes              := (cboMes.ItemIndex + 1);

   // define o período: do 1º ao último dia do mês de competência
   dDataIniPeriodo   := DiasInUteis.SomaMeses(EncodeDate(iAno, iMes, 1), 1);
   dDataFimPeriodo   := DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(dDataIniPeriodo), DiasInUteis.ExtraiMes(dDataIniPeriodo));

   // baseia o custo contábil no último dia do mês anterior
   dDataContabil     := DiasInUteis.SomaMeses(dDataFimPeriodo, -2);

   with dtmRelAdminImobRentab do begin

      fFatorAtuarial       := ( 1 + edtAtuarialPrevisto.Value / 100) * ( 1 + edtAtuarialSoma.Value / 100) - 1;

      case rdgAtuarial.ItemIndex of
         0: rptMapaRI_lblCalculoAtuarial.Caption := 'Mínimo Atuarial baseado no Custo Contábil';
         1: rptMapaRI_lblCalculoAtuarial.Caption := 'Mínimo Atuarial baseado no Valor Corrigido';
      end;

      // verifica se é necessária a correção do Vlr de Aquisição
      if not(chkVlrCorrigido.Checked) then iIndiceCorrecao  := StrToInt(DBcboIndiceCorrecao.LookupValue);

      // preenche as labels do relatório
      rptMapaRI_lblMesCompetencia.Caption      := cboMes.Text + ' / ' + IntToStr(iAno);
      rptMapaRI_lblDataContabil.Caption        := FormatDateTime('dd/mm/yyyy', dDataContabil);

      rptMapaRI_lblAtuarialProjetado.Caption   := FormatFloat('##0.00 %;(##0.00 %)', fFatorAtuarial * 100);
      rptMapaRI_lblIndiceCorrecao.Caption      := DBcboIndiceCorrecao.Text;

      if chkVlrCorrigido.Checked then rptMapaRI_lblIndiceCorrecao.Caption := ' < NÃO >';

      // indica quais imóveis imprimir
      bImprimeSoComValor := chkImprimeSoComValor.Checked;

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

      // monta a query
      with qryMapaRI do begin

         ParamByName('PDATAMOV').asDateTime  := dDataContabil;
         ParamByName('PIDPESSOA').asInteger  := Sistema.idEmpresa;

         if edtImovelMestre.Text <> '' then ParamByName('PIDIMOVELMESTRE').asInteger := iImovelMestre;

         Open;
      end;
   end;
end;



procedure TcfgRelMapaRI.Fecha;
begin

end;



procedure TcfgRelMapaRI.ProcessaAtualizacao;
begin
   with dtmRelAdminImobRentab.qryMapaRI do begin

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
         dtmRelAdminImobRentab.qryMapaRIVLR_CORRIGIDO.AsFloat    := dtmRelAdminImobRentab.VlrAquisicaoImovel(dtmRelAdminImobRentab.qryMapaRIIDIMOVEL.asInteger, iIndiceCorrecao, dDataContabil, not(chkVlrCorrigido.Checked));

         // calcula o Mínimo Atuarial de acordo com o método escolhido
         case rdgAtuarial.ItemIndex of
            0: dtmRelAdminImobRentab.qryMAPARIMINIMO_ATUARIAL.AsFloat  := dtmRelAdminImobRentab.qryMAPARICUSTO_CONTABIL.AsFloat * fFatorAtuarial / 12;
            1: dtmRelAdminImobRentab.qryMAPARIMINIMO_ATUARIAL.AsFloat  := dtmRelAdminImobRentab.qryMAPARIVLR_CORRIGIDO.AsFloat * fFatorAtuarial / 12;
         end;

         dtmRelAdminImobRentab.qryMapaRIVLR_ALUGUEL.AsFloat      := AluguelImovel(dtmRelAdminImobRentab.qryMapaRIIDIMOVEL.asInteger, iAno, iMes);

         // se houer custo contábil faz a conta, para evitar divisão por ZERO
         if dtmRelAdminImobRentab.qryMapaRICUSTO_CONTABIL.AsFloat <> 0 then begin
            dtmRelAdminImobRentab.qryMapaRIALUGUELXCC.AsFloat    := dtmRelAdminImobRentab.qryMapaRIVLR_ALUGUEL.asFloat / dtmRelAdminImobRentab.qryMapaRICUSTO_CONTABIL.AsFloat * 100;
            dtmRelAdminImobRentab.qryMapaRIRECEITAXCC.AsFloat    := dtmRelAdminImobRentab.qryMapaRIVLR_LIQUIDO.asFloat / dtmRelAdminImobRentab.qryMapaRICUSTO_CONTABIL.AsFloat * 100;
         end else begin
            dtmRelAdminImobRentab.qryMapaRIALUGUELXCC.AsFloat    := 0;
            dtmRelAdminImobRentab.qryMapaRIRECEITAXCC.AsFloat    := 0;
         end;

         // se houver custo de aquisição corrigido faz a conta, para evitar divisão por ZERO
         if dtmRelAdminImobRentab.qryMapaRIVLR_CORRIGIDO.AsFloat <> 0 then begin
            dtmRelAdminImobRentab.qryMapaRIALUGUELXVLR.AsFloat   := dtmRelAdminImobRentab.qryMapaRIVLR_ALUGUEL.asFloat / dtmRelAdminImobRentab.qryMapaRIVLR_CORRIGIDO.AsFloat * 100;
            dtmRelAdminImobRentab.qryMapaRIRECEITAXVLR.AsFloat   := dtmRelAdminImobRentab.qryMapaRIVLR_LIQUIDO.asFloat / dtmRelAdminImobRentab.qryMapaRIVLR_CORRIGIDO.AsFloat * 100;
         end else begin
            dtmRelAdminImobRentab.qryMapaRIALUGUELXVLR.AsFloat   := 0;
            dtmRelAdminImobRentab.qryMapaRIRECEITAXVLR.AsFloat   := 0;
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



function TcfgRelMapaRI.DataMaisAntigaAquisicao: TDateTime;
begin
   with dtmRelAdminImobRentab.qryDataAntiga do begin
      Close;

      SQL.Text :=
      'SELECT ' + chr(13) +
      '   MIN(I.IMODATACOMPRA) ' + chr(13) +
      'FROM ' + chr(13) +
      '   IMOVEL I ' + chr(13) +
      'WHERE ' + chr(13) +
      '   ( I.FLGTIPOIMOVEL = 1 ) ' + chr(13) +
      '   AND ( I.IMODATACOMPRA IS NOT NULL ) ' + chr(13) +
      '   AND ( I.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ' ) ';

      if edtImovelMestre.Text <> '' then
      SQL.Text := SQL.Text +
      '   AND ( I.IDIMOVELMESTRE = ' + IntToStr(iImovelMestre) + ' ) ' + chr(13);

      Open;

      Result := Fields[0].asDateTime;

      Close;
   end;
end;



function TcfgRelMapaRI.AluguelImovel(iImovel: integer; iAnoAluguel, iMesAluguel: word): currency;
begin
   with dtmRelAdminImobRentab.qryAluguelImovel do begin
      LimpaParametros(dtmRelAdminImobRentab.qryAluguelImovel);

      ParamByName('IMOVEL').AsInteger  := iImovel;
      ParamByName('MES').AsInteger     := iMesAluguel;
      ParamByName('ANO').AsInteger     := iAnoAluguel;
      Open;

      Result := dtmRelAdminImobRentab.qryAluguelImovelALUGUEL.asFloat;

      Close;
   end;
end;



procedure TcfgRelMapaRI.FechaQueriesModulo;
var
   i : integer;
begin
   with dtmRelAdminImobRentab do begin
      for i := 0 to (ComponentCount - 1) do begin
         if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
            TwwQuery(Components[i]).Close;
         end;
      end;
   end;
end;



procedure TcfgRelMapaRI.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin

      try

         DesabilitaBotoes;
         MontaQuery;

         dtmRelAdminImobRentab.qryMapaRI.Open;

         // processa o cálculo de atualização monetária e do rateio do custo contábil
         ProcessaAtualizacao;

         dtmRelAdminImobRentab.rptMapaRI.Print;
         Repaint;

      finally

         dtmRelAdminImobRentab.qryMapaRI.Close;
         HabilitaBotoes;

      end;
   end;
end;



procedure TcfgRelMapaRI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if ( (dtmRelAdminImobRentab.qryMapaRI.Active) and (dtmRelAdminImobRentab.qryMapaRI.UpdatesPending) ) then begin
      dtmRelAdminImobRentab.qryMapaRI.CancelUpdates;
   end;

   FechaQueriesModulo;

   inherited;
end;



procedure TcfgRelMapaRI.FormShow(Sender: TObject);
begin
   inherited;

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex        := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasInUteis.ExtraiAno(Date);

   iImovelMestre           := -1;
   edtAtuarialSoma.Value   := 6;

   qryIndice.Open;

   Screen.Cursor := crDefault;
end;



procedure TcfgRelMapaRI.chkVlrCorrigidoClick(Sender: TObject);
begin
   inherited;
   if chkVlrCorrigido.Checked then DBcboIndiceCorrecao.Clear;
end;



procedure TcfgRelMapaRI.FormCreate(Sender: TObject);
begin
   inherited;
   ppRegisterForm(TppCustomPreviewer, TppPrintPreview);
end;



procedure TcfgRelMapaRI.btnBuscaImovelMestreClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_ImovelMestre.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelMestre.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iImovelMestre        := StrToInt(dtmMS.MS_ImovelMestre.ValoresChave[0]);
      edtImovelMestre.Text := dtmMS.MS_ImovelMestre.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaImovelMestre.SetFocus;
end;



procedure TcfgRelMapaRI.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;

   iImovelMestre := -1;
   edtImovelMestre.Clear;
end;



end.
