{--------------------------------------------------------------------------------
Rotina : FiltraImovel
N. SOL: 176454
N. Kintana: 1612321
Data: 19/03/2012
Responsável: Helen V. Bianchi
Descrição : Correção no UNION

Rotina : FiltraImovel
N. SOL: 152676
N. Kintana: 1138237
Data: 24/03/2011
Responsável: Felipe de Oliveira
Descrição : Alterar o Relatório para mostrar documentos sem financeiro


Rotina.............: VerificaDataVigencia
N. Sol.............: 131922
N. Kintana.........: 756226
Data...............: 19/04/2010
Responsável........: Felipe de Oliveira
Descrição..........: Alterado Relatório  de Conta Corrente por Imóvel}

unit CRelCCImovel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, Mask, wwdbedit, wwdblook, Db,
  DBTables, Wwquery, fcCombo, fcColorCombo, MontaSelect, Wwdbspin,
  wwdbdatetimepicker, CMDateTimePicker, uModuloImobiliario, mImovelouMestre,
  Wwdotdot, Wwdbcomb, DBCtrls, DBClient, uCMClientDataSet, uCtrlPatrocinadora,
  uCtrlPlanPrevContabil, uCtrlPlanPrevContabPatro;

type
  TcfgRelCCImovel = class(TcfgRel)
    chkEmAberto: TCheckBox;
    grpDatas: TGroupBox;
    Label5: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    rdgLancamentos: TRadioGroup;
    rdgValores: TRadioGroup;
    rdgOrdenacao: TRadioGroup;
    Label3: TLabel;
    DBcboTipoRecDes: TwwDBLookupCombo;
    chkLinhas: TCheckBox;
    Label7: TLabel;
    chkAgrupar: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    edtAdminImovel: TEdit;
    btnBuscaAdminImovel: TBitBtn;
    btnLimpaAdminImovel: TBitBtn;
    Label6: TLabel;
    chkCompetencia: TCheckBox;
    rdgTipoData: TRadioGroup;
    DBcboTipoImovel: TwwDBLookupCombo;
    Label8: TLabel;
    molImovelouMestre1: TmolImovelouMestre;
    Label11: TLabel;
    dbcbSitImovel: TwwDBComboBox;
    cbVago: TCheckBox;
    lbl2: TLabel;
    cbbPlano: TDBLookupComboBox;
    lbl1: TLabel;
    cbbPatro: TDBLookupComboBox;
    cdsPlano: TCMClientDataSet;
    dsPlano: TDataSource;
    dsPatro: TDataSource;
    cdsPatro: TCMClientDataSet;
    cdsTemp: TClientDataSet;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaAdminImovelClick(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);
    procedure rdgValoresExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure molImovelouMestre1btnBuscaImovelClick(Sender: TObject);
    procedure molImovelouMestre1btnLimpaImovelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private { Private declarations }
    iAdminImovel  : integer;
    iImovelMestre : integer;
    iImovel       : integer;

    // SOL 126315 KTN 660053 Ricardo A.
    CtrlPatrocinadora: TCtrlPatrocinadora;
    CtrlPlanoPrev: TCtrlPlanPrevContabil;
    CtrlPlanoPatro: TCtrlPlanPrevContabPatro;
    // FIM SOL 126315 KTN 660053 Ricardo A.

    function VerificaPreenchimento: boolean;
    // Felipe de Oliveira SOL 131922 - KTN 756226
    // função que verifica se existe mais de uma data de vigência no período informado
    Function VerificaDataVigencia (dData : TDateTime) : Boolean;

    procedure FiltraImovel;

    procedure MontaQuery; override;

  public { Public declarations }
  end;



var
  cfgRelCCImovel: TcfgRelCCImovel;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobCC, uDiasInUteis, dLookImobiliario, uFuncoesImob, DMS, Provider;



function TcfgRelCCImovel.VerificaPreenchimento: boolean;
begin
  Result := True;

  try

    if ( ((length(trim(edtDataIni.Text)) = 0) or (length(trim(edtDataFim.Text)) = 0)) and
      ((cboMesCompetencia.ItemIndex = -1) or (DBspnAnoCompetencia.Value = 0)) ) then
      raise EValidacao.CreateVal('É necessário indicar o Período ou o Mês de Competência!', edtDataIni);

    // SOL 126315 KTN 660053 Ricardo A.
    if ( Trim(cbbPlano.Text) <> '' ) and ( Trim(cbbPatro.Text) = '' ) then
      raise EValidacao.CreateVal( 'Se o Plano Previdenciário estiver preenchido o Patrocinador' +
        ' também deve ser preenchido.', cbbPatro );
    if ( Trim( cbbPlano.Text ) = '' ) and ( Trim( cbbPatro.Text ) <> '' ) then
      raise EValidacao.CreateVal( 'Se o Patrocinador estiver preenchido o Plano Previdenciário' +
        ' também deve ser preenchido.', cbbPlano );

    if ( Trim(cbbPlano.Text) <> '' ) and
      not CtrlPlanoPatro.ValidaPlanoPatro( cbbPatro.KeyValue, cbbPlano.KeyValue ) then
      raise EValidacao.createVal( CtrlPlanoPatro.MessageInfo, cbbPatro );
    // FIM SOL 126315 KTN 660053 Ricardo A.

  except

    on ev : EValidacao do
    begin
      Result := False;
      Screen.Cursor := crDefault;
      if ev.Show then
        MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then
        ev.Control.SetFocus;
    end;
  end;

end;



procedure TcfgRelCCImovel.MontaQuery;
begin
   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         ppLogoCCImovel.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         ppLogoCCImovel.Picture := nil;

      rptCCImovel_lblDatas.Visible := edtDataIni.Text <> '';

      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
         rptCCImovel_lblDatas.Caption := FormatDateTime('DD/MM/YYYY', edtDataIni.Date) + ' a ' + FormatDateTime('DD/MM/YYYY', edtDataFim.Date);

         case rdgTipoData.ItemIndex of
            0: rptCCImovel_lblDatas.Caption := rptCCImovel_lblDatas.Caption + ' (datas de baixa)';
            1: rptCCImovel_lblDatas.Caption := rptCCImovel_lblDatas.Caption + ' (datas de inclusão)';
            2: rptCCImovel_lblDatas.Caption := rptCCImovel_lblDatas.Caption + ' (datas de lançamento)';
            3: rptCCImovel_lblDatas.Caption := rptCCImovel_lblDatas.Caption + ' (datas de vencimento)';
         end;

      end;

      rptCCImovel_lblCompetencia.Caption := cboMesCompetencia.Text + ' / ' + FormatFloat('0000', DBspnAnoCompetencia.Value);
      rptCCImovel_lblCompetencia.Visible := not(chkCompetencia.Checked);

      if DBcboTipoImovel.LookupValue <> '' then begin
         rptCCContrato_lblTipoImovel.Caption := DBcboTipoImovel.Text;
      end else begin
         rptCCContrato_lblTipoImovel.Caption := 'Todos os Tipos de Imóvel / Segmentos';
      end;

      if DBcboTipoRecDes.LookupValue <> '' then begin
         rptCCImovel_lblTipoRecDes.Caption := DBcboTipoRecDes.Text;
      end else begin
         rptCCImovel_lblTipoRecDes.Caption := '< Todos >';
      end;

      case rdgLancamentos.ItemIndex of
         0: rptCCImovel_lblRecPag.Caption       := '';
         1: rptCCImovel_lblRecPag.Caption       := 'Apenas lançamentos a Pagar';
         2: rptCCImovel_lblRecPag.Caption       := 'Apenas lançamentos a Receber';
      else
         rptCCImovel_lblRecPag.Caption          := '';
      end;

      case rdgValores.ItemIndex of
         0: rptCCImovel_lblPrevEfetivo.Caption  := '';
         1: rptCCImovel_lblPrevEfetivo.Caption  := 'Apenas valores Previstos';
         2: rptCCImovel_lblPrevEfetivo.Caption  := 'Apenas valores Efetivos';
      else
         rptCCImovel_lblPrevEfetivo.Caption     := '';
      end;

      if cbVago.Checked then
           rptCCImovel_lblVago.Caption := 'Apenas imóveis vagos'
      else rptCCImovel_lblVago.Caption := '';

      if dbcbSitImovel.ItemIndex <> -1 then begin
         rptCCImovel_lblSitImovel.Caption := dbcbSitImovel.Text;
      end;

      rptCCImovel_lblEmAberto.Visible           := chkEmAberto.Checked;

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   FiltraImovel;
end;



procedure TcfgRelCCImovel.FiltraImovel;
var
  // SOL 126316 KTN 660057 Ricardo A.
  sParamPlanoPatro, sImovelExtenso: string;
  iContadorGrupo, iContadorGeral, iRecsOut: Integer;
  // FIM SOL 126316 KTN 660057 Ricardo A.

begin

  // SOL 126316 KTN 660057 Ricardo A.
  if ( Trim( cbbPatro.Text ) <> '' ) then
  begin
    sParamPlanoPatro := ' AND EXISTS(' +
        '       SELECT 1' +
        '       FROM PLANOPATROXIMOVEL PPI, CONTRATOXIMOVEL CXI' +
        '       WHERE CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL' +
        '       AND CXI.IDIMOVEL = PPI.IDIMOVEL';
    sParamPlanoPatro := sParamPlanoPatro + '       AND PPI.IDPATRO = ' + IntToStr( cbbPatro.KeyValue );
    sParamPlanoPatro := sParamPlanoPatro + '       AND PPI.IDPLANOPREV = ' + IntToStr( cbbPlano.KeyValue );
    sParamPlanoPatro := sParamPlanoPatro + '       )';
  end
  else
    sParamPlanoPatro := '';
  // FIM SOL 126316 KTN 660057 Ricardo A.

   with dtmRelAdminImobCC.qryCCImovel do
   begin

      Close;
// seleciona tudo do union 
      SQL.Text := ' SELECT * FROM ' + #13 +
      '(SELECT ' + #13 +
      '   I.IDIMOVEL, I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE, ' + #13 +
      '   (IM.IMONOME||'' - ''||I.IMONOME) AS IMOVEL_EXTENSO, ' + #13 +
      '   I.CODTIPIMOVEL, ' + #13 +

      '   T.DESCCUSTORECIMO, ' + #13 +

      '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, ' + #13 +

      '   LI.IDLANCIMOVEL,TA.DESCRICAO, ' + #13 +

      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR, ' + #13 +

      '   PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI, ' + #13 +

      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO, ' + #13 +
      '   LD.VALOR, LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO, ' + #13 +

// Daniel Simões - P: 19142 - 16/05/2006
      '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ''2'', LI.DATAVENCIMENTO, ''4'', LD.DATALANCTO, DECODE(RP.DATABAIXA, NULL, LD.DATALANCTO, RP.DATABAIXA) ) AS DATA, ' + #13 +

      '   ( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
      '   ) AS TOT_RECEBER, ' + #13 +

      '   DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) AS TOT_RECEBIDO, ' + #13 +

      '   ( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) ' + #13 +
      '   ) AS TOT_PAGAR, ' + #13 +

      '   DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) AS TOT_PAGO, ' + #13 +

      '   ( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) - ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
      '   ) AS SALDO_RECEB, ' + #13 +

      '   ( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0)  - ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) ' + #13 +
      '   ) AS SALDO_PAGAR ' + #13 +

      'FROM ' + #13 +
      '   PESSOA PFC, ' + #13 +
      '   DOCUMENTO D, LANCTODOCUM LD, ' + #13 +

      '  ( SELECT CODDOCUMENTO, VALOR ' + #13 +
      '    FROM LANCTODOCUM ' + #13 +
      '    WHERE RTRIM(OPERACAO) = ''1'' OR RTRIM(OPERACAO) = ''2'' OR RTRIM(OPERACAO) = ''3'' OR RTRIM(OPERACAO) = ''12'') TRD, ' + #13 +

      '   RECBTOPAGTO RP, TIPOALTERADOR TA, ' + #13 +
      '   IMOVEL I, IMOVEL IM, ' + #13 +
      '   TIPOCUSTORECIMOV T, LANCAMENTOSIMOVEL LI ' + #13 +

      'WHERE ' + #13;

      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
         case rdgTipoData.ItemIndex of
            0: SQL.Text := SQL.Text + '   ( RP.DATABAIXA BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            1: SQL.Text := SQL.Text + '   ( LI.TRGDTINCLUSAO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            2: SQL.Text := SQL.Text + '   ( LI.DATALANCAMENTO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            3: SQL.Text := SQL.Text + '   ( LI.DATAVENCIMENTO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
         end;
      end;

      if not(chkCompetencia.Checked) then begin
      SQL.Text := SQL.Text +
      '   ( LI.MESCOMPETENCIA = ' + IntToStr(cboMesCompetencia.ItemIndex + 1) + ' AND LI.ANOCOMPETENCIA = ' + FloatToStr(DBspnAnoCompetencia.Value) + ' ) AND ';
      end;

      if iImovelMestre > 0 then
      SQL.Text := SQL.Text + #13 +
      '   ( I.IDIMOVELMESTRE = ' + IntToStr(iImovelMestre) + ' ) AND ' + #13;

      if iImovel > 0 then
      SQL.Text := SQL.Text +
      '   ( I.IDIMOVEL = ' + IntToStr(iImovel) + ' ) AND ' + #13;

      if edtAdminImovel.Text <> '' then
      SQL.Text := SQL.Text +
      '   ( I.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) AND ' + #13;

      if DBcboTipoImovel.LookupValue <> '' then
      SQL.Text := SQL.Text +
      '   ( I.CODTIPIMOVEL = ''' + DBcboTipoImovel.LookupValue + ''' ) AND ' + #13;

      if dbcbSitImovel.ItemIndex <> -1 then
      SQL.Text := SQL.Text +
      '   ( I.FLGSTATUS = ''' + dbcbSitImovel.Value + ''' ) AND ' + #13;

      if DBcboTipoRecDes.LookupValue <> '' then
      SQL.Text := SQL.Text +
      '   ( LI.IDTIPOCUSTORECIMO = ' + DBcboTipoRecDes.LookupValue + ' ) AND ' + #13;

      Case rdgLancamentos.ItemIndex of
         1: SQL.Text := SQL.Text + '   ( D.RECPAG = ''P'' ) AND ' + #13;
         2: SQL.Text := SQL.Text + '   ( D.RECPAG = ''R'' ) AND ' + #13;
      end;

      Case rdgValores.ItemIndex of
         1: SQL.Text := SQL.Text + '   ( (RTRIM(LD.OPERACAO) = ''1'') OR (RTRIM(LD.OPERACAO) = ''2'') OR (RTRIM(LD.OPERACAO) = ''4'') ) AND ' + #13;
         2: SQL.Text := SQL.Text + '   ( RTRIM(LD.OPERACAO) = ''5'' ) AND ' + #13;
      end;

      if cbVago.Checked then
         SQL.Text := SQL.Text + #13 + '   ( I.FLGSTATUSOCUPACAO = ''D'' ) AND ';

      if chkEmAberto.Checked then
      SQL.Text := SQL.Text + #13 +
      '   ( (D.STATUS <> ''2'') OR (D.STATUS IS NULL) ) AND ';

      SQL.Text := SQL.Text +
      '   ( I.IDIMOVELMESTRE = IM.IDIMOVEL )                      ' + #13 +
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL )                        ' + #13 +
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )                ' + #13 +
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )                ' + #13 +
      '   AND ( LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) )            ' + #13 +
      '   AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO )               ' + #13 +
      '   AND ( LD.NUMLANCTO = RP.NUMLANCTO(+) )                  ' + #13 +
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )            ' + #13 +
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )      ' + #13 +
      '   AND ( D.IDFORCLI = PFC.IDPESSOA(+) )                    ' + #13 ;
// SOL 152676  Felipe de Oliveira
// o order by agora vai entrar no select "pai" que compõe o select do antigo relatório e o novo select
// que irá fazer o union all pra trazer também os documentos sem financeiro
//      'ORDER BY ' + #13 +
//      '   IM.IMONOME, I.IMONOME, ' + #13;

//      case rdgOrdenacao.ItemIndex of
//
//         0:
//         begin
//            SQL.Text := SQL.Text +
//            '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13;
//
//            if chkAgrupar.Checked then
//            SQL.Text := SQL.Text +
//            '   LI.IDLANCIMOVEL, ' + #13;
//
//            SQL.Text := SQL.Text +
//            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
//            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
//            '   RTRIM(LD.OPERACAO), ' + #13 +
//            '   T.DESCCUSTORECIMO ' + #13;
//
//            if not(chkAgrupar.Checked) then
//            SQL.Text := SQL.Text +
//            '   , LI.IDLANCIMOVEL ';
//         end;
//
//         1:
//         begin
//            SQL.Text := SQL.Text +
//            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
//            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
//            '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13;
//
//            if chkAgrupar.Checked then
//            SQL.Text := SQL.Text +
//            '   LI.IDLANCIMOVEL, ' + #13;
//
//            SQL.Text := SQL.Text +
//            '   RTRIM(LD.OPERACAO), ' + #13 +
//            '   T.DESCCUSTORECIMO ' + #13;
//
//            if not(chkAgrupar.Checked) then
//            SQL.Text := SQL.Text +
//            '   , LI.IDLANCIMOVEL ';
//         end;


// a partir daki será feito o union all que trará  no relatório os documentos lançados
// sem financeiro pelo processo de lançamentos multiplos do adminimob
     SQL.Text := SQL.Text + ' UNION ALL                                                                ' + #13 +
     'SELECT DISTINCT                                                                                  ' + #13 +
     '       I.IDIMOVEL,                                                                               ' + #13 +
     '       I.IDIMOVELMESTRE,                                                                         ' + #13 +
     '       IM.IMONOME AS NOME_MESTRE,                                                                ' + #13 +
     '       (IM.IMONOME||'' - ''||I.IMONOME) AS IMOVEL_EXTENSO,                                       ' + #13 +
     '       I.CODTIPIMOVEL,                                                                           ' + #13 +
//     '       T.DESCCUSTORECIMO,                                                                      ' + #13 +
     '       ''SEM FINANCEIRO'',                                                                       ' + #13 +
     '       LI.DATALANCAMENTO,                                                                        ' + #13 +
     '       LI.DATAVENCIMENTO,                                                                        ' + #13 +
     '       LI.MESCOMPETENCIA,                                                                        ' + #13 +
     '       LI.ANOCOMPETENCIA,                                                                        ' + #13 +
     '       LI.IDLANCIMOVEL,                                                                          ' + #13 +
     '       '''' AS DESCRICAO,                                                                        ' + #13 +
     '       LI.RECPAG,                                                                                ' + #13 +
     '       '''' AS STATUS,                                                                           ' + #13 +
     '       LI.NODOCUMENTO,                                                                           ' + #13 +
     '       0 AS NUMAPGR,                                                                             ' + #13 +
     '       PFC.NOME        AS NF_FORCLI,                                                             ' + #13 +
     '       PFC.RAZAOSOCIAL AS RS_FORCLI,                                                             ' + #13 +
     '       LI.CODDOCUMENTO,                                                                          ' + #13 +
     '       0 AS CODALTERADOR,                                                                        ' + #13 +
     '       '''' AS OPERACAO,			                                                       ' + #13 +
     '       0 AS VALOR,                                                                               ' + #13 +
     '       LA.LACDEBCRE AS DEBCRE,                                                                   ' + #13 +
     '       '''' AS HISTORICOCOMPL,                                                                   ' + #13 +
     '       LI.DATAEMISSAO,                                                                           ' + #13 +
     '       LI.DATAVENCIMENTO AS DATA,                                                                ' + #13 +
     '       DECODE(LI.RECPAG,''R'',DECODE(LA.LACDEBCRE,''D'',LI.VLRLANCRECEB, 0),0) AS TOT_RECEBER,   ' + #13 +
     '       DECODE(LI.RECPAG,''R'',DECODE(LA.LACDEBCRE,''C'',LI.VLRLANCRECEB, 0),0) AS TOT_RECEBIDO,  ' + #13 +
     '       DECODE(LI.RECPAG,''P'',DECODE(LA.LACDEBCRE,''C'',LI.VLRLANCPAGAR, 0),0) AS TOT_PAGAR,     ' + #13 +
     '       DECODE(LI.RECPAG,''P'',DECODE(LA.LACDEBCRE,''D'',LI.VLRLANCPAGAR, 0),0) AS TOT_PAGO,      ' + #13 +
     '0 AS SALDO_RECEB,  ' + #13 +
     '0 AS SALDO_PAGAR   ' + #13 +
     'FROM   PESSOA PFC,                                                                               ' + #13 +
     '       IMOVEL I,                                                                                 ' + #13 +
     '       IMOVEL IM,                                                                                ' + #13 +
     '       TIPOCUSTORECIMOV  T,                                                                      ' + #13 +
     '       LANCAMENTOSIMOVEL LI,                                                                     ' + #13 +
     '       PLANILHA PLN,                                                                             ' + #13 +
     '       LANCAMENTO LA                                                                             ' + #13 +
     'WHERE                                                                                            ' + #13;
      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
         case rdgTipoData.ItemIndex of
            //HELEN - SOL : 176454 KINTANA 1612321 - INICIO
            0: SQL.Text := SQL.Text + '   ( PLN.PLNDATDIA BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            //HELEN - SOL : 176454 KINTANA 1612321 - FIM
            1: SQL.Text := SQL.Text + '   ( LI.TRGDTINCLUSAO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            2: SQL.Text := SQL.Text + '   ( LI.DATALANCAMENTO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            3: SQL.Text := SQL.Text + '   ( LI.DATAVENCIMENTO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
         end;
      end;

      if not(chkCompetencia.Checked) then begin
      SQL.Text := SQL.Text +
      '   ( LI.MESCOMPETENCIA = ' + IntToStr(cboMesCompetencia.ItemIndex + 1) + ' AND LI.ANOCOMPETENCIA = ' + FloatToStr(DBspnAnoCompetencia.Value) + ' ) AND ';
      end;

      if iImovelMestre > 0 then
      SQL.Text := SQL.Text + #13 +
      '   ( I.IDIMOVELMESTRE = ' + IntToStr(iImovelMestre) + ' ) AND ' + #13;

      if iImovel > 0 then
      SQL.Text := SQL.Text +
      '   ( I.IDIMOVEL = ' + IntToStr(iImovel) + ' ) AND ' + #13;

      if edtAdminImovel.Text <> '' then
      SQL.Text := SQL.Text +
      '   ( I.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) AND ' + #13;

      if DBcboTipoImovel.LookupValue <> '' then
      SQL.Text := SQL.Text +
      '   ( I.CODTIPIMOVEL = ''' + DBcboTipoImovel.LookupValue + ''' ) AND ' + #13;

      if dbcbSitImovel.ItemIndex <> -1 then
      SQL.Text := SQL.Text +
      '   ( I.FLGSTATUS = ''' + dbcbSitImovel.Value + ''' ) AND ' + #13;

      if DBcboTipoRecDes.LookupValue <> '' then
      SQL.Text := SQL.Text +
      '   ( LI.IDTIPOCUSTORECIMO = ' + DBcboTipoRecDes.LookupValue + ' ) AND ' + #13;

      if cbVago.Checked then
         SQL.Text := SQL.Text + #13 + '   ( I.FLGSTATUSOCUPACAO = ''D'' ) AND ';



    SQL.Text := SQL.Text +
     '   (LI.PLNCODIGO = PLN.PLNCODIGO)                 ' + #13 +
     'AND (LI.PLNCODIGO = LA.PLNCODIGO)                  ' + #13 +
     'AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)               ' + #13 +
     'AND (LI.IDIMOVEL = I.IDIMOVEL)                     ' + #13 +
     'AND (LI.CODDOCUMENTO IS NULL)                      ' + #13 +
     'AND (LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO)   ' + #13 +
     'AND (LI.IDFORCLI = PFC.IDPESSOA(+))                ' + #13 +
// aki se finaliza o union que é fechado no parêntese abaixo
     ' )  ORDER BY                                       ' + #13 +
      '   NOME_MESTRE, IMOVEL_EXTENSO, ' + #13;

      case rdgOrdenacao.ItemIndex of

         0:
         begin
            SQL.Text := SQL.Text +
            '   ANOCOMPETENCIA, MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then
            SQL.Text := SQL.Text +
            '   IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            'DATA,                ' + #13 +
            'DESCCUSTORECIMO      ' + #13;

            if not(chkAgrupar.Checked) then
            SQL.Text := SQL.Text +
            '   , IDLANCIMOVEL ';
         end;

         1:
         begin
            SQL.Text := SQL.Text +
            '   DATA, ' + #13 +
            '   ANOCOMPETENCIA, MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then
            SQL.Text := SQL.Text +
            '   IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then
            SQL.Text := SQL.Text +
            '   , IDLANCIMOVEL ';
         end;

      end;
      Open;
   end;

end;



procedure TcfgRelCCImovel.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
   dtmRelAdminImobCC.dDataFinal := edtDataFim.Date;
   if VerificaDataVigencia(edtDataFim.Date) then
   begin
      MessageDlg('Para este período existem mais de um percentual de segregação vigente. '+#13+#10+
                 'Relatório considerará o percentual vigente na data final', mtWarning, [mbOK], 0);
   end;

end;

Function TcfgRelCCImovel.VerificaDataVigencia(dData : TDateTime ) : Boolean;
var
  qryData : TQuery;
  sql : String;
begin
   Result := False;
   qryData := TQuery.Create(nil);
   qryData.DatabaseName := 'BASEDADOS';

   sql := 'SELECT COUNT (DISTINCT DATAVIGENCIA) AS CONT_DATA FROM PLANOPATROXVIGENCIAIMOB' +#13+
          ' WHERE DATAVIGENCIA <= '+ QuotedStr (DateToStr(dData));

   qryData.Close;
   qryData.SQL.Add(sql);
   qryData.Open;

   if qryData.FieldByName('CONT_DATA').AsInteger > 1 then
      Result := True;
end;


procedure TcfgRelCCImovel.FormShow(Sender: TObject);
begin
   inherited;

   cboMesCompetencia.ItemIndex   := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value     := DiasInUteis.ExtraiAno(Date);

   LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
   dtmLookImobiliario.qryLookTipoRecDes.Open;

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;

   iAdminImovel  := -1;
   iImovelMestre := -1;
   iImovel       := -1;
end;



procedure TcfgRelCCImovel.btnBuscaAdminImovelClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_AdminImovel.Executar;
   // dtmMS.MS_AdminImovel.CamposChave
   //    [0] A.IDADMINIMOVEL
   //    [1] P.NOME
   //    [2] P.RAZAOSOCIAL

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



procedure TcfgRelCCImovel.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;



procedure TcfgRelCCImovel.rdgValoresExit(Sender: TObject);
begin
   inherited;

   case rdgValores.ItemIndex of
      1: rdgTipoData.ItemIndex := 3;
      2: rdgTipoData.ItemIndex := 0;
   end;
end;



procedure TcfgRelCCImovel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLookImobiliario.qryLookTipoRecDes.Close;

  // SOL 126315 KTN 660053 Ricardo A.
  FreeAndNil( CtrlPatrocinadora );
  FreeAndNil( CtrlPlanoPrev );
  FreeAndNil( CtrlPlanoPatro );
  // FIM SOL 126315 KTN 660053 Ricardo A.

   inherited;
end;



procedure TcfgRelCCImovel.molImovelouMestre1btnBuscaImovelClick(Sender: TObject);
begin
  inherited;
  molImovelouMestre1.btnBuscaImovelClick(Sender);
  if molImovelouMestre1.iImovel > 0 then begin
     if molImovelouMestre1.iMestre > 0 then begin
        iImovel := molImovelouMestre1.iImovel;
        iImovelMestre := molImovelouMestre1.iMestre;
     end else begin
        iImovel := -1;
        iImovelMestre := molImovelouMestre1.iImovel;
     end;
  end;
end;

procedure TcfgRelCCImovel.molImovelouMestre1btnLimpaImovelClick(Sender: TObject);
begin
  inherited;
  molImovelouMestre1.btnLimpaImovelClick(Sender);
  iImovelMestre  := -1;
  iImovel        := -1;
end;


procedure TcfgRelCCImovel.FormCreate(Sender: TObject);
begin
  inherited;

  // SOL 126315 KTN 660053 Ricardo A.
  CtrlPatrocinadora := TCtrlPatrocinadora.Create;
  CtrlPatrocinadora.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlPlanoPrev := TCtrlPlanPrevContabil.Create;
  CtrlPlanoPrev.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlPlanoPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanoPatro.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true);

  cdsPatro.Data := CtrlPatrocinadora.ListaPatrocinadora();
  cdsPlano.Data := CtrlPlanoPrev.ListaPlanPrevContabil();
  // FIM SOL 126315 KTN 660053 Ricardo A.

end;

end.
