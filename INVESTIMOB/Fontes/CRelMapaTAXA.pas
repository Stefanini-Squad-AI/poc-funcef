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

unit CRelMapaTaxa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, ComCtrls, ExtCtrls, StdCtrls, Mask, wwdbedit, Wwdbspin, TREdit,
  wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  Db, DBTables, Wwquery, Pptypes, ppPrvDlg, ppforms, OleCtrls, vcf1,
  fcCombo, fcColorCombo, MontaSelect, wwdbdatetimepicker, CMDateTimePicker,
  AxCtrls;

type
  TcfgRelMapaTAXA = class(TcfgRel)
    Label1: TLabel;
    Label6: TLabel;
    DBcboIndiceCorrecao: TwwDBLookupCombo;
    SpreadSheet: TF1Book;
    qryIndice: TwwQuery;
    qryIndiceMOECODIGO: TFloatField;
    qryIndiceMOEDESC: TStringField;
    qryIndiceMOESIGLA: TStringField;
    qryIndiceMOEPERIODICIDADE: TStringField;
    qryIndiceMOEINATIVO: TStringField;
    qryIndiceFLGPERCVALOR: TStringField;
    qryIndiceDATAINICIO: TDateTimeField;
    qryIndiceDATAFIM: TDateTimeField;
    Bevel2: TBevel;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    Label2: TLabel;
    btnBuscaAdminImovel: TBitBtn;
    btnLimpaAdminImovel: TBitBtn;
    chkImoveisLocados: TCheckBox;
    Bevel1: TBevel;
    edtVlrPresente: TCMDateTimePicker;
    Label3: TLabel;
    edtAdminImovel: TEdit;
    edtImovelMestre: TEdit;
    btnBuscaImovelMestre: TBitBtn;
    btnLimpaImovelMestre: TBitBtn;
    Panel1: TPanel;
    lblProgress: TLabel;
    lblContador: TLabel;
    ProgressBar: TProgressBar;
    rgReavaliacao: TRadioGroup;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscaAdminImovelClick(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);



  private { Private declarations }
    iAdminImovel  : integer;
    iImovelMestre : integer;

    function  VerificaPreenchimento: boolean;
    procedure MontaQuery;   override;
    procedure FechaQueries; override;

    procedure ProcessaAtualizacao;

    function DataMaisAntigaAquisicao: TDateTime;

  public { Public declarations }

  end;


var  cfgRelMapaTAXA: TcfgRelMapaTAXA;


implementation
{$R *.DFM}

uses uSistema, uMensErro, uDiasInUteis, uComunsImobiliario, uVerificaPreenchimento,
     dRelAdminImobRentab, uFuncoesImob, Math, dImobiliario, dLookImobiliario, DMS;


function TcfgRelMapaTAXA.VerificaPreenchimento: boolean;
var  dDataIniCorrecao : TDateTime;
begin
   Result := False;
   try
     if DBcboIndiceCorrecao.LookupValue = '' then
        raise EValidacao.CreateVal('É necessário indicar o Índice de Correção!', DBcboIndiceCorrecao);

      if DBcboIndiceCorrecao.LookupValue <> '' then begin
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



procedure TcfgRelMapaTAXA.MontaQuery;
begin
   with dtmRelAdminImobRentab do begin

      rptMapaTaxa_lblIndiceCorrecao.Caption     := DBcboIndiceCorrecao.Text;
      rptMapaTaxa_lblDataCorrecao.Caption       := edtVlrPresente.Text;

      if edtAdminImovel.Text <> '' then begin
         rptMapaTaxa_lblAdministradora.Caption  := edtAdminImovel.Text;
      end else begin
         rptMapaTaxa_lblAdministradora.Caption  := '< Todas >';
      end;

      if rgReavaliacao.ItemIndex = 0 then begin
         rptMapaTaxa_lblReavalia.Caption         := 'Ultima Reavaliação';
         rptMapaTaxa_lbldbReavalia.DataField     := 'IMOVLRREAVAL';
         rptMapaTaxa_lbldbDataReavalia.DataField := 'IMODATAREAVAL';
      end else begin
         rptMapaTaxa_lblReavalia.Caption         := 'Valor de Mercado';
         rptMapaTaxa_lbldbReavalia.DataField     := 'IMOVLRMERCADO';
         rptMapaTaxa_lbldbDataReavalia.DataField := 'IMODATAMERCADO';
      end;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bSeparador  := chkLinhas.Checked;
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

      with qryMapaTaxa do begin
         Close;
         SQL.Text :=
         'SELECT ' + #13 +
         '   I.IDIMOVEL, ' + #13 +
         '   I.IMONOME AS NOME_IMOVEL, ' + #13 +

         '   IM.IDIMOVEL AS IDMESTRE, ' + #13 +
         '   IM.IMONOME AS NOME_MESTRE, IM.IMOLOGRADOURO, IM.IMONUMERO, ' + #13 +
         '   IM.IMOCOMPLEMENTO, IM.IMOBAIRRO, IM.IMOCEP, ' + #13 +
         '   CI.NOME AS DSC_CIDADE, CI.UF AS DSC_UF, ' + #13 +

         '   I.IMODATACOMPRA,  I.IMOVLRREAVAL,  I.IMOMOEDAREAVAL,  ' + #13 +
         '   I.IMODATAREAVAL,  I.IMOVLRCOMPRA,  I.IMOMOEDACOMPRA,  ' + #13 +
         '   I.IMODATAMERCADO, I.IMOVLRMERCADO, I.IMOMOEDAMERCADO, ' + #13 +

         '   NVL(ALUGUEL.TOTAL, 0) AS ULTIMO_ALUGUEL, ' + #13 +

         '   0 AS VLR_COMPRA_C, ' + #13 +
         '   0 AS FATOR_COMPRA_C, ' + #13 +
         '   0 AS VLR_REAVAL_C, ' + #13 +
         '   0 AS FATOR_REVAL_C, ' + #13 +
         '   0 AS TAXA_RENTAB ' + #13 +

         'FROM ' + #13 +
         '   IMOVEL I, IMOVEL IM, CIDADES CI, ' + #13 +

         '   ( ' + #13 +
         '   SELECT ' + #13 +
         '      I.IDIMOVEL, SUM(CXI.CIMVLRAJUSTADO) AS TOTAL ' + #13 +
         '   FROM ' + #13 +
         '      IMOVEL I, CONTRATOIMOVEL C, ' + #13 +
         '      CONTRATOXIMOVEL CXI ' + #13 +
         '   WHERE ' + #13 +
         '      ( ( C.CONDATAFIM >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''', ''DD/MM/YYYY'') ) OR ' + #13 +
         '      ( C.FLGINDETERMINADO = ''S'' ) ) ' + #13 +
         '      AND ( I.IDIMOVEL = CXI.IDIMOVEL ) ' + #13 +
         '      AND ( CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) ' + #13 +
         '   GROUP BY ' + #13 +
         '      I.IDIMOVEL ' + #13 +
         '   ) ALUGUEL ' + #13 +

         'WHERE ' + #13 +
         '   ( I.FLGTIPOIMOVEL = 1 ) ' + #13;

         if chkImoveisLocados.Checked then begin
         SQL.Text := SQL.Text +
         '   AND ( ALUGUEL.TOTAL > 0 ) ' + #13 +
         '   AND ( I.IDIMOVEL = ALUGUEL.IDIMOVEL ) ' +#13;
         end else begin
         SQL.Text := SQL.Text +
         '   AND ( I.IDIMOVEL = ALUGUEL.IDIMOVEL(+) ) ' +#13;
         end;

         if edtImovelMestre.Text <> '' then
         SQL.Text := SQL.Text +
         '   AND ( I.IDIMOVELMESTRE = ' + IntToStr(iImovelMestre) + ' ) ' + #13;

         if edtAdminImovel.Text <> '' then
         SQL.Text := SQL.Text +
         '   AND ( I.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) ' + #13;

         if rgReavaliacao.ItemIndex = 0 then begin
         SQL.Text := SQL.Text +
         '   AND ( I.IMOVLRREAVAL IS NOT NULL ) ' + #13 +
         '   AND ( I.IMODATAREAVAL IS NOT NULL ) ' + #13;
         end else begin
         SQL.Text := SQL.Text +
         '   AND ( I.IMOVLRMERCADO IS NOT NULL ) ' + #13 +
         '   AND ( I.IMODATAMERCADO IS NOT NULL ) ' + #13;
         end;

         SQL.Text := SQL.Text +
         '   AND ( I.IMOVLRCOMPRA IS NOT NULL ) ' + #13 +
         '   AND ( I.IMODATACOMPRA IS NOT NULL ) ' + #13 +
         '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL ) ' + #13 +
         '   AND ( IM.IDCIDADES = CI.IDCIDADES(+) ) ' + #13 +

         'ORDER BY ' + #13 +
         '   IM.IMONOME, I.IMONOME ';

         Open;
      end;
   end;
end;



procedure TcfgRelMapaTAXA.ProcessaAtualizacao;
var
   fQuant, fAtual : double;

   fVlrCompraC, fVlrReavalC   : extended;
   fFatorCompra, fFatorReaval : extended;
   fTaxa                      : extended;

   dDataCompra, dDataReaval   : TDateTime;
   iIndice, iMeses            : integer;
begin
   iIndice  := StrToInt(DBcboIndiceCorrecao.LookupValue);

   with dtmRelAdminImobRentab.qryMapaTaxa do begin
      fQuant := RecordCount;

      MostraProgresso(ProgressBar, lblProgress, lblContador, fQuant, 'Processando Relatório...');

      First;
      fAtual := 0;
      while not(EOF) do begin

         fAtual := fAtual + 1;
         AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fQuant);

         // inicializa o data e valor historico da compra
         dDataCompra    := dtmRelAdminImobRentab.qryMapaTaxaIMODATACOMPRA.AsDateTime;
         fVlrCompraC    := dtmRelAdminImobRentab.qryMapaTaxaIMOVLRCOMPRA.AsFloat;

         // inicializa o data e valor historico da reavaliação conforme opção ( reavaliação ou mercado )
         if rgReavaliacao.ItemIndex = 0 then begin
           dDataReaval  := dtmRelAdminImobRentab.qryMapaTaxaIMODATAREAVAL.AsDateTime;
           fVlrReavalC  := dtmRelAdminImobRentab.qryMapaTaxaIMOVLRREAVAL.AsFloat;
         end else begin
           dDataReaval  := dtmRelAdminImobRentab.qryMapaTaxaIMODATAMERCADO.AsDateTime;
           fVlrReavalC  := dtmRelAdminImobRentab.qryMapaTaxaIMOVLRMERCADO.AsFloat;
         end;

         // calcula o percentual acumulado de correção monetária
         fFatorCompra   := FuncoesImob.CalculaFatorCorrecao(iIndice, dDataCompra, edtVlrPresente.Date, False);
         fFatorReaval   := FuncoesImob.CalculaFatorCorrecao(iIndice, dDataReaval, edtVlrPresente.Date, False);

         // converte p/ valor presente os valores históricos de aquisição e reavaliação
         FuncoesImob.TrazAValorPresente(fVlrCompraC, dDataCompra, edtVlrPresente.Date, fFatorCompra, 'F');
         FuncoesImob.TrazAValorPresente(fVlrReavalC, dDataReaval, edtVlrPresente.Date, fFatorReaval, 'F');

         // preenche as células na planilha
         try
            SpreadSheet.ClearRange(-1, -1, -1, -1, F1ClearValues);

            SpreadSheet.NumberRC[1,1] := dDataCompra;
            SpreadSheet.NumberRC[1,2] := dtmRelAdminImobRentab.qryMapaTaxaIMOVLRCOMPRA.AsFloat;
            SpreadSheet.NumberRC[1,3] := fVlrCompraC;

            SpreadSheet.NumberRC[1,5] := dDataReaval;
            SpreadSheet.NumberRC[1,6] := dtmRelAdminImobRentab.qryMapaTaxaIMOVLRREAVAL.AsFloat;
            SpreadSheet.NumberRC[1,7] := fVlrReavalC;

            SpreadSheet.NumberRC[1,8] := edtVlrPresente.Date;
            SpreadSheet.NumberRC[1,9] := dtmRelAdminImobRentab.qryMapaTaxaULTIMO_ALUGUEL.AsFloat;

            iMeses := DiasInUteis.IntervaloMeses(dDataCompra, edtVlrPresente.Date);

            SpreadSheet.FormulaRC[1,4] := 'RATE(' + IntToStr(iMeses) + ';I1;-C1;G1;0)';
            SpreadSheet.Recalc;
            fTaxa := SpreadSheet.NumberRC[1,4] * 100;
         except
            fTaxa := 0;
         end;
         Application.ProcessMessages;

         Edit;
         dtmRelAdminImobRentab.qryMapaTaxaVLR_COMPRA_C.AsFloat   := fVlrCompraC;
         dtmRelAdminImobRentab.qryMapaTaxaVLR_REAVAL_C.AsFloat   := fVlrReavalC;
         dtmRelAdminImobRentab.qryMapaTaxaFATOR_COMPRA_C.AsFloat := fFatorCompra;
         dtmRelAdminImobRentab.qryMapaTaxaFATOR_REVAL_C.AsFloat  := fFatorReaval;
         dtmRelAdminImobRentab.qryMapaTaxaTAXA_RENTAB.AsFloat    := fTaxa;
         Post;

         Next;
      end;
      EscondeProgresso(ProgressBar, lblProgress, lblContador);
   end;
end;



function TcfgRelMapaTAXA.DataMaisAntigaAquisicao: TDateTime;
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

      if edtImovelMestre.Text <> '' then
      SQL.Text := SQL.Text +
      '   AND ( I.IDIMOVELMESTRE = ' + IntToStr(iImovelMestre) + ' ) ' + chr(13);

      Open;
      Result := Fields[0].asDateTime;
      Close;
   end;
end;




procedure TcfgRelMapaTAXA.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin
      try
         DesabilitaBotoes;
         MontaQuery;

         ProcessaAtualizacao;

         dtmRelAdminImobRentab.rptMapaTaxa.Print;
         Repaint;
      finally
         dtmRelAdminImobRentab.qryMapaTaxa.Close;
         HabilitaBotoes;
      end;
   end;
end;



procedure TcfgRelMapaTAXA.FormShow(Sender: TObject);
begin
   inherited;
   iImovelMestre := -1;
   qryIndice.Open;
end;



procedure TcfgRelMapaTAXA.FormCreate(Sender: TObject);
begin
   inherited;
   ppRegisterForm(TppCustomPreviewer, TppPrintPreview);
end;



procedure TcfgRelMapaTAXA.btnBuscaAdminImovelClick(Sender: TObject);
begin
   inherited;
   dtmMS.MS_AdminImovel.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_AdminImovel.RetornouValor then begin
      Screen.Cursor := crHourGlass;

      iAdminImovel         := StrToInt(dtmMS.MS_AdminImovel.ValoresChave[0]);
      edtAdminImovel.Text  := dtmMS.MS_AdminImovel.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;
   btnBuscaAdminImovel.SetFocus;
end;



procedure TcfgRelMapaTAXA.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;
   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;



procedure TcfgRelMapaTAXA.FechaQueries;
begin
   qryIndice.Close;
   with dtmRelAdminImobRentab do begin
      qryMapaTaxa.Close;
      qryDataAntiga.Close;
   end;
end;



procedure TcfgRelMapaTAXA.btnBuscaImovelMestreClick(Sender: TObject);
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



procedure TcfgRelMapaTAXA.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;
   iImovelMestre := -1;
   edtImovelMestre.Clear;
end;


end.
