unit FSeparaArq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  ComCtrls, Db, DBTables, Wwquery,  IvDictio, IvMulti,
  IvEMulti, wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TfrmSeparaArq = class(TfrmSairAjuda)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    bbtnArquivo1: TSpeedButton;
    Label2: TLabel;
    bbtnArquivo2: TSpeedButton;
    Label3: TLabel;
    bbtnArquivo3: TSpeedButton;
    Label4: TLabel;
    bbtnArquivo4: TSpeedButton;
    edNomeArq1: TEdit;
    edNomeArq2: TEdit;
    edNomeArq3: TEdit;
    edNomeArq4: TEdit;
    edNomeArq5: TEdit;
    Label8: TLabel;
    bbtnArquivo5: TSpeedButton;
    OpenDlg: TOpenDialog;
    pnlProcessa: TPanel;
    Label11: TLabel;
    anProcessa: TAnimate;
    dblkpcmbPatro: TwwDBLookupCombo;
    Label9: TLabel;
    qryPatro: TwwQuery;
    dtDataReferencia: TCMDateTimePicker;
    Label10: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Edit3: TEdit;
    Label14: TLabel;
    Edit4: TEdit;
    Label15: TLabel;
    Edit5: TEdit;
    Label16: TLabel;
    Edit6: TEdit;
    Label17: TLabel;
    Edit7: TEdit;
    Label18: TLabel;
    GroupBox2: TGroupBox;
    edArqDados: TEdit;
    bbtnArquivo: TSpeedButton;
    EdArqTabelas: TEdit;
    SpeedButton8: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    bbtnSeparar: TBitBtn;
    procedure bbtnArquivoClick(Sender: TObject);
    procedure bbtnArquivo1Click(Sender: TObject);
    procedure bbtnArquivo2Click(Sender: TObject);
    procedure bbtnArquivo3Click(Sender: TObject);
    procedure bbtnArquivo4Click(Sender: TObject);
    procedure bbtnArquivo5Click(Sender: TObject);
    procedure bbtnArquivo6Click(Sender: TObject);
    procedure bbtnArquivo7Click(Sender: TObject);
    procedure bbtnSepararClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
    procedure SetaNomeArq(pEdit : TEdit);
    function VerificaCampos : boolean;
  public
    { Public declarations }
  end;

var
  frmSeparaArq: TfrmSeparaArq;

implementation

{$R *.DFM}

Uses UMensErro, UInterface,UAdmPrev;

function TfrmSeparaArq.VerificaCampos : boolean;
begin
  Result := False;

  if trim(EdArqTabelas.text) = '' then
  begin
     MsgDlg('Preencha o nome do Arquivo de Origem das Tabelas. ','Erro',mtError,[mbOk,mbHelp],0);
     EdArqTabelas.SetFocus;
     Exit;
  end;

  if trim(EdArqDados.Text) = '' then
  begin
     MsgDlg('Preencha o nome do Arquivo de Origem de Dados. ','Erro',mtError,[mbOk,mbHelp],0);
     EdArqDados.SetFocus;
     Exit;
  end;

  Result := True;
end; // VerificaCampos

procedure TfrmSeparaArq.SetaNomeArq(pEdit : TEdit);
begin
  OpenDlg.FileName := '';
  if not OpenDlg.Execute
  then pEdit.Text := ''
  else pEdit.Text := OpenDlg.FileName;
end; // SetaNomeArq

procedure TfrmSeparaArq.bbtnArquivoClick(Sender: TObject);
var kx,kk,ky : integer;
begin
  inherited;
  SetaNomeArq(edArqDados);

  kx:=0;
  ky:=length(trim(edArqDados.Text));
  for kk:=1 to ky do begin
     if copy(trim(edArqDados.Text),kk,1) = '\' then begin
        kx:=kk;
     end;
  end;
  if kx = 0 then begin
     for kk:=1 to ky do begin
        if copy(trim(edArqDados.Text),kk,1) = ':' then begin
           kx:=kk;
        end;
     end;
  end;
  edNomeArq1.Text := copy(trim(edArqDados.Text),1,kx)+trim(edNomeArq1.text);
  edNomeArq2.text := copy(trim(edArqDados.Text),1,kx)+trim(edNomeArq2.text);
  edNomeArq3.text := copy(trim(edArqDados.Text),1,kx)+trim(edNomeArq3.text);
  edNomeArq4.text := copy(trim(edArqDados.Text),1,kx)+trim(edNomeArq4.text);
  edNomeArq5.text := copy(trim(edArqDados.Text),1,kx)+trim(edNomeArq5.text);

end; // bbtnArquivoClick

procedure TfrmSeparaArq.bbtnArquivo1Click(Sender: TObject);
begin
  inherited;
  SetaNomeArq(edNomeArq1);
end; // bbtnArquivo1Click

procedure TfrmSeparaArq.bbtnArquivo2Click(Sender: TObject);
begin
  inherited;
  SetaNomeArq(edNomeArq2);
end; // bbtnArquivo2Click

procedure TfrmSeparaArq.bbtnArquivo3Click(Sender: TObject);
begin
  inherited;
  SetaNomeArq(edNomeArq3);
end; // bbtnArquivo3Click

procedure TfrmSeparaArq.bbtnArquivo4Click(Sender: TObject);
begin
  inherited;
  SetaNomeArq(edNomeArq4);
end; // bbtnArquivo4Click

procedure TfrmSeparaArq.bbtnArquivo5Click(Sender: TObject);
begin
  inherited;
  SetaNomeArq(edNomeArq5);
end; // bbtnArquivo5Click

procedure TfrmSeparaArq.bbtnArquivo6Click(Sender: TObject);
begin
  inherited;
end; // bbtnArquivo6Click

procedure TfrmSeparaArq.bbtnArquivo7Click(Sender: TObject);
begin
  inherited;
end; // bbtnArquivo7Click

procedure TfrmSeparaArq.bbtnSepararClick(Sender: TObject);
var
  F1,
  F2,
  F3,
  F4,
  F5,
  F6,
  F7,F8,F9,F10,F11,F12,F13,
  F,FF      : TextFile;
  sMesRef,
  sDataReferencia,
  sMatricula,
  sNumInscricao,
  sCodProvDesc1,
  sValorProvento1,
  sValorDesconto1,
  sCodProvDesc2,
  sValorProvento2,
  sValorDesconto2,
  sCodProvDesc3,
  sValorProvento3,
  sValorDesconto3,
  sCodProvDesc4,
  sValorProvento4,
  sValorDesconto4,
  sCodProvDesc5,
  sValorProvento5,
  sValorDesconto5,
  sCodProvDesc6,
  sValorProvento6,
  sValorDesconto6,
  sCodProvDesc7,
  sValorProvento7,
  sValorDesconto7,
  sCodProvDesc8,
  sValorProvento8,
  sValorDesconto8,
  sCodProvDesc9,
  sValorProvento9,
  sValorDesconto9,
  sTipo,
  sIdPessJur,
  sLinha1,
  sLinha : string;
  liSeqInterface : LongInt;
  lercomo : string;

begin
  inherited;
  // Preenche variáveis
  sIdPessJur := qryPatro.FieldByName('IdPessoa').AsString;
  sDataReferencia := dtDataReferencia.Text;
  liSeqInterface := 1;

  // Verificar campos obrigatorios
  if not VerificaCampos
  then Exit;

  pnlProcessa.BringToFront;
  anProcessa.Active  := True;
  pnlProcessa.Update;

  // Processamento

  // Abertura dos Arquivos
  AssignFile(F,edArqDados.Text);
  Reset(F);
  AssignFile(FF,EdArqTabelas.Text);
  Reset(FF);

  AssignFile(F1,edNomeArq1.Text);
  Rewrite(F1);

  AssignFile(F2,edNomeArq2.Text);
  Rewrite(F2);

  AssignFile(F3,edNomeArq3.Text);
  Rewrite(F3);

  AssignFile(F4,edNomeArq4.Text);
  Rewrite(F4);

  AssignFile(F5,edNomeArq5.Text);
  Rewrite(F5);

  AssiGNfile(F6,edit1.Text);
  Rewrite(F6);

  AssignFile(F7,edit3.text);
  Rewrite(F7);

  AssignFile(F8,edit4.text);
  Rewrite(F8);

  AssignFile(F9,edit5.text);
  Rewrite(F9);

  AssignFile(F10,edit6.text);
  Rewrite(F10);

  AssignFile(F11,edit7.text);
  Rewrite(F11);

  // Header

  Readln(F, sLinha);
  Readln(FF, slinha1);

  sMesRef := Trim(Copy(sLinha,32,4)) + '/' + Trim(Copy(sLinha,36,2));

  while not Eof(F) do
  begin
    Readln(F, sLinha);
    if Trim(Copy(sLinha,strtoint(QryPatro.FieldByName('IDREGCADASTROINI').AsString),strtoint(QryPatro.FieldByName('IDREGCADASTROTAM').AsString))) = Trim(QryPatro.FieldByName('IDREGCADASTRO').AsString)
    then Writeln(F1,sLinha);
    if Trim(Copy(sLinha,strtoint(QryPatro.FieldByName('IDREGLOTACAOINI').AsString),strtoint(QryPatro.FieldByName('IDREGLOTACAOTAM').AsString))) = Trim(QryPatro.FieldByName('IDREGLOTACAO').AsString)
    then Writeln(F2,sLinha);
    if Trim(Copy(sLinha,strtoint(QryPatro.FieldByName('IDREGENDERECOINI').AsString),strtoint(QryPatro.FieldByName('IDREGENDERECOTAM').AsString))) = Trim(qryPatro.FieldByName('IDREGENDERECO').AsString)
    then Writeln(F3,sLinha);
    if Trim(Copy(sLinha,strtoint(QryPatro.FieldByName('IDREGEVENTOINI').AsString),strtoint(QryPatro.FieldByName('IDREGEVENTOTAM').AsString))) = Trim(QryPatro.FieldByName('IDREGEVENTO').AsString)
    then Writeln(F4,sLinha);
    if qryPatro.FieldByName('IDPARTRUBRICA').AsInteger = 0
    then lercomo := 'MATRICULA'
    else lercomo := 'INSCRICAONUMERO';
    if Trim(Copy(sLinha,strtoint(QryPatro.FieldByName('idregrubricaINI').AsString),strtoint(QryPatro.FieldByName('idregrubricaTAM').AsString))) = Trim(QryPatro.FieldByName('idregrubricas').AsString) then
       begin
          sMatricula := Trim(Copy(sLinha,1,8));
          sNumInscricao := Trim(Copy(sLinha,9,6));
          sCodProvDesc1 := Trim(Copy(sLinha,16,4));
          sValorProvento1 := Trim(Copy(sLinha,20,11));
          sValorDesconto1 := Trim(Copy(sLinha,31,11));
          sCodProvDesc2 := Trim(Copy(sLinha,42,4));
          sValorProvento2 := Trim(Copy(sLinha,46,11));
          sValorDesconto2 := Trim(Copy(sLinha,57,11));
          sCodProvDesc3 := Trim(Copy(sLinha,68,4));
          sValorProvento3 := Trim(Copy(sLinha,72,11));
          sValorDesconto3 := Trim(Copy(sLinha,83,11));
          sCodProvDesc4 := Trim(Copy(sLinha,94,4));
          sValorProvento4 := Trim(Copy(sLinha,98,11));
          sValorDesconto4 := Trim(Copy(sLinha,109,11));
          sCodProvDesc5 := Trim(Copy(sLinha,120,4));
          sValorProvento5 := Trim(Copy(sLinha,124,11));
          sValorDesconto5 := Trim(Copy(sLinha,135,11));
          sCodProvDesc6 := Trim(Copy(sLinha,146,4));
          sValorProvento6 := Trim(Copy(sLinha,150,11));
          sValorDesconto6 := Trim(Copy(sLinha,161,11));
          sCodProvDesc7 := Trim(Copy(sLinha,172,4));
          sValorProvento7 := Trim(Copy(sLinha,176,11));
          sValorDesconto7 := Trim(Copy(sLinha,187,11));
          sCodProvDesc8 := Trim(Copy(sLinha,198,4));
          sValorProvento8 := Trim(Copy(sLinha,202,11));
          sValorDesconto8 := Trim(Copy(sLinha,213,11));
          sCodProvDesc9 := Trim(Copy(sLinha,224,4));
          sValorProvento9 := Trim(Copy(sLinha,228,11));
          sValorDesconto9 := Trim(Copy(sLinha,239,11));

          // Insere na tabela CLASSERUBRICAS - Ocorrencia 1
          if (Trim(sCodProvDesc1) <> '0000') then
          begin
             if (Trim(sValorProvento1) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorProvento1+' '+
                           Preenche('D',' ',sCodProvDesc1+'P',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
             if (Trim(sValorDesconto1) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorDesconto1+' '+
                           Preenche('D',' ',sCodProvDesc1+'D',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
          end;
          // Insere na tabela CLASSERUBRICAS - Ocorrencia 2
          if (Trim(sCodProvDesc2) <> '0000') then
          begin
             if (Trim(sValorProvento2) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorProvento2+' '+
                           Preenche('D',' ',sCodProvDesc2+'P',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
             if (Trim(sValorDesconto2) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorDesconto2+' '+
                           Preenche('D',' ',sCodProvDesc2+'D',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
          end;
          // Insere na tabela CLASSERUBRICAS - Ocorrencia 3
          if (Trim(sCodProvDesc3) <> '0000') then
          begin
             if (Trim(sValorProvento3) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorProvento3+' '+
                           Preenche('D',' ',sCodProvDesc3+'P',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
             if (Trim(sValorDesconto3) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorDesconto3+' '+
                           Preenche('D',' ',sCodProvDesc3+'D',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
          end;
          // Insere na tabela CLASSERUBRICAS - Ocorrencia 4
          if (Trim(sCodProvDesc4) <> '0000') then
          begin
             if (Trim(sValorProvento4) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorProvento4+' '+
                           Preenche('D',' ',sCodProvDesc4+'P',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
             If (Trim(sValorDesconto4) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorDesconto4+' '+
                           Preenche('D',' ',sCodProvDesc4+'D',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
          end;
          // Insere na tabela CLASSERUBRICAS - Ocorrencia 5
          if (Trim(sCodProvDesc5) <> '0000') then
          begin
             if (Trim(sValorProvento5) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorProvento5+' '+
                           Preenche('D',' ',sCodProvDesc5+'P',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
             if (Trim(sValorDesconto5) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorDesconto5+' '+
                           Preenche('D',' ',sCodProvDesc5+'D',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
          end;
          // Insere na tabela CLASSERUBRICAS - Ocorrencia 6
          if (Trim(sCodProvDesc6) <> '0000') then
          begin
             if (Trim(sValorProvento6) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorProvento6+' '+
                           Preenche('D',' ',sCodProvDesc6+'P',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
             If (Trim(sValorDesconto6) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorDesconto6+' '+
                           Preenche('D',' ',sCodProvDesc6+'D',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
          end;
          // Insere na tabela CLASSERUBRICAS - Ocorrencia 7
          if (Trim(sCodProvDesc7) <> '0000') then
          begin
             if (Trim(sValorProvento7) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorProvento7+' '+
                           Preenche('D',' ',sCodProvDesc7+'P',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
             if (Trim(sValorDesconto7) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorDesconto7+' '+
                           Preenche('D',' ',sCodProvDesc7+'D',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
          end;
          // Insere na tabela CLASSERUBRICAS - Ocorrencia 8
          if (Trim(sCodProvDesc8) <> '0000') then
          begin
             if (Trim(sValorProvento8) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorProvento8+' '+
                           Preenche('D',' ',sCodProvDesc8+'P',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
             if (Trim(sValorDesconto8) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorDesconto8+' '+
                           Preenche('D',' ',sCodProvDesc8+'D',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
          end;
          // Insere na tabela CLASSERUBRICAS - Ocorrencia 9
          if (Trim(sCodProvDesc9) <> '0000') then
          begin
             if (Trim(sValorProvento9) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorProvento9+' '+
                           Preenche('D',' ',sCodProvDesc9+'P',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
             if (Trim(sValorDesconto9) <> '00000000000') then
             begin
                sLinha1 := Preenche('D',' ',IntToStr(liSeqInterface),17)+' '+Preenche('D',' ',sIdPessJur,5)+' '+Preenche('D',' ','',5)+' '+sMesRef+' '+sMesRef+' '+
                           sDataReferencia+' '+sValorDesconto9+' '+
                           Preenche('D',' ',sCodProvDesc9+'D',7)+' '+Preenche('D',' ',lercomo,30)+' '+Preenche('D',' ',sNumInscricao,30)+' '+Preenche('D',' ',sMatricula,30);
                Inc(liSeqInterface);
                Writeln(F5,sLinha1);
             end;
          end;
       end;
      if sTipo = '6' then Writeln(F6,sLinha);
      if sTipo = Trim(QryPatro.FieldByName('idregconsig').AsString) then Writeln(F7,sLinha);
      if sTipo = '9' then break;
    end;
    while not eof(FF) do
    begin
       readln(FF,slinha);
       if Trim(Copy(sLinha,strtoint(QryPatro.FieldByName('IDREGTBRUBINI').AsString),strtoint(QryPatro.FieldByName('IDREGTBRUBTAM').AsString))) = Trim(QryPatro.FieldByName('IDREGTBRUBRICA').AsString)
       then Writeln(F6,sLinha);
       if Trim(Copy(sLinha,strtoint(QryPatro.FieldByName('IDREGTBEVENTOINI').AsString),strtoint(QryPatro.FieldByName('IDREGTBEVENTOTAM').AsString))) = Trim(QryPatro.FieldByName('IDREGTBEVENTOS').AsString)
       then Writeln(F7,sLinha);
       if Trim(Copy(sLinha,strtoint(QryPatro.FieldByName('IDREGTBORGAOINI').AsString),strtoint(QryPatro.FieldByName('IDREGTBORGAOTAM').AsString))) = Trim(qryPatro.FieldByName('IDREGTBORGAO').AsString)
       then Writeln(F8,sLinha);
       if Trim(Copy(sLinha,strtoint(QryPatro.FieldByName('IDREGTBNIVELINI').AsString),strtoint(QryPatro.FieldByName('IDREGTBNIVELTAM').AsString))) = Trim(QryPatro.FieldByName('IDREGTBNIVEL').AsString)
       then Writeln(F9,sLinha);
       if Trim(Copy(sLinha,strtoint(QryPatro.FieldByName('IDREGTBCARGOINI').AsString),strtoint(QryPatro.FieldByName('IDREGTBCARGOTAM').AsString))) = Trim(qryPatro.FieldByName('IDREGTBCARGO').AsString)
       then Writeln(F10,sLinha);
       if Trim(Copy(sLinha,strtoint(QryPatro.FieldByName('IDREGTBBANCOINI').AsString),strtoint(QryPatro.FieldByName('IDREGTBBANCOTAM').AsString))) = Trim(QryPatro.FieldByName('IDREGTBBANCOS').AsString)
       then Writeln(F11,sLinha);

    end;

  // Fechando os arquivos
  CloseFile(F);
  CloseFile(F1);
  CloseFile(F2);
  CloseFile(F3);
  CloseFile(F4);
  CloseFile(F5);
  CloseFile(F6);
  CloseFile(F7);
  CloseFile(F8);
  CloseFile(F9);
  CloseFile(F10);
  CloseFile(F11);

  // Finalizando
  anProcessa.Active  := False;
  pnlProcessa.SendToBack;
  MsgDlg('Separação de Arquivos encerrada com sucesso !','Informação',mtInformation,[mbOk,mbHelp],0);
end; // bbtnSepararClick

procedure TfrmSeparaArq.FormActivate(Sender: TObject);
begin
  inherited;
  dtDataReferencia.Text := DateTimeToStr(Date);
  pnlProcessa.SendToBack;
  anProcessa.Active  := False;
  qryPatro.Close; qryPatro.Open;
end; // FormActivate

procedure TfrmSeparaArq.SpeedButton8Click(Sender: TObject);
var kx,ky,kk : integer ;
begin
  inherited;
  SetaNomeArq(EdArqTabelas);
  kx:=0;
  ky:=length(trim(edArqDados.Text));
  for kk:=1 to ky do begin
     if copy(trim(EdArqTabelas.Text),kk,1) = '\' then begin
        kx:=kk;
     end;
  end;
  if kx = 0 then begin
     for kk:=1 to ky do begin
        if copy(trim(EdArqTabelas.Text),kk,1) = ':' then begin
           kx:=kk;
        end;
     end;
  end;
  edit1.Text := copy(trim(EdArqTabelas.Text),1,kx)+trim(edit1.text);
  edit7.text := copy(trim(EdArqTabelas.Text),1,kx)+trim(edit7.text);
  edit6.text := copy(trim(EdArqTabelas.Text),1,kx)+trim(edit6.text);
  edit5.text := copy(trim(EdArqTabelas.Text),1,kx)+trim(edit5.text);
  edit4.text := copy(trim(EdArqTabelas.Text),1,kx)+trim(edit4.text);
  edit3.text := copy(trim(EdArqTabelas.Text),1,kx)+trim(edit3.text);

end;

procedure TfrmSeparaArq.SpeedButton1Click(Sender: TObject);
begin
  inherited;
 SetaNomeArq(Edit1);
end;

procedure TfrmSeparaArq.SpeedButton2Click(Sender: TObject);
begin
  inherited;
SetaNomeArq(Edit7);
end;

procedure TfrmSeparaArq.SpeedButton3Click(Sender: TObject);
begin
  inherited;
SetaNomeArq(Edit6);
end;

procedure TfrmSeparaArq.SpeedButton5Click(Sender: TObject);
begin
  inherited;
SetaNomeArq(Edit5);
end;

procedure TfrmSeparaArq.SpeedButton6Click(Sender: TObject);
begin
  inherited;
SetaNomeArq(Edit4);
end;

procedure TfrmSeparaArq.SpeedButton7Click(Sender: TObject);
begin
  inherited;
SetaNomeArq(Edit3);
end;

end.
