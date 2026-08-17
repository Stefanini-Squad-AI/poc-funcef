unit FAnalSolic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoal, Db,
  DBTables, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, DBCtrls, Wwquery, TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmAnalSolic = class(TfrmSelPessoal)
    dsSol: TwwDataSource;
    tblSolic: TwwTable;
    wwDBGrid1: TwwDBGrid;
    tblSolicID_SOLIC_ALTER_FUNC: TFloatField;
    tblSolicCODCENTROCUSTO: TStringField;
    tblSolicIDMOTIVO: TFloatField;
    tblSolicIDCARGO: TFloatField;
    tblSolicDATA_SOLIC_ALTER: TDateTimeField;
    tblSolicDATA_EFETIV_ALTER: TDateTimeField;
    tblSolicPERC_REAJ: TFloatField;
    tblSolicNOVO_SALARIO: TFloatField;
    tblSolicNOVO_TIPO_SAL: TStringField;
    tblSolicSITUACAO_SOLIC: TFloatField;
    tblSolicFLAG_PERC_SALAR: TFloatField;
    tblSolicIDINDICADO: TFloatField;
    tblSolicIDREQUISITANTE: TFloatField;
    tblCargo2: TwwTable;
    tblSolicNOME_INDIC: TStringField;
    tblSolicNOME_REQUIS: TStringField;
    tblSolicCARGO_PROP: TStringField;
    tblMotivo: TwwTable;
    tblSolicTIPO_DESCR: TStringField;
    tblHstces: TwwTable;
    tblFuncio2: TwwTable;
    tblSolicIDESTAB: TFloatField;
    Panel3: TPanel;
    lblQtdSolic: TLabel;
    lblValSolic: TLabel;
    dbnav: TDBNavigator;
    PanelBase: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    lblQtdBase: TLabel;
    lblValBase: TLabel;
    PanelPerc: TPanel;
    Label11: TLabel;
    lblPerc: TLabel;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    sbtnImprimirCarta: TSpeedButton;
    sbtnConfigEtiqueta: TSpeedButton;
    sbtnDesfConfigCartaComunic: TSpeedButton;
    ToolbarSep973: TToolbarSep97;
    Toolbar1: TToolbar97;
    ToolbarSep975: TToolbarSep97;
    sbtnImplementar: TBitBtn;
    sbtnComparar: TBitBtn;
    qryAux: TwwQuery;
    tblPessoal1: TwwTable;
    tblPessoal2: TwwTable;
    Label12: TLabel;
    Label13: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure tblSolicFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure sbtnCompararClick(Sender: TObject);
    procedure sbtnImplementarClick(Sender: TObject);
    procedure ImplementaSolicitacao;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnImprimirCartaClick(Sender: TObject);
    procedure sbtnConfigEtiquetaClick(Sender: TObject);
    procedure sbtnDesfConfigCartaComunicClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    iSelecaoSolicit: integer;
    sIDPessoal, sIDCarta, sSolicitSemCarta: string;

    function SelectSolicitacoes(TipoExec: byte): boolean;
  end;

var
  frmAnalSolic: TfrmAnalSolic;
  TotPessoas: integer;
  TotSalario: real;

implementation

uses uMensErro, fTelaAut, uFuncoesUteisRH, uImprimeRelatorio, fSelSolic, fBaseComp,
  fParamCartaComun, dRelatorioCartaComun, UIntegraPrevRH, dBaseDados, uDataBase;

{$R *.DFM}

procedure TfrmAnalSolic.FormCreate(Sender: TObject);
begin
  inherited;
  ImprimeRelatorio := TImprimeRelatorio.Create;
  // Registro o Form de visualização das Etiquetas e Carrego a configuração destas
  with (dtmRelatorioCartaComun) do
  begin
    ImprimeRelatorio.Iniciar(dsgnCartaComun, rpCartaComun, ppCartaComun,
      qryCartaComun, GetLayoutPadrao, 'Cartas ou Comunicados',
      'rpCartaComun', 'CartaComun.tmp', 69);
  end;

  tblSolic.Open;
  tblFuncio2.Open;
  tblHstces.Open;
  qryAux.Prepare;

  Toolbar1.Visible          := false;
  sbtnImprimirCarta.Visible := false;
end;

procedure TfrmAnalSolic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ImprimeRelatorio.Free;  
end;

procedure TfrmAnalSolic.FormShow(Sender: TObject);
begin
  inherited;
  TotPessoas := 0;
  TotSalario := 0;
  if (frmSelSolic.rgSelIndic.ItemIndex = 0) then
    bbtnConfirmarClick(frmAnalSolic);
end;

procedure TfrmAnalSolic.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  Toolbar1.Visible          := false;
  sbtnImprimirCarta.Visible := false;
  rgSequencia.Visible       := false;
  ModalResult               := mrNone;
end;

procedure TfrmAnalSolic.tblSolicFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  c: integer;
  ValAumen: real;
begin
  inherited;
  Accept := true;

  with (frmSelSolic) do
  begin
    if ((not cbxProposta.Checked) and
        (tblSolic.FieldByName('SITUACAO_SOLIC').Value = 0)) or
       ((not cbxEfetiv.Checked) and
        (tblSolic.FieldByName('SITUACAO_SOLIC').Value = 1)) or
       (tblSolic.FieldByName('DATA_EFETIV_ALTER').Value < edData1.Date) or
       (tblSolic.FieldByName('DATA_EFETIV_ALTER').Value > edData2.Date) then
    begin
      Accept := false;
      exit;
    end;

    // Verifico se um requisitante foi selecionado
    //if (bSelRequisit) then
    begin
      Accept := false;
      for c:=0 to chklstRequisit.Items.Count-1 do
      begin
        if (chklstRequisit.Checked[c]) and
           (ListaRequisit[c] = tblSolic.FieldByName('IDREQUISITANTE').asString) then
        begin
          Accept := true;
          break;
        end;
      end;
      if not(Accept) then
        exit;
    end;

    // Verifico se uma ação foi selecionada
    if (bSelAcoes) then
    begin
      Accept := false;
      for c:=0 to chklstAcoes.Items.Count-1 do
      begin
        if (chklstAcoes.Checked[c]) and
           (ListaAcoes[c] = tblSolic.FieldByName('IDMOTIVO').asString) then
        begin
          Accept := true;
          break;
        end;
      end;
      if not(Accept) then
        exit;
    end;

    // Procuro um Empregado com as informações anteriores
    if (rgSelIndic.ItemIndex = 1) and (tblPessoal.Active) then
    begin
      Accept := tblPessoal.Locate('IDPESSOA', tblSolic.FieldByName('IDINDICADO').Value, []);
      if not(Accept) then
        exit;
    end;

    tblFuncio2.FindKey([tblSolic.FieldByName('IDINDICADO').Value]);
    if (Accept) then
    begin
      lblQtdSolic.Caption := IntToStr(StrToInt(lblQtdSolic.Caption) + 1);
      ValAumen := tblSolic.FieldByName('NOVO_SALARIO').Value * (1 - (100 / (100 +
                  tblSolic.FieldByName('PERC_REAJ').Value)));

      if (tblPessoal.FieldByName('TIPOPAGAMENTO').Value = 'D') then
        ValAumen := ValAumen * 30
      else
      if (tblPessoal.FieldByName('TIPOPAGAMENTO').Value = 'H') then
        ValAumen := ValAumen * tblPessoal.FieldByName('JORNADAMENSAL').asInteger;

      lblValSolic.Caption := FloatToStrF(StrToFloat(lblValSolic.Caption) +
                             ValAumen, ffFixed, 12, 2);
    end;
  end;
end;

procedure TfrmAnalSolic.sbtnCompararClick(Sender: TObject);
begin
  if (MsgDlg('Deseja Definir (Nova) Base Comparativa?', LerMensagem(4),
             mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    TotPessoas := 0;
    TotSalario := 0;
    if (AbrirFormModal(frmBaseComp, TfrmBaseComp) = mrOk) and (TotSalario > 0) then
    begin
      lblQtdBase.Caption := IntToStr(TotPessoas);
      lblValBase.Caption := FloatToStrF(TotSalario, ffFixed, 12, 2);
      lblPerc.Caption    := FloatToStrF(StrToFloat(lblValSolic.Caption) * 100 /
                            TotSalario, ffFixed, 6, 2);
    end;
  end;
  PanelBase.Visible := (TotSalario > 0);
  PanelPerc.Visible := (TotSalario > 0);
end;

procedure TfrmAnalSolic.sbtnImplementarClick(Sender: TObject);
var
  Marca: TBookMark;
  sFlgOK: String;
begin
  sIDCarta:=''; sSolicitSemCarta:=''; sIDPessoal:='';
  Marca := tblSolic.GetBookmark;

  if (SelectSolicitacoes(2)) then
  begin
    if (iSelecaoSolicit = 0) then
    begin
      tblSolic.GotoBookmark(Marca);
      if (tblSolic.FieldByName('SITUACAO_SOLIC').Value = 0) then
      begin
        sFlgOK := 'S';
        if (tblSolic.FieldByName('IDPROCESSO').AsInteger > 0) then
           If Fazquery(DtmBaseDados.qry,'SELECT FLGOK FROM RADINSTPROCESSO WHERE IDPROCESSO = '+
                        tblSolic.FieldByName('IDPROCESSO').AsString) Then
               sFlgOK := DtmBaseDados.qry.FieldByName('FLGOK').asString;

        if sFlgOK = 'S' then
        begin
          ImplementaSolicitacao;
          tblSolic.Edit;
          tblSolic.FieldByName('SITUACAO_SOLIC').Value := 1;
          tblSolic.Post;
        end;

      end;
    end
    else
    begin
      tblSolic.First;
      while not(tblSolic.EOF) do
      begin
        if (tblSolic.FieldByName('SITUACAO_SOLIC').Value = 0) then
        begin
          sFlgOK := 'S';
          if (tblSolic.FieldByName('IDPROCESSO').AsInteger > 0) then
             If Fazquery(DtmBaseDados.qry,'SELECT FLGOK FROM RADINSTPROCESSO WHERE IDPROCESSO = '+
                          tblSolic.FieldByName('IDPROCESSO').AsString) Then
                 sFlgOK := DtmBaseDados.qry.FieldByName('FLGOK').asString;

          if sFlgOK = 'S' then
          begin
            ImplementaSolicitacao;
            tblSolic.Edit;
            tblSolic.FieldByName('SITUACAO_SOLIC').Value := 1;
            tblSolic.Post;
          end;

        end;
        tblSolic.Next;
      end;
      tblSolic.First;
    end;

    tblSolic.FreeBookmark(Marca);
    // Imprime Cartas
    ImprimeRelatorio.Imprimir([sIDPessoal, sIDCarta]);
  end;
end;

procedure TfrmAnalSolic.ImplementaSolicitacao;
var
  sIdPessoa, sIdEmpresa: string;
  bFazIntegraPrevRH: boolean;
begin
  //Cria Histórico
  tblHstces.Insert;
  tblHstces.FieldByName('IDPESSOA').Value       := tblSolic.FieldByName('IDINDICADO').Value;
  tblHstces.FieldByName('DATAALTERFUNC').Value  := tblSolic.FieldByName('DATA_EFETIV_ALTER').Value;
  tblHstces.FieldByName('CODCENTROCUSTO').Value := tblSolic.FieldByName('CODCENTROCUSTO').Value;
  tblHstces.FieldByName('IDCARGO').Value        := tblSolic.FieldByName('IDCARGO').Value;
  tblHstces.FieldByName('SALARIO').Value        := tblSolic.FieldByName('NOVO_SALARIO').Value;
  tblHstces.FieldByName('IDMOTIVO').Value       := tblSolic.FieldByName('IDMOTIVO').Value;
  tblHstces.FieldByName('PERC_REAJ').Value      := tblSolic.FieldByName('PERC_REAJ').Value;
  tblHstces.FieldByName('TIPOPAGAMENTO').Value  := tblSolic.FieldByName('NOVO_TIPO_SAL').Value;
  tblHstces.Post;

  //Atualiza Cadastro
  tblFuncio2.FindKey([tblSolic.FieldByName('IDINDICADO').Value]);
  if (tblHstces.FieldByName('DATAALTERFUNC').Value >=
      tblFuncio2.FieldByName('DATASALARIO').Value) and
     (tblHstces.FieldByName('SALARIO').Value <>
      tblFuncio2.FieldByName('SALARIOATUAL').Value) then
  begin
    tblFuncio2.Edit;
    tblFuncio2.FieldByName('DATASALARIO').Value   := tblHstces.FieldByName('DATAALTERFUNC').Value;
    tblFuncio2.FieldByName('SALARIOATUAL').Value  := tblHstces.FieldByName('SALARIO').Value;
    tblFuncio2.FieldByName('TIPOPAGAMENTO').Value := tblHstces.FieldByName('TIPOPAGAMENTO').Value;
  end;

  if (tblHstces.FieldByName('DATAALTERFUNC').Value >=
      tblFuncio2.FieldByName('DATACARGO').Value) and
     (tblHstces.FieldByName('IDCARGO').Value <>
      tblFuncio2.FieldByName('IDCARGO').Value) then
  begin
    tblFuncio2.Edit;
    tblFuncio2.FieldByName('DATACARGO').Value := tblHstces.FieldByName('DATAALTERFUNC').Value;
    tblFuncio2.FieldByName('IDCARGO').Value   := tblHstces.FieldByName('IDCARGO').Value;
  end;

  if (tblHstces.FieldByName('DATAALTERFUNC').Value >=
      tblFuncio2.FieldByName('DATALOTACAO').Value) and
     (tblHstces.FieldByName('CODCENTROCUSTO').Value <>
      tblFuncio2.FieldByName('CODCENTROCUSTO').Value) then
  begin
    tblFuncio2.Edit;
    tblFuncio2.FieldByName('DATALOTACAO').Value    := tblHstces.FieldByName('DATAALTERFUNC').Value;
    tblFuncio2.FieldByName('CODCENTROCUSTO').Value := tblHstces.FieldByName('CODCENTROCUSTO').Value;
  end;

  if (tblFuncio2.State = dsEdit) then
    tblFuncio2.Post;

  sIdPessoa  := tblFuncio2.FieldByName('IDPESSOA').asString;
  sIdEmpresa := tblFuncio2.FieldByName('IDEMPRESA').asString;
  // Chama a rotina de integraçao dos sistemas previdenciarios com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  if (sIdEmpresa <> '') then
  begin
    dtmBaseDados.qry.Close;
    with (dtmBaseDados.qry.SQL) do
    begin
      Clear;
      Add('SELECT TIPOEMPRESA ');
      Add('FROM EMPRESAPROP ');
      Add('WHERE IDPESSOA = ' + sIdEmpresa);
    end;
    dtmBaseDados.qry.Open;
    bFazIntegraPrevRH := (dtmBaseDados.qry.FieldByName('TIPOEMPRESA').asString = 'P');
    dtmBaseDados.qry.Close;
    if (bFazIntegraPrevRH) then
    begin
      dtmBaseDados.dbBaseDados.StartTransaction;
      if (AtualizaDadosPrevFuncionario(StrToInt(sIdEmpresa), StrToInt(sIdPessoa))) then
        dtmBaseDados.dbBaseDados.Commit
      else
        dtmBaseDados.dbBaseDados.RollBack;
    end;
  end;

end;

function TfrmAnalSolic.SelectSolicitacoes(TipoExec: byte): boolean;
begin
  sIDCarta:=''; sSolicitSemCarta:=''; sIDPessoal:='';
  Result := false;

  with (TfrmParamCartaComun.Create(Self)) do
  try
    Visible   := false;
    TipoParam := TipoExec;

    if (ShowModal = mrOk) then
    begin
      iSelecaoSolicit := rgSelecao.ItemIndex;

      if (iSelecaoSolicit = 0) then
      begin
        qryAux.Close;
        qryAux.ParamByName('ID_SOLIC_ALTER_FUNC').asInteger := tblSolic.FieldByName('ID_SOLIC_ALTER_FUNC').asInteger;
        qryAux.Open;

        if (qryAux.IsEmpty) then
          sSolicitSemCarta := tblSolic.FieldByName('ID_SOLIC_ALTER_FUNC').asString
        else
        begin
          sIDPessoal := tblSolic.FieldByName('IDINDICADO').asString;
          sIDCarta   := qryAux.FieldByName('NUMCARTA').asString;
        end;
      end
      else
      begin
        tblSolic.First;
        while not(tblSolic.EOF) do
        begin
          qryAux.Close;
          qryAux.ParamByName('ID_SOLIC_ALTER_FUNC').asInteger :=
            tblSolic.FieldByName('ID_SOLIC_ALTER_FUNC').asInteger;
          qryAux.Open;

          if (qryAux.IsEmpty) then
          begin
            if (VerificaCodigoEm(sSolicitSemCarta,tblSolic.FieldByName('ID_SOLIC_ALTER_FUNC').asString,',') = 0) then
            begin
              if (Trim(sSolicitSemCarta) = '') then
                sSolicitSemCarta := tblSolic.FieldByName('ID_SOLIC_ALTER_FUNC').asString
              else
                sSolicitSemCarta := sSolicitSemCarta +
                  IFF(Trim(sSolicitSemCarta) = '','',',') +
                  tblSolic.FieldByName('ID_SOLIC_ALTER_FUNC').asString;
            end;
          end
          else
          begin
            if (Trim(sIDPessoal) = '') then
            begin
              sIDPessoal := tblSolic.FieldByName('IDINDICADO').asString;
              sIDCarta   := qryAux.FieldByName('NUMCARTA').asString;
            end
            else
            if (VerificaCodigoEm(sIDPessoal,tblSolic.FieldByName('IDINDICADO').asString,',') = 0) then
            begin
              sIDPessoal := sIDPessoal +','+ tblSolic.FieldByName('IDINDICADO').asString;
              sIDCarta   := sIDCarta   +','+ qryAux.FieldByName('NUMCARTA').asString;
            end;
          end;
          tblSolic.Next;
        end;
        tblSolic.First;
      end;

      if (sSolicitSemCarta <> '') then
        MsgDlg('Não Há Carta para a' +IFF(Pos(',',sSolicitSemCarta) > 0,'s','')+
          ' Solicitaç' +IFF(Pos(',',sSolicitSemCarta) > 0,'ões','ão')+ ': ' +sSolicitSemCarta,
          LerMensagem(3), mtInformation, [mbOk, mbHelp], 0);

      if (sIDPessoal <> '') then
      begin
        dtmRelatorioCartaComun.qryCartaComun.SQL[176] := '  (CARTA.NUMCARTA     = '+sIDCarta+') AND';
        if (Pos(',',sIDPessoal) > 0) then
          dtmRelatorioCartaComun.qryCartaComun.SQL[177] := '  (P.IDPESSOA        IN ('+sIDPessoal+')) AND'
        else
          dtmRelatorioCartaComun.qryCartaComun.SQL[177] := '  (P.IDPESSOA         = '+sIDPessoal+') AND';

        ImprimeRelatorio.QueryDados.Assign(dtmRelatorioCartaComun.qryCartaComun.SQL);
        Result := true;
      end;
    end;
  finally
    Free;
  end;

  if (Trim(sIDPessoal) = '') or not(Result) then
    ImprimeRelatorio.QueryDados.Text := '';
end;

procedure TfrmAnalSolic.sbtnImprimirCartaClick(Sender: TObject);
begin
  if (SelectSolicitacoes(1)) then
    ImprimeRelatorio.Imprimir([sIDPessoal, sIDCarta]);
end;

procedure TfrmAnalSolic.sbtnConfigEtiquetaClick(Sender: TObject);
begin
  ImprimeRelatorio.Configurar;
end;

procedure TfrmAnalSolic.sbtnDesfConfigCartaComunicClick(Sender: TObject);
begin
  ImprimeRelatorio.RestaurarConfiguracao;
end;

procedure TfrmAnalSolic.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult         := mrNone;
  tblSolic.Filtered   := true;
  //tblPessoal.Filtered := frmSelSolic.rgSelIndic.ItemIndex = 1;
  lblQtdSolic.Caption := '0';
  lblValSolic.Caption := '0,00';
  tblSolic.Refresh;

//  bbtnOutraVez.Visible      := (frmSelSolic.rgSelIndic.ItemIndex = 1);
  TB97oKCancelar.Visible    := (frmSelSolic.rgSelIndic.ItemIndex = 1);
  Toolbar1.Visible          := (frmSelSolic.cbxProposta.Checked) and not(tblSolic.EOF);
  sbtnImprimirCarta.Visible := not(tblSolic.EOF);

  if (TotSalario > 0)  then
    lblPerc.Caption := FloatToStrF(StrToFloat(lblValSolic.Caption)*100/TotSalario,ffFixed,6,2);
end;

end.
