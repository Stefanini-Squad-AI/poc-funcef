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

unit CRelMapaRC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, ExtCtrls, StdCtrls, Mask, wwdbedit, Wwdbspin, TREdit, wwdblook, Db,
  DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, Pptypes, ppPrvDlg, ppforms, ComCtrls, MontaSelect,
  fcCombo, fcColorCombo;

type
  TcfgRelMapaRC = class(TcfgRel)
    qryIndice: TwwQuery;
    qryIndiceMOESIGLA: TStringField;
    qryIndiceMOECODIGO: TFloatField;
    qryIndiceMOEDESC: TStringField;
    qryIndiceMOEPERIODICIDADE: TStringField;
    qryIndiceMOEINATIVO: TStringField;
    qryIndiceFLGPERCVALOR: TStringField;
    qryIndiceDATAINICIO: TDateTimeField;
    qryIndiceDATAFIM: TDateTimeField;
    Label1: TLabel;
    Label6: TLabel;
    grpAtuarial: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Image2: TImage;
    edtAtuarialPrevisto: TRealEdit;
    edtAtuarialSoma: TRealEdit;
    DBcboIndiceCorrecao: TwwDBLookupCombo;
    grpReferencia: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    chkVlrCorrigido: TCheckBox;
    chkVigente: TCheckBox;
    rdgOrdenacao: TRadioGroup;
    Bevel1: TBevel;
    edtAdminImovel: TEdit;
    btnBuscaAdminImovel: TBitBtn;
    rdgAtuarial: TRadioGroup;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    Bevel2: TBevel;
    qryCriaContratoXImovel: TwwQuery;
    qryCriaContrato: TwwQuery;
    qryAlteraContratoLancamento: TwwQuery;
    qryDesfazContratoLancamento: TwwQuery;
    qryDesfazContratoXImovel: TwwQuery;
    qryDesfazContratos: TwwQuery;
    btnLimpaAdminImovel: TBitBtn;
    Panel1: TPanel;
    lblProgress: TLabel;
    lblContador: TLabel;
    ProgressBar: TProgressBar;
    chkDesocupado: TCheckBox;
    qryMarcaImovelOcupado: TwwQuery;
    qryMarcaImovelDesocupado: TwwQuery;

    // procedimentos definidos
    function VerificaPreenchimento: boolean;

    function AgrupaImoveisDesocupados: boolean;
    procedure CriaContrato(iContrato: integer);
    procedure InsereImovelContrato(iImovel, iContrato: integer);
    procedure AlteraLancamentos(iImovel, iContrato: integer);

    procedure Desfaz;

    procedure MontaQuery;   override;
    procedure FechaQueries; override;

    procedure ProcessaAtualizacao;

    function DataMaisAntigaAquisicao: TDateTime;
    function VlrAquisicaoCorrigidoContrato(iContrato: integer): extended;

    // outros procedimentos
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkVlrCorrigidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscaAdminImovelClick(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);


  private { Private declarations }
   iIndiceCorrecao   : integer;
   fFatorAtuarial    : extended;
   dDataContabil     : TDateTime;
   iAdminImovel      : integer;
   iAnoRec,iMesRec   : word;
   iMesAlug,iAnoAlug : word;
   iAnoMesAlug       : integer;
  public { Public declarations }

  end;



var
  cfgRelMapaRC: TcfgRelMapaRC;



implementation
{$R *.DFM}
uses
   dBaseDados, uDataBase, uSistema, uMensErro, uDiasInUteis, uComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobRentab, uFuncoesImob, FEspera, dImobiliario, uModuloImobiliario,
   dLookImobiliario, DMS;



function TcfgRelMapaRC.VerificaPreenchimento: boolean;
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



procedure TcfgRelMapaRC.CriaContrato(iContrato: integer);
begin
   with qryCriaContrato do begin
      LimpaParametros(qryCriaContrato);
      ParamByName('CONTRATO').asInteger      := iContrato;
      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      ExecSQL;
   end;
end;



procedure TcfgRelMapaRC.InsereImovelContrato(iImovel, iContrato: integer);
begin
   with qryCriaContratoXImovel do begin
      LimpaParametros(qryCriaContratoXImovel);
      ParamByName('IMOVEL').asInteger   := iImovel;
      ParamByName('CONTRATO').asInteger := iContrato;
      ExecSQL;
   end;
end;



procedure TcfgRelMapaRC.AlteraLancamentos(iImovel, iContrato: integer);
begin
   with qryAlteraContratoLancamento do begin
      LimpaParametros(qryAlteraContratoLancamento);
      ParamByName('IMOVEL').asInteger   := iImovel;
      ParamByName('CONTRATO').asInteger := iContrato;
      ExecSQL;
   end;
end;



function TcfgRelMapaRC.AgrupaImoveisDesocupados: boolean;
var
   fQuantMestre, fAtual : double;
   iContadorContrato    : integer;
   qryTemp : Twwquery;
begin
   Result := True;
   frmEspera.Config('Aguarde', 'Atualizando ocupação dos Imóveis no mês de aluguel...', False);
   frmEspera.Show;
   Application.ProcessMessages;

   StartTransacao;
   try
      try
         // marca TODOS os Imóveis como Ocupados/Desocupados NO MES DE COMPETENCIA DO ALUGUEL
         LimpaParametros(qryMarcaImovelDesocupado);
         qryMarcaImovelDesocupado.ParamByName('pANOMESALUG').AsInteger := iAnoMesAlug;
         qryMarcaImovelDesocupado.ExecSQL;

         LimpaParametros(qryMarcaImovelOcupado);
         qryMarcaImovelOcupado.ParamByName('pANOMESALUG').AsInteger    := iAnoMesAlug;
         qryMarcaImovelOcupado.ExecSQL;

         frmEspera.Hide;
         frmEspera.Config('', '', False);

         // cria Contratos que contenham todos os Imóveis desocupados de cada Imóvel Mestre
         with dtmImobiliario.qryAux do begin
            Close;
            SQL.Text := 'SELECT DISTINCT ' + #13 +
                        '       I.IDIMOVELMESTRE AS IDMESTRE ' + #13 +
                        '  FROM IMOVEL I ' + #13 +
                        ' WHERE I.FLGTIPOIMOVEL = 1 ' + #13 +
                        '   AND ( I.FLGSTATUSOCUPACAO = ''D'' OR I.FLGATIVO = 0 ) ';
            Open;
            fQuantMestre := dtmImobiliario.qryAux.RecordCount;
         end;

         // ProgressBar
         MostraProgresso(ProgressBar, lblProgress, lblContador, fQuantMestre, 'Agrupando Imóveis vagos...');

         // idContrato começa em -100 e vai diminuindo...
         iContadorContrato := -100;

         // Processamento Principal ----------------------------------------------------------------------

         qryTemp := Twwquery.Create( nil );
         qryTemp.DatabaseName := 'BaseDados';

         dtmImobiliario.qryAux.First;
         fAtual := 0;
         while not(dtmImobiliario.qryAux.EOF) do begin

            // ProgressBar
            fAtual := fAtual + 1;
            AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fQuantMestre);

            dec(iContadorContrato);

            // cria um Contrato (1 Mestre = 1 Contrato) para agrupar os Imóveis do Mestre
            CriaContrato(iContadorContrato);

            // seleciona todos os Imóveis de cada Imóvel Mestre
            with qryTemp do begin
               Sql.Clear;
               Sql.Text := 'SELECT IDIMOVEL ' +#13+
                           '  FROM IMOVEL   ' +#13+
                           ' WHERE FLGTIPOIMOVEL = 1 ' +#13+
                           '   AND ( FLGSTATUSOCUPACAO = ''D'' OR FLGATIVO = 0 )' +#13+
                           '   AND IDIMOVELMESTRE = ' + IntToStr(dtmImobiliario.qryAux.FieldByName('IDMESTRE').asInteger);
               Open;

               // dispara o processamento Imóvel a Imóvel
               First;
               while not EOF do begin
                  InsereImovelContrato(qryTemp.FieldByName('IDIMOVEL').AsInteger, iContadorContrato);
                  AlteraLancamentos(qryTemp.FieldByName('IDIMOVEL').AsInteger, iContadorContrato);
                  Next;
               end;
            end;

            dtmImobiliario.qryAux.Next;
         end;
         CommitTransacao;
      except
         Result := False;
         RollBackTransacao;
         Raise;
         Repaint;
      end;
   finally
      qryTemp.Free;
      EscondeProgresso(ProgressBar, lblProgress, lblContador);
   end;
end;



procedure TcfgRelMapaRC.Desfaz;
begin
   frmEspera.Config('Aguarde', 'Desfazendo alterações...', False);
   frmEspera.Show;
   Repaint;
   Application.ProcessMessages;
   Temporiza(2);
   try
      // Exclui os contratos temporários para imovel desocupado
      qryDesfazContratoLancamento.ExecSQL;
      qryDesfazContratoXImovel.ExecSQL;
      qryDesfazContratoS.ExecSQL;

      // marca TODOS os Imóveis como Ocupados/Desocupados
      if not(FuncoesImob.AtualizaOcupacao(-1, -1, 'O', True)
         and FuncoesImob.AtualizaOcupacao(-1, -1, 'D', True)) then Exit;
   finally
      frmEspera.Hide;
      frmEspera.Config('', '', False);
      Repaint;
      Application.ProcessMessages;
   end;
   Temporiza(1);
end;



procedure TcfgRelMapaRC.MontaQuery;
var dDataPeriodo,dRecIni,dRecFim,dBaseAlug : TDateTime;
begin
   // Define competência de Recebimento
   dRecIni := EncodeDate(iAnoRec, iMesRec, 1);
   dRecFim := DiasInUteis.UltDiaMes(iAnoRec, iMesRec);

   // Define competência de Aluguel
   dBaseAlug   := EncodeDate(iAnoAlug, iMesAlug, 1);

   // baseia o custo contábil no último dia do mês anterior a competencia do Aluguel
   dDataPeriodo  := DiasInUteis.SomaMeses(EncodeDate(iAnoAlug, iMesAlug, 1), -1);
   dDataContabil := DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(dDataPeriodo), DiasInUteis.ExtraiMes(dDataPeriodo));

   with dtmRelAdminImobRentab do begin
      // verifica se é necessária a correção do Vlr de Aquisição
      if not(chkVlrCorrigido.Checked) then iIndiceCorrecao  := StrToInt(DBcboIndiceCorrecao.LookupValue);
      fFatorAtuarial := ( 1 + edtAtuarialPrevisto.Value / 100) * ( 1 + edtAtuarialSoma.Value / 100) - 1;

      // preenche as labels do relatório
      case rdgAtuarial.ItemIndex of
         0: rptMapaRC_lblCalculoAtuarial.Caption := 'Mínimo Atuarial baseado no Custo Contábil';
         1: rptMapaRC_lblCalculoAtuarial.Caption := 'Mínimo Atuarial baseado no Valor Corrigido';
      end;
      rptMapaRC_lblMesRecebto.Caption        := cboMes.Items.Strings[iMesRec  - 1] + ' / ' + IntToStr(iAnoRec);
      rptMapaRC_lblMesAluguel.Caption        := cboMes.Items.Strings[iMesAlug - 1] + ' / ' + IntToStr(iAnoAlug);
      rptMapaRC_lblDataContabil.Caption      := FormatDateTime('dd/mm/yyyy', dDataContabil);
      rptMapaRC_lblAtuarialProjetado.Caption := FormatFloat('#,##0.00 %;(#,##0.00 %)', fFatorAtuarial * 100);
      rptMapaRC_lblIndiceCorrecao.Caption    := DBcboIndiceCorrecao.Text;
      if chkVlrCorrigido.Checked then rptMapaRC_lblIndiceCorrecao.Caption := ' < NÃO >';
      if edtAdminImovel.Text <> '' then begin
         rptMapaRC_lblAdministradora.Caption   := edtAdminImovel.Text;
      end else begin
         rptMapaRC_lblAdministradora.Caption   := '< Todas >';
      end;

      // Somente mostra os totais quando exibir apenas os contratos vigentes, pois quando
      // exibe todos, vai dar divergência com o mapa por imovel mestre.
      if chkVigente.Checked then begin
         dtmRelAdminImobRentab.rptmapaRC_RegTotal.Visible   := True;
         dtmRelAdminImobRentab.rptmapaRC_RegSumario.Visible := True;
      end else begin
         dtmRelAdminImobRentab.rptmapaRC_RegTotal.Visible   := False;
         dtmRelAdminImobRentab.rptmapaRC_RegSumario.Visible := False;
      end;

      // determina se imprime linha separadora ou em cores alternadas no relatorio
      bSeparador := chkLinhas.Checked;
      bCorlinha  := chkCorLinha.Checked;
      CorLinha   := cboCorLinha.SelectedColor;

      // carrega parâmetros e abre a query
      LimpaParametros(dtmRelAdminImobRentab.qryMapaRC);
      qryMapaRC.ParamByName('PIDPESSOA').asInteger    := Sistema.idEmpresa;
      qryMapaRC.ParamByName('PIDMOEDACAF').asInteger  := ModuloImobiliario.InvestImob.iIdMoedaCAF;
      qryMapaRC.ParamByName('PIDPAISCAF').asInteger   := ModuloImobiliario.InvestImob.iIdPaisCAF;      
      qryMapaRC.ParamByName('PDATAMOV').asDateTime    := dDataContabil;
      qryMapaRC.ParamByName('PMESALUG').asInteger     := iMesAlug;
      qryMapaRC.ParamByName('PANOALUG').asInteger     := iAnoAlug;
      qryMapaRC.ParamByName('PANOMESALUG').asInteger  := iAnoMesAlug;
      qryMapaRC.ParamByName('PDATARECINI').asDateTime := dRecIni;
      qryMapaRC.ParamByName('PDATARECFIM').asDateTime := dRecFim;
      if edtAdminImovel.Text <> '' then
         qryMapaRC.ParamByName('PIDADMINIMOVEL').asInteger := iAdminImovel;
      if chkVigente.Checked then
         qryMapaRC.ParamByName('PFILTRA').asInteger     := 1;
      if chkDesocupado.Checked then
         qryMapaRC.ParamByName('PDESOCUPADO').asInteger := 1;
      case rdgOrdenacao.ItemIndex of
         0: qryMapaRC.ParamByName('PORDEM').asString := 'NUMERO';
         1: qryMapaRC.ParamByName('PORDEM').asString := 'NOME';
      end;
      qryMapaRC.Open;
   end;
end;



procedure TcfgRelMapaRC.ProcessaAtualizacao;
var fQuant, fAtual   : double;
    iDia, iMes, iAno : Word;
    iDiasMes : Integer;
begin
   with dtmRelAdminImobRentab.qryMapaRC do begin
      fQuant := RecordCount;
      MostraProgresso(ProgressBar, lblProgress, lblContador, fQuant, 'Processando Relatório...');

      First;
      fAtual := 0;
      while not(EOF) do begin
         fAtual := fAtual + 1;
         AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fQuant);
         Edit;

         // calcula o valor corrigido
         dtmRelAdminImobRentab.qryMapaRCVLR_CORRIGIDO.AsFloat := VlrAquisicaoCorrigidoContrato(dtmRelAdminImobRentab.qryMapaRCIDCONTRATOIMOVEL.asInteger);

         // Calcula pro-rata do custo contábil e valor corrigido
         // para os contratos encerrados ou iniciados no mes de competencia do aluguel
         with dtmRelAdminImobRentab do begin
            DecodeDate(qryMapaRCCONDATAINICIO.AsDateTime, iAno, iMes, iDia );
            if (iMes = iMesAlug) and (iAno = iAnoAlug) then begin
               iDiasMes := DiasInUteis.ExtraiDia(DiasInUteis.UltDiaMes(iAno,iMes));
               qryMapaRCVLR_CORRIGIDO.AsFloat := ( (qryMapaRCVLR_CORRIGIDO.AsFloat / iDiasMes) * ((iDiasMes - iDia) + 1) );
               qryMapaRCCUSTO_CONTABIL_CONTRATO.AsFloat := ( (qryMapaRCCUSTO_CONTABIL_CONTRATO.AsFloat / iDiasMes) * ((iDiasMes - iDia) + 1) );
            end;

            DecodeDate(qryMapaRCCONDATAFIM.AsDateTime, iAno, iMes, iDia );
            if (iMes = iMesAlug) and (iAno = iAnoAlug) then begin
               iDiasMes := DiasInUteis.ExtraiDia(DiasInUteis.UltDiaMes(iAno,iMes));
               qryMapaRCVLR_CORRIGIDO.AsFloat := ( (qryMapaRCVLR_CORRIGIDO.AsFloat / iDiasMes) * iDia );
               qryMapaRCCUSTO_CONTABIL_CONTRATO.AsFloat := ( (qryMapaRCCUSTO_CONTABIL_CONTRATO.AsFloat / iDiasMes) * iDia );
            end;
         end;

         // calcula o Mínimo Atuarial de acordo com o método escolhido
         case rdgAtuarial.ItemIndex of
            0: dtmRelAdminImobRentab.qryMapaRCMINIMO_ATUARIAL.AsFloat := dtmRelAdminImobRentab.qryMapaRCCUSTO_CONTABIL_CONTRATO.AsFloat * fFatorAtuarial / 12;
            1: dtmRelAdminImobRentab.qryMapaRCMINIMO_ATUARIAL.AsFloat := dtmRelAdminImobRentab.qryMapaRCVLR_CORRIGIDO.AsFloat * fFatorAtuarial / 12;
         end;

         // se houer custo contábil faz a conta, para evitar divisão por ZERO
         if dtmRelAdminImobRentab.qryMapaRCCUSTO_CONTABIL_CONTRATO.AsFloat <> 0 then begin
            dtmRelAdminImobRentab.qryMapaRCALUGUELXCC.AsFloat  := dtmRelAdminImobRentab.qryMapaRCVLR_ALUGUEL.asFloat / dtmRelAdminImobRentab.qryMapaRCCUSTO_CONTABIL_CONTRATO.AsFloat * 100;
            dtmRelAdminImobRentab.qryMapaRCRECEITAXCC.AsFloat  := dtmRelAdminImobRentab.qryMapaRCVLR_LIQUIDO.asFloat / dtmRelAdminImobRentab.qryMapaRCCUSTO_CONTABIL_CONTRATO.AsFloat * 100;
         end else begin
            dtmRelAdminImobRentab.qryMapaRCALUGUELXCC.AsFloat  := 0;
            dtmRelAdminImobRentab.qryMapaRCRECEITAXCC.AsFloat  := 0;
         end;

         // se houver custo de aquisição corrigido faz a conta, para evitar divisão por ZERO
         if dtmRelAdminImobRentab.qryMapaRCVLR_CORRIGIDO.AsFloat <> 0 then begin
            dtmRelAdminImobRentab.qryMapaRCALUGUELXVLR.AsFloat := dtmRelAdminImobRentab.qryMapaRCVLR_ALUGUEL.asFloat / dtmRelAdminImobRentab.qryMapaRCVLR_CORRIGIDO.AsFloat * 100;
            dtmRelAdminImobRentab.qryMapaRCRECEITAXVLR.AsFloat := dtmRelAdminImobRentab.qryMapaRCVLR_LIQUIDO.asFloat / dtmRelAdminImobRentab.qryMapaRCVLR_CORRIGIDO.AsFloat * 100;
         end else begin
            dtmRelAdminImobRentab.qryMapaRCALUGUELXVLR.AsFloat := 0;
            dtmRelAdminImobRentab.qryMapaRCRECEITAXVLR.AsFloat := 0;
         end;
         Post;
         Next;
      end;
      EscondeProgresso(ProgressBar, lblProgress, lblContador);
   end;
end;



function TcfgRelMapaRC.DataMaisAntigaAquisicao: TDateTime;
begin
   with dtmRelAdminImobRentab.qryDataAntiga do begin
      Close;

      SQL.Text :=
      'SELECT ' + chr(13) +
      '   MIN(I.IMODATACOMPRA) ' + chr(13) +
      'FROM ' + chr(13) +
      '   IMOVEL I, CONTRATOIMOVEL C, CONTRATOXIMOVEL CX ' + chr(13) +
      'WHERE ' + chr(13) +
      '   ( I.FLGTIPOIMOVEL = 1 ) ' + chr(13) +
      '   AND ( I.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ' ) ' + chr(13) +
      '   AND ( C.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ' ) ' + chr(13) +
      '   AND ( I.IDIMOVEL = CX.IDIMOVEL ) ' + chr(13) +
      '   AND ( CX.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) ' + chr(13);

      if edtAdminImovel.Text <> '' then
      SQL.Text := SQL.Text +
      '   AND ( C.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) ' + chr(13);

      if chkVigente.Checked then
      SQL.Text := SQL.Text +
         '   AND ( ' + #13 +
         '   ( C.CONDATAFIM >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''', ''DD/MM/YYYY'') ) OR ' + #13 +
         '   ( C.FLGINDETERMINADO = ''S'' ) ) ' + #13;

      Open;

      Result := Fields[0].asDateTime;

      Close;
   end;
end;



function TcfgRelMapaRC.VlrAquisicaoCorrigidoContrato(iContrato: integer): extended;
var
   fPercentRateio, fTotalCorrigido: extended;
begin
   with dtmRelAdminImobRentab.qryContratoXImovel do begin
      LimpaParametros(dtmRelAdminImobRentab.qryContratoXImovel);

      ParamByName('CONTRATO').AsInteger   := iContrato;
      Open;

      First;
      fTotalCorrigido := 0;
      while not(EOF) do begin

         fPercentRateio := 100;
         if FieldByName('FLGRATEIO').asInteger = 1 then begin
            fPercentRateio := 0;
            if not(FieldByName('CIMPERCENTRATEIO').IsNULL) then fPercentRateio := FieldByName('CIMPERCENTRATEIO').asFloat;
         end;

         fTotalCorrigido := fTotalCorrigido + ( fPercentRateio / 100 ) * dtmRelAdminImobRentab.VlrAquisicaoImovel(FieldByName('IDIMOVEL').AsInteger, iIndiceCorrecao, dDataContabil, not(chkVlrCorrigido.Checked));

         Next;
      end;

      Close;
   end;

   Result := fTotalCorrigido;
end;



procedure TcfgRelMapaRC.FechaQueries;
var i : integer;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
   end;

   // fecha queries do DataModule
   with dtmRelAdminImobRentab do begin
      qryMapaRC.Close;
      qryDataAntiga.Close;
      qryContratoXImovel.Close;
   end;
end;


procedure TcfgRelMapaRC.bbtnConfirmarClick(Sender: TObject);
var bProssegue : boolean;
begin
   if VerificaPreenchimento then begin

      // Define competência de Recebimento
      iMesRec := (cboMes.ItemIndex + 1);
      iAnoRec := StrToInt(IntToStr(trunc(DBspnAno.Value)));

      // Define competência de Aluguel
      iMesAlug := iMesRec - 1;
      iAnoAlug := iAnoRec;
      if iMesAlug <= 0 then begin
        iMesAlug := 12;
        iAnoAlug := iAnoAlug - 1;
      end;
      iAnoMesAlug := StrToInt(FormatFloat('0000',iAnoAlug) + FormatFloat('00',iMesAlug));

      try
         DesabilitaBotoes;
         bProssegue := True;

         if not(AgrupaImoveisDesocupados) then begin
            MsgDlg('Houve erro no agrupamento dos Imóveis desocupados.', 'Erro', mtError, [mbOk], 0);
            Repaint;
            bProssegue := MsgDlg('Deseja visualizar o Mapa, excluídos os Imóveis desocupados?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
            Repaint;
         end;

         if bProssegue then begin
            frmEspera.Config('Aguarde', 'Selecionando Contratos...', False);
            frmEspera.Show;
            Application.ProcessMessages;

            Temporiza(1);

            MontaQuery;

            frmEspera.Hide;
            frmEspera.Config('', '', False);

            // processa o cálculo de atualização monetária e do rateio do custo contábil
            ProcessaAtualizacao;

            dtmRelAdminImobRentab.rptMapaRC.Print;
            Repaint;
         end;
      finally
         Desfaz;
         dtmRelAdminImobRentab.qryMapaRC.Close;
         HabilitaBotoes;
      end;
   end;
end;



procedure TcfgRelMapaRC.FormShow(Sender: TObject);
begin
   inherited;
   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex      := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value        := DiasInUteis.ExtraiAno(Date);
   edtAtuarialSoma.Value := 6;
   qryIndice.Open;
   Screen.Cursor := crDefault;
end;



procedure TcfgRelMapaRC.chkVlrCorrigidoClick(Sender: TObject);
begin
   inherited;
   if chkVlrCorrigido.Checked then DBcboIndiceCorrecao.Clear;
end;



procedure TcfgRelMapaRC.FormCreate(Sender: TObject);
begin
   inherited;
   ppRegisterForm(TppCustomPreviewer, TppPrintPreview);
end;



procedure TcfgRelMapaRC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if ( (dtmRelAdminImobRentab.qryMapaRC.Active) and (dtmRelAdminImobRentab.qryMapaRC.UpdatesPending) ) then begin
      dtmRelAdminImobRentab.qryMapaRC.CancelUpdates;
   end;
   inherited;
end;



procedure TcfgRelMapaRC.btnBuscaAdminImovelClick(Sender: TObject);
begin
   inherited;
   dtmMS.MS_AdminImovel.Executar;
   Repaint;
   if dtmMS.MS_AdminImovel.RetornouValor then begin
      Screen.Cursor := crHourGlass;
      iAdminImovel         := StrToInt(dtmMS.MS_AdminImovel.ValoresChave[0]);
      edtAdminImovel.Text  := dtmMS.MS_AdminImovel.ValoresChave[1];
      Screen.Cursor := crDefault;
   end;
   btnBuscaAdminImovel.SetFocus;
end;


procedure TcfgRelMapaRC.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;
   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;


end.
