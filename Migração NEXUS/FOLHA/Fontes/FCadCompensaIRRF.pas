// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Alteração  : Form
//Nº SIG.....: 87047
//Data.......: 31/05/2019
//Responsável: Andre Imakawa
//Descrição..: Limitar os campos Nome Vara e Nº Processo para tamanho 20.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 08/06/2006
// Rotina      : Form
// Pendência   : 20652
// Descricao   : Cadastrar indice para atualizar valor a compensar.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 31/03/2006
// Rotina      : bbtnConfirmarClick 
// Pendência   : 20651
// Descricao   : Tirar obrigatoriedade da informar a data final
//------------------------------------------------------------------------------
unit FCadCompensaIRRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, TREdit, ExtCtrls, Mask, DBCtrls, Spin, Db,
  DBTables, Wwquery, CmEventosCadastro, ImgList, MontaSelect, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  uMensErro, dBaseDados, uAdmPrevFB, uDataBase, wwdblook;

type
  TFrmCadCompensaIRRF = class(TfrmCadastroCS)
    pnlCompensacao: TPanel;
    lbNome: TLabel;
    dbedNome: TDBEdit;
    lbMatricula: TLabel;
    dbedMatricula: TDBEdit;
    lbCpf: TLabel;
    dbedCPF: TDBEdit;
    lbSitNaFund: TLabel;
    edSitNaFund: TEdit;
    MS1: TMontaSelect;
    qryAux: TwwQuery;
    qryCompensaIR: TwwQuery;
    pnlCompensaIR: TPanel;
    grbValores: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    redCompTotal: TRealEdit;
    redsaldo: TRealEdit;
    pnlsaldo: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    edtcodvaracomp: TEdit;
    edtNomeVaracomp: TEdit;
    GroupBox5: TGroupBox;
    edtNumproccomp: TEdit;
    gbAnoMesFinal: TGroupBox;
    lbAnoFim: TLabel;
    lbMesFim: TLabel;
    cbMesFim: TComboBox;
    speAnoFinal: TSpinEdit;
    gbAnoMesInicio: TGroupBox;
    lbAnoInicio: TLabel;
    lbMesInicio: TLabel;
    cbMesInicio: TComboBox;
    speAnoInicio: TSpinEdit;
    Bevel1: TBevel;
    qryUpd: TwwQuery;
    GroupBox2: TGroupBox;
    lblIndice: TLabel;
    lblUltMesAtualiza: TLabel;
    qryMoeda: TwwQuery;
    dblkcmbIndiceAtualiza: TwwDBLookupCombo;
    dsCompensaIR: TwwDataSource;
    dbtUltMesAtualiza: TDBEdit;
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryCompensaIRAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkcmbIndiceAtualizaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    GuardaIdPessoa,
    iIdComp          : Integer;
    Year, Month, Day : Word;
    procedure LimpaCampos;
    procedure AtualizaTela;
  public
    { Public declarations }
  end;

var
  FrmCadCompensaIRRF: TFrmCadCompensaIRRF;

implementation

{$R *.DFM}

procedure TFrmCadCompensaIRRF.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
  Begin
    qry.Close;
    qry.ParamByName('IDPESSOA').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qry.Open;

    GuardaIdPessoa := StrToInt(MontaSelect.ValoresChave[0]);

    qryCompensaIR.Close;
    qryCompensaIR.ParamByName('IDPESSOA').AsInteger:= GuardaIdPessoa;
    qryCompensaIR.Open;

    if not qryCompensaIR.fieldbyname('INDICE').isnull then                              
    begin
      if qryMoeda.locate('MOECODIGO',
            qryCompensaIR.fieldbyname('INDICE').asinteger, []) then
        dblkcmbIndiceAtualiza.text:=qryMoeda.fieldbyname('MOEDESC').asstring;
    end;
  end
  Else
    LimpaCampos;
end;

procedure TFrmCadCompensaIRRF.sbtnInserirClick(Sender: TObject);
begin
  MS1.Executar;
  If (MS1.ValoresChave.Count > 0) And (MS1.ValoresChave[0] <> '') Then
  Begin
    qry.Close;
    qry.ParamByName('IDPESSOA').Value := StrToInt(MS1.ValoresChave[0]);
    qry.Open;
    inherited;
    qry.Close;
    qry.ParamByName('IDPESSOA').Value := StrToInt(MS1.ValoresChave[0]);
    qry.Open;

    pnlCompensaIR.Enabled := True;
    cbMesInicio.setfocus; 
    GuardaIdPessoa        := StrToInt(MS1.ValoresChave[0]);
  end
  Else
    LimpaCampos;
end;

procedure TFrmCadCompensaIRRF.bbtnConfirmarClick(Sender: TObject);
Var
  sSql,
  sMesInicio,
  sMesFim      : String;
begin
  { Não executar o inserir novamente após a confirmação }
  CmeCadastro.RepetirInsert := False;

  { Cria o objeto query }
  qryUpd.Close;
  qryUpd.Sql.Clear;

  { Testa o preenchimento do campo Mês de Início }
  If cbMesInicio.Text = '' Then
  Begin
    MsgDlg('Mês do início da compensação é de preenchimento obrigatório.', 'Informação', mtInformation, [mbOK], 0);
    cbMesInicio.SetFocus;
    Exit;
  End;

  { Testa o preenchimento do campo Ano de Início }
  If speAnoInicio.Value <= 0 Then
  Begin
    MsgDlg('Escolha o ano do início da compensação.', 'Informação', mtInformation, [mbOK], 0);
    speAnoInicio.SetFocus;
    Exit;
  End;

  If cbMesInicio.ItemIndex <= 8 Then
    sMesInicio := '0'+IntToStr(cbMesInicio.ItemIndex + 1)
  Else
    sMesInicio := IntToStr(cbMesInicio.ItemIndex + 1);
  sMesInicio := IntToStr(speAnoInicio.Value)+'/'+sMesInicio;

  { Testa o preenchimento do campo Mês Final }
  If (trim(cbMesFim.Text) <> '') or (speAnoFinal.Value > 0) Then
  begin
    If cbMesFim.Text = '' Then
    Begin
      MsgDlg('Mês do final da compensação deve ser preenchimento.', 'Informação', mtInformation, [mbOK], 0);
      cbMesFim.SetFocus;
      Exit;
    End;

    { Testa o preenchimento do campo Ano Final }
    If speAnoFinal.Value <= 0 Then
    Begin
      MsgDlg('Ano do final da compensação deve ser preenchimento.', 'Informação', mtInformation, [mbOK], 0);
      speAnoFinal.SetFocus;
      Exit;
    end;

    If cbMesFim.ItemIndex <= 8 Then
      sMesFim := '0'+IntToStr(cbMesFim.ItemIndex + 1)
    Else
      sMesFim := IntToStr(cbMesFim.ItemIndex + 1);
    sMesFim    := IntToStr(speAnoFinal.Value)+'/'+sMesFim;
  End
  else
    sMesFim:='';

  { Testa o preenchimento do campo valor a compensar }
  If redCompTotal.Value <= 0 Then
  Begin
    MsgDlg('Valor de Total a Compensar inválido.', 'Informação', mtInformation, [mbOK], 0);
    redCompTotal.SetFocus;
    Exit;
  End;

  If Not dtmBaseDados.dbBaseDados.InTransaction then
   dtmBaseDados.dbBaseDados.StartTransaction;

  sSql := ' SELECT IDPESSOA, IDCOMPIRRF FROM COMPENSAIRRF WHERE IDPESSOA = '+IntToStr(GuardaIdPessoa);

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(sSql);
  qryAux.Open;

  If Not qryAux.IsEmpty Then
  Begin
    ssql:=
      ' UPDATE COMPENSAIRRF SET '+
      ' COMPTOTAL      = '+ Oranumero(FloatToStr(redCompTotal.Value)) + ',' +
      ' ANOMESINICIO   = '+ QuotedStr(sMesInicio)                     + ',' ;

    if sMesFim <> '' then
      ssql:=ssql+
        ' ANOMESFIM      = '+ QuotedStr(sMesFim) + ','
    else
      ssql:=ssql+
        ' ANOMESFIM      = NULL, ';

    if dblkcmbIndiceAtualiza.text <> '' then
      ssql:=ssql+
        ' INDICE = '+qryMoeda.fieldbyname('MOECODIGO').asstring+','
    else
      ssql:=ssql+
        ' INDICE = NULL,';

    ssql:=ssql+
      ' NUMEROPROCESSO = '+ QuotedStr(edtNumproccomp.text)            + ',' +
      ' CODVARA        = '+ QuotedStr(edtcodvaracomp.text)            + ',' +
      ' NOMEVARA       = '+ QuotedStr(edtNomeVaracomp.text)           +
      ' WHERE '+
      ' IDCOMPIRRF     = '+ qryAux.FieldByName('IDCOMPIRRF').AsString +
      ' AND IDPESSOA   = '+ qryAux.FieldByName('IDPESSOA').AsString;
    try
      qryUpd.Sql.Add(ssql); 
      qryUpd.ExecSql;
      dtmBaseDados.dbBaseDados.Commit;
    except
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('Erro ao alterar compensação. ','Erro',mtError,[mbOk,mbHelp],0);
    end;
  End
  Else
  Begin
    iIdComp := LeUltRegistro(Nil,'COMPENSAIRRF');

    ssql:=
      'INSERT INTO COMPENSAIRRF (IDCOMPIRRF,'+
      'IDPESSOA,SALDOCOMP,COMPTOTAL,ANOMESINICIO,ANOMESFIM, '+
      'INDICE, ULTMESATUALIZA,'+ 
      'NUMEROPROCESSO,CODVARA,NOMEVARA) '+
      'VALUES ('+  IntToStr(iIdComp)        + ',' +
                   IntToStr(GuardaIdPessoa) + ',' +
                   '0,' + Oranumero(FloatToStr(redCompTotal.Value)) + ',' +
                   QuotedStr(sMesInicio)          + ',';

    if sMesFim <> '' then
      ssql:=ssql+
        QuotedStr(sMesFim) + ','
    else
      ssql:=ssql+
        'NULL, ';

    if dblkcmbIndiceAtualiza.text <> '' then
      ssql:=ssql+
        qryMoeda.fieldbyname('MOECODIGO').asstring+',NULL,'
    else
      ssql:=ssql+
        'NULL,NULL,';

    ssql:=ssql+
      QuotedStr(edtNumproccomp.Text) + ',' +
      QuotedStr(edtcodvaracomp.Text) + ',' +
      QuotedStr(edtNomeVaracomp.Text)+ ')';

    try
      qryUpd.Sql.Add(ssql); 
      qryUpd.ExecSql;
      dtmBaseDados.dbBaseDados.Commit;
    except
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('Erro ao inserir compensação. ','Erro',mtError,[mbOk,mbHelp],0);
    end;
  End;
  AtualizaTela;
  LimpaCampos; 
end;

procedure TFrmCadCompensaIRRF.qryCompensaIRAfterOpen(DataSet: TDataSet);
begin
  inherited;
  With qryCompensaIR Do
  Begin
    If Not IsEmpty Then
    Begin
      cbMesInicio.ItemIndex := (StrToIntDef(Copy(FieldByName('ANOMESINICIO').AsString,6,2), -1)-1);
      speAnoInicio.Text     := Copy(FieldByName('ANOMESINICIO').AsString,1,4);
      if qryCompensaIR.FieldByName('ANOMESFIM').AsString <> '' then 
      begin
        cbMesFim.ItemIndex:=(StrToIntDef(Copy(qryCompensaIR.FieldByName('ANOMESFIM').AsString,6,2), -1)-1);
        speAnoFinal.Text:=Copy(qryCompensaIR.FieldByName('ANOMESFIM').AsString,1,4);
      end
      else
      begin
        cbMesFim.ItemIndex:=-1;
        speAnoFinal.Text:='';
      end;

      redCompTotal.Text     := FormatFloat('#,##0.00',FieldByName('COMPTOTAL').AsFloat);
      redSaldo.Text         := FormatFloat('#,##0.00',FieldByName('SALDOCOMP').AsFloat);
      edtNumproccomp.text   := Fieldbyname('NUMEROPROCESSO').asString;
      edtcodvaracomp.text   := Fieldbyname('CODVARA').asstring;
      edtNomeVaracomp.text  := Fieldbyname('NOMEVARA').asstring;
      pnlsaldo.caption      := FormatFloat('#,##0.00',(FieldByName('COMPTOTAL').AsFloat-FieldByName('SALDOCOMP').AsFloat));
      cbMesInicio.update;
    End
    Else
    Begin
      cbMesInicio.ItemIndex := -1;
      speAnoInicio.Text     := '';
      cbMesFim.ItemIndex    := -1;
      speAnoFinal.Text      := '';
      redCompTotal.Value    := 0;
      redSaldo.Value        := 0;
      pnlsaldo.caption      := '0';
      edtNumproccomp.text   := '';
      edtcodvaracomp.text   := '';
      edtNomeVaracomp.text  := '';
    End;
  End;
end;

procedure TFrmCadCompensaIRRF.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(Now, Year, Month, Day);
  speAnoInicio.Value      := Year;
  speAnoFinal.Value       := Year;
  cbMesInicio.ItemIndex   := Month - 1;
  cbMesFim.ItemIndex      := Month - 1;
end;

procedure TFrmCadCompensaIRRF.LimpaCampos;
begin
  speAnoInicio.Value      := Year;
  speAnoFinal.Value       := Year;
  cbMesInicio.ItemIndex   := Month - 1;
  cbMesFim.ItemIndex      := Month - 1;
  redCompTotal.Value      := 0.00;
  redsaldo.Value          := 0.00;
  pnlSaldo.Caption        := '0,00';
  edtcodvaracomp.Clear;
  edtNomeVaracomp.Clear;
  edtNumproccomp.Clear;
  dblkcmbIndiceAtualiza.clear;
  dbtUltMesAtualiza.clear;
end;

procedure TFrmCadCompensaIRRF.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  AtualizaTela;
  LimpaCampos;
end;

procedure TFrmCadCompensaIRRF.sbtnApagarClick(Sender: TObject);
Var
  sSql : String;

begin
  If MsgDlg('Deseja realmente excluir o registro?', 'Informação', mtInformation, [mbYes, mbNo], 0) = MrYes Then
  Begin
    sSql := 'DELETE COMPENSAIRRF WHERE IDCOMPIRRF = '+ qryCompensaIR.FieldByName('IDCOMPIRRF').AsString;
    qryUpd.Close;
    qryUpd.Sql.Clear;
    qryUpd.Sql.Add(sSql);
    If not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

    Try
      qryUpd.ExecSql;
      dtmBaseDados.dbBaseDados.Commit;
    Except
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('Erro ao excluir compensação. ','Erro',mtError,[mbOk,mbHelp],0);
    End;
  End;
  AtualizaTela;
  LimpaCampos; 
end;

procedure TFrmCadCompensaIRRF.AtualizaTela;
begin
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
  sbtnInserir.Down      := False;
  sbtnAlterar.Down      := False;
  sbtnApagar.Down       := False;
  sbtnInserir.Enabled   := True;
  sbtnAlterar.Enabled   := False;
  sbtnApagar.Enabled    := False;
  sbtnProcurar.Enabled  := True;
  qry.Close;
end;

procedure TFrmCadCompensaIRRF.FormCreate(Sender: TObject);
begin
  inherited;
  qryMoeda.open; 
end;

procedure TFrmCadCompensaIRRF.dblkcmbIndiceAtualizaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  dblkcmbIndiceAtualiza.text:=qryMoeda.fieldbyname('MOEDESC').asstring; 
end;

end.
