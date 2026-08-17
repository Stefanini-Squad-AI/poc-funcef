unit FCadHstCompensaIR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, DBCtrls, wwdblook;

type
  TFrmCadHstCompensaIR = class(TfrmCadMestreDetalheCS)
    lbNome: TLabel;
    lbMatricula: TLabel;
    lbCPF: TLabel;
    lbSitNaFund: TLabel;
    edSitNaFund: TEdit;
    dbedNome: TDBEdit;
    dbedMatric: TDBEdit;
    dbedCPF: TDBEdit;
    qryPart: TwwQuery;
    dsPart: TwwDataSource;
    gbAnoMesInicio: TGroupBox;
    edAnoInicio: TEdit;
    edMesInicio: TEdit;
    lbAnoInicio: TLabel;
    lbMesInicio: TLabel;
    lbBarraAnoMesInicio: TLabel;
    gbAnoMesFinal: TGroupBox;
    edAnoFim: TEdit;
    lbBarraAnoMesFim: TLabel;
    edMesFim: TEdit;
    lbAnoFim: TLabel;
    lbMesFim: TLabel;
    lbCompTotal: TLabel;
    lbSaldo: TLabel;
    gbAnoMesDesc: TGroupBox;
    lbAnoDesc: TLabel;
    edAnoDesc: TEdit;
    lbBarraDesc: TLabel;
    edMesDesc: TEdit;
    lbMesDesc: TLabel;
    qryHistorico: TwwQuery;
    gbVersao: TGroupBox;
    dblkVersao: TwwDBLookupCombo;
    lbValComp: TLabel;
    lbValDevidoMes: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryAux: TwwQuery;
    qryAuxDet: TwwQuery;
    edCompTotal: TDBEdit;
    edSaldo: TDBEdit;
    edValComp: TDBEdit;
    edValDevido: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    GuardaIdPessoa, GuardaIdCompIRRF, GuardaIdHstComp : Integer;
    sTipo          : String;

  end;

var
  FrmCadHstCompensaIR: TFrmCadHstCompensaIR;

implementation

Uses uDataBase, uMensErro;


{$R *.DFM}

procedure TFrmCadHstCompensaIR.FormShow(Sender: TObject);
begin
  inherited;
  sbtnInserir.Enabled := False;
  sbtnAlterar.Enabled := False;
  sbtnApagar.Enabled  := False;
end;

procedure TFrmCadHstCompensaIR.CmeCadastroFind(Sender: TObject);
Var
  lAchou : boolean;

begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    GuardaIdPessoa                            := StrToInt(MontaSelect.ValoresChave[0]);

    // Verificar se a pessoa é ATIVO, ASSISTIDO OU BENEFICIARIO
    With qryAux Do
    Begin
      // ASSISTIDO OU ATIVO (PARTICIPANTE)
      Close;
      SQL.Clear;
      SQL.Add(' SELECT PP.IDPESSOA , SP.FLGINTERNO '+
              ' FROM PARTPREVPLAN PP, SITPART SP   '+
              ' WHERE PP.IDPESSOA =                '+ MontaSelect.ValoresChave[0] + ' AND '+
              ' PP.IDSITPART = SP.IDSITPART        ');
      Open;
      If Not IsEmpty Then
      Begin
        If FieldByName('FLGINTERNO').AsString = 'AS' Then
        Begin
          lAchou := True;
          sTipo  := 'Assistido'
        End
        Else
          If FieldByName('FLGINTERNO').AsString = 'AT' Then
          Begin
            lAchou := True;
            sTipo  := 'Participante'
          End;
      End
      Else
      Begin
        // BENEFICIARIO
        Close;
        SQL.Clear;
        SQL.Add(' SELECT IDRESPONSAVEL  FROM BFCIARIOTITPLAN WHERE IDPESSOA = '+MontaSelect.ValoresChave[0]);
        Open;
        If Not IsEmpty Then
        Begin
          lAchou := True;
          sTipo  := 'Beneficiario';
        End;
      End;
    End; // with
    If lAchou Then
    Begin
      edSitNaFund.Text := sTipo;
      qryPart.Close;
      qryPart.ParamByName('IDPESSOA').AsInteger := GuardaIdPessoa;
      qryPart.Open;
    End;

    FazQuery(qryAux,
       ' SELECT * FROM CM.COMPENSAIRRF WHERE '+
       ' (IDPESSOA = '+IntToStr(GuardaIdPessoa)+')');

    If not qryAux.IsEmpty Then
    Begin
      qry.Close;
      qry.ParamByName('IDPESSOA').AsInteger := GuardaIdPessoa;
      qry.Open;

      GuardaIdCompIRRF := qry.FieldByName('IDCOMPIRRF').AsInteger;

      qryDet.Close;
      qryDet.ParamByName('IDPESSOA').AsInteger      := GuardaIdPessoa;
      qryDet.Open;

      edAnoInicio.Text := Copy(qry.FieldByName('ANOMESINICIO').AsString,1,4);
      edMesInicio.Text := Copy(qry.FieldByName('ANOMESINICIO').AsString,6,2);

      edAnoFim.Text    := Copy(qry.FieldByName('ANOMESFIM').AsString,1,4);
      edMesFim.Text    := Copy(qry.FieldByName('ANOMESFIM').AsString,6,2);


    End
    Else
    Begin
      qry.Close;
      qry.ParamByName('IDPESSOA').AsInteger := GuardaIdPessoa;
      qry.Open;
      qryDet.Close;
      edAnoInicio.Clear;
      edMesInicio.Clear;
      edAnoFim.Clear;
      edMesFim.Clear;
    End;

  End;
end;

procedure TFrmCadHstCompensaIR.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  FazQuery(qryAux,
     ' SELECT * FROM CM.COMPENSAIRRF WHERE '+
     ' (IDPESSOA = '+IntToStr(GuardaIdPessoa)+')');

  If qryAux.IsEmpty Then
  Begin
    sbtnAlterar.Enabled := False;
    sbtnApagar.Enabled  := False;
    sbtnInserir.Enabled := True;
  End
  Else
  Begin
    sbtnInserir.Enabled := False;
    sbtnApagar.Enabled  := True;
    sbtnAlterar.Enabled := True;
  End;
end;

procedure TFrmCadHstCompensaIR.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('IDCOMPIRRF').AsInteger  := GuardaIdCompIRRF;
  qry.FieldByName('IDPESSOA').AsInteger    := GuardaIdPessoa;
  qry.FieldByName('ANOMESINICIO').AsString := edAnoInicio.Text+'/'+edMesInicio.Text;
  qry.FieldByName('ANOMESFIM').AsString    := edAnoFim.Text+'/'+edMesFim.Text;
end;

procedure TFrmCadHstCompensaIR.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  edAnoInicio.SetFocus;
  GuardaIdCompIRRF := LeUltRegistro(Nil,'COMPENSAIRRF');
  qryDet.Close;
  qryDet.ParamByName('IDPESSOA').AsInteger      := GuardaIdPessoa;
  qryDet.Open;
end;

procedure TFrmCadHstCompensaIR.bbtnConfirmarClick(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  qry.ApplyUpdates;
  inherited;
end;

procedure TFrmCadHstCompensaIR.CmeCadastroDelete(Sender: TObject);
begin
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE COMPENSAIRRF '+
                 ' WHERE IDPESSOA = '+IntToStr(GuardaIdPessoa));

  qryAuxDet.SQL.Clear;
  qryAuxDet.SQL.Add(' DELETE HSTCOMPENSAIRRF WHERE IDPESSOA = '+IntToStr(GuardaIdPessoa));
  Try
    qryAux.ExecSQL;
    qryAuxDet.ExecSQL;
  Except
    MsgDlg('Ocorreu um Erro Durante a Exclusão!!!',
            'Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  End;
  qryDet.Close;
  edAnoInicio.Clear;
  edMesInicio.Clear;
  edAnoFim.Clear;
  edMesFim.Clear;
  edCompTotal.Clear;
  edSaldo.Clear;
  dbedNome.Clear;
  dbedMatric.Clear;
  dbedCPF.clear;
  edSitNaFund.clear;
 // inherited;
end;

procedure TFrmCadHstCompensaIR.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  GuardaIdHstComp := LeUltRegistro(Nil, 'HSTCOMPENSAIRRF');
  qryHistorico.Open;
end;

procedure TFrmCadHstCompensaIR.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('IDHSTCOMPIRRF').AsInteger   := GuardaIdHstComp;
  qryDet.FieldByName('IDPESSOA').AsInteger        := GuardaIdPessoa;
  qryDet.FieldByName('MESREF').AsString           := edAnoDesc.Text+'/'+edMesDesc.Text;
  qryDet.FieldByName('IDHSTFOLHABENEF').AsInteger := StrToInt(dblkVersao.LookUpValue);
end;

procedure TFrmCadHstCompensaIR.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  edAnoDesc.Text         := Copy(qryDet.FieldByName('MESREF').AsString,1,4);
  edMesDesc.Text         := Copy(qryDet.FieldByName('MESREF').AsString,6,2);
  qryHistorico.Open;
  dblkVersao.LookUpValue := qryDet.FieldByName('IDHSTFOLHABENEF').AsString;
end;

procedure TFrmCadHstCompensaIR.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  qryDet.Close;
  qryDet.ParamByName('IDPESSOA').AsInteger := GuardaIdPessoa;
  qryDet.Open;
end;

procedure TFrmCadHstCompensaIR.bbtnOkDetClick(Sender: TObject);
begin
  CmeDetalhe.RepetirInsert := False;
  qryDet.ApplyUpdates;
  inherited;
  qryDet.Close;
  qryDet.ParamByName('IDPESSOA').AsInteger := GuardaIdPessoa;
  qryDet.Open;
  bbtnVoltarDetClick(Self);
end;

end.

{==============================================================================|
| UNIT: FCADHSTCOMPENSAIR                                                      |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   TELA DE CADASTRO DE COMPENSAÇÃO DE IRRF.                                   |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

