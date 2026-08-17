unit FParamRelCompEnvio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, Mask, wwdbedit, Wwdbspin, Spin, ComCtrls, checklst,
  FileCtrl;

type
  TFrmParamRelCompEnvio = class(TfrmOkCancelar)
    Label2: TLabel;
    Label1: TLabel;
    cmbMes: TComboBox;
    EdtMesRef: TEdit;
    SpeAno: TSpinEdit;
    EdtAnoRef: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    DtpVenc: TDateTimePicker;
    Label6: TLabel;
    RgBanco: TRadioGroup;
    qryDados: TwwQuery;
    FileListBox1: TFileListBox;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    ListaDir: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    GroupBox2: TGroupBox;
    ListaArquivo: TCheckListBox;
    bbtnPatroInverte: TBitBtn;
    bbtnPatroTodas: TBitBtn;
    qryExiste: TQuery;
    qryExisteCODDOCUMENTO: TFloatField;
    qryDadosIDPESSOA: TFloatField;
    qryDadosINSCRICAONUMERO: TFloatField;
    qryDadosCODDOCUMENTO: TFloatField;
    qryDadosNOSSONUMERO: TStringField;
    qryDadosCODPROVDESC: TStringField;
    qryDadosNOME: TStringField;
    qryDadosLOCAL: TStringField;
    qryDadosESPERADO: TFloatField;
    qryDadosVALOR: TFloatField;
    qryDadosCODPORTFORMA: TFloatField;
    qryDadosDESCRICAO: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure EdtAnoRefChange(Sender: TObject);
    procedure bbtnPatroTodasClick(Sender: TObject);
    procedure bbtnPatroInverteClick(Sender: TObject);
    procedure ListaDirClick(Sender: TObject);
    procedure FazQry;
    procedure GravaDados;
  private
    { Private declarations }
  Arquivo                    : TextFile;
  sLinha                     : String;
  AnoMesCobranca,
  AnoMesReferencia           : String;
  public
    { Public declarations }
  vUltimo                    : Integer;
  end;

var
  FrmParamRelCompEnvio: TFrmParamRelCompEnvio;

implementation

{$R *.DFM}

Uses UMensErro, UAdmAss, dRelAssistencial, fAguarde;

procedure TFrmParamRelCompEnvio.bbtnConfirmarClick(Sender: TObject);
Var
  iCont                      : Integer;
  sCaminho                   : String;
begin
  inherited;
  (* Verifica o preenchimento do Mês e Ano *)
  if (SpeAno.Text = '') then begin
    MsgDlg('O Ano deve ser informado!','Erro',mtError,[mbOK],0);
    Exit;
  end;(* if *)
  if (cmbMes.Text = '') then begin
    MsgDlg('O mês precisa ser selecionado !','Erro',mtError,[mbOK],0);
    Exit;
  end;(* if *)
  (* Inicializa as variáveis com o Mês de Cobrança e Referência *)
  AnoMesCobranca   := RetornaMesAno(cmbMes.Text,    SpeAno.Value );
  AnoMesReferencia := RetornaMesAno(EdtMesRef.Text, StrToInt(EdtAnoRef.Text));
  (* Executa a query de dados e prepara a rotina de inclusão na query virtual *)
  FazQry;
  If qryDados.RecordCount = 0 Then
   Begin
    ShowMessage('NÃO HÁ DADOS HÁ SEREM PROCESSADOS COM ESTES VALORES !! VERIFIQUE !!');
    Exit;
   End;
  qryDados.Last;
  dtmRelAssistencial.vUltimo:=qryDadosCODDOCUMENTO.AsInteger;
  dtmRelAssistencial.qryCompEnvio.Close;
  dtmRelAssistencial.qryCompEnvio.Open;
  dtmRelAssistencial.qryCompEnvio.Delete;
  qryDados.First;
  While Not qryDados.EOF do
    With dtmRelAssistencial do
     Begin
      qryCompEnvio.Insert;
      qryCompEnvioNUMDOC.AsInteger          := qryDadosCODDOCUMENTO.AsInteger;
      qryCompEnvioNOME.AsString             := qryDadosNOME.AsString;
      qryCompEnvioINSCRICAONUMERO.AsInteger := qryDadosINSCRICAONUMERO.AsInteger;
      qryCompEnvioNOSSONUMERO.AsString      := qryDadosNOSSONUMERO.AsString;
      qryCompEnvioRUBRICA.AsString          := qryDadosCODPROVDESC.AsString;
      qryCompEnvioVALOR.AsCurrency          := qryDadosVALOR.AsCurrency;
      qryCompEnvioLOCAL.AsString            := qryDadosLOCAL.AsString;
      qryCompEnvioSITUACAO.AsString         := qryDadosDESCRICAO.AsString;
      qryCompEnvioMOTIVO.AsString           := '** ENVIADO SEM RETORNO **';
      Case StrToInt(qryDadosCODPROVDESC.AsString) Of
       500,502 :   qryCompEnvioDESCRICAO.AsString:='Assistência Odontológica';
       512     :   qryCompEnvioDESCRICAO.AsString:='Assistência Médica Hospitalar';
       562     :   qryCompEnvioDESCRICAO.AsString:='Seguro de Vida';
       572     :   qryCompEnvioDESCRICAO.AsString:='Assitência Funeral';
       711     :   qryCompEnvioDESCRICAO.AsString:='Diferenças Assistênciais';
      End;
      qryCompEnvio.Post;
      qryDados.Next;
     End;
  (* Faz a leitura dos arquivos em sequencia a partir do(s) escolhido(s) *)
  for iCont := 0 to ListaArquivo.Items.Count - 1 do
   begin
    if ListaArquivo.Checked[iCont] then
    begin
      // Se for raiz o componente coloca "\"
      if Copy(ListaDir.Directory,Length(ListaDir.Directory),1) = '\' then
        sCaminho := ListaDir.Directory+ListaArquivo.Items[iCont]
      else sCaminho := ListaDir.Directory+'\'+ListaArquivo.Items[iCont];
      AssignFile(Arquivo,sCaminho);
      Reset(Arquivo);
      // Efetua a Leitura                                                      -
      while not Eof(Arquivo) do
       begin
        ReadLn(Arquivo, sLinha);
        If Copy(sLinha,1,1)='F' Then
         Begin
          QryExiste.Close;
          QryExiste.ParamByName('DOC').AsInteger:=StrToInt(Copy(sLinha,2,5));
          QryExiste.Open;
          If not QryExisteCODDOCUMENTO.IsNull Then GravaDados;
         End;
       end;
    end;
   End;
//                                                                            --
  Case RgBanco.ItemIndex of
   0 : dtmRelAssistencial.rpCompEnvioLabel1.Caption:='Banco: BANCO DO BRASIL';
   1 : dtmRelAssistencial.rpCompEnvioLabel1.Caption:='Banco: CAIXA ECONÔMICA FEDERAL';
   2 : dtmRelAssistencial.rpCompEnvioLabel1.Caption:='Banco: BANCO REAL';
  End;
  dtmRelAssistencial.ppLabel93.Caption:='Mês: '+RetornaMes(cmbMes.Text)+'/'+SpeAno.Text;end;

procedure TFrmParamRelCompEnvio.FormShow(Sender: TObject);
Var
 ano, mes, dia : Word;
begin
  inherited;
  DecodeDate(now, ano, mes, dia);
  DtpVenc.Date:=Now;
  cmbMes.ItemIndex:=mes-1;
  SpeAno.Value:=ano;
  If mes = 12
   Then
    Begin
     EdtMesRef.Text:='Janeiro';
     EdtAnoRef.Text:=IntToStr(SpeAno.Value+1);
    End
   Else
    Begin
     EdtMesRef.Text:=cmbMes.Items.Strings[cmbMes.itemindex-1];
     EdtAnoRef.Text:=IntToStr(SpeAno.Value);
    End;
end;

procedure TFrmParamRelCompEnvio.cmbMesChange(Sender: TObject);
var sMes: string;
begin
  inherited;
  sMes := LowerCase(cmbMes.Text);
  if sMes = 'janeiro'    then begin
    EdtMesRef.Text := 'Fevereiro';
    EdtAnoRef.Text := IntToStr(SpeAno.Value);
  end
  else if sMes = 'fevereiro'  then EdtMesRef.Text := 'Março' {ACERTAR ESSA ROTINA, TESTAR O MES COM 3 POSICOES}{}
  else if sMes = 'março'      then EdtMesRef.Text := 'Abril'
  else if sMes = 'abril'      then EdtMesRef.Text := 'Maio'
  else if sMes = 'maio'       then EdtMesRef.Text := 'Junho'
  else if sMes = 'junho'      then EdtMesRef.Text := 'Julho'
  else if sMes = 'julho'      then EdtMesRef.Text := 'Agosto'
  else if sMes = 'agosto'     then EdtMesRef.Text := 'Setembro'
  else if sMes = 'setembro'   then EdtMesRef.Text := 'Outubro'
  else if sMes = 'outubro'    then EdtMesRef.Text := 'Novembro'
  else if sMes = 'novembro'   then EdtMesRef.Text := 'Dezembro'
  else if sMes = 'dezembro'   then begin
    EdtMesRef.Text := 'Janeiro';
    EdtAnoRef.Text := IntToStr(SpeAno.Value + 1);
  end;
end;

procedure TFrmParamRelCompEnvio.EdtAnoRefChange(Sender: TObject);
begin
  inherited;
  EdtAnoRef.Text := SpeAno.Text;
  cmbMesChange(Sender);
end;

procedure TFrmParamRelCompEnvio.FazQry;
var
 vSQL, mescob : String;
 NumBanco     : Integer;
begin
  NumBanco:=0;
  MesCob:=AnoMesCobranca;
  Case RgBanco.ItemIndex of
   0 : NumBanco:=9;
   1 : NumBanco:=196;
   2 : NumBanco:=6;
  End;
  (* Exibe o frmAguarde mostrando a mensagem abaixo para o usuário *)
  frmAguarde.Mostra('Aguarde.  Montando relatório...');
  (* Monta a SQL de Consulta para o report *)
  vSQL :=' SELECT /*+ INDEX (HSTCONTRIBASS XPKCONTRIB) */ '+
         '   PE.IDPESSOA, '+
         '   PP.INSCRICAONUMERO, '+
         '   DC.CODDOCUMENTO, '+
         '   DC.NOSSONUMERO, '+
         '   RP.CODPROVDESC, '+
         '   PE.NOME, '+
         '   DECODE(PP.IDPESSJUR,99,''SERPRO'',''SERPROS'') LOCAL, '+
         '   SUM(HT.VALORESPERADO) ESPERADO, '+
         '   RD.VALOR, '+
         '   DC.CODPORTFORMA, '+
         '   ST.DESCRICAO '+
         ' FROM '+
         '    PESSOA                      PE, '+
         '    HSTCONTRIBASS               HT, '+
         '    PARTPREVPLAN                PP, '+
         '    DOCUMENTO                   DC, '+
         '    RATEIODOCUM                 RD, '+
         '    PROVDESC                    PV, '+
         '    RUBRICAXPESS                RP, '+
         '    CONTRIBASS                  CB, '+
         '    SITPART                     ST '+
         ' WHERE '+
         (* JOIN HSTCONTRIBASS COM PESSOA   *)
         '    (HT.MESCOBRANCA   = '''+AnoMesReferencia+''')                         AND '+
         '    (HT.IDPAGADOR     = PE.IDPESSOA)                       AND '+
         (* JOIN PARTPREVPLAN COM HSTCONTRIBASS  *)
         '    (PP.IDPESSJUR     = HT.IDPESSJUR)                      AND '+
         '    (PP.IDPESSOA      = HT.IDTITULAR)                      AND '+
         '    (PP.IDPLANOPREV   = HT.IDPLANOPREV)                    AND '+
         '    (PP.IDSITPART     = PP.IDSITPART)                      AND '+
         '    (PP.SEQPROPOSTA   = HT.SEQPROPOSTA)                    AND '+
         (* JOIN DOCUMENTO COM PARTPREVPLAN   *)
         '    (DC.IDFORCLI     = PE.IDPESSOA)                        AND '+
         '    (DC.CODTIPDOC    = 52)                                 AND '+
         '    (DC.CODPORTFORMA IN('+IntToStr(numbanco)+'))                                AND '+
         '    (DC.DATAVENCTO   = TO_DATE('''+DateToStr(DtpVenc.Date)+''',''DD/MM/YYYY'')) AND '+
         (* JOIN RATEIODOCUM COM DOCUMENTO   *)
         '    (RD.CODDOCUMENTO = DC.CODDOCUMENTO)                    AND '+
         (* JOIN PROVDESC COM CONTRIBASS/HSTCONTRIBASS  *)
         '    (PV.IDPROVENTO    = CB.IDPROVENTO)                     AND '+
         (* JOIN RUBRICAXPESS COM CONTRIBASS   *)
         '    (RP.IDRUBRICA     = CB.IDPROVENTO)                     AND '+
         '    (RP.IDPESSOA      = HT.IDPESSJUR)                      AND '+
         (* JOIN CONTRIBASS COM HSTCONTRIBASS  *)
         '    (CB.IDPLANASS = HT.IDPLANASS)                          AND '+
         '    (CB.IDCONTASS = HT.IDCONTASS)                          AND '+
         '    (CB.IDREGRA   = HT.IDREGRA)                            AND '+
         (* JOIN SITPART COM PARTPREVPLAN  *)
         '    (ST.IDSITPART = PP.IDSITPART) '+
         ' GROUP BY '+
         '   PE.IDPESSOA, '+
         '   PP.INSCRICAONUMERO, '+
         '   DC.CODDOCUMENTO, '+
         '   DC.NOSSONUMERO, '+
         '   RP.CODPROVDESC, '+
         '   PE.NOME, '+
         '   PP.IDPESSJUR, '+
         '   RD.VALOR, '+
         '   DC.CODPORTFORMA, '+
         '   ST.DESCRICAO, '+
         '   HT.IDCONTASS '+
         ' HAVING SUM(HT.VALORESPERADO) = RD.VALOR '+
         ' ORDER BY RP.CODPROVDESC, PE.NOME, DC.NOSSONUMERO ';
//
  qryDados.Close;
  qryDados.SQL.Clear;
  qryDados.SQL.Add(vSQL);
  qryDados.Open;
end;

procedure TFrmParamRelCompEnvio.bbtnPatroTodasClick(Sender: TObject);
var
   iCont  : Integer;
begin
  inherited;
  for iCont := 0 to ListaArquivo.Items.Count - 1 do
    ListaArquivo.Checked[iCont] := True;
end;

procedure TFrmParamRelCompEnvio.bbtnPatroInverteClick(Sender: TObject);
var
   iCont  : Integer;
begin
  inherited;
  for iCont := 0 to ListaArquivo.Items.Count - 1 do
    ListaArquivo.Checked[iCont] := Not ListaArquivo.Checked[iCont];
end;

procedure TFrmParamRelCompEnvio.ListaDirClick(Sender: TObject);
var
   iCont : Integer;
begin
  inherited;
  // Preenche a listaarquivo com os arquivos vindo do FileListBox1.
  FileListBox1.Refresh;
  ListaArquivo.Items.Clear;
  for iCont := 0 to FileListBox1.Items.Count - 1 do
    ListaArquivo.Items.Add(FileListBox1.Items.Strings[iCont]);
end;

procedure TFrmParamRelCompEnvio.GravaDados;
begin
// Grava na dtmRelAssistencial.qryCompEnvio (query virtual)              -
// Garante não gravar o último registro em branco.                       -
  With dtmRelAssistencial do
   Begin
    qryCompEnvio.First;
    If qryCompEnvio.Locate('NUMDOC', Copy(sLinha,2,5), []) Then
     Begin
      qryCompEnvio.Edit;
      qryCompEnvioCOD.AsString      := Copy(sLinha,68,2);
      qryCompEnvioDATA.AsDateTime   := EncodeDate(StrToInt(Copy(sLinha,45,4)),
                                                  StrToInt(Copy(sLinha,49,2)),
                                                  StrToInt(Copy(sLinha,51,2)));
      Case StrToInt(Copy(sLinha,68,2)) Of
       00 : qryCompEnvioMOTIVO.AsString:='Débito efetuado';
       01 : qryCompEnvioMOTIVO.AsString:='Insuficiência de fundos';
       02 : qryCompEnvioMOTIVO.AsString:='Conta corrente não cadastrada';
       04 : qryCompEnvioMOTIVO.AsString:='Outras restrições';
       10 : qryCompEnvioMOTIVO.AsString:='Agência em regime de encerramento';
       12 : qryCompEnvioMOTIVO.AsString:='Valor inválido';
       13 : qryCompEnvioMOTIVO.AsString:='Data de lançamento inválida';
       14 : qryCompEnvioMOTIVO.AsString:='Agência inválida';
       15 : qryCompEnvioMOTIVO.AsString:='DAC da conta corrente inválido';
       18 : qryCompEnvioMOTIVO.AsString:='Data do débito anterior ao do processamento';
       30 : qryCompEnvioMOTIVO.AsString:='Sem contrato de debito automático';
       96 : qryCompEnvioMOTIVO.AsString:='Manutenção do cadastro';
       97 : qryCompEnvioMOTIVO.AsString:='Não encontrado';
       98 : qryCompEnvioMOTIVO.AsString:='Não efetuado, fora de tempo hábil';
       99 : qryCompEnvioMOTIVO.AsString:='Cancelado conforme solicitação';
      End;
      qryCompEnvio.Post;
     End;
   End;
End;


end.




