unit FPRelBenefaPreparar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, CheckLst, Db, DBTables, Wwquery, Spin, fcCombo,
  fcColorCombo, usistema, dbasedados;

type
  TFrmPRelBenefaPreparar = class(TfrmOkCancelar)
    rdoTipoFolha: TRadioGroup;
    pnlPatroePlano: TPanel;
    pnlPatro: TPanel;
    lblPatro: TLabel;
    chklstPatro: TCheckListBox;
    Splitter1: TSplitter;
    pnlPlano: TPanel;
    chklstPlano: TCheckListBox;
    lblPlano: TLabel;
    pnlBeneficios: TPanel;
    chklstBeneficios: TCheckListBox;
    lblBeneficio: TLabel;
    grbConsolidar: TGroupBox;
    qryAux: TwwQuery;
    cboxPatro: TCheckBox;
    cboxPlano: TCheckBox;
    cboxBeneficios: TCheckBox;
    cmbMes: TComboBox;
    lblMesRef: TLabel;
    lblAnoRef: TLabel;
    speAno: TSpinEdit;
    rdoInformacoes: TRadioGroup;
    rdoTipoOrdem: TRadioGroup;
    grbCor: TGroupBox;
    lblCor: TLabel;
    dlgColor: TColorDialog;
    ccbEscolheCor: TfcColorCombo;
    procedure MontaQuery;    
    procedure FormCreate(Sender: TObject);
    procedure cboxPatroClick(Sender: TObject);
    procedure chklstPatroClick(Sender: TObject);
    procedure chklstPlanoClick(Sender: TObject);
    procedure chklstBeneficiosClick(Sender: TObject);
    procedure cboxPlanoClick(Sender: TObject);
    procedure cboxBeneficiosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rdoInformacoesClick(Sender: TObject);
  private
    { Private declarations }
    sMesReferencia : String;
    ListaPatro     : TStringList;
    ListaPlano     : TStringList;
    ListaBeneficio : TStringList;
    sPatroSel, sPlanoSel, sBeneficioSel: string;

    procedure MontaListaPatro;
    procedure MontaListaPlano;
    procedure MontaListaBeneficio;
    procedure VerificaProcessa;
    procedure DeterminaPatroSel;
    procedure DeterminaPlanoSel;
    procedure DeterminaBeneficios;
    procedure MudaComponentes;
    procedure FiltraBenefMesPorTipoFolha(flgabono       : integer;
                                         bbenefXcontrib : boolean;
                                         var       ssql : string);

  public
    { Public declarations }
  end;

var
  FrmPRelBenefaPreparar: TFrmPRelBenefaPreparar;

implementation

Uses uDataBase, uFuncoesFolha, dRelBenefaPreparar, uMensErro;

{$R *.DFM}

procedure TFrmPRelBenefaPreparar.FormCreate(Sender: TObject);
begin
  inherited;
  ListaPatro     := TStringList.Create;
  ListaPlano     := TStringList.Create;
  ListaBeneficio := TStringList.Create;
  MontaListaPatro;
  MontaListaPlano;
  MontaListaBeneficio;
end;

procedure TFrmPRelBenefaPreparar.MontaListaBeneficio;
begin
  chklstBeneficios.Items.Clear;
  ListaBeneficio.Clear;
  If FazQuery(qryAux, 'SELECT IDBENEFICIO, NOME FROM BENEFICIO') Then
    While Not qryAux.Eof Do
    Begin
      chklstBeneficios.Items.Add(qryAux.FieldByName('NOME').AsString);
      ListaBeneficio.Add(qryAux.FieldByName('IDBENEFICIO').AsString);
      qryAux.Next;
    End;
end;

procedure TFrmPRelBenefaPreparar.MontaListaPatro;
begin
  chklstPatro.Items.Clear;
  ListaPatro.Clear;
  If FazQuery(qryAux, 'SELECT P.IDPESSOA, P.NOME FROM PATRO PT, PESSOA P '+
                      'WHERE P.IDPESSOA = PT.IDPESSOA') Then
    While Not qryAux.Eof Do
    Begin
      chklstPatro.Items.Add(qryAux.FieldByName('NOME').AsString);
      ListaPatro.Add(qryAux.FieldByName('IDPESSOA').AsString);
      qryAux.Next;
    End;
end;

procedure TFrmPRelBenefaPreparar.MontaListaPlano;
begin
  chklstPlano.Items.Clear;
  ListaPlano.Clear;
  If FazQuery(qryAux, 'SELECT IDPLANOPREV, NOME FROM PLANPREV') Then
    While Not qryAux.Eof Do
    Begin
      chklstPlano.Items.Add(qryAux.FieldByName('NOME').AsString);
      ListaPlano.Add(qryAux.FieldByName('IDPLANOPREV').AsString);
      qryAux.Next;
    End;
end;

procedure TFrmPRelBenefaPreparar.cboxPatroClick(Sender: TObject);
begin
  inherited;
  MarcaLista(chklstPatro, cboxPatro.Checked);
  VerificaProcessa;
end;

procedure TFrmPRelBenefaPreparar.VerificaProcessa;
begin
  DeterminaPatroSel;
  DeterminaPlanoSel;
  DeterminaBeneficios;
  bbtnConfirmar.enabled:=((sPatroSel <> '') Or (cboxPatro.checked)) And
                         ((sPlanoSel <> '') Or (cboxPlano.checked)) And
                         ((sBeneficioSel <> '') Or (cboxBeneficios.checked));
end;

procedure TFrmPRelBenefaPreparar.DeterminaBeneficios;
begin
  If Not cboxBeneficios.Checked then
    MontaFiltro(chklstBeneficios, ListaBeneficio, sBeneficioSel);
end;

procedure TFrmPRelBenefaPreparar.DeterminaPatroSel;
begin
  If Not cboxPatro.Checked then
    MontaFiltro(chklstPatro, ListaPatro, sPatroSel);
end;

procedure TFrmPRelBenefaPreparar.DeterminaPlanoSel;
begin
  If Not cboxPlano.Checked then
    MontaFiltro(chklstPlano, ListaPlano, sPlanoSel);
end;

procedure TFrmPRelBenefaPreparar.chklstPatroClick(Sender: TObject);
begin
  inherited;
  VerificaProcessa;
end;

procedure TFrmPRelBenefaPreparar.chklstPlanoClick(Sender: TObject);
begin
  inherited;
  VerificaProcessa;
end;

procedure TFrmPRelBenefaPreparar.chklstBeneficiosClick(Sender: TObject);
begin
  inherited;
  VerificaProcessa;
end;

procedure TFrmPRelBenefaPreparar.cboxPlanoClick(Sender: TObject);
begin
  inherited;
  MarcaLista(chklstPlano, cboxPlano.Checked);
  VerificaProcessa;
end;

procedure TFrmPRelBenefaPreparar.cboxBeneficiosClick(Sender: TObject);
begin
  inherited;
  MarcaLista(chklstBeneficios, cboxBeneficios.Checked);
  VerificaProcessa;
end;

procedure TFrmPRelBenefaPreparar.FormShow(Sender: TObject);
Var
  wDia, wMes, wAno : Word;

begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cmbMes.ItemIndex := wMes - 1;
  speAno.Value     := wAno;
end;

procedure TFrmPRelBenefaPreparar.MontaQuery;
Var
  sSql : String;

begin
  If rdoInformacoes.ItemIndex = 0 Then
    sSql :=
    ' SELECT EL.MATRICULA, PPP.INSCRICAONUMERO, P.NOME, BB.DATAINICIO, '+
    ' B.NOME AS BENEFICIO, BB.DATAFINAL, BB.ULTMESPREPARO, PAT.IDPESSOA, '+
    ' PP.NOME AS PLANO, PP.IDPLANOPREV, NVL(BB.VALORATUAL, 0) AS VALORBENEFICIO, '+
    ' NVL(BB.VALORTOTAL, 0) AS VALORTOTAL, '+
    ' NVL(BB.VALORSRB, 0)   AS VALORSRB, '+
    ' NVL(BB.VLRINFINSS, 0) AS VALORINSS '
  Else
    sSql :=
    ' SELECT B.NOME AS BENEFICIO, B.IDBENEFICIO, PP.NOME AS PLANO, PP.IDPLANOPREV, '+
    ' SUM(NVL(BB.VALORATUAL, 0)) AS VALORBENEFICIO, '+
    ' SUM(NVL(BB.VALORTOTAL, 0)) AS VALORTOTAL, '+
    ' SUM(NVL(BB.VALORSRB, 0))   AS VALORSRB, '+
    ' SUM(NVL(BB.VLRINFINSS, 0)) AS VALORINSS ';

  If rdoInformacoes.ItemIndex = 0 Then
    sSql := sSql +
            ' FROM BENEFBFCIARIO BB, BENEFPLANOPART BP, DEPENTIT DP, '+
            ' TPPAGTOBENEFICIO TPB, TPPERIODICIDADE TP, BENEFPLANPREV BPP, '+
            ' PARTPREVPLAN PPP, ELEGPATRO EL, BENEFICIO B, PLANPREV PP, '+
            ' PATRO PAT, PESSOA P, PESSOAFISICA PF, PESSOA PA '+
            ' WHERE '
  Else
    sSql := sSql +
            ' FROM BENEFBFCIARIO BB, BENEFPLANOPART BP, DEPENTIT DP, '+
            ' TPPAGTOBENEFICIO TPB, TPPERIODICIDADE TP, BENEFPLANPREV BPP, '+
            ' BENEFICIO B, PLANPREV PP WHERE ';

  FiltraBenefMesPorTipoFolha(RdoTipoFolha.ItemIndex, True, sSql);

  sSql := sSql +
          ' AND (BB.FLGFORMAPAGTO = ''F'') AND (TPB.FLGFREQUENCIA <> ''U'') '+
          ' AND ((BPP.FLGREFERENCIA = 0 OR BPP.FLGREFERENCIA IS NULL) OR (BPP.FLGREFERENCIA = 1 AND BPP.FLGPAGAINSS = 1)) ';

  If sPlanoSel <> '' Then
    sSql := sSql + ' AND (BB.IDPLANOPREV IN ('+sPlanoSel+')) ';

  If sBeneficioSel <> '' Then
    sSql := sSql + ' AND (BB.IDBENEFICIO IN ('+sBeneficioSel+')) ';

  If sPatroSel <> '' Then
    sSql := sSql + ' AND (BB.IDPESSJUR IN ('+sPatroSel+')) ';

  sSql := sSql +
          ' AND (TPB.IDTPPAGTOBENEFIC = BB.IDTPPAGTOBENEFIC) '+
          ' AND (TP.IDTPPERIODICIDADE(+) = TPB.IDTPPERIODICIDADE) '+
          ' AND (BP.IDBENEFICIO(+) = BB.IDBENEFICIO) '+
          ' AND (BP.IDPLANOPREV(+) = BB.IDPLANOPREV) '+
          ' AND (BP.IDPESSJUR(+) = BB.IDPESSJUR) '+
          ' AND (BP.SEQPROPOSTA(+) = BB.SEQPROPOSTA) '+
          ' AND (BP.IDPESSOA(+) = BB.IDPESSOA) '+
          ' AND (DP.IDTITULAR = BB.IDTITULAR) '+
          ' AND (DP.IDPESSOA = BB.IDPESSOA) '+
          ' AND (BPP.IDBENEFICIO = BB.IDBENEFICIO) '+
          ' AND (BPP.IDPLANOPREV = BB.IDPLANOPREV) '+
          ' AND (PP.IDPLANOPREV = BB.IDPLANOPREV) '+
          ' AND (B.IDBENEFICIO = BB.IDBENEFICIO) ';

  If rdoInformacoes.ItemIndex = 0 Then
    sSql := sSql +
            ' AND (PPP.IDPESSJUR = BB.IDPESSJUR) '+
            ' AND ((PPP.IDPLANOPREV = BB.IDPLANOPREV) OR (PPP.IDPLANOPREV = BB.IDPLANOORIGEM)) '+
            ' AND (PPP.IDPESSOA = BB.IDTITULAR) '+
            ' AND (EL.IDPESSJUR = BB.IDPESSJUR) '+
            ' AND (EL.IDPESSOA = BB.IDTITULAR) '+
            ' AND (PAT.IDPESSOA = BB.IDPESSJUR) '+
            ' AND (P.IDPESSOA = BB.IDPESSOA) '+
            ' AND (PF.IDPESSOA = BB.IDPESSOA) '+
            ' AND (PA.IDPESSOA = BB.IDPESSJUR) ';

  If rdoInformacoes.ItemIndex = 1 Then
    sSql := sSql + ' GROUP BY B.IDBENEFICIO, B.NOME, PP.NOME, PP.IDPLANOPREV ';

  If rdoInformacoes.ItemIndex = 0 Then
  Begin
    Case rdoTipoOrdem.ItemIndex Of
      0: sSql := sSql + ' ORDER BY PP.NOME, EL.MATRICULA ';
      1: sSql := sSql + ' ORDER BY PP.NOME, PPP.INSCRICAONUMERO ';
      2: sSql := sSql + ' ORDER BY PP.NOME, P.NOME ';
    End;
  End
  Else
    sSql := sSql + ' ORDER BY PP.NOME, B.NOME';

  dtmRelBenefaPreparar.qryBenefaPreparar.Close;
  dtmRelBenefaPreparar.qryBenefaPreparar.Sql.Clear;
  dtmRelBenefaPreparar.qryBenefaPreparar.Sql.Add(sSql);
  dtmRelBenefaPreparar.qryBenefaPreparar.Open;
  MudaComponentes;
end;

procedure TFrmPRelBenefaPreparar.FiltraBenefMesPorTipoFolha(
  flgabono: integer; bbenefXcontrib: boolean; var ssql: string);

  function PrimeiroDiaAno : string;
  begin
    result := copy(sMesReferencia,1,4)+'/01/01';
  end;

begin
  if flgAbono <> 0 then
  begin {abono ou antecipacao de abono}
  //NÃO ALTERADO PARA O ABONO ANUAL OU ANTECIPAÇÃO
    ssql:=ssql+
          ' (BPP.FLGPOSSUIABONO = 1) '+
      ' AND ( (    (BB.IDSITBENEFICIO = 3) '+
            '  AND (BB.DATAFINAL IS NOT NULL) '+
            '  AND (BPP.FLGABONOFINALBEN IS NULL OR BPP.FLGABONOFINALBEN = 0) '+
             ') OR '+
      //TRATA SITUAÇÃO DE BENEFICIO DE INSS (=6)
            ' (BB.IDSITBENEFICIO IN (1,2,6)) '+
           ') '+
      ' AND ((BB.DATAFINAL >= TO_DATE('''+PrimeiroDiaAno+''',''YYYY/MM/DD'')) OR (BB.DATAFINAL IS NULL))'+
      ' AND ((((BB.FLGDATAPREVISTA = 0) OR (BB.FLGDATAPREVISTA IS NULL) OR '+
      '        ((BB.FLGDATAPREVISTA = 1) AND ((BB.DATAFINALPREVISTA >= TO_DATE('''+PrimeiroDiaAno+
      ''',''YYYY/MM/DD'')) OR (BB.DATAFINALPREVISTA IS NULL)))))) ';
  end
  else
  begin
    ssql:=ssql+
      //TRATA SITUAÇÃO DE BENEFICIO DE INSS (=6)
        '(   (    (BB.IDSITBENEFICIO IN (1,6)) '+
            ' AND (   (BB.FLGDATAPREVISTA = 1) '+
                 ' OR (    (    (BB.FLGDATAPREVISTA = 0) '+
                           ' OR (BB.FLGDATAPREVISTA IS NULL)'+
                          ') '+
                      'AND (   (BB.DATAFINAL >= TO_DATE('''+sMesReferencia+'/01'',''YYYY/MM/DD'')) '+
                          ' OR (BB.DATAFINAL IS NULL) '+
                          ') '+
                     ') '+
                 ') '+
            ') '+
         'OR (    (IDSITBENEFICIO = 2) '+
             'AND (B.FLGBENEFTEMP = 0) '+
            ') '+
        ') ';
  end;
  if bbenefXcontrib then {beneficio}
    ssql:=ssql+' AND ((BB.ULTMESPREPARO < '''+sMesReferencia+''') OR (BB.ULTMESPREPARO IS NULL)) '
  else
    ssql:=ssql+' AND ((BB.ULTMESPREPARO = '''+sMesReferencia+''') OR (BB.ULTMESPREPARO IS NULL)) ';
end;

procedure TFrmPRelBenefaPreparar.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  If (cmbMes.Text = '') Or (speAno.Text = '') Then
  Begin
    If cmbMes.Text = '' Then
    Begin
      MsgDlg('É necessário escolher o mês.','Informação',mtInformation,[mbOk],0);
      ModalResult := mrNone;
      Exit;
    End
    Else
    Begin
      MsgDlg('É necessário escolher o ano.','Informação',mtInformation,[mbOk],0);
      ModalResult := mrNone;
      Exit;
    End;
  End
  Else
  Begin
    If (cmbMes.Text = '') And (speAno.Text = '') Then
    Begin
      MsgDlg('É necessário escolher o mês e o ano.','Informação',mtInformation,[mbOk],0);
      ModalResult := mrNone;
      Exit;
    End;
    If cmbMes.ItemIndex > 8 Then
      sMesReferencia := speAno.Text+'/'+IntToStr(cmbMes.ItemIndex + 1)
    Else
      sMesReferencia := speAno.Text+'/0'+IntToStr(cmbMes.ItemIndex + 1);

    dtmRelBenefaPreparar.lblMostraMesRef.Caption := sMesReferencia;
    dtmRelBenefaPreparar.CorZebra                := ccbEscolheCor.SelectedColor;
    MontaQuery;
  End;
end;

procedure TFrmPRelBenefaPreparar.rdoInformacoesClick(Sender: TObject);
begin
  inherited;
  If rdoInformacoes.ItemIndex = 0 Then
    rdoTipoOrdem.Enabled := True
  Else
    rdoTipoOrdem.Enabled := False;
end;

procedure TFrmPRelBenefaPreparar.MudaComponentes;
begin
  If rdoInformacoes.ItemIndex = 0 Then
  Begin
    dtmRelBenefaPreparar.lblMatricula.Visible        := True;
    dtmRelBenefaPreparar.lblInscricao.Visible        := True;
    dtmRelBenefaPreparar.lblBeneficiario.Visible     := True;
    dtmRelBenefaPreparar.dbMatricula.Visible         := True;
    dtmRelBenefaPreparar.dbInscricao.Visible         := True;
    dtmRelBenefaPreparar.dbNome.Visible              := True;
    dtmRelBenefaPreparar.lblDataInicio.Visible       := True;
    dtmRelBenefaPreparar.dbDataInicio.Visible        := True;
    dtmRelBenefaPreparar.lblDataFinal.Visible        := True;
    dtmRelBenefaPreparar.dbDataFinal.Visible         := True;
    dtmRelBenefaPreparar.lblUltimoMesPreparo.Visible := True;
    dtmRelBenefaPreparar.dbUltPreparo.Visible        := True;
    dtmRelBenefaPreparar.lblBeneficio.Left           := 3.3021;
    dtmRelBenefaPreparar.dbBeneficio.Left            := 3.3021;
    dtmRelBenefaPreparar.lblValAtual.Left            := 8.125;
    dtmRelBenefaPreparar.dbValorAtual.Left           := 8.125;
    dtmRelBenefaPreparar.lblValorTot.Left            := 8.9062;
    dtmRelBenefaPreparar.dbValorTotal.Left           := 8.9062;
    dtmRelBenefaPreparar.lblValorSRB.Left            := 9.6771;
    dtmRelBenefaPreparar.dbValorSRB.Left             := 9.6771;
    dtmRelBenefaPreparar.lblValorInss.Left           := 10.4479;
    dtmRelBenefaPreparar.dbValorInss.Left            := 10.4479;
    dtmRelBenefaPreparar.lblTotPlano.Left            := 7.2709;
    dtmRelBenefaPreparar.dbSumVlrAtual.Left          := 8.125;
    dtmRelBenefaPreparar.dbSumVlrSRB.Left            := 9.6771;
    dtmRelBenefaPreparar.dbSumVlrInss.Left           := 10.4479;
  End
  Else
  Begin
    dtmRelBenefaPreparar.lblMatricula.Visible        := False;
    dtmRelBenefaPreparar.lblInscricao.Visible        := False;
    dtmRelBenefaPreparar.lblBeneficiario.Visible     := False;
    dtmRelBenefaPreparar.dbMatricula.Visible         := False;
    dtmRelBenefaPreparar.dbInscricao.Visible         := False;
    dtmRelBenefaPreparar.dbNome.Visible              := False;
    dtmRelBenefaPreparar.lblDataInicio.Visible       := False;
    dtmRelBenefaPreparar.dbDataInicio.Visible        := False;
    dtmRelBenefaPreparar.lblDataFinal.Visible        := False;
    dtmRelBenefaPreparar.dbDataFinal.Visible         := False;
    dtmRelBenefaPreparar.lblUltimoMesPreparo.Visible := False;
    dtmRelBenefaPreparar.dbUltPreparo.Visible        := False;
    dtmRelBenefaPreparar.lblValorTot.Visible         := False;
    dtmRelBenefaPreparar.dbValorTotal.Visible        := False;
    dtmRelBenefaPreparar.lblBeneficio.Left           := 0.0208;
    dtmRelBenefaPreparar.dbBeneficio.Left            := 0.0208;
    dtmRelBenefaPreparar.lblValAtual.Left            := 3.3021;
    dtmRelBenefaPreparar.dbValorAtual.Left           := 3.3021;
    dtmRelBenefaPreparar.lblValorSRB.Left            := 6.3021;
    dtmRelBenefaPreparar.dbValorSRB.Left             := 6.3021;
    dtmRelBenefaPreparar.lblValorInss.Left           := 9.3021;
    dtmRelBenefaPreparar.dbValorInss.Left            := 9.3021;
    dtmRelBenefaPreparar.lblTotPlano.Left            := 2;
    dtmRelBenefaPreparar.dbSumVlrAtual.Left          := 3.3021;
    dtmRelBenefaPreparar.dbSumVlrSRB.Left            := 6.3021;
    dtmRelBenefaPreparar.dbSumVlrInss.Left           := 9.3021;
  End;
end;

end.

{==============================================================================|
| UNIT: FPRelBenefaPreparar                                                    |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   - Formulário filtro do relatório de Benefícios que serão processados no    |
|   mês escolhido pelo usuário.                                                |
|==============================================================================}

