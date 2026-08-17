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

unit cRelTIRPorProjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, Mask, wwdbedit, Wwdbspin, Wwdotdot, Wwdbcomb, wwdblook,
  Db, Wwdatsrc, DBClient, uCMClientDataSet, uCtrlMoeda, DBCtrls, ComCtrls,
  uCtrlMapaTIR, uComunsImobiliarioDB, fcCombo, fPreview, fcColorCombo,
  uCtrlCotacaoMoeda, Menus, AxCtrls, OleCtrls, vcf1, math, uCmSqlParams,
  Grids, DBGrids, shellapi;

const
  fCotaInicial : Extended = 100;
  sDataCota    : String = '01/01/1990';

type
  TcfgRelTIRPorProjeto = class(TcfgRel)
    grpReferencia: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    grpSegmento: TGroupBox;
    grpIndicesTIR: TGroupBox;
    dblkpIndTIR1: TwwDBLookupCombo;
    Label1: TLabel;
    Label5: TLabel;
    dblkpIndTIR2: TwwDBLookupCombo;
    grpPercentuais: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cdsIndice: TCMClientDataSet;
    cdsIndiceMOESIGLA: TStringField;
    cdsIndiceMOECODIGO: TFloatField;
    cdsIndiceMOEDESC: TStringField;
    cdsIndiceMOEPERIODICIDADE: TStringField;
    cdsIndiceFLGPERCVALOR: TStringField;
    dtsIndice: TwwDataSource;
    edtPerVPL1: TDBEdit;
    edtPerVPL3: TDBEdit;
    edtPerVPL2: TDBEdit;
    cdsPercentuaisVPL: TCMClientDataSet;
    cdsPercentuaisVPLPerVPL1: TFloatField;
    cdsPercentuaisVPLPerVPL2: TFloatField;
    cdsPercentuaisVPLPerVPL3: TFloatField;
    dtsPercentuaisVPL: TDataSource;
    cdsSegmento: TCMClientDataSet;
    cdsSegmentoDESCTIPOIMOVEL: TStringField;
    dtsSegmento: TDataSource;
    dblkpSegmento: TwwDBLookupCombo;
    cdsSegmentoCODTIPIMOVEL: TStringField;
    Panel1: TPanel;
    lblProgress: TLabel;
    ProgressBar: TProgressBar;
    grpIndicePayPack: TGroupBox;
    dblkpIndicePayBack: TwwDBLookupCombo;
    grpDia: TGroupBox;
    edtDia: TEdit;
    cdsReceitaLiquida: TCMClientDataSet;
    cdsUltReavaliacao: TCMClientDataSet;
    cdsUltReavaliacaoIDIMOVELMESTRE: TFloatField;
    cdsUltReavaliacaoIDPATRO: TFloatField;
    cdsUltReavaliacaoIDPLANOPREV: TFloatField;
    cdsUltReavaliacaoIDSEGMENTO: TStringField;
    cdsUltReavaliacaoORIGEM: TFloatField;
    cdsUltReavaliacaoULTREAVALIA: TFloatField;
    GroupBox1: TGroupBox;
    dblkpIndiceVPL: TwwDBLookupCombo;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    PopupMenu1: TPopupMenu;
    pmuNrIndice: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtDiaExit(Sender: TObject);
    procedure edtDiaKeyPress(Sender: TObject; var Key: Char);
    procedure DBspnAnoChange(Sender: TObject);
    procedure cboMesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure pmuNrIndiceClick(Sender: TObject);
  private
    CtrlMapaTIR         : TCtrlMapaTIR;
    CtrlMoeda           : TCtrlMoeda;
    CtrlCotacaoMoeda    : TCtrlCotacaoMoeda;
    ComunsImobiliarioDB : TComunsImobiliarioDB;

    function VerificaPreenchimento: boolean;
    procedure ProcessaRelatorio;
  public
    procedure MsgErro( sMsg : string );
  end;

var
  cfgRelTIRPorProjeto: TcfgRelTIRPorProjeto;

implementation

{$R *.DFM}

uses uDiasInUteis, dBaseDados, uSistema, uVerificaPreenchimento, uMensErro,
     dRelTIRPorProjeto, FEspera, uComunsImobiliario;

procedure TcfgRelTIRPorProjeto.FormCreate(Sender: TObject);
begin
  inherited;

  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  ComunsImobiliarioDB.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  CtrlMapaTIR := TCtrlMapaTIR.Create;
  CtrlMapaTIR.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  CtrlMoeda := TCtrlMoeda.Create;
  CtrlMoeda.InitializeAs( CtrlMapaTIR );

  CtrlCotacaoMoeda := TCtrlCotacaoMoeda.Create;
  CtrlCotacaoMoeda.InitializeAs( CtrlMapaTIR );

  cdsIndice.Data := CtrlMoeda.ListaMoeda( 0, False, True, 'P' );

  cdsSegmento.Data := CtrlMapaTIR.ListaTiposImoveis;

  cdsPercentuaisVPL.CreateDataSet;

  dtmRelTIRPorProjeto := TdtmRelTIRPorProjeto.Create( Self );
end;

procedure TcfgRelTIRPorProjeto.MsgErro(sMsg: string);
begin
  ShowMessage( sMsg );
end;

procedure TcfgRelTIRPorProjeto.FormDestroy(Sender: TObject);
begin
  CtrlMapaTIR.Free;
  CtrlMoeda.Free;
  CtrlCotacaoMoeda.Free;
  ComunsImobiliarioDB.Free;
  dtmRelTIRPorProjeto.Free;
  inherited;
end;

procedure TcfgRelTIRPorProjeto.edtDiaExit(Sender: TObject);
begin
  inherited;
  try
    EncodeDate( StrToInt( IntToStr( Inteiro( DBspnAno.Value ) ) ),
                cboMes.ItemIndex + 1,
                StrToInt( edtDia.Text ) );
  except
    MessageDlg('Dia inválido.', mtError, [mbOK], 0);
    edtDia.Text := '01';
    edtDia.SetFocus;
    exit
  end;
end;

procedure TcfgRelTIRPorProjeto.edtDiaKeyPress( Sender : TObject; var Key : Char );
begin
  inherited;
  if ( ( Pos( Key, '0123456789' ) <= 0 ) and ( Ord( Key ) <> VK_BACK ) ) then
    Key := #0;
end;

procedure TcfgRelTIRPorProjeto.DBspnAnoChange(Sender: TObject);
begin
  inherited;
  try
    EncodeDate( StrToInt( IntToStr( Inteiro( DBspnAno.Value ) ) ),
                cboMes.ItemIndex + 1,
                StrToInt( edtDia.Text ) );
  except
    edtDia.Text := IntToStr( DiasInUteis.ExtraiDia( DiasInUteis.UltDiaMes(
      StrToInt( IntToStr( Inteiro( DBspnAno.Value ) ) ), cboMes.ItemIndex + 1 ) ) );
  end;
end;

procedure TcfgRelTIRPorProjeto.cboMesChange(Sender: TObject);
begin
  inherited;
  try
    EncodeDate( StrToInt( IntToStr( Inteiro( DBspnAno.Value ) ) ),
                cboMes.ItemIndex + 1,
                StrToInt( edtDia.Text ) );
  except
    edtDia.Text := IntToStr( DiasInUteis.ExtraiDia( DiasInUteis.UltDiaMes(
      StrToInt( IntToStr( Inteiro( DBspnAno.Value ) ) ), cboMes.ItemIndex + 1 ) ) );
  end;
end;

procedure TcfgRelTIRPorProjeto.FormShow(Sender: TObject);
begin
  inherited;
  cboMes.ItemIndex := DiasInUteis.ExtraiMes( Date ) - 1;
  DBspnAno.Value   := DiasInUteis.ExtraiAno( Date );
end;

function TcfgRelTIRPorProjeto.VerificaPreenchimento: boolean;
begin
  Result := False;

  try

    if cboMes.ItemIndex < 0 then
      raise EValidacao.CreateVal('É necessário indicar o mês.', cboMes);

    if ( DBspnAno.Value <= 0 ) or ( DBspnAno.Text = '' ) then
      raise EValidacao.CreateVal('É necessário indicar o ano.', DBspnAno);

    if edtDia.Text = '' then
      raise EValidacao.CreateVal('É necessário indicar o dia de apropriação das despesas.', edtDia);

    if ( dblkpIndTIR1.Text = '' ) and ( dblkpIndTIR2.Text = '' )  then
      raise EValidacao.CreateVal('É necessário indicar pelo menos um fluxo para cálculo de TIR.', dblkpIndTIR1);

    if dblkpIndicePayBack.Text = '' then
      raise EValidacao.CreateVal('É necessário indicar o índice para cálculo de Pay Back.', dblkpIndicePayBack);

    if   ( ( edtPerVPL1.Text <> '' ) or ( edtPerVPL2.Text <> '' ) or ( edtPerVPL3.Text <> '' ) )
     and ( dblkpIndiceVPL.Text = '' ) then
      raise EValidacao.CreateVal('É necessário indicar o índice para cálculo de VPL.', dblkpIndiceVPL);

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

procedure TcfgRelTIRPorProjeto.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if VerificaPreenchimento then
  begin
    DesabilitaBotoes;
    try
      ProcessaRelatorio;

      with dtmRelTIRPorProjeto do
      begin
        ppdbTXTIR1.Visible := ( dblkpIndTIR1.Text <> '' );
        ppdbTXTIR2.Visible := ( dblkpIndTIR2.Text <> '' );
        ppdbVPL1.Visible   := ( edtPerVPL1.Text   <> '' );
        ppdbVPL2.Visible   := ( edtPerVPL2.Text   <> '' );
        ppdbVPL3.Visible   := ( edtPerVPL3.Text   <> '' );

        ppLblVPL.Caption   := 'VPL (a.a.) - ' + dblkpIndiceVPL.Text; 
        ppLblVPL.Visible   := ( ( edtPerVPL1.Text <> '' ) or ( edtPerVPL2.Text <> '' ) or ( edtPerVPL3.Text <> '' ) );
        ppLbl_VPL.Visible  := ( ( edtPerVPL1.Text <> '' ) or ( edtPerVPL2.Text <> '' ) or ( edtPerVPL3.Text <> '' ) );
        ppShapeVPL.Visible := ( ( edtPerVPL1.Text <> '' ) or ( edtPerVPL2.Text <> '' ) or ( edtPerVPL3.Text <> '' ) );

        if dblkpSegmento.LookupValue <> '' then
             pplblTipoSegmento.Text := dblkpSegmento.Text
        else pplblTipoSegmento.Text := '< Todos >';
        pplblCompetencia.Text   := cboMes.Text + ' / ' + DBspnAno.Text;
        pplblDia.Text           := edtDia.Text;
        pplblIndicePayBack.Text := dblkpIndicePayBack.Text;

        // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
        dtmRelTIRPorProjeto.bCorlinha  := chkCorLinha.Checked;
        dtmRelTIRPorProjeto.CorLinha   := cboCorLinha.SelectedColor;

        TFrmPreview.CreateModalPreview(Application,
                                       dtmRelTIRPorProjeto.pprpt,
                                       dtmRelTIRPorProjeto.pprpt.PrinterSetup.DocumentName)
      end;

      Repaint;
    finally
      HabilitaBotoes;
    end;
  end;
end;

procedure TcfgRelTIRPorProjeto.ProcessaRelatorio;
var
  dDtFim : TDateTime;
  fSeqVal : array of extended;
  fFatorCorrecao, fAux, fSoma, fVlrNominal : extended;
  fValorCota : extended;
  i : integer;
  sAnoMesAnt, sAnoMes, sAnoMesFim, sAnoMesIni : string;
  iMes, iAno : Integer;

  dDtCotacao : TDateTime;

  procedure AdicionaValor( fValor : extended );
  begin
    SetLength( fSeqVal, length( fSeqVal ) + 1 );
    fSeqVal[ High( fSeqVal ) ] := fValor;
  end;

  function RetornaTIR( iIndice : integer ) : extended;
  var iQtdeDias: Integer;
      fVlrReav, fTIRDia  : Extended;
      dDataIniCota : TDateTime;
  begin
    SetLength( fSeqVal, 0 );

    cdsReceitaLiquida.Filtered := False;
    cdsReceitaLiquida.Filter   := 'IDIMOVELMESTRE = ' + dtmRelTIRPorProjeto.cdsIDIMOVEL.AsString;
    cdsReceitaLiquida.Filtered := True;

    // Filtra o Fluxo
    dtmRelTIRPorProjeto.cdsFluxo.Filtered := False;
    dtmRelTIRPorProjeto.cdsFluxo.Filter   := 'IDIMOVEL = ' + dtmRelTIRPorProjeto.cdsIDIMOVEL.AsString;
    dtmRelTIRPorProjeto.cdsFluxo.Filtered := True;

    // Define data de início do Nr. Indice - default valor constante 01/01/1990 de sDataCota
    dDataIniCota := StrToDate(sDataCota);
    if dtmRelTIRPorProjeto.cdsDATAAQUISICAO.AsDateTime < dDataIniCota then begin
       dDataIniCota := EncodeDate(DiasUteis.ExtraiAno(dtmRelTIRPorProjeto.cdsDATAAQUISICAO.AsDateTime),1,1);
    end;

    // Totaliza Receitas / Despesas Mes a Mes, registrando 0 quando não houver
    if not cdsReceitaLiquida.IsEmpty then begin
       cdsReceitaLiquida.First;
       sAnoMes := cdsReceitaLiquida.FieldByName('ANOMES').AsString;
       iAno    := StrToInt(Copy(sAnoMes,0,4));
       iMes    := StrToInt(Copy(sAnoMes,5,2));
       sAnoMesFim := DbSpnAno.Text + FormatFloat( '00', cboMes.ItemIndex +1 );
       while sAnoMes <= sAnoMesFim do begin
          // Filtra as receitas de cada mês
          cdsReceitaLiquida.Filtered := False;
          cdsReceitaLiquida.Filter   := '( IDIMOVELMESTRE = ' + dtmRelTIRPorProjeto.cdsIDIMOVEL.AsString + ' ) AND ' +
                                        '( ANOMES = ' + QuotedStr( FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes ) ) + ' )';
          cdsReceitaLiquida.Filtered := True;

          // Soma as receitas de todos os planos
          fAux        := 0;
          fValorcota  := 0;
          fVlrNominal := 0;
          while not cdsReceitaLiquida.Eof do begin
             fAux := fAux + cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat;
             dDtCotacao := EncodeDate( StrToInt( Copy( sAnoMes, 1, 4 ) ), StrToInt( Copy( sAnoMes, 5, 2 ) ), StrToInt( edtDia.Text ) );
             cdsReceitaLiquida.Next;
          end;

          // Cotiza as receitas pelo índice na data informada
          if fAux <> 0 then begin
             fVlrNominal    := fAux;
             fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( iIndice, dDataIniCota, dDtCotacao, True, 0, True );
             fValorCota     := fCotaInicial * fFatorCorrecao;
             // Corrige Plano Itamar - Divide por 1.000
             if dDtCotacao > StrToDate('31/07/1993') then fValorCota := fValorCota / 1000;
             // Corrige Plano FHC I - Divide por 2.750
             if dDtCotacao > StrToDate('30/06/1994') then fValorCota := fValorCota / 2750;

             // Cotiza o valor
             fValorCota := ComunsImobiliario.Arredonda( fValorCota, 8 );
             fAux := fAux / fValorCota;
          end;

          // Adiciona o valor da última reavaliação no último mês da competência selecionada
          if sAnoMes = sAnoMesFim then begin
             cdsUltReavaliacao.Filtered := False;
             cdsUltReavaliacao.Filter   := 'IDIMOVELMESTRE = ' + dtmRelTIRPorProjeto.cdsIDIMOVEL.AsString;
             cdsUltReavaliacao.Filtered := True;

             // Totaliza as Reavaliações segregadas por plano / patro
             fVlrReav := 0;
             cdsUltReavaliacao.First;
             while not cdsUltReavaliacao.Eof do begin
                fVlrReav := fVlrReav + cdsUltReavaliacaoULTREAVALIA.AsFloat;
                cdsUltReavaliacao.Next;
             end;

             // Corrige a reavaliação desde a aquisição até o último dia do mês de competencia selecionado
             dDtCotacao := DiasUteis.UltDiaMes( Inteiro( DBspnAno.Value ), Inteiro( cboMes.ItemIndex + 1) );
             fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( iIndice, dDataIniCota, dDtCotacao, True, 0, True );
             fValorCota     := fCotaInicial * fFatorCorrecao;
             // Corrige Plano Itamar - Divide por 1.000
             if dDtCotacao > StrToDate('31/07/1993') then fValorCota := fValorCota / 1000;
             // Corrige Plano FHC I - Divide por 2.750
             if dDtCotacao > StrToDate('30/06/1994') then fValorCota := fValorCota / 2750;

             fValorCota := ComunsImobiliario.Arredonda( fValorCota, 8 );
             fAux := fAux + (fVlrReav / fValorCota);
             fVlrNominal := fVlrNominal + fVlrReav;
          end;

          // Adiciona o valor calculado no fluxo para a TIR
          AdicionaValor( fAux );

          // adiciona em cdsFluxo
          if not dtmRelTIRPorProjeto.cdsFluxo.Locate('ANOMES',sAnoMes,[]) then begin
             dtmRelTIRPorProjeto.cdsFluxo.Insert;
             dtmRelTIRPorProjeto.cdsFluxo.FieldByName('IDIMOVEL').AsInteger  := dtmRelTIRPorProjeto.cdsIDIMOVEL.AsInteger;
             dtmRelTIRPorProjeto.cdsFluxo.FieldByName('ANOMES').AsString     := sAnoMes;
             dtmRelTIRPorProjeto.cdsFluxo.FieldByName('VLR_NOMINAL').AsFloat := ComunsImobiliario.Arredonda(fVlrNominal, 2);
          end else begin
             dtmRelTIRPorProjeto.cdsFluxo.Edit;
          end;
          if iIndice = StrToInt(dblkpIndTIR1.LookupValue) then begin
             dtmRelTIRPorProjeto.cdsFluxo.FieldByName('VLR_COTA_1').AsFloat  := fValorCota;
             dtmRelTIRPorProjeto.cdsFluxo.FieldByName('VLR_TIR_1').AsFloat   := ComunsImobiliario.Arredonda(fAux, 2);
          end else begin
             dtmRelTIRPorProjeto.cdsFluxo.FieldByName('VLR_COTA_2').AsFloat  := fValorCota;
             dtmRelTIRPorProjeto.cdsFluxo.FieldByName('VLR_TIR_2').AsFloat   := ComunsImobiliario.Arredonda(fAux, 2);
          end;
          dtmRelTIRPorProjeto.cdsFluxo.Post;


          // Incrementa o Mês
          Inc(iMes);
          if iMes > 12 then begin
             iMes := 1;
             Inc(iAno);
          end;
          sAnoMes := FormatFloat('0000',iAno) + FormatFloat( '00', iMes );
       end;
    end;

    if fAux = 0 then
      Result := 0
    else
    begin
      dDtCotacao := DiasUteis.UltDiaMes(Inteiro(dbSpnAno.Value),(cboMes.ItemIndex+1));;
      iQtdeDias  := Inteiro(dDtCotacao - dtmRelTIRPorProjeto.cdsDATAAQUISICAO.AsDateTime) + 1;
      Result := CtrlMapaTIR.CalculaRentabilidade(fSeqVal, dtmRelTIRPorProjeto.cdsDATAAQUISICAO.AsDateTime, iQtdeDias, StrToInt( edtDia.Text ), False );
    end;
  end;

  function RetornaVPL( iIndice : integer; fTaxa : extended ) : extended;
  var fDesembolsoInicial, fVlrReav : Extended;
      dDataIniCota : TDateTime;
  begin
    SetLength( fSeqVal, 0 );

    cdsReceitaLiquida.Filtered := False;
    cdsReceitaLiquida.Filter   := 'IDIMOVELMESTRE = ' + dtmRelTIRPorProjeto.cdsIDIMOVEL.AsString;
    cdsReceitaLiquida.Filtered := True;

    // Define data de início do Nr. Indice - default valor constante 01/01/1990 de sDataCota
    dDataIniCota := StrToDate(sDataCota);
    if dtmRelTIRPorProjeto.cdsDATAAQUISICAO.AsDateTime < dDataIniCota then begin
       dDataIniCota := EncodeDate(DiasUteis.ExtraiAno(dtmRelTIRPorProjeto.cdsDATAAQUISICAO.AsDateTime),1,1);
    end;

    // Totaliza Receitas / Despesas Mes a Mes, registrando 0 quando não houver
    if not cdsReceitaLiquida.IsEmpty then begin
       cdsReceitaLiquida.First;
       sAnoMes := cdsReceitaLiquida.FieldByName('ANOMES').AsString;
       iAno    := StrToInt(Copy(sAnoMes,0,4));
       iMes    := StrToInt(Copy(sAnoMes,5,2));
       sAnoMesFim := DbSpnAno.Text + FormatFloat( '00', cboMes.ItemIndex +1 );
       while sAnoMes <= sAnoMesFim do begin
          // Filtra as receitas de cada mês
          cdsReceitaLiquida.Filtered := False;
          cdsReceitaLiquida.Filter   := '( IDIMOVELMESTRE = ' + dtmRelTIRPorProjeto.cdsIDIMOVEL.AsString + ' ) AND ' +
                                        '( ANOMES = ' + QuotedStr( FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes ) ) + ' )';
          cdsReceitaLiquida.Filtered := True;

          // Soma as receitas de todos os planos
          fAux := 0;
          while not cdsReceitaLiquida.Eof do begin
             fAux := fAux + cdsReceitaLiquida.FieldByName('RECEITALIQUIDA').AsFloat;
             dDtCotacao := EncodeDate( StrToInt( Copy( sAnoMes, 1, 4 ) ), StrToInt( Copy( sAnoMes, 5, 2 ) ), StrToInt( edtDia.Text ) );
             cdsReceitaLiquida.Next;
          end;

          // Cotiza as receitas pelo índice na data informada
          if fAux <> 0 then begin
             fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( iIndice, dDataIniCota, dDtCotacao, True, 0, True );
             fValorCota     := fCotaInicial * fFatorCorrecao;
             // Corrige Plano Itamar - Divide por 1.000
             if dDtCotacao > StrToDate('31/07/1993') then fValorCota := fValorCota / 1000;
             // Corrige Plano FHC I - Divide por 2.750
             if dDtCotacao > StrToDate('30/06/1994') then fValorCota := fValorCota / 2750;

             // Cotiza o valor
             fValorCota := ComunsImobiliario.Arredonda( fValorCota, 8 );
             fAux := fAux / fValorCota;
          end;

          // Adiciona o valor da última reavaliação no último mês da competência selecionada
          if sAnoMes = sAnoMesFim then begin
             cdsUltReavaliacao.Filtered := False;
             cdsUltReavaliacao.Filter   := 'IDIMOVELMESTRE = ' + dtmRelTIRPorProjeto.cdsIDIMOVEL.AsString;
             cdsUltReavaliacao.Filtered := True;

             // Totaliza as Reavaliações segregadas por plano / patro
             fVlrReav := 0;
             cdsUltReavaliacao.First;
             while not cdsUltReavaliacao.Eof do begin
                fVlrReav := fVlrReav + cdsUltReavaliacaoULTREAVALIA.AsFloat;
                cdsUltReavaliacao.Next;
             end;

             // Corrige a reavaliação desde a aquisição até o último dia do mês de competencia selecionado
             dDtCotacao := DiasUteis.UltDiaMes( Inteiro( DBspnAno.Value ), Inteiro( cboMes.ItemIndex + 1) );
             fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( iIndice, dDataIniCota, dDtCotacao, True, 0, True );
             fValorCota     := fCotaInicial * fFatorCorrecao;
             // Corrige Plano Itamar - Divide por 1.000
             if dDtCotacao > StrToDate('31/07/1993') then fValorCota := fValorCota / 1000;
             // Corrige Plano FHC I - Divide por 2.750
             if dDtCotacao > StrToDate('30/06/1994') then fValorCota := fValorCota / 2750;

             fValorCota := ComunsImobiliario.Arredonda( fValorCota, 8 );
             fAux := fAux + (fVlrReav / fValorCota);
          end;

          // Guarda valor do primeiro desembolso, os demais inclui no vetor para VPL
          if fDesembolsoInicial = 0 then
               fDesembolsoInicial := fAux
          else AdicionaValor( fAux );

          // Incrementa o Mês
          Inc(iMes);
          if iMes > 12 then begin
             iMes := 1;
             Inc(iAno);
          end;
          sAnoMes := FormatFloat('0000',iAno) + FormatFloat( '00', iMes );
       end;
    end;

    if fAux = 0 then
         Result := 0
    else Result := CtrlMapaTIR.CalculaVPL( fTaxa, fSeqVal ) + fDesembolsoInicial;
  end;

  function RetornaPayBack( iIndice : integer ) : extended;
  var fReceita, fDespesa, fRecAux, fDesAux : Extended;
      dDataIniCota : TDateTime;
  begin
    SetLength( fSeqVal, 0 );

    cdsReceitaLiquida.Filtered := False;
    cdsReceitaLiquida.Filter   := 'IDIMOVELMESTRE = ' + dtmRelTIRPorProjeto.cdsIDIMOVEL.AsString;
    cdsReceitaLiquida.Filtered := True;
    fReceita   := 0;
    fDespesa   := 0;

    // Define data de início do Nr. Indice - default valor constante 01/01/1990 de sDataCota
    dDataIniCota := StrToDate(sDataCota);
    if dtmRelTIRPorProjeto.cdsDATAAQUISICAO.AsDateTime < dDataIniCota then begin
       dDataIniCota := EncodeDate(DiasUteis.ExtraiAno(dtmRelTIRPorProjeto.cdsDATAAQUISICAO.AsDateTime),1,1);
    end;

    // Totaliza Receitas / Despesas Mes a Mes, registrando 0 quando não houver
    if not cdsReceitaLiquida.IsEmpty then begin
       cdsReceitaLiquida.First;
       sAnoMes := cdsReceitaLiquida.FieldByName('ANOMES').AsString;
       iAno    := StrToInt(Copy(sAnoMes,0,4));
       iMes    := StrToInt(Copy(sAnoMes,5,2));
       sAnoMesFim := DbSpnAno.Text + FormatFloat( '00', cboMes.ItemIndex +1 );
       while sAnoMes <= sAnoMesFim do begin
          // Filtra as receitas de cada mês
          cdsReceitaLiquida.Filtered := False;
          cdsReceitaLiquida.Filter   := '( IDIMOVELMESTRE = ' + dtmRelTIRPorProjeto.cdsIDIMOVEL.AsString + ' ) AND ' +
                                        '( ANOMES = ' + QuotedStr( FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes ) ) + ' )';
          cdsReceitaLiquida.Filtered := True;

          // Soma as receitas de todos os planos
          fRecAux := 0;
          fDesAux := 0;
          while not cdsReceitaLiquida.Eof do begin
             fRecAux    := fRecAux + cdsReceitaLiquida.FieldByName('RECEITAMES').AsFloat;
             fDesAux    := fDesAux + cdsReceitaLiquida.FieldByName('DESPESAMES').AsFloat;
             dDtCotacao := EncodeDate( StrToInt( Copy( sAnoMes, 1, 4 ) ), StrToInt( Copy( sAnoMes, 5, 2 ) ), StrToInt( edtDia.Text ) );
             cdsReceitaLiquida.Next;
          end;

          // Cotiza e acumula as receitas e despesas pelo índice na data informada
          if (fRecAux <> 0) or (fDesAux <> 0) then begin
             fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( iIndice, dDataIniCota, dDtCotacao, True, 0, True );
             fValorCota     := fCotaInicial * fFatorCorrecao;
             // Corrige Plano Itamar - Divide por 1.000
             if dDtCotacao > StrToDate('31/07/1993') then fValorCota := fValorCota / 1000;
             // Corrige Plano FHC I - Divide por 2.750
             if dDtCotacao > StrToDate('30/06/1994') then fValorCota := fValorCota / 2750;

             // Cotiza o valor
             fValorCota := ComunsImobiliario.Arredonda( fValorCota, 8 );
             if fRecAux > 0 then fReceita := fReceita + ( fRecAux / fValorCota );
             if fDesAux > 0 then fDespesa := fDespesa + ( fDesAux / fValorCota );
          end;

          // Incrementa o Mês
          Inc(iMes);
          if iMes > 12 then begin
             iMes := 1;
             Inc(iAno);
          end;
          sAnoMes := FormatFloat('0000',iAno) + FormatFloat( '00', iMes );
       end;
    end;

    if fDespesa <> 0 then
         Result := ComunsImobiliario.Arredonda((fReceita / fDespesa) * 100, 2)
    else Result := 0;
  end;

begin
  dDtFim  := DiasInUteis.UltDiaMes( StrToInt( IntToStr( Inteiro( DBspnAno.Value ) ) ), ( cboMes.ItemIndex + 1 ) );

  dtmRelTIRPorProjeto.sqlFluxo.Open;

  with dtmRelTIRPorProjeto do
  begin

    frmEspera.Hide;
    frmEspera.Config('Aguarde', 'Recuperando dados de imóveis...', False);
    frmEspera.Show;
    Application.ProcessMessages;

    //Recupera os dados do imóveis e a estrutura do relatório (dataset principal);
    cds.Close;
    cds.Data := CtrlMapaTIR.DadosTIRPorProjeto( cboMes.ItemIndex + 1,
                                                Inteiro( DBspnAno.Value ),
                                                dblkpSegmento.LookupValue );


    frmEspera.Hide;
    frmEspera.Config('Aguarde', 'Recuperando receitas líquidas...', False);
    frmEspera.Show;
    Application.ProcessMessages;

    //Recuperando receitas líquidas dos imóveis
    cdsReceitaLiquida.Close;
    cdsReceitaLiquida.Data := CtrlMapaTIR.ReceitaLiquidaMesAMes( 1, dDtFim, False, False, '', dblkpSegmento.LookupValue );

    frmEspera.Hide;
    frmEspera.Config('Aguarde', 'Recuperando últimas reavaliações de imóveis...', False);
    frmEspera.Show;
    Application.ProcessMessages;

    //Recuperando últimas reavaliações
    cdsUltReavaliacao.Close;
    cdsUltReavaliacao.Data := CtrlMapaTIR.RecuperaUltAvaliacaoData( 1, dDtFim );

    frmEspera.Hide;
    frmEspera.Config('', '', False);

    ProgressBar.Max       := cds.RecordCount;
    lblProgress.Visible   := True;
    lblProgress.Caption   := 'Processando empreendimentos...';
    ProgressBar.Visible   := True;
    ProgressBar.Position  := 0;
    Repaint;
    Application.ProcessMessages;

    while not cds.Eof do
    begin
      cds.Edit;

      cdsINDTIR1.AsString  := dblkpIndTIR1.Text;
      cdsINDTIR2.AsString  := dblkpIndTIR2.Text;
      if edtPerVPL1.Text  <> '' then cdsPERCVPL1.AsString := edtPerVPL1.Text + '%';
      if edtPerVPL2.Text  <> '' then cdsPERCVPL2.AsString := edtPerVPL2.Text + '%';
      if edtPerVPL3.Text  <> '' then cdsPERCVPL3.AsString := edtPerVPL3.Text + '%';

      if dblkpIndTIR1.Text <> '' then
        cdsTXTIR1.AsFloat := RetornaTIR( StrToInt( dblkpIndTIR1.LookupValue ) );

      if dblkpIndTIR2.Text <> '' then
        cdsTXTIR2.AsFloat := RetornaTIR( StrToInt( dblkpIndTIR2.LookupValue ) );

      if edtPerVPL1.Text <> '' then
        cdsVPL1.AsFloat := RetornaVPL( StrToInt( dblkpIndiceVPL.LookupValue ), cdsPercentuaisVPLPerVPL1.AsFloat );

      if edtPerVPL2.Text <> '' then
        cdsVPL2.AsFloat := RetornaVPL( StrToInt( dblkpIndiceVPL.LookupValue ), cdsPercentuaisVPLPerVPL2.AsFloat );

      if edtPerVPL3.Text <> '' then
        cdsVPL3.AsFloat := RetornaVPL( StrToInt( dblkpIndiceVPL.LookupValue ), cdsPercentuaisVPLPerVPL3.AsFloat );

      cdsPAYBACK.AsFloat := RetornaPayBack( StrToInt( dblkpIndicePayBack.LookupValue ) );

      cds.Post;

      cds.Next;

      ProgressBar.StepIt;
      Application.ProcessMessages;
    end;

    lblProgress.Visible   := False;
    lblProgress.Caption   := '';
    ProgressBar.Visible   := False;
    ProgressBar.Position  := 0;

  end;
end;


procedure TcfgRelTIRPorProjeto.pmuNrIndiceClick(Sender: TObject);
var lista : TStringList;
    i : Integer;
    dDataCotacao : TDateTime;
    fFatorCorrecao, fValorCota : Extended;
    sDataIniCota, sNomeArq : String;
begin
   inherited;
   if InputQuery('Data Inicial (dd/mm/yyyy)', 'Data',sDataIniCota) then begin
      lista := TStringList.Create;
      for i := 0 to Inteiro(Date - StrToDate(sDataIniCota)) + 1 do begin
          dDataCotacao := StrToDate(sDataIniCota) + i;
          fFatorCorrecao := ComunsImobiliarioDB.FatorCorrecao( StrToInt(dblkpIndTIR1.LookupValue), StrToDate(sDataIniCota), dDataCotacao, True, 0, True );
          fValorCota     := fCotaInicial * fFatorCorrecao;
          // Corrige Plano Itamar - Divide por 1.000
          if dDataCotacao > StrToDate('31/07/1993') then fValorCota := fValorCota / 1000;
          // Corrige Plano FHC I - Divide por 2.750
          if dDataCotacao > StrToDate('30/06/1994') then fValorCota := fValorCota / 2750;

          fValorCota := ComunsImobiliario.Arredonda( fValorCota, 8 );
          lista.Add(DateToStr(dDataCotacao) + '    ' + FloatToStr(fValorCota) );
      end;
      sNomeArq := Sistema.TempDir + 'NRINDICE-'+ Trim(dblkpIndTIR1.Text) + '.TXT';
      lista.SaveToFile(sNomeArq);

      // Abre o arquivo
      if MsgDlg('Gerado arquivo: ' + sNomeArq +#13+
                'Exibe o arquivo ? ','Informação',mtInformation,[mbyes,mbno],0) = mrYes then begin
         ShellExecute( Self.Handle, 'open', PChar( sNomeArq ), '', '', SW_SHOW	);
      end;
      lista.Free;
   end;
end;

end.
