unit fCadRegTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadMestreDetCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, DBCtrls, Wwtable, CMProcura, wwdblook, ImgList, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro;

type
  TfrmCadRegTrein = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    dbedMatricula: TDBEdit;
    Label10: TLabel;
    dbedNome: TDBEdit;
    MontaSelectFunc: TMontaSelect;
    qryDet: TwwQuery;
    updHstTrn: TUpdateSQL;
    MontaSelectCand: TMontaSelect;
    dbedSit: TDBEdit;
    dbedCargo: TDBEdit;
    qryUltSeq: TwwQuery;
    tblParam: TwwTable;
    qryCurso: TwwQuery;
    qryEntid: TwwQuery;
    Label2: TLabel;
    dblcEntid: TwwDBLookupCombo;
    gbxDatas: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cmDatPlIni: TCMDateTimePicker;
    cmDatPlFim: TCMDateTimePicker;
    cmDatReIni: TCMDateTimePicker;
    cmDatReFim: TCMDateTimePicker;
    gbxCarga: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    gbxDespesas: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dbrgControle: TDBRadioGroup;
    gbxResult: TGroupBox;
    LblAprov: TLabel;
    imgAprov: TImage;
    imgReprov: TImage;
    dbrgAvalCurs: TDBRadioGroup;
    dbrgAvalTeor: TDBRadioGroup;
    dbrgAvalPrat: TDBRadioGroup;
    dbedAvCurs: TDBEdit;
    Label3: TLabel;
    dblcInstrutor: TwwDBLookupCombo;
    qryInstrutor: TwwQuery;
    gbxLocalCurso: TGroupBox;
    dbedLocalCurso: TDBEdit;
    Label4: TLabel;
    dbedValor: TDBRealEdit;
    dbedViagem: TDBRealEdit;
    dbedHosped: TDBRealEdit;
    dbedOutras: TDBRealEdit;
    CMProcuraCurso: TCMProcura;
    MontaSelectCurso: TMontaSelect;
    tbshAval: TTabSheet;
    pnlAval: TPanel;
    dbgrdAval: TwwDBGrid;
    dsAval: TwwDataSource;
    qryAval: TwwQuery;
    updAval: TUpdateSQL;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    qryFatorAval: TwwQuery;
    sbtnProcurarCand: TToolbarButton97;
    pnlImprimeAval: TPanel;
    sbtnImprimirAval: TSpeedButton;
    sbtnConfigAval: TSpeedButton;
    sbtnDesfConfigAval: TSpeedButton;
    dbedAvTeor: TDBRealEdit;
    dbedAvPrat: TDBRealEdit;
    dbedDurTeor: TDBRealEdit;
    dbedDurPrat: TDBRealEdit;
    dbedDurTot: TDBRealEdit;
    dbrgAvalConceitual: TDBRadioGroup;
    gbxAvalEscal: TGroupBox;
    dbredAvaliacao: TDBRealEdit;
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure dbrgAvalTeorChange(Sender: TObject);
    procedure dbrgAvalPratChange(Sender: TObject);
    procedure dbrgControleChange(Sender: TObject);
    procedure dbrgAvalCursChange(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure qryDetBeforeEdit(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure CMProcuraCursoValidaDados(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure sbtnDesfConfigAvalClick(Sender: TObject);
    procedure sbtnConfigAvalClick(Sender: TObject);
    procedure sbtnImprimirAvalClick(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dblcEntidChange(Sender: TObject);
    procedure dbedAvPratChange(Sender: TObject);
    procedure dbedAvTeorChange(Sender: TObject);
    procedure dblcEntidEnter(Sender: TObject);
    procedure qryAvalAfterScroll(DataSet: TDataSet);
  private
    iIdTipoProcesso: LongInt;
    sDataFinalAntes, sDataFinalDepois, sDataIniAntes, sDataIniDepois: string;
  public  
    bFuncionario: boolean;
  end;

var
  frmCadRegTrein: TfrmCadRegTrein;

implementation

uses uCMTypes, uSistema, uMensErro, uDataBase, UsoGeralRH, uRAD, DBaseDados, uFuncoesUteisRH,
  CorreioCM, fPrincipal, uImprimeRelatorio, dRelatoriosAvalCurso;

{$R *.DFM}

procedure TfrmCadRegTrein.FormCreate(Sender: TObject);
begin
  inherited;
  ImprimeRelatorio := TImprimeRelatorio.Create;

  // Registro o Form de visualização e Carrego a configuração destas
  with (dtmRelatoriosAvalCurso) do
  begin
    ImprimeRelatorio.Iniciar(dsgnRelatorios, rpAvalCurso, ppAvalCurso,
      qryAvalCurso, GetLayoutPadrao, 'Avaliação de Curso',
      'rpAvalCurso', 'AvalCurso.tmp', 72);
  end;

  if (Sistema.IdModulo = 417) then
    HelpContext := 4170012;

  if (frmPrincipal.iIdContraCheque = 3) then
    dbrgControle.Caption := 'Por Conta da Empresa?';

  qryEntid.Open;
  qryInstrutor.Open;

  qry.Prepare;
  qry.ParamByName('IdPessoa').asInteger := -1;
  qry.Open;

  qryDet.Prepare;
  qryDet.ParamByName('IdPessoa').asInteger := -1;
  qryDet.Open;

  qryAval.Prepare;
  qryAval.ParamByName('IdPessoa').asInteger := -1;
  qryAval.ParamByName('IdCurso').asInteger  := -1;
  qryAval.ParamByName('NumSeq').asInteger   := -1;
  qryAval.Open;

  qryCurso.Open;

  if (sUsuXccusto <> '') then
    MontaSelectFunc.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' + sUsuXccusto);

  if (sUsuXfilial <> '') then
    MontaSelectFunc.Filtro.Add('FUNCIONARIO.IDESTAB IN ' + sUsuXfilial);

  if sUsoGeralIdPessoa <> '' then
    MontaSelectFunc.Filtro.Add('FUNCIONARIO.IDPESSOA = ' + sUsoGeralIdPessoa);

  sbtnConfigAval.Visible := frmPrincipal.UsuarioRH.Enabled;
  sbtnDesfConfigAval.Visible := frmPrincipal.UsuarioRH.Enabled;

  lblAprov.Caption := '';

  iIdTipoProcesso := -1;
  if (Sistema.UsaRAD) then
  begin
    Rad := TRad.Create;
    if Fazquery(DtmBaseDados.qry,'SELECT IDTIPOPROCESSO FROM RADTIPOPROCESSO WHERE (IDREFERENCIA = 20)') then
      iIdTipoProcesso := dtmBaseDados.qry.FieldByName('IDTIPOPROCESSO').asInteger;
  end;

  if (sUsoGeralIdPessoa <> '') then
  begin
    qryDet.Close;
    qryDet.ParamByName('IdPessoa').asInteger := StrToInt(sUsoGeralIdPessoa);
    qryDet.Open;

    qry.Close;
    qry.ParamByName('IdPessoa').asInteger := StrToInt(sUsoGeralIdPessoa);
    qry.Open;

    sbtnProcurarCand.Visible := False;
  end;
end;

procedure TfrmCadRegTrein.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ImprimeRelatorio);
  inherited;
  qry.Close;
  qryDet.Close;

  qry.UnPrepare;
  qryDet.UnPrepare;
end;

procedure TfrmCadRegTrein.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
  begin
    qryDet.Close;
    qryDet.ParamByName('IdPessoa').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
    qryDet.Open;
    qry.Close;
    qry.ParamByName('IdPessoa').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
    qry.Open;
  end;
end;

procedure TfrmCadRegTrein.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('IdPessoa').asInteger    := qry.FieldByName('IdPessoa').asInteger;
  if bFuncionario then
     qryDet.FieldByName('FLGCONTROLE').asInteger := 1
  else
     qryDet.FieldByName('FLGCONTROLE').asInteger := 0;
  qryDet.FieldByName('FLGAVALCURS').asInteger := 0;
  qryDet.FieldByName('FLGAVALTEOR').asInteger := 0;
  qryDet.FieldByName('FLGAVALPRAT').asInteger := 0;
end;

procedure TfrmCadRegTrein.sbtnProcurarClick(Sender: TObject);
begin
  with (qry.SQL) do
  begin
    Clear;
    if Sender <> sbtnProcurarCand then
    begin
      bFuncionario:= True;
      MontaSelect := MontaSelectFunc;
      Add('SELECT F.MATRICULA, P.NOME, C.TITULO, S.DESCRICAO, F.IDPESSOA '+
          'FROM   PESSOA P, FUNCIONARIO F, SITFUNC S, CARGO C '+
          'WHERE (F.IDPESSOA  = :IDPESSOA)   AND '+
          '      (F.IDCARGO   = C.IDCARGO)   AND '+
          '      (F.IDSITFUNC = S.IDSITFUNC) AND '+
          '      (F.IDPESSOA  = P.IDPESSOA)');
    end
    else
    begin
      bFuncionario := False;
      sbtnProcurarCand.Down := False;
      MontaSelect := MontaSelectCand;
      Add('SELECT CA.IDPESSOA AS MATRICULA, P.NOME, C.TITULO, '+
          '       ''Candidato'' AS DESCRICAO, CA.IDPESSOA '+
          'FROM   PESSOA P, CANDIDAT CA, CARGO C '+
          'WHERE (CA.IDPESSOA = :IDPESSOA) AND '+
          '      (CA.IDCARGO  = C.IDCARGO) AND '+
          '      (CA.IDPESSOA = P.IDPESSOA)');
    end;
  end;

  inherited;
end;

procedure TfrmCadRegTrein.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  lblAprov.Visible  := false;
  imgAprov.Visible  := false;
  imgReprov.Visible := false;

  if (qryCurso.Active) and (
      (qryCurso.FieldByName('TEMAVAL').AsInteger = 1) and
      (dbrgAvalTeor.ItemIndex = 0) or
      (qryCurso.FieldByName('TEMAVPR').AsInteger = 1) and
      (dbrgAvalPrat.ItemIndex = 0)
     ) then
  begin
       if ((qryCurso.FieldByName('TEMAVAL').AsInteger = 1) and
           (dbrgAvalTeor.ItemIndex = 0) and
           (qryCurso.FieldByName('AVALIACAO').AsInteger > dbedAvTeor.Value)) or
          ((qryCurso.FieldByName('TEMAVPR').AsInteger = 1) and
           (dbrgAvalPrat.ItemIndex = 0) and
           (qryCurso.FieldByName('AVALPRAT').AsInteger > dbedAvPrat.Value))  then
         begin
           lblAprov.Caption := 'REPROVAD';
           lblAprov.Font.Color := clRed;
           imgReprov.Visible := True;
         end
       else
         begin
           lblAprov.Caption := 'APROVAD';
           lblAprov.Font.Color := clBlue;
           imgAprov.Visible := True;
         end;
     //if tblPessoal.FieldByName('SEXO').Value = 'M' then
        lblAprov.Caption := lblAprov.Caption + 'O';//  else
     //   lblAprov.Caption := lblAprov.Caption + 'A';
     lblAprov.Left := trunc(gbxResult.Width / 2 - lblAprov.Width / 2);
     lblAprov.Visible := True;
  end;

  dbedAvTeor.Visible  := dbrgAvalTeor.ItemIndex = 0;
  dbedAvPrat.Visible  := dbrgAvalPrat.ItemIndex = 0;
  gbxDespesas.Enabled := (dbrgControle.ItemIndex = 0);

  dbrgAvalCurs.Visible := (dbrgControle.ItemIndex = 0);
  dbedAvCurs.Visible   := dbrgAvalCurs.ItemIndex = 0;
  gbxDespesas.Visible  := (dbrgControle.ItemIndex = 0);
end;

procedure TfrmCadRegTrein.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
    CMProcuraCurso.SetFocus;
end;

procedure TfrmCadRegTrein.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
    CMProcuraCurso.SetFocus;
end;

procedure TfrmCadRegTrein.bbtnOkDetClick(Sender: TObject);
begin
  if (qryDet.State = dsInsert) then
  begin
    qryUltSeq.Close;
    qryUltSeq.ParamByName('IDPESSOA').asInteger := qryDet.FieldByName('IDPESSOA').asInteger;
    qryUltSeq.ParamByName('IDCURSO').asInteger  := qryDet.FieldByName('IDCURSO').asInteger;
    qryUltSeq.Open;

    qryDet.FieldByName('NUMSEQ').Value := qryUltSeq.FieldByName('ULTSEQ').AsInteger + 1;

    if (qryDet.FieldByName('NUMSEQ').AsInteger > 1) and

       (MsgDlg('Já consta esse curso para essa pessoa. Deseja registrar nova ocorrência ?',
             'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes) then
       exit;

  end;
  inherited;
end;

procedure TfrmCadRegTrein.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('DESCRICAO').AsString := qryCurso.FieldByName('DESCRICAO').AsString;

  qryDet.FieldByName('FINALIZOU').asInteger := 0;
  if (sDataFinalAntes = '') and (sDataFinalDepois <> '') and
     (dbrgAvalCurs.ItemIndex = 0) and (dbedAvCurs.Text = '') and
     (dbrgControle.ItemIndex = 0) then
     qryDet.FieldByName('FINALIZOU').asInteger := 1;

  if (qryDet.FieldByName('DUR_TEOR').IsNull) then
    qryDet.FieldByName('DUR_TEOR').Value := 0;

  if (qryDet.FieldByName('DUR_PRAT').IsNull) then
    qryDet.FieldByName('DUR_PRAT').Value := 0;

  qryDet.FieldByName('DUR_TOT').asFloat := qryDet.FieldByName('DUR_TEOR').asFloat +
    qryDet.FieldByName('DUR_PRAT').asFloat;
end;

procedure TfrmCadRegTrein.dbrgAvalTeorChange(Sender: TObject);
begin
  inherited;
  dbedAvTeor.Visible := dbrgAvalTeor.ItemIndex = 0;
  qryDetAfterScroll(dsDet.DataSet);
end;

procedure TfrmCadRegTrein.dbrgAvalPratChange(Sender: TObject);
begin
  inherited;
  dbedAvPrat.Visible := dbrgAvalPrat.ItemIndex = 0;
  qryDetAfterScroll(dsDet.DataSet);
end;

procedure TfrmCadRegTrein.dbrgAvalCursChange(Sender: TObject);
begin
  inherited;
  dbedAvCurs.Visible := (dbrgAvalCurs.ItemIndex = 0);
end;

procedure TfrmCadRegTrein.dbrgControleChange(Sender: TObject);
begin
  inherited;
  gbxDespesas.Enabled  := (dbrgControle.ItemIndex = 0);
  dbrgAvalCurs.Visible := (dbrgControle.ItemIndex = 0);
  dbedAvCurs.Visible   := (dbrgControle.ItemIndex = 0);
  gbxDespesas.Visible  := (dbrgControle.ItemIndex = 0);

  if (dsDet.State = dsInsert) then
     dbrgAvalCurs.ItemIndex   := dbrgControle.ItemIndex;

  dbrgAvalCursChange(Sender);
end;

procedure TfrmCadRegTrein.CmeCadastroConfirma(Sender: TObject);
var
  sSql: String;
  Mensagem : TMensagem;
begin
  qryDet.First;
  while not qryDet.Eof do
  begin
     If ( Sistema.UsaRAD ) And (iIdTipoProcesso > 0) then
     if (qryDet.FieldByName('IDPROCESSO').AsInteger <= 0) and
        (qryDet.FieldByName('DATREINI').AsString = '')    and
        (qryDet.FieldByName('DATREFIM').AsString = '')    and
        (qryDet.FieldByName('FLGCONTROLE').AsInteger = 1) Then
     Begin
           Rad.TipoProcesso    := iIdTipoProcesso;
           Rad.IdPessoa        := Sistema.IdEmpresa;
           //Rad.CodCentroRespon := dblcCentRespon.LookupValue;
           //Rad.UnidNegoc       := StrToInt(dblcAtiv.LookupValue);
           Rad.OBS             := 'Treinamento de ' + dbedNome.Text + ' em ' +
                                   qryDet.FieldByName('DESCRICAO').AsString +
                                  ' iniciando em ' +
                                  qryDet.FieldByName('DATPLINI').AsString;
           Rad.Valor           := qryDet.FieldByName('VALOR').AsFloat +
                                  qryDet.FieldByName('DESP_VIAG').AsFloat +
                                  qryDet.FieldByName('DESP_ESTAD').AsFloat +
                                  qryDet.FieldByName('DESP_OUTR').AsFloat;
           with (DtmBaseDados.qry) do
           begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT IDEMPRESA, CODCENTROCUSTO FROM FUNCIONARIO WHERE IDPESSOA = '+
                       qry.FieldByName('IDPESSOA').asString);
              Open;
              if not IsEmpty then
              begin
                 Rad.IdEmpresa       := FieldByName('IDEMPRESA').AsInteger;
                 Rad.CodCentroCusto  := FieldByName('CODCENTROCUSTO').AsString;
              end;
              Close;
           end;
           //Rad.CodGrupoProd    := sGrupoProd;
           //
           qryDet.Edit;
           qryDet.FieldByName('IDPROCESSO').AsInteger :=  Rad.IniciarProcesso;
           qryDet.Post;
           if qryDet.FieldByName('IDPROCESSO').AsInteger < 0 Then
           Begin
              MsgDlg('Erro ao tentar instanciar o processo no R.A.D.','Erro',mtError,[mbOK],0);
              Abort;
           End;

     End
     else if (qryDet.FieldByName('IDPROCESSO').AsInteger > 0) then
     Begin
        sSQL :=  'UPDATE RADINSTPROCESSO SET VLRPROC = ' +
                  OraNumero(FloatToStr(qryDet.FieldByName('VALOR').AsFloat +
                                  qryDet.FieldByName('DESP_VIAG').AsFloat +
                                  qryDet.FieldByName('DESP_ESTAD').AsFloat +
                                  qryDet.FieldByName('DESP_OUTR').AsFloat)) +
                  ' WHERE IDPROCESSO = ' + qryDet.FieldByName('IDPROCESSO').AsString;

        DtmBaseDados.qry.Close;
        DtmBaseDados.qry.SQL.Clear;
        DtmBaseDados.qry.SQL.Add(sSQL);
        try
          if sSQL <> ''
          then DtmBaseDados.qry.ExecSQL;
        except
              MsgDlg('Erro ao tentar atualizar o processo no R.A.D.','Erro',mtError,[mbOK],0);
              Abort;
        end;//try
     End;

     if (qryDet.FieldByName('FINALIZOU').AsInteger = 1) Then
     begin
       Mensagem := TMensagem.Create(Self);
       try
         Mensagem.Nova;
         Mensagem.IdDestinatario := qryDet.FieldByName('IDPESSOA').asInteger;
         Mensagem.IdRemetente := Sistema.IdUsuario;
         Mensagem.Assunto := 'Avaliação de Treinamento';
         Mensagem.NomeRemetente := Sistema.NomeUsuario;
         Mensagem.TipoDestinatario := tdUsuario;
         Mensagem.Mensagem := 'Não esqueça de fazer a sua avaliação do curso ' +
                              qryDet.FieldByName('DESCRICAO').AsString +
                              ' concluído em ' +
                              qryDet.FieldByName('DATREFIM').AsString;
         Mensagem.Envia;
       finally
         Mensagem.Free;
       end;
     end;
     qryDet.Next;
  end;
  qryDet.First;

  //inherited;
  try
    AplicaAlteracoes([qryDet,qryAval]);
  except
    raise;
  end;
  qryAval.Close;
  qryAval.ParamByName('IdPessoa').asInteger := qryDet.FieldByName('IDPESSOA').AsInteger;
  qryAval.ParamByName('IdCurso').asInteger  := qryDet.FieldByName('IDCURSO').AsInteger;
  qryAval.ParamByName('NumSeq').asInteger   := qryDet.FieldByName('NUMSEQ').AsInteger;
  qryAval.Open;


end;

procedure TfrmCadRegTrein.CmeDetalheConfirma(Sender: TObject);
var
  sFlgOK: String;
  QtdAva, TotAva: Integer;
begin
  sDataFinalDepois := cmDatReFim.Text;
  sDataIniDepois   := cmDatReIni.Text;
  if (sDataIniAntes = '') and (sDataIniDepois <> '') and
     (qryDet.FieldByName('IDPROCESSO').AsInteger > 0) then
     begin
        sFlgOK := 'S';
        If Fazquery(DtmBaseDados.qry,'SELECT FLGOK FROM RADINSTPROCESSO WHERE IDPROCESSO = '+
                    qryDet.FieldByName('IDPROCESSO').AsString) Then
           sFlgOK := DtmBaseDados.qry.FieldByName('FLGOK').asString;

        if sFlgOK <> 'S' then
        begin
            MsgDlg('Processo não está concluído. Não pode ser iniciado o curso',
                   'Informação',mtInformation,[mbOk,mbHelp],0);
            exit;
        end;

     end;

  if (pgctrlDetalhe.ActivePage = tbsDet) and (dbrgAvalCurs.ItemIndex = 0) and
     (qryAval.Active) and (qryAval.RecordCount > 0) and
     (MsgDlg('Deseja alterar avaliação do curso com média das avaliações dos fatores ?',
             'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then
  begin
     qryAval.First;
     QtdAva := 0;
     TotAva := 0;
     while not (qryAval.Eof) do
     begin
        inc(QtdAva);
        TotAva := TotAva + qryAval.FieldByName('AVALCURSO').AsInteger *
                  iff(qryAval.FieldByName('FLGAVALCURSO').AsInteger=0,1,25);
        qryAval.Next;
     end;
     qryAval.First;
     qryDet.FieldByName('AVALCURSO').AsInteger := round(TotAva / QtdAva);
  end;
  inherited;

end;

procedure TfrmCadRegTrein.qryDetBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  sDataFinalAntes := cmDatReFim.Text;
  sDataIniAntes   := cmDatReIni.Text;
end;

procedure TfrmCadRegTrein.FormShow(Sender: TObject);
begin
  inherited;
  if sUsoGeralIdPessoa <> '' then
  begin
     sbtnProcurar.Visible := False;
     sbtnAlterar.Enabled  := True;
  end;
end;

procedure TfrmCadRegTrein.CMProcuraCursoValidaDados(Sender: TObject);
begin
  inherited;
  if ((qryDet.State = dsEdit) or (qryDet.State = dsInsert)) then
  begin
    qryCurso.Close;
    qryCurso.Open;
    qryDet.FieldByName('IDENTIDINSTR').Value := qryCurso.FieldByName('IDENTIDINSTR').Value;
    qryDet.FieldByName('FLGAVALTEOR').Value  := qryCurso.FieldByName('TEMAVAL').Value;
    qryDet.FieldByName('FLGAVALPRAT').Value  := qryCurso.FieldByName('TEMAVPR').Value;
    qryDet.FieldByName('DUR_PRAT').Value     := qryCurso.FieldByName('DUR_PRAT').Value;
    qryDet.FieldByName('DUR_TEOR').Value     := qryCurso.FieldByName('DUR_TEOR').Value;
    qryDet.FieldByName('VALOR').Value        := qryCurso.FieldByName('VALOR').Value;
  end;

end;

procedure TfrmCadRegTrein.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnProcurarCand.Enabled  :=  sbtnProcurar.Enabled;
end;

procedure TfrmCadRegTrein.sbtnDesfConfigAvalClick(Sender: TObject);
begin
  inherited;
  ImprimeRelatorio.RestaurarConfiguracao;
end;

procedure TfrmCadRegTrein.sbtnConfigAvalClick(Sender: TObject);
begin
  inherited;
  ImprimeRelatorio.Configurar;
end;

procedure TfrmCadRegTrein.sbtnImprimirAvalClick(Sender: TObject);
begin
  inherited;

  if (Trim(cmDatReFim.Text) <> '') then
  begin
    with (dtmRelatoriosAvalCurso.qryAvalCurso) do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT A.IDFATORAVAL,'+QuotedStr(Sistema.NomeEmpresa)+ ' AS EMPRESA,');
      Sql.Add(QuotedStr(CMProcuraCurso.Text)+' AS CURSO,');
      Sql.Add(QuotedStr(dbedNome.Text)+' AS NOME,');
      Sql.Add(QuotedStr(dbedMatricula.Text)+' AS MATRICULA,');
      Sql.Add(QuotedStr(dbedCargo.Text)+' AS CARGO,');
      Sql.Add(QuotedStr(dblcEntid.Text)+' AS ENTIDADE,');
      Sql.Add(QuotedStr(dbedLocalCurso.Text)+' AS LOCAL,');
      Sql.Add(QuotedStr(cmDatReIni.Text+' - '+cmDatReFim.Text)+' AS PERIODO,');
      Sql.Add('A.AVALCURSO AS AVALIACAO, F.DESCRICAO, A.OBSERVACAO');
      Sql.Add('FROM AVALCURSO A, FATORAVALCURSO F');
      Sql.Add('WHERE  A.IDPESSOA = ' + qryDet.FieldByName('IDPESSOA').AsString);
      Sql.Add('AND    A.IDCURSO  = ' + qryDet.FieldByName('IDCURSO').AsString);
      Sql.Add('AND    A.NUMSEQ   = ' + qryDet.FieldByName('NUMSEQ').AsString);
      Sql.Add('AND    A.IDFATORAVAL   = F.IDFATORAVAL');
      Sql.Add('ORDER BY A.IDFATORAVAL');
      Open;
      if not(IsEmpty) then
      begin
        ImprimeRelatorio.TipoImpressao := tpQueryComDados;
        ImprimeRelatorio.QueryDados.Assign(SQL);
        ImprimeRelatorio.Imprimir([null]);
      end;
    end;
  end;

end;

procedure TfrmCadRegTrein.tbcDetalheChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  pnlImprimeAval.Visible := False;
  if (pgctrlDetalhe.ActivePage = tbshAval) then
  begin
    sbtnInsDet.Visible    := True;
    sbtnExcluiDet.Visible := True;
    exit;
  end;

  if (qryDet.FieldByName('IDPESSOA').AsInteger = 0) then
  begin
    AllowChange := false;
      //pgctrlDetalhe.ActivePage := tbsDet;
      //tbcDetalhe.TabIndex := 0;
      MsgDlg('Nào há curso selecionado',
             'Informação',mtInformation,[mbOk,mbHelp],0);
      exit;
  end;

  if (cmDatReFim.Text = '') or
     (qryDet.FieldByName('FLGAVALCURS').AsInteger <> 1) then
  begin
    AllowChange := false;
      //pgctrlDetalhe.ActivePage := tbsDet;
      //tbcDetalhe.TabIndex := 0;
      MsgDlg('Curso selecionado não tem avaliação e/ou não foi concluído',
             'Informação',mtInformation,[mbOk,mbHelp],0);
      exit;
  end;

  if not qryFatorAval.Active then qryFatorAval.Open;
  if (qryFatorAval.IsEmpty) then
  begin
    AllowChange := false;
      //pgctrlDetalhe.ActivePage := tbsDet;
      //tbcDetalhe.TabIndex := 0;
      MsgDlg('Cadastre os Fatores de Avaliação dos Cursos !',
             'Informação',mtInformation,[mbOk,mbHelp],0);
      exit;
  end;

  sbtnInsDet.Visible     := False;
  sbtnExcluiDet.Visible  := False;
  pnlImprimeAval.Visible := True;
  qryAval.Close;
  qryAval.ParamByName('IdPessoa').asInteger := qryDet.FieldByName('IDPESSOA').AsInteger;
  qryAval.ParamByName('IdCurso').asInteger  := qryDet.FieldByName('IDCURSO').AsInteger;
  qryAval.ParamByName('NumSeq').asInteger   := qryDet.FieldByName('NUMSEQ').AsInteger;
  qryAval.Open;
  if (qryAval.IsEmpty) then
  begin
    qryFatorAval.First;
    while not qryFatorAval.Eof do
    begin
      qryAval.Insert;
      qryAval.FieldByName('IDPESSOA').AsInteger := qryDet.FieldByName('IDPESSOA').AsInteger;
      qryAval.FieldByName('IDCURSO').AsInteger  := qryDet.FieldByName('IDCURSO').AsInteger;
      qryAval.FieldByName('NUMSEQ').AsInteger   := qryDet.FieldByName('NUMSEQ').AsInteger;
      qryAval.FieldByName('IDFATORAVAL').AsInteger :=
              qryFatorAval.FieldByName('IDFATORAVAL').AsInteger;
      qryAval.FieldByName('DESCRICAO').AsString :=
              qryFatorAval.FieldByName('DESCRICAO').AsString;
      qryAval.FieldByName('OBSERVACAO').AsString :=
              qryFatorAval.FieldByName('OBSERVACAO').AsString;
      qryAval.Post;
      qryFatorAval.Next;
    end;
    qryAval.First;
  end;
  AllowChange := true;  
end;

procedure TfrmCadRegTrein.dblcEntidChange(Sender: TObject);
begin
  inherited;
  if dblcEntid.Text <> '' then
  begin
    qryInstrutor.Close;
    qryInstrutor.Sql[6] := '  (P.TIPO          = ''F'') AND (P.IDGRUPO = ' +
                           qryEntid.FieldByName('IdPessoa').asString + ') ';
    qryInstrutor.Open;
  end;

end;

procedure TfrmCadRegTrein.dbedAvPratChange(Sender: TObject);
begin
  inherited;
  qryDetAfterScroll(dsDet.DataSet);
end;

procedure TfrmCadRegTrein.dbedAvTeorChange(Sender: TObject);
begin
  inherited;
  qryDetAfterScroll(dsDet.DataSet);
end;

procedure TfrmCadRegTrein.dblcEntidEnter(Sender: TObject);
begin
  inherited;
  if CMProcuraCurso.Text <> '' then
  begin
    qryEntid.Close;
    qryEntid.Sql[7] := '  (P.TIPO = ''F'') AND (IE.IDCURSO = ' +
                           qryDet.FieldByName('IdCurso').asString + ') ';
    qryEntid.Open;
  end;

end;

procedure TfrmCadRegTrein.qryAvalAfterScroll(DataSet: TDataSet);
begin
  inherited;
  gbxAvalEscal.Visible       := qryAval.FieldByName('FLGAVALCURSO').AsInteger = 0;
  dbrgAvalConceitual.Visible := qryAval.FieldByName('FLGAVALCURSO').AsInteger > 0;
end;

end.
