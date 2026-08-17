unit FRecebimentoAssistencial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, StdCtrls, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmRecebimentoAssistencial = class(TfrmOkCancelar)
    qryPatro: TwwQuery;
    grbArq_Recebido: TGroupBox;
    BevelArqRecebido: TBevel;
    lblNomeArq_Recebido: TLabel;
    sbtnOrigem: TSpeedButton;
    pnlOpcoes: TPanel;
    grbMesAno: TGroupBox;
    grbPatro: TGroupBox;
    dblkPatro: TwwDBLookupCombo;
    bbtnVerificaArq_Recebido: TBitBtn;
    OpenDlg: TOpenDialog;
    qryAux: TwwQuery;
    dtpDtReceb: TCMDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnOrigemClick(Sender: TObject);
    procedure bbtnVerificaArq_RecebidoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Processa_Verificacao(Caminho, sNomeArqErro : String; bProcessa: Boolean);
    procedure Processa_Recebimento(pIdContrib, pIdPessoa, pIdPatro : Integer; sMesRef : String; rVlrArq : Double);
    function Busca_Critica_Matricula(sMatric, sIdPatro : String; Var pIdPessoa : Integer; pReg : Integer): Boolean;
    function Busca_Critica_Rubrica(sCodRubExt, sIdPatro : String; Var pCodRubInt : Integer; pReg :Integer): Boolean;
    function Busca_Critica_Contrib(pIdProvento, pIdPatro : Integer; Var pIdContrib : Integer; pReg : Integer) : Boolean;
    function Busca_Critica_Historico(Var pIdContrib: Integer; pIdPessoa, pIdPatro : Integer; psMesCob : String; pReg : Integer): Boolean;
  public
    { Public declarations }
  end;

var
  FrmRecebimentoAssistencial: TFrmRecebimentoAssistencial;
  wAno, wMes, wDia          : Word;
  ListaArq_Recebido,
  ListaArq_Resultado        : TStringList;
  sMesEsc                   : String;

implementation

Uses
  uMensErro, fAguarde, uFuncoesUteis;

{$R *.DFM}

procedure TFrmRecebimentoAssistencial.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  dtpDtReceb.Text  := DateTimeToStr(Date);
  qryPatro.Open;
end;

procedure TFrmRecebimentoAssistencial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatro.Close;
end;

procedure TFrmRecebimentoAssistencial.sbtnOrigemClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute then
    lblNomeArq_Recebido.Caption := OpenDlg.FileName;
end;

procedure TFrmRecebimentoAssistencial.bbtnVerificaArq_RecebidoClick(
  Sender: TObject);
Var
  sUltCaracter, sArqResult : String;

begin
  inherited;
  If dblkPatro.Text = '' Then
  Begin
    MsgDlg('É obrigatória a escolha da patrocinadora.', 'Informação', mtInformation, [mbOK], 0);
    Exit;
  End;
  sUltCaracter := Copy(lblNomeArq_Recebido.Caption, length(lblNomeArq_Recebido.Caption), 1);
  If sUltCaracter = '\' Then
  Begin
    MsgDlg('Indique o nome do arquivo a ser recebido.', 'Informação', mtInformation, [mbOK], 0);
    Exit;
  End;
  Processa_Verificacao(OpenDlg.FileName, Copy(OpenDlg.FileName, 1, Length(OpenDlg.FileName) - 4) + '.verifica.txt', False);
end;

procedure TFrmRecebimentoAssistencial.Processa_Verificacao(Caminho, sNomeArqErro : String; bProcessa: Boolean);
Var
  I, iIdPessoa, iIdProvento, iIdContrib : Integer;
  rValorArquivo : Double;
  sValor        : String;

begin
  ListaArq_Recebido   := TStringList.Create;
  ListaArq_Resultado  := TStringList.Create;
  ListaArq_Recebido.LoadFromFile(Caminho);
  ListaArq_Resultado.Clear;

  If bProcessa Then
    frmAguarde.Mostra('Aguarde por favor. Processando. ')
  Else
    frmAguarde.Mostra('Aguarde por favor. Verificando. ');

  frmAguarde.Repaint;
  For I := 0 to ListaArq_Recebido.Count - 1 Do
  Begin
    //Busca a matrícula do participante na patro selecionada
    If Not Busca_Critica_Matricula(Copy(ListaArq_Recebido[I], 1, 10), dblkPatro.LookupValue, iIdPessoa, I) Then
      Continue;

    //Busca a rubrica do arquivo na tabela RubricaxPess para Patro selecionada
    If Not Busca_Critica_Rubrica(Copy(ListaArq_Recebido[I], 12, 5), dblkPatro.LookupValue, iIdProvento, I) Then
      Continue;

    //Busca a contribuição
    If Not Busca_Critica_Contrib(iIdProvento, StrToInt(dblkPatro.LookupValue), iIdContrib, I) Then
      Continue;

    //Busca histórico no mês em que está no arquivo
    If Not Busca_Critica_Historico(iIdContrib, iIdPessoa, StrToInt(dblkPatro.LookupValue), Copy(ListaArq_Recebido[I], 17, 4)+'/'+Copy(ListaArq_Recebido[I], 21, 2), I) Then
      Continue;

    If Length(Copy(ListaArq_Recebido[I], 23, Length(ListaArq_Recebido[I]))) <> 10 Then
    Begin
      ListaArq_Resultado.Add(ListaArq_Recebido[I]+' Valor inválido.');
      Continue;
    End
    Else
    Begin
      sValor        := Copy(ListaArq_Recebido[I], 23, 8);
      sValor        := sValor + ',' + Copy(ListaArq_Recebido[I], Length(ListaArq_Recebido[I])-1, Length(ListaArq_Recebido[I]));
      rValorArquivo := StrToFloat(sValor);
    End;

    If bProcessa Then
      Processa_Recebimento(iIdContrib, iIdPessoa, StrToInt(dblkPatro.LookupValue), Copy(ListaArq_Recebido[I], 17, 4)+'/'+Copy(ListaArq_Recebido[I], 21, 2) , rValorArquivo);
  End;
  frmAguarde.Apaga;

  If bProcessa Then
  Begin
    bbtnConfirmar.Enabled            := False;
    bbtnVerificaArq_Recebido.Enabled := False;
    bbtnCancelar.Enabled             := False;
  End;

  If ListaArq_Resultado.Count > 0 Then
  Begin
    ListaArq_Resultado.SaveToFile(sNomeArqErro);
    If bProcessa Then
      MsgDlg('Processamento terminado. Verifique o arquivo gerado. ', 'Informação', mtInformation, [mbOk], 0)
    Else
      MsgDlg('Verificação terminada. Verifique o arquivo gerado. ', 'Informação', mtInformation, [mbOk], 0);
  End
  Else
  Begin
    If bProcessa Then
      MsgDlg('Processamento terminado. ', 'Informação', mtInformation, [mbOk], 0)
    Else
      MsgDlg('Verificação terminada. ', 'Informação', mtInformation, [mbOk], 0);
  End;

  ListaArq_Recebido.Free;
  ListaArq_Resultado.Free;
end;

function TFrmRecebimentoAssistencial.Busca_Critica_Matricula(sMatric, sIdPatro : String; Var pIdPessoa : Integer; pReg : Integer): Boolean;
begin
  Result := False;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add('SELECT * FROM ELEGPATRO WHERE MATRICULA = '+QuotedStr(sMatric)+
                 ' AND IDPESSJUR =  '+sIdPatro);
  qryAux.Open;

  If Not qryAux.IsEmpty Then
  Begin
    If qryAux.RecordCount > 1 Then
    Begin
      ListaArq_Resultado.Add(ListaArq_Recebido[pReg]+' Matrícula com mais de dois registros no banco para essa patrocinadora.');
      Result := False;
      Exit;
    End;
  End
  Else
  Begin
    ListaArq_Resultado.Add(ListaArq_Recebido[pReg]+' Matrícula inexistente.');
    Result := False;
    Exit;
  End;
  pIdPessoa := qryAux.FieldByName('IDPESSOA').AsInteger;
  Result    := True;
end;

function TFrmRecebimentoAssistencial.Busca_Critica_Rubrica(sCodRubExt, sIdPatro : String; Var pCodRubInt : Integer; pReg :Integer): Boolean;
begin
  Result := False;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add('SELECT * FROM RUBRICAXPESS WHERE CODPROVDESC = '+QuotedStr(sCodRubExt)+
                 ' AND IDPESSOA = '+sIdPatro);
  qryAux.Open;

  If qryAux.IsEmpty Then
  Begin
    ListaArq_Resultado.Add(ListaArq_Recebido[pReg]+' Rubrica inexistente.');
    Result := False;
    Exit;
  End;
  pCodRubInt := qryAux.FieldByName('IDRUBRICA').AsInteger;
  Result     := True;
end;

function TFrmRecebimentoAssistencial.Busca_Critica_Contrib(pIdProvento,
  pIdPatro: Integer; Var pIdContrib : Integer; pReg : Integer): Boolean;
begin
  Result := False;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add('SELECT * FROM CONTRIBASS WHERE IDPROVENTO = '+IntToStr(pIdProvento));
  qryAux.Open;

  If qryAux.IsEmpty Then
  Begin
    ListaArq_Resultado.Add(ListaArq_Recebido[pReg]+' Nenhuma contribuição associada a rubrica da patrocinadora.');
    Result := False;
    Exit;
  End;
  pIdContrib := qryAux.FieldByName('IDCONTASS').AsInteger;
  Result     := True;
end;

function TFrmRecebimentoAssistencial.Busca_Critica_Historico(Var pIdContrib: Integer;
  pIdPessoa, pIdPatro: Integer; psMesCob: String; pReg : Integer): Boolean;
begin
  Result := False;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT * FROM HSTCONTRIBASS '+
                 ' WHERE IDPESSJUR   = '+IntToStr(pIdPatro)+
                   ' AND IDTITULAR   = '+IntToStr(pIdPessoa)+
                   ' AND MESCOBRANCA = '+QuotedStr(psMesCob)+
                   ' AND IDCONTASS   = '+IntToStr(pIdCOntrib)+
                   ' AND DATA IS NULL '+
                   ' AND NVL(VALORRECEBIDO, 0) = 0 '+
                   ' AND SITRECEBIMENTO IN (0, 1) ');
  qryAux.Open;

  If qryAux.IsEmpty Then
  Begin
    ListaArq_Resultado.Add(ListaArq_Recebido[pReg]+' Matrícula sem Histórico de Contribuição Assistencial no mês especificado.');
    Result := False;
    Exit;
  End;
  Result     := True;
end;

procedure TFrmRecebimentoAssistencial.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Processa_Verificacao(OpenDlg.FileName, Copy(OpenDlg.FileName, 1, Length(OpenDlg.FileName) - 4) + '.erro.txt', True);
end;

procedure TFrmRecebimentoAssistencial.Processa_Recebimento(pIdContrib,
  pIdPessoa, pIdPatro: Integer; sMesRef: String; rVlrArq: Double);
Var
  sVlrEsperado : String;

begin
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT * FROM HSTCONTRIBASS '+
                 ' WHERE IDPESSJUR   = '+IntToStr(pIdPatro)+
                   ' AND IDTITULAR   = '+IntToStr(pIdPessoa)+
                   ' AND MESCOBRANCA = '+QuotedStr(sMesRef)+
                   ' AND IDCONTASS   = '+IntToStr(pIdCOntrib)+
                   ' AND DATA IS NULL '+
                   ' AND NVL(VALORRECEBIDO, 0) = 0 '+
                   ' AND SITRECEBIMENTO IN (0, 1) ');

  qryAux.Open;

  sVlrEsperado := qryAux.FieldByName('VALORESPERADO').AsString;
  If sVlrEsperado = FloatToStr(rVlrArq) Then
  Begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' UPDATE HSTCONTRIBASS '+
                   ' SET DATA = '+QuotedStr(dtpDtReceb.Text)+
                      ', VALORRECEBIDO = '+TrocaCaracter(FloatToStr(rVlrArq), ',', '.')+
                      ', SITRECEBIMENTO = 2 '+
                   ' WHERE IDPESSJUR   = '+IntToStr(pIdPatro)+
                     ' AND IDTITULAR   = '+IntToStr(pIdPessoa)+
                     ' AND MESCOBRANCA = '+QuotedStr(sMesRef)+
                     ' AND IDCONTASS   = '+IntToStr(pIdCOntrib));
  End
  Else
  Begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' UPDATE HSTCONTRIBASS '+
                   ' SET DATA = '+QuotedStr(dtpDtReceb.Text)+
                      ', VALORRECEBIDO = '+TrocaCaracter(FloatToStr(rVlrArq), ',', '.')+
                      ', SITRECEBIMENTO = 3 '+
                   ' WHERE IDPESSJUR   = '+IntToStr(pIdPatro)+
                     ' AND IDTITULAR   = '+IntToStr(pIdPessoa)+
                     ' AND MESCOBRANCA = '+QuotedStr(sMesRef)+
                     ' AND IDCONTASS   = '+IntToStr(pIdCOntrib));
  End;
  qryAux.ExecSql;
end;


end.
