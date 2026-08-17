unit fCadRegOcorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadMestreDetCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, DBCtrls, Wwtable, CMProcura, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, CmEventosCadastro, ImgList, TREdit;

type
  TfrmCadRegOcorr = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    dbedMatricula: TDBEdit;
    Label10: TLabel;
    dbedNome: TDBEdit;
    tbshObserv: TTabSheet;
    dbmemFortes: TDBMemo;
    MontaSelectFunc: TMontaSelect;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryTabOcorr: TwwQuery;
    Label2: TLabel;
    dblcTipoEntr: TwwDBLookupCombo;
    Label3: TLabel;
    dbedDatPlan: TCMDateTimePicker;
    Label4: TLabel;
    dbedDatReal: TCMDateTimePicker;
    Label6: TLabel;
    Label5: TLabel;
    lblLicenca: TLabel;
    Label9: TLabel;
    dbmObser: TDBMemo;
    imgApto: TImage;
    lblAprov: TLabel;
    MontaSelectCand: TMontaSelect;
    dbedSit: TDBEdit;
    dbedCargo: TDBEdit;
    qryUltSeq: TwwQuery;
    imgInapto: TImage;
    MontaSelectCID: TMontaSelect;
    pnlAleatorio: TPanel;
    dtedDataRetorno: TCMDateTimePicker;
    dbedDatInicio: TCMDateTimePicker;
    Label11: TLabel;
    Label12: TLabel;
    sbtnFicha: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    qryParamRH: TwwQuery;
    gbxExaminador: TGroupBox;
    bbtnProcMedico: TBitBtn;
    dbedAvaliador: TDBEdit;
    dbedCODCID: TDBEdit;
    bbtnBuscaCID: TBitBtn;
    edCID: TEdit;
    sbtnProcurarCand: TToolbarButton97;
    qryCID: TwwQuery;
    mskedHora: TMaskEdit;
    Label8: TLabel;
    dbedAvaliacao: TDBRealEdit;
    dbedLicenca: TDBRealEdit;
    sbtnCAT: TToolbarButton97;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnFichaClick(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure dbedAvaliacaoExit(Sender: TObject);
    procedure dblcTipoEntrChange(Sender: TObject);
    procedure dbedLicencaChange(Sender: TObject);
    procedure dbedDatInicioChange(Sender: TObject);
    procedure dtedDataRetornoChange(Sender: TObject);
    procedure bbtnProcMedicoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure bbtnBuscaCIDClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnCATClick(Sender: TObject);
  end;

var
  frmCadRegOcorr: TfrmCadRegOcorr;
  bCandAprovado, bEmpregado : Boolean;

implementation

uses uSistema, uMensErro, uDataBase, UsoGeralRH, uFuncoesUteisRH, fTelaAut, fParamPCMSO,
  fLancaFalta, fProcuraPessoaDoc, dBaseDados, fParamRelCAT;

{$R *.DFM}

procedure TfrmCadRegOcorr.FormCreate(Sender: TObject);
begin
  inherited;
  frmProcuraPessoaDoc := TfrmProcuraPessoaDoc.Create(Application);

  qryTabOcorr.Open;
  qryParamRH.Open;

  qry.Close;
  qry.ParamByName('IdPessoa').asInteger := -1;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IdPessoa').asInteger := -1;
  qryDet.Open;

  qryCID.Open;
  
  if (sUsuXccusto <> '') then
    MontaSelectFunc.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' + sUsuXccusto);

  if (sUsuXfilial <> '') then
    MontaSelectFunc.Filtro.Add('FUNCIONARIO.IDESTAB IN ' + sUsuXfilial);

  lblAprov.Caption := '';
  sbtnProcurarClick(Sender);
end;

procedure TfrmCadRegOcorr.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  sbtnFicha.Enabled := not(qryDet.IsEmpty);
  sbtnCAT.Enabled := not(qryDet.IsEmpty) and (bEmpregado) and
    not(qryDet.FieldByName('DATAREAL').isNull);
end;

procedure TfrmCadRegOcorr.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  sbtnCAT.Enabled := not(qryDet.IsEmpty) and (bEmpregado) and
    not(qryDet.FieldByName('DATAREAL').isNull);

  lblAprov.Visible  := false;
  imgApto.Visible   := false;
  imgInapto.Visible := false;
  edCID.Text        := qryCID.FieldByName('DESCRCID').asString;

  if (qryTabOcorr.FieldByName('AVALMIN').asInteger > 0) then
  begin
    if (qryTabOcorr.FieldByName('AVALMIN').asInteger >
        qryDet.FieldByName('AVALIACAO').AsInteger) then
    begin
      lblAprov.Caption    := 'INAPT';
      lblAprov.Font.Color := clRed;
      imgInapto.Visible   := true;
    end
    else
    begin
      lblAprov.Caption := 'APT';
      lblAprov.Font.Color := clGreen;
      imgApto.Visible := true;
    end;
    lblAprov.Caption := lblAprov.Caption + 'O';
    lblAprov.Visible := true;
  end;

  dbedDatPlan.Text := '';
  mskedHora.Text   := '';
  if not(qryDet.FieldByName('DATAPLAN').IsNull) then
  begin
    dbedDatPlan.Date  := StrToDate(DateToStr(qryDet.FieldByName('DATAPLAN').AsDateTime));
    //mskedHora.Text     := TimeToStr(qryEtapa.FieldByName('DATAREALOCOR').AsDateTime);
    mskedHora.Text     := copy(qryDet.FieldByName('DATAPLAN').AsString,12,5);
  end;
end;

procedure TfrmCadRegOcorr.qryDetAfterInsert(DataSet: TDataSet);
begin
  dbedDatInicio.Text   := '';
  dtedDataRetorno.Text := '';
  inherited;
  qryDet.FieldByName('IdPessoa').asInteger := qry.FieldByName('IdPessoa').asInteger;
end;

procedure TfrmCadRegOcorr.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('DESCRTIPOOCMED').asString := qryTabOcorr.FieldByName('DESCRTIPOOCMED').asString;
  if mskedHora.Text = '  :  ' then
     qryDet.FieldByName('DATAPLAN').Value := dbedDatPlan.Date
  else
     qryDet.FieldByName('DATAPLAN').AsDateTime := dbedDatPlan.Date +
                                                        StrToTime(mskedHora.Text);
end;

procedure TfrmCadRegOcorr.dblcTipoEntrChange(Sender: TObject);
begin
  inherited;
  pnlAleatorio.Visible := qryTabOcorr.FieldByName('FLGTIPOCOR').AsInteger = 1;
  mskedHora.Visible    := not pnlAleatorio.Visible;
end;

procedure TfrmCadRegOcorr.dbedLicencaChange(Sender: TObject);
begin
  inherited;
  dtedDataRetorno.Date := dbedDatInicio.Date + dbedLicenca.Value;
end;

procedure TfrmCadRegOcorr.dbedDatInicioChange(Sender: TObject);
begin
  inherited;
  dtedDataRetorno.Date := dbedDatInicio.Date +
     qryDet.FieldByName('LICENCA').AsInteger;
end;

procedure TfrmCadRegOcorr.dtedDataRetornoChange(Sender: TObject);
begin
  inherited;
  dbedLicenca.Value := Trunc(dtedDataRetorno.Date - dbedDatInicio.Date);
end;

procedure TfrmCadRegOcorr.dbedAvaliacaoExit(Sender: TObject);
begin
  inherited;
  qryDetAfterScroll(dsDet.DataSet);
end;

procedure TfrmCadRegOcorr.sbtnProcurarClick(Sender: TObject);
begin
  qry.SQL.Clear;

  bCandAprovado := False;
  bEmpregado    := True;

  if Sender <> sbtnProcurarCand then
  begin
    lblLicenca.Visible  := True;
    dbedLicenca.Visible := True;
    MontaSelect := MontaSelectFunc;
    qry.SQL.Add('SELECT F.MATRICULA, P.NOME, C.TITULO, S.DESCRICAO, F.IDPESSOA ' +
                'FROM PESSOA P, FUNCIONARIO F, SITFUNC S, CARGO C ' +
                'WHERE F.IDPESSOA     = P.IDPESSOA ' +
                'AND   F.IDCARGO           = C.IDCARGO ' +
                'AND   F.IDPESSOA          = :IDPESSOA ' +
                'AND   F.IDSITFUNC         = S.IDSITFUNC');
  end
  else
  begin
    lblLicenca.Visible  := False;
    dbedLicenca.Visible := False;
    bEmpregado          := False;

    sbtnProcurarCand.Down := False;
    MontaSelect := MontaSelectCand;
    qry.SQL.Add('SELECT CA.IDPESSOA AS MATRICULA, P.NOME, C.TITULO, ' +
                '''Candidato'' AS DESCRICAO, CA.IDPESSOA, ' +
                'CA.IDCARGO, CA.SALARIO, CA.TIPOPAGAMENTO, CA.DAT_ADMIS, CA.TIPOCONTRATO ' +
                'FROM PESSOA P, CANDIDAT CA, CARGO C ' +
                'WHERE CA.IDPESSOA     = :IDPESSOA ' +
                'AND   CA.IDCARGO           = C.IDCARGO ' +
                'AND   CA.IDPESSOA          = P.IDPESSOA ');
  end;
  inherited;
end;

procedure TfrmCadRegOcorr.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
  begin
    qryDet.Close;
    qryDet.ParamByName('IdPessoa').asString := MontaSelect.ValoresChave[0];
    qryDet.Open;

    qry.Close;
    qry.ParamByName('IdPessoa').asString := MontaSelect.ValoresChave[0];
    qry.Open;
  end;
end;

procedure TfrmCadRegOcorr.sbtnFichaClick(Sender: TObject);
begin
  with TfrmParamPCMSO.Create(Application) do
  begin
    sFunc := qryDet.FieldByName('IdPessoa').asString;
    sTipoOcorr := qryDet.FieldByName('CodTipoOcMed').asString;
    sNumSeq := qryDet.FieldByName('NumSeq').asString;
    sEmpregado := iff(bEmpregado, '1', '0');
    ShowModal;
    Free;
  end;
end;

procedure TfrmCadRegOcorr.bbtnOkDetClick(Sender: TObject);
var
  ProxSeq: integer;
begin
  if (dsDet.Dataset.State = dsInsert) then
  begin
    qryUltSeq.Close;
    qryUltSeq.ParamByName('IDPESSOA').asInteger     := qryDet.FieldByName('IDPESSOA').asInteger;
    qryUltSeq.ParamByName('CODTIPOOCMED').asInteger := qryTabOcorr.FieldByName('CODTIPOOCMED').asInteger;
    qryUltSeq.Open;

    ProxSeq := qryUltSeq.FieldByName('ULTSEQ').asInteger + 1;
    qryDet.FieldByName('NUMSEQ').asInteger := ProxSeq;

    if not(qryParamRH.FieldByName('IDRUBFALTA').IsNull) and (dbedLicenca.Value > 0) then
      if (MsgDlg('Registra os Dias de Licença Como Falta ?',
                 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then
        AbrirFormModal(frmLancaFalta, TfrmLancaFalta);
  end;
  inherited;
  if (dsDet.Dataset.State = dsInsert) then
  begin
    dbedDatInicio.Text   := '';
    dtedDataRetorno.Text := '';
  end;
end;

procedure TfrmCadRegOcorr.CmeCadastroConfirma(Sender: TObject);
var
  msgDataAdm, sIdSitFunc, MascMatr, sMatric : String;
  NumMatr  : LongInt;
begin
  //inherited;
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;

  if (bCandAprovado) then
  begin
    sMatric := '';
    if (qryParamRH.FieldByName('FLGNUMERAMATRIC').asInteger = 1) then
    begin
       MascMatr := QuotedStr(replicate('0',qryParamRH.FieldByName('TAMANHOMATRIC').asInteger));
       dtmBaseDados.qry.Close;
       dtmBaseDados.qry.Sql.Clear;
       dtmBaseDados.qry.Sql.Add('SELECT TRIM(TO_CHAR(MAX(TO_NUMBER(MATRICULA))+1, ' +
                                 MascMatr + ')) AS PROXIMA FROM FUNCIONARIO');
       try
         dtmBaseDados.qry.Open;
         NumMatr := StrToInt(dtmBaseDados.qry.FieldByName('PROXIMA').asString);
         sMatric := dtmBaseDados.qry.FieldByName('PROXIMA').asString;
         dtmBaseDados.qry.Close;
       except
       end;
    end;

    dtmBaseDados.qry.Close;
    dtmBaseDados.qry.Sql.Clear;
    dtmBaseDados.qry.Sql.Add('SELECT IDSITFUNC FROM SITFUNC WHERE TIPOSIT = ''A''');
    dtmBaseDados.qry.Open;
    sIdSitFunc := dtmBaseDados.qry.FieldByName('IDSITFUNC').asString;

    dtmBaseDados.qry.Close;
    dtmBaseDados.qry.Sql.Clear;
    dtmBaseDados.qry.Sql.Add('SELECT F.IDPESSOA, S.TIPOSIT FROM FUNCIONARIO F, SITFUNC S');
    dtmBaseDados.qry.Sql.Add('WHERE F.IDPESSOA  = ' + qry.FieldByName('IDPESSOA').asString);
    dtmBaseDados.qry.Sql.Add('AND   F.IDSITFUNC = S.IDSITFUNC');
    dtmBaseDados.qry.Open;

    if ((dtmBaseDados.qry.IsEmpty) or (dtmBaseDados.qry.FieldByName('TIPOSIT').asString='D')) and
       (MsgDlg('Efetiva Candidato Como Empregado ?',
             'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then
    begin
      msgDataAdm := qry.FieldByName('DAT_ADMIS').asString;
      if msgDataAdm = '' then
         msgDataAdm := DateToStr(Date);
      if InputQuery('Data de Admissão','Confirme ou Altere :',msgDataAdm) then
      begin
        if (dtmBaseDados.qry.IsEmpty) then
        begin
          dtmBaseDados.qry.Close;
          dtmBaseDados.qry.Sql.Clear;
          dtmBaseDados.qry.Sql.Add('INSERT INTO FUNCIONARIO');
          dtmBaseDados.qry.Sql.Add('(IDPESSOA,IDEMPRESA,IDCARGO,IDSITFUNC,DATAADMISSAO,');
          dtmBaseDados.qry.Sql.Add('TIPOCONTRATO,TIPOPAGAMENTO,MATRICULA,');
          dtmBaseDados.qry.Sql.Add('SALARIOATUAL,DATAOPCAOFGTS,DATASALARIO,DATACARGO,DATALOTACAO)');
          dtmBaseDados.qry.Sql.Add('VALUES (' + qry.FieldByName('IDPESSOA').asString);
          dtmBaseDados.qry.Sql.Add(',' + IntToStr(Sistema.IdEmpresa));
          dtmBaseDados.qry.Sql.Add(',' + qry.FieldByName('IDCARGO').asString);
          dtmBaseDados.qry.Sql.Add(',' + sIdSitFunc);
          dtmBaseDados.qry.Sql.Add(',TO_DATE(' + QuotedStr(msgDataAdm) + ',''DD/MM/YYYY'')');
          dtmBaseDados.qry.Sql.Add(',' + QuotedStr(qry.FieldByName('TIPOCONTRATO').asString));
          dtmBaseDados.qry.Sql.Add(',' + QuotedStr(qry.FieldByName('TIPOPAGAMENTO').asString));
          dtmBaseDados.qry.Sql.Add(',' + QuotedStr(sMatric));
          dtmBaseDados.qry.Sql.Add(',' + FloatToStr(qry.FieldByName('SALARIO').asFloat));
          dtmBaseDados.qry.Sql.Add(',TO_DATE(' + QuotedStr(msgDataAdm) + ',''DD/MM/YYYY'')');
          dtmBaseDados.qry.Sql.Add(',TO_DATE(' + QuotedStr(msgDataAdm) + ',''DD/MM/YYYY'')');
          dtmBaseDados.qry.Sql.Add(',TO_DATE(' + QuotedStr(msgDataAdm) + ',''DD/MM/YYYY'')');
          dtmBaseDados.qry.Sql.Add(',TO_DATE(' + QuotedStr(msgDataAdm) + ',''DD/MM/YYYY''))');
        end
        else begin
          dtmBaseDados.qry.Close;
          dtmBaseDados.qry.Sql.Clear;
          dtmBaseDados.qry.Sql.Add('UPDATE FUNCIONARIO');
          dtmBaseDados.qry.Sql.Add('SET IDCARGO = ' + qry.FieldByName('IDCARGO').asString);
          dtmBaseDados.qry.Sql.Add(',IDSITFUNC = ' + sIdSitFunc);
          dtmBaseDados.qry.Sql.Add(',DAT_ADMIS = TO_DATE(' + QuotedStr(msgDataAdm) + ',''DD/MM/YYYY'')');
          dtmBaseDados.qry.Sql.Add(',TIPOCONTRATO = ' + QuotedStr(qry.FieldByName('TIPOCONTRATO').asString));
          dtmBaseDados.qry.Sql.Add(',TIPOPAGAMENTO =' + QuotedStr(qry.FieldByName('TIPOPAGAMENTO').asString));
          dtmBaseDados.qry.Sql.Add(',SALARIO = ' + FloatToStr(qry.FieldByName('SALARIO').asFloat));
          dtmBaseDados.qry.Sql.Add(',DATAOPCAOFGTS = TO_DATE(' + QuotedStr(msgDataAdm) + ',''DD/MM/YYYY'')');
          dtmBaseDados.qry.Sql.Add(',DATASALARIO = TO_DATE(' + QuotedStr(msgDataAdm) + ',''DD/MM/YYYY'')');
          dtmBaseDados.qry.Sql.Add(',DATACARGO   = TO_DATE(' + QuotedStr(msgDataAdm) + ',''DD/MM/YYYY'')');
          dtmBaseDados.qry.Sql.Add(',DATALOTACAO = TO_DATE(' + QuotedStr(msgDataAdm) + ',''DD/MM/YYYY'')');
          dtmBaseDados.qry.Sql.Add('WHERE IDPESSOA = ' + qry.FieldByName('IDPESSOA').asString);
        end;
        try
          dtmBaseDados.qry.ExecSQL;
          dtmBaseDados.qry.Close;
          dtmBaseDados.qry.Sql.Clear;
          dtmBaseDados.qry.Sql.Add('DELETE REQUICAND');
          dtmBaseDados.qry.Sql.Add('WHERE IDPESSOA = ' + qry.FieldByName('IDPESSOA').asString);
          dtmBaseDados.qry.ExecSQL;
          dtmBaseDados.qry.Close;
          dtmBaseDados.qry.Sql.Clear;
          dtmBaseDados.qry.Sql.Add('DELETE CANDIDAT');
          dtmBaseDados.qry.Sql.Add('WHERE IDPESSOA = ' + qry.FieldByName('IDPESSOA').asString);
          dtmBaseDados.qry.ExecSQL;
          MsgDlg('Dados do Empregado Criados ou Atualizados. ' +
                 'Complemente-os no Módulo Apropriado !', 'Aviso',
                  mtInformation, [mbOk,mbHelp], 0);
        except
          MsgDlg('Não Foi Possível Criar ou Atualizar Dados do Empregado', 'Aviso',
                  mtInformation, [mbOk,mbHelp], 0);
        end;
      end;
    end;
    dtmBaseDados.qry.Close;
  end;
end;

procedure TfrmCadRegOcorr.bbtnProcMedicoClick(Sender: TObject);
begin
  inherited;
  if (frmProcuraPessoaDoc.ShowModal = mrOk) and (qryDet.State in [dsInsert,dsEdit]) then
  begin
     qryDet.FieldByName('IDEXAMINADOR').AsString := frmProcuraPessoaDoc.sIDPessoa;
     dbedAvaliador.Text := frmProcuraPessoaDoc.sNomePessoa;
  end;

end;

procedure TfrmCadRegOcorr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(frmProcuraPessoaDoc) then
    frmProcuraPessoaDoc.Free;
  inherited;

end;

procedure TfrmCadRegOcorr.CmeDetalheConfirma(Sender: TObject);
begin
  inherited;
  if (MontaSelect = MontaSelectCand) and
     (qryTabOcorr.FieldByName('AVALMIN').asInteger > 0) and
     (qryTabOcorr.FieldByName('AVALMIN').asInteger <=
      qryDet.FieldByName('AVALIACAO').AsInteger) then
      bCandAprovado := True;
end;

procedure TfrmCadRegOcorr.bbtnBuscaCIDClick(Sender: TObject);
begin
  inherited;
  MontaSelectCID.Executar;
  if (MontaSelectCID.ValoresChave.Count > 0) and (MontaSelectCID.ValoresChave[0] <> '') then
  begin
     dbedCODCID.Text := MontaSelectCID.ValoresChave[0];
     edCID.Text      := MontaSelectCID.ValoresChave[1];
  end;
end;

procedure TfrmCadRegOcorr.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnProcurarCand.Enabled  :=  sbtnProcurar.Enabled;
end;

procedure TfrmCadRegOcorr.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  sbtnFicha.Enabled := not(qryDet.IsEmpty);
  sbtnCAT.Enabled := not(qryDet.IsEmpty) and (bEmpregado) and
    not(qryDet.FieldByName('DATAREAL').isNull);
end;

procedure TfrmCadRegOcorr.sbtnCATClick(Sender: TObject);
var
  frm: TfrmParamRelCAT;
begin
  inherited;
  frm := TfrmParamRelCAT.Create(Application);
  frm.sFunc         := qryDet.FieldByName('IdPessoa').asString;
  frm.sData         := qryDet.FieldByName('DataReal').asString;
  frm.sUnidade      := dbedAvaliador.Text;
  frm.dDias         := dbedLicenca.Value;
  frm.sDiagnostico  := edCID.Text;
  frm.sCID          := dbedCODCID.Text;
  frm.sObserv       := dbmObser.Text;
  frm.sTipoOcorr    := qryDet.FieldByName('CodTipoOcMed').asString;
  frm.sNumSeq       := qryDet.FieldByName('NumSeq').asString;
  frm.ShowModal;
  frm.Free;
end;

end.
