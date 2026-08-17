unit CRelDivergenciaLanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, Mask, wwdbedit, wwdblook, Db,
  DBTables, Wwquery, MontaSelect, DBCtrls, fcCombo, fcColorCombo, TREdit,
  Wwdbspin, wwdbdatetimepicker, CMDateTimePicker, uModuloImobiliario;

type
  TcfgRelDivergenciaLanc = class(TcfgRel)
    grpDatas: TGroupBox;
    Label5: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    Label3: TLabel;
    DBcboTipoRecDes: TwwDBLookupCombo;
    chkLinhas: TCheckBox;
    rdgOrdenacao: TRadioGroup;
    Label7: TLabel;
    btnBuscaCliente: TBitBtn;
    btnLimpaCliente: TBitBtn;
    edtDebitado: TEdit;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    chkCompetencia: TCheckBox;
    rdgTipoData: TRadioGroup;
    GroupBox1: TGroupBox;
    chkDivergenciaData: TCheckBox;
    DBcboTipoImovel: TwwDBLookupCombo;
    Label6: TLabel;
    Label8: TLabel;
    edtDivergencia: TRealEdit;
    Label4: TLabel;
    lblImovelouMestre: TLabel;
    edtImovelouMestre: TEdit;
    btnLimpaImovelMestre: TBitBtn;
    btnBuscaImovelMestre: TBitBtn;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaClienteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);

  private { Private declarations }
    iDebitado     : integer;
    iImovelMestre : integer;
    iImovel       : integer;

    function VerificaPreenchimento: boolean;
    procedure FiltraLancamentos;
    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
   cfgRelDivergenciaLanc: TcfgRelDivergenciaLanc;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   uDiasInUteis, dRelAdminImobCC, uFuncoesImob, dLookImobiliario, DMS;



function TcfgRelDivergenciaLanc.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

      if ( ((length(trim(edtDataIni.Text)) = 0) or (length(trim(edtDataFim.Text)) = 0)) and
         ((cboMesCompetencia.ItemIndex = -1) or (DBspnAnoCompetencia.Value = 0)) ) then
         raise EValidacao.CreateVal('É necessário indicar o Período ou o Mês de Competência!', edtDataIni);

	except

      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

	Result := True;
end;



procedure TcfgRelDivergenciaLanc.MontaQuery;
begin
   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         ppLogoLctoDivergencias.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         ppLogoLctoDivergencias.Picture := nil;

      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
         rptDivergenciaLanc_lblCompetencia.Clear;
         rptDivergenciaLanc_lblDatas.Caption := FormatDateTime('DD/MM/YYYY', edtDataIni.Date) + ' a ' + FormatDateTime('DD/MM/YYYY', edtDataFim.Date);
      end else begin
         rptDivergenciaLanc_lblCompetencia.Caption := cboMesCompetencia.Text + FormatFloat('0000', DBspnAnoCompetencia.Value);
         rptDivergenciaLanc_lblDatas.Clear;
      end;

      if DBcboTipoRecDes.LookupValue <> '' then begin
         rptDivergenciaLanc_lblTipoRecDes.Caption := DBcboTipoRecDes.Text;
      end else begin
         rptDivergenciaLanc_lblTipoRecDes.Caption := '< Todos >';
      end;

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;
      
   end;

   FiltraLancamentos;
end;



procedure TcfgRelDivergenciaLanc.FiltraLancamentos;
begin
   with dtmRelAdminImobCC.qryDivergenciaLanc do begin
      Close;

      SQL.Text :=
      'SELECT ' + #13 +
      '   IMOVEL_EXTENSO, CONTRATO_EXTENSO, DESCCUSTORECIMO, ' + #13 +

      '   DATALANCAMENTO, DATAVENCIMENTO, TRGDTINCLUSAO, DATA_BAIXA, ' + #13 +
      '   MESCOMPETENCIA, ANOCOMPETENCIA, ' + #13 +
      '   FLGORIGEMLANC, FLGESTORNADO, ' + #13 +

      '   RECPAG, VALOR_OM_LANC, VALOR_LANC, ' + #13 +
      '   VLRLANCOMRECEB, VLRLANCOMPAGAR, VLRLANCRECEB, VLRLANCPAGAR, ' + #13 +
      '   VLRJUROS, VLRMULTA, VLRCORRECAOMON, DATACORRECAO, ' + #13 +
      '   TOT_PAGAR, TOT_PAGO, TOT_RECEBER, TOT_RECEBIDO, PREVISTO, EFETIVO, ' + #13 +

      '   LOGIN_USUARIO, NF_USUARIO, NF_FORCLI, RS_FORCLI, ' + #13 +

      '   IDDOCUMENTO, NODOCUMENTO, PORTADOR_FORMA, ' + #13 +

      '   IMOCODIGO, CODTIPIMOVEL, FLGATIVO, STATUS_IMOVEL ' + #13 +

      'FROM ' + #13 +
      '   VWLANCAMENTO ' + #13 +

      'WHERE ' + #13 +
      '   ( STATUS_DOC = ''2'' ) ' + #13 +
      '   AND ( RECPAG = ''R'' ) ' + #13;

      if iImovelMestre > 0 then
      SQL.Text := SQL.Text + #13 +
      '   AND ( IDIMOVELMESTRE = ' + IntToStr(iImovelMestre) + ' ) ' + #13;

      if iImovel > 0 then
      SQL.Text := SQL.Text +
      '   AND ( IDIMOVEL = ' + IntToStr(iImovelMestre) + ' ) ' + #13;

      if DBcboTipoRecDes.LookupValue <> '' then
      SQL.Text := SQL.Text +
      '   AND ( IDTIPOCUSTORECIMO = ' + DBcboTipoRecDes.LookupValue + ' ) ' + #13;

      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
         case rdgTipoData.ItemIndex of
            0: SQL.Text := SQL.Text + '   AND ( DATA_BAIXA BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) ';
            1: SQL.Text := SQL.Text + '   AND ( TRGDTINCLUSAO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) ';
            2: SQL.Text := SQL.Text + '   AND ( DATALANCAMENTO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) ';
            3: SQL.Text := SQL.Text + '   AND ( DATAVENCIMENTO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) ';
         end;
      end;

      if not(chkCompetencia.Checked) then begin
      SQL.Text := SQL.Text +
      '   AND ( MESCOMPETENCIA = ' + IntToStr(cboMesCompetencia.ItemIndex + 1) + ' AND ANOCOMPETENCIA = ' + FloatToStr(DBspnAnoCompetencia.Value) + ' ) ';
      end;

      if DBcboTipoImovel.LookupValue <> '' then begin
      SQL.Text := SQL.Text +
      '   AND ( CODTIPIMOVEL <> ''' + DBcboTipoImovel.LookupValue + ''' ) ';
      end;

      if chkDivergenciaData.Checked then begin
      SQL.Text := SQL.Text +
      '   AND ( (DATA_BAIXA > DATAVENCIMENTO) OR ( ABS(EFETIVO - PREVISTO) > ' + NumeroIngles(edtDivergencia.Value) + ' ) ) ' + #13;
      end else begin
      SQL.Text := SQL.Text +
      '   AND ( ABS(EFETIVO - PREVISTO) > ' + NumeroIngles(edtDivergencia.Value) + ' ) ' + #13;
      end;

      SQL.Text := SQL.Text +
      'ORDER BY ' + #13;

      case rdgOrdenacao.ItemIndex of
         0:
         SQL.Text := SQL.Text +
         '   NOME_MESTRE, NOME_IMOVEL, ' + #13 +
         '   ANOCOMPETENCIA, MESCOMPETENCIA, ' + #13 +
         '   DATAVENCIMENTO, DATA_BAIXA, ' + #13 +
         '   DESCCUSTORECIMO ' + #13;
         1:
         SQL.Text := SQL.Text +
         '   NOME_MESTRE, NOME_IMOVEL, ' + #13 +
         '   DATAVENCIMENTO, DATA_BAIXA, ' + #13 +
         '   ANOCOMPETENCIA, MESCOMPETENCIA, ' + #13 +
         '   DESCCUSTORECIMO ' + #13;
         2:
         SQL.Text := SQL.Text +
         '   ANOCOMPETENCIA, MESCOMPETENCIA, ' + #13 +
         '   DATAVENCIMENTO, DATA_BAIXA, ' + #13 +
         '   NOME_MESTRE, NOME_IMOVEL, ' + #13 +
         '   DESCCUSTORECIMO ' + #13;
         3:
         SQL.Text := SQL.Text +
         '   DATAVENCIMENTO, DATA_BAIXA, ' + #13 +
         '   ANOCOMPETENCIA, MESCOMPETENCIA, ' + #13 +
         '   NOME_MESTRE, NOME_IMOVEL, ' + #13 +
         '   DESCCUSTORECIMO ' + #13;
      end;

      Open;
   end;
end;



procedure TcfgRelDivergenciaLanc.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TcfgRelDivergenciaLanc.FormShow(Sender: TObject);
begin
   inherited;

   edtDivergencia.Value := 0.01;

   cboMesCompetencia.ItemIndex   := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value     := DiasInUteis.ExtraiAno(Date);

   dtmLookImobiliario.qryLookTipoRecDes.Open;
   dtmLookImobiliario.qryLookTipoImovel.Open;
end;



procedure TcfgRelDivergenciaLanc.btnBuscaClienteClick(Sender: TObject);
begin
   dtmMS.MS_Cliente.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query com apenas o registro buscado
   if dtmMS.MS_Cliente.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iDebitado          := StrToInt(dtmMS.MS_Cliente.ValoresChave[0]);
      edtDebitado.Text   := dtmMS.MS_Cliente.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;
end;



procedure TcfgRelDivergenciaLanc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLookImobiliario.qryLookTipoRecDes.Close;
   dtmLookImobiliario.qryLookTipoImovel.Close;

   inherited;
end;



procedure TcfgRelDivergenciaLanc.btnBuscaImovelMestreClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_ImovelouMestre.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelouMestre.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      if dtmMS.MS_ImovelouMestre.ValoresChave[9] = '1' then begin

         iImovelMestre              := StrToInt(dtmMS.MS_ImovelouMestre.ValoresChave[1]);
         iImovel                    := StrToInt(dtmMS.MS_ImovelouMestre.ValoresChave[0]);
         lblImovelouMestre.Caption  := 'Imóvel';
         edtImovelouMestre.Text     := dtmMS.MS_ImovelouMestre.ValoresChave[2] + ' - ' +
                                       dtmMS.MS_ImovelouMestre.ValoresChave[3];
      end else begin

         lblImovelouMestre.Caption  := 'Imóvel Mestre';

         iImovelMestre              := StrToInt(dtmMS.MS_ImovelouMestre.ValoresChave[1]);
         iImovel                    := -1;
         edtImovelouMestre.Text := dtmMS.MS_ImovelouMestre.ValoresChave[2];

      end;

      Screen.Cursor := crDefault;
   end;

   btnBuscaImovelMestre.SetFocus;
end;



procedure TcfgRelDivergenciaLanc.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;

   lblImovelouMestre.Caption  := 'Imóvel Mestre e/ou Imóvel';

   iImovelMestre  := -1;
   iImovel        := -1;

   edtImovelouMestre.Clear;
end;



end.
