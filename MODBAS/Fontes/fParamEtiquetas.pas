unit fParamEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoal, Db,
  DBTables, Wwquery, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TB97, wwdblook, ExtCtrls, Spin,
  TEdNum, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmParamEtiquetas = class(TfrmSelPessoal)
    tbshConfigEtiq: TTabSheet;
    rgTipoEtiq: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    gbxConfigEtiq: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    spedAlt: TSpinEdit;
    spedCarr: TSpinEdit;
    spedMargAlto: TSpinEdit;
    spedMargEsquerda: TSpinEdit;
    gbxIntervRef: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    dtedIni: TCMDateTimePicker;
    dtedFin: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgTipoEtiqClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  frmParamEtiquetas: TfrmParamEtiquetas;
  bLotCargo, bPonto, bAltFunc, bFerias : boolean;
implementation

uses uMensErro, fAguarde, uFuncoesUteis, dRelatoriosComum;

const
  PIXEL_MILIM = 0.265;

{$R *.DFM}

procedure TfrmParamEtiquetas.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  //Fazquery(DtmBaseDados.qry,'ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '',.''');

  dtedIni.Date := Date - 30;
  dtedFin.Date := Date;

  cmbTipoPapel.Items.Assign (dtmRelatoriosComum.rpEtiquetas.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

end;

procedure TfrmParamEtiquetas.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  PaperWidth: single;
  sListaFunc: string;
  rMargemEsq: real;
begin
  inherited;
  bLotCargo := not(cbxCandidatos.Checked) and (rgTipoEtiq.ItemIndex = 1);
  bPonto    := not(cbxCandidatos.Checked) and (rgTipoEtiq.ItemIndex = 2);
  bAltFunc  := not(cbxCandidatos.Checked) and (rgTipoEtiq.ItemIndex = 3);
  bFerias   := not(cbxCandidatos.Checked) and (rgTipoEtiq.ItemIndex = 4);

  c:=0;

  while not(tblPessoal.EOF) do
  begin
    if (c = 0) then
    begin
      sListaFunc := tblPessoal.FieldByName('IDPESSOA').asString;
      Inc(c);
    end
    else
      sListaFunc := sListaFunc +','+ tblPessoal.FieldByName('IDPESSOA').asString;

    tblPessoal.Next;
  end;

  dtmRelatoriosComum.qryEtiquetas.Close;
  PaperWidth := dtmRelatoriosComum.rpEtiquetas.PrinterSetup.PaperWidth;
  with (dtmRelatoriosComum.qryEtiquetas.SQL) do
  begin
    Clear;
    Add('SELECT');
    if rgTipoEtiq.ItemIndex < 3 then
       Add('  PF.NOME,');
    //else
    //   Add('  '' '' AS NOME,')
    ///end;
    if (bLotCargo) then
    begin
      Add('  '' '' AS CAMPO4,');
      Add('  C.TITULO AS CAMPO1,');
      Add('  PJ.NOME  AS CAMPO2,');
      Add('  CC.NOME  AS CAMPO3');
      Add('FROM');
      Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F,');
      Add('  CENTCUST CC, CARGO C');
    end
    else
    if (bPonto) then
    begin
      Add('  ''Matr: '' || F.MATRICULA || ''  CTPS: '' || CTPS.NUM || '' - '' || CTPS.UF  AS CAMPO4,');
      Add('  C.TITULO AS CAMPO1,');
      Add('  PJ.NOME  AS CAMPO2,');
      Add('  HT.NOMEHORARIO AS CAMPO3');
      Add('FROM');
      Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F,');
      Add('  HORATRAB HT, CARGO C,');
      // CTPS do Funcionário
      Add('  (SELECT F.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
      Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO, TIPODOCPESSOA TDP,');
      Add('          ESTADO ES, PAIS PA');
      Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
      Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
      Add('         (TDP.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
      Add('         (F.IDPESSOA         = DP.IDPESSOA) AND');
      Add('         (DP.IDPAIS          = PA.IDPAIS) AND');
      Add('         (ES.IDPAIS          = PA.IDPAIS) AND');
      Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS ');
      // -------------------------------------------------------------------- //
    end
    else
    if (bAltFunc) then
    begin
      Add('  ''Aumentado em: '' ||');
      Add('  TO_CHAR(PF.DATAALTERFUNC,''DD/MM/YYYY'') ||');
      Add('  '' para R$ '' || TRIM(TO_CHAR(PF.SALARIO,''999G999D99'')) AS CAMPO4,');
      Add('  ''Na função de '' || C.TITULO AS NOME,');
      Add('  ''CBO: '' || C.CBO || '' Por motivo de '' || RPAD(MO.DESCRICAO,25,'' '') AS CAMPO1,');
      Add('  ''___________________________________________'' AS CAMPO2,');
      Add('  F.MATRICULA || ''   Assinatura do Empregador '' AS CAMPO3,');
      Add('  PF.IDPESSOA, PF.IDCARGO, PF.DATAALTERFUNC');
      Add('FROM');
      Add('  EVOLFUNC PF, FUNCIONARIO F, MOTIVO MO, CARGO C');
    end
    else
    if (bFerias) then
    begin
      Add('  ''Gozou férias relativas ao período: '' AS CAMPO4,');
      Add('  ''       '' || TO_CHAR(INIPERIODOFERIAS,''DD/MM/YYYY'') ||');
      Add('  '' a '' || TO_CHAR(ADD_MONTHS(INIPERIODOFERIAS, 12) -1,''DD/MM/YYYY'') AS NOME,');
      Add('  ''  de '' || TO_CHAR(INIGOZOFERIAS,''DD/MM/YYYY'') ||');
      Add('  '' a '' || TO_CHAR(FIMGOZOFERIAS,''DD/MM/YYYY'') AS CAMPO1,');
      Add('  ''___________________________________________'' AS CAMPO2,');
      Add('  F.MATRICULA || ''   Assinatura do Empregador '' AS CAMPO3');
      Add('  FROM FERIAS PF, FUNCIONARIO F');
    end
    else
    begin
      Add('  '' '' AS CAMPO4,');
      Add('  DECODE(RTRIM(E.LOGRADOURO),NULL,NULL,RTRIM(E.LOGRADOURO) ||');
      Add('    '', ''|| E.NUMERO || DECODE(RTRIM(E.COMPLEMENTO),');
      Add('    NULL,NULL,'' - '' || RTRIM(E.COMPLEMENTO))) AS CAMPO1,');
      Add('  E.BAIRRO     AS CAMPO2,');
      Add('  ES.CODESTADO AS UF,');
      Add('  CI.NOME      AS CIDADE,');
      Add('  DECODE(RTRIM(E.CEP),NULL,NULL,RTRIM(SUBSTR(E.CEP,1,5)) ||''-''||');
      Add('    RTRIM(SUBSTR(E.CEP,6,3))) AS CAMPO3');
      Add('FROM');
      Add('  PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, FUNCIONARIO F,');
      Add('  CIDADES CI, ESTADO ES');
    end;

    Add('WHERE');

    // Funcionários selecionado(s)
    if (sListaFunc <> '') then
    begin
      if (Pos(',',sListaFunc) > 0) then
        Add('  (PF.IDPESSOA        IN (' +sListaFunc+ ')) AND')
      else
        Add('  (PF.IDPESSOA         = ' +sListaFunc+ ') AND');
    end
    else
      Add('  (PF.IDPESSOA      = -1) AND');

    if rgTipoEtiq.ItemIndex < 3 then
    begin
      Add('  (PF.IDPESSOA         = PEFIS.IDPESSOA)    AND');
      Add('  (PF.IDPESSOA         = F.IDPESSOA)        AND');
    end;

    if (bLotCargo) then
    begin
      Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO) AND');
      Add('  (F.IDEMPRESA         = CC.IDEMPRESA)      AND');

      if (cbxCargoAltern.Checked) then
         Add(' (DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = C.IDCARGO) AND')
      else
         Add('  (F.IDCARGO           = C.IDCARGO)         AND');

      Add('  (F.IDESTAB           = PJ.IDPESSOA(+))');
    end
    else
    if (bPonto) then
    begin
      Add('  (F.IDHORARIO         = HT.IDHORARIO)      AND');
      Add('  (F.IDCARGO           = C.IDCARGO)         AND');
      Add('  (F.IDPESSOA          = CTPS.IDPESSOA(+))  AND');
      Add('  (F.IDESTAB           = PJ.IDPESSOA(+))');
    end
    else
    if (bAltFunc) then
    begin
      Add('  (MO.GRUPOMOTIVO IN (''A'',''D''))      AND');
      Add('  (PF.DATAALTERFUNC BETWEEN TO_DATE(' + QuotedStr(dtedIni.Text) +
          ',''DD/MM/YYYY'') AND ' +
          'TO_DATE('+QuotedStr(dtedFin.Text)+',''DD/MM/YYYY'')) AND');
      Add('  (PF.IDPESSOA      = F.IDPESSOA)     AND');
      Add('  (PF.IDMOTIVO      = MO.IDMOTIVO(+)) AND');
      Add('  (PF.IDCARGO       = C.IDCARGO(+))');
    end
    else
    if (bFerias) then
    begin
      Add('  (FLGOCORRIDA = 1) AND');
      Add('  (INIGOZOFERIAS BETWEEN TO_DATE(' + QuotedStr(dtedIni.Text) +
          ',''DD/MM/YYYY'') AND ' +
          'TO_DATE('+QuotedStr(dtedFin.Text)+',''DD/MM/YYYY'')) AND');
      Add('  (PF.IDPESSOA      = F.IDPESSOA)');
    end
    else
    begin
      Add('  (PF.IDENDRESIDENCIAL = E.IDENDERECO(+))   AND');
      Add('  (E.IDCIDADES         = CI.IDCIDADES(+))   AND');
      Add('  (CI.IDESTADO         = ES.IDESTADO(+))');
    end;

    if rgTipoEtiq.ItemIndex < 3 then
       Add('ORDER BY NOME')
    else
    if rgTipoEtiq.ItemIndex = 3 then
       Add('ORDER BY CAMPO3, PF.DATAALTERFUNC')
    else
       Add('ORDER BY CAMPO3, CAMPO4');
    SaveToFile ('c:\qry.txt');
  end;

  frmAguarde.Mostra('Impressão de Etiquetas');
  frmAguarde.Pos := 0;
  dtmRelatoriosComum.qryEtiquetas.Open;
  if not(dtmRelatoriosComum.qryEtiquetas.IsEmpty) then
  begin
    with (dtmRelatoriosComum) do
    begin
      rMargemEsq                          := spedMargEsquerda.Value;
      rpEtiquetasDtlBnd.Height            := spedAlt.Value * 19 * PIXEL_MILIM;
      rpEtiquetas.Columns                 := spedCarr.Value;
      rpEtiquetas.PrinterSetup.MarginTop  := spedMargAlto.Value;
      rpEtiquetas.PrinterSetup.MarginLeft := rMargemEsq;
      rpEtiquetas.PrinterSetup.PaperName  := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
      rpEtiquetasDBCampo3.AutoSize        := (bPonto) or (rgTipoEtiq.ItemIndex > 2);

      with (rpEtiquetas.ColumnPositions) do
      begin
        Clear;
        Add(IntToStr(Round(rMargemEsq) + 1)); // Primeira coluna
        Add(IntToStr(Round(rMargemEsq) + Trunc(PaperWidth / spedCarr.Value))); // Segunda coluna
        if (spedCarr.Value = 3) then
          Add(IntToStr((Round(rMargemEsq) + Trunc(PaperWidth / spedCarr.Value)) * 2)); // Terceira coluna
      end;
    end;
  end
  else
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
  end;
end;

procedure TfrmParamEtiquetas.rgTipoEtiqClick(Sender: TObject);
begin
  inherited;
  gbxIntervRef.Visible := (rgTipoEtiq.ItemIndex > 2);
end;

procedure TfrmParamEtiquetas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //Fazquery(DtmBaseDados.qry,'ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ''.,''');
end;

end.
