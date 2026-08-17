unit FormataArquivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, StdCtrls, ExtCtrls, Buttons, FileCtrl, Db, DBTables,
  CMDatabase;

type
  TFrmFormataArq = class(TForm)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    btnProcurar: TBitBtn;
    PnlOpen: TPanel;
    Panel5: TPanel;
    btnProcessar: TBitBtn;
    btnSair: TBitBtn;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    PnlSave: TPanel;
    btnSave: TBitBtn;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    cbPatro: TComboBox;
    Bevel2: TBevel;
    GroupBox4: TGroupBox;
    cbMes: TComboBox;
    cbAno: TComboBox;
    qryMatricula: TQuery;
    { Private declarations }
    Function Esq(Lstr:String;Lnum:Byte):String;
    Function Dir(RStr:String;RNum:Byte):String;
    procedure Zeros(var st : string; tam : integer);
    Function Aj(St:String):String;
    Function AcVl(sVl:String):String;
    procedure btnProcessarClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cbPatroChange(Sender: TObject);
    procedure cbMesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Function DigitoOk(St:String):String;
    procedure GravaArqCBTU;
    procedure GravaArqCFN;
    procedure GravaArqCPTM;
    procedure GravaArqFLUMITRENS;
    procedure GravaArqFTC;
    procedure GravaArqRFFSA;

  public
    { Public declarations }
  end;

var
  FrmFormataArq: TFrmFormataArq;
  Mov,
  LResult        : Textfile;
  Linha,
  sMatricula,
  sDigito,
  sMesAno,
  sValor,
  sPatro,
  sMesCob: String;
  iCount: Integer;

implementation

{$R *.DFM}

Function TFrmFormataArq.Esq(Lstr:String;Lnum:Byte):String;
Var I:Byte;
    Stra:String;
Begin
  If Length(Lstr)>=Lnum Then Esq:=Copy(Lstr,1,Lnum)
  Else
     Begin
       Stra:='';
       For I:=1 to Lnum-Length(Lstr) Do
           Stra:=Stra+' ';
       Esq:=Lstr+Stra;
     End;
End;

Function TFrmFormataArq.Dir(RStr:String;RNum:Byte):String;
Var I   :Integer;
    Stra:String;
Begin
  If Length(Rstr)>=Rnum Then Dir:=Copy(Rstr,Length(Rstr)-Rnum+1,Rnum)
  Else
     Begin
       Stra:='';
       For I:=1 to Rnum-Length(Rstr) Do
           Stra:=Stra+' ';
       Dir:=Stra+Rstr;
    End;
End;

procedure TFrmFormataArq.Zeros(var st : string; tam : integer);
var Ind,L : Integer;
    StAux : String;
begin
  StAux:='';
  L:=Length(St);
  For Ind:=1 to L do
  begin
    If Copy(St,Ind,1)<>' ' then StAux:=StAux+Copy(St,Ind,1);
  end;
  For Ind:=1 to tam - L do insert('0',st,1);
end;

Function TFrmFormataArq.Aj(St:String):String;
Var
  A     : Integer;
  Ch    : Char;
  Tam   : Integer;
  StAuxJ: String;
begin
  StAuxJ:='';
  Tam:=Length(St);
  For A:=1 to Tam do
  begin
    Ch:=St[A];
    If Ch In ['A'..'Z','0'..'9'] then StAuxJ:=StAuxJ+Ch;
  end;
  Aj:=StAuxJ;
end;

Function TFrmFormataArq.AcVl(sVl:String):String;
begin
  sVl:=Aj(sVl);
  Zeros(sVl,10);
  sVl:=Copy(sVl,1,8)+'.'+Copy(sVl,9,2);
  Result:=sVl;
end;

Function TFrmFormataArq.DigitoOk(St:String):String;
begin
  qryMatricula.Close;
  qryMatricula.Sql.Clear;
  qryMatricula.Sql.Add('SELECT SUBSTR(MATRICULA,10,1) AS DIGITO '+
                       ' FROM ELEGPATRO '+
                       ' WHERE MATRICULA LIKE '+QuotedStr(Trim(St)+'%'));

  qryMatricula.Open;
  Result:=Trim(qryMatricula.FieldByName('DIGITO').AsString);
end;

procedure TFrmFormataArq.GravaArqCBTU;
begin
  Writeln(LResult,'I         0           ',Trim(sMesCob),'CBTU');
  Repeat
    Linha:='';
    ReadLn(Mov,Linha);
    Writeln(LResult,Copy(Linha,1,16),'05054',Copy(Linha,22,10));
    Inc(iCount,1);
  Until(Eof(Mov));
end;

Procedure TFrmFormataArq.GravaArqCFN;
begin
  Writeln(LResult,'I         0           ',Trim(sMesCob),'CFN');
  Repeat
    Linha:='';
    ReadLn(Mov,Linha);
    sMatricula:= Copy(Linha,1,8);
    sDigito   := DigitoOk(Copy(Linha,1,8));
    sMesAno   := Copy(Linha,9,6);
    sValor    := Copy(Linha,25,10);
    Writeln(LResult,'R',sMatricula,sDigito,' ',
             '000000',' ','5054',sMesAno,sValor);
    Inc(iCount,1);
  Until(Eof(Mov));
end;

Procedure TFrmFormataArq.GravaArqCPTM;
begin
  Writeln(LResult,'I         0           ',Trim(sMesCob),'CPTM');
  Repeat
    Linha:='';
    ReadLn(Mov,Linha);
    sMatricula:= Copy(Linha,1,8);
    sDigito   := Copy(Linha,10,1);
    sMesAno   := Copy(Linha,11,6);
    sValor    := Copy(Linha,22,10);
    Writeln(LResult,'R',sMatricula,sDigito,' ',
             '000000',' ','5054',sMesAno,sValor);
    Inc(iCount,1);
 Until(Eof(Mov));
end;

Procedure TFrmFormataArq.GravaArqFLUMITRENS;
begin
  Repeat
    Linha:='';
    ReadLn(Mov,Linha);
    sMatricula:= Copy(Linha,1,8);
    sDigito   := '';
    sMesAno   := Copy(sMesCob,1,2);
    sValor    := Copy(Linha,29,10); {ACVL TEM SOMENTE 10 POSICOES}

    sValor:=AcVl(sValor);
    Zeros(sValor,15);

    Writeln(LResult,sMatricula,' ',' ','0000000',Copy(sMesAno,1,2),
        '50155',sValor,'000000000000.00N');
    Inc(iCount,1);
  Until(Eof(Mov));
end;

Procedure TFrmFormataArq.GravaArqFTC;
begin
  Writeln(LResult,'I         0           ',Trim(sMesCob),'FTC');
  Repeat
    Linha:='';
    ReadLn(Mov,Linha);
    sMatricula:= Copy(Linha,1,8);
    sDigito   := DigitoOk(Copy(Linha,1,8));
    sMesAno   := Copy(Linha,9,6);
    sValor    := Copy(Linha,25,10);
    Writeln(LResult,'R',sMatricula,sDigito,' ',
             '000000',' ','5054',sMesAno,sValor);
    Inc(iCount,1);
  Until(Eof(Mov));
end;

Procedure TFrmFormataArq.GravaArqRFFSA;
begin
  Writeln(LResult,'I         0           ',Trim(sMesCob),'RFFSA');
  Repeat
    Linha:='';
    ReadLn(Mov,Linha);
    sMatricula:= Copy(Linha,1,8);
    sDigito   := DigitoOk(Copy(Linha,1,8));
    sMesAno   := Copy(Linha,9,6);
    sValor    := Copy(Linha,25,10);
    Writeln(LResult,'R',sMatricula,sDigito,' ',
             '000000',' ','5054',sMesAno,sValor);
    Inc(iCount,1);
  Until(Eof(Mov));
end;

procedure TFrmFormataArq.btnProcessarClick(Sender: TObject);
begin
  iCount:=0;
  If OpenDialog.FileName='' then Exit;
  If SaveDialog.FileName='' then Exit;
  If cbMes.Text='' then Exit;
  If cbAno.Text='' then Exit;
  If Not btnSave.Enabled then Exit;

  sMesCob:=IntToStr(cbMes.ItemIndex+1);
  If cbMes.ItemIndex+1 < 10 then sMesCob:='0'+sMesCob;

  sMesCob:=sMesCob+Trim(cbAno.Text);

  AssignFile(Mov,OpenDialog.FileName);
  Reset(Mov);

  If sMesCob='' then
  begin
    ShowMessage('Erro no arquivo origem');
    Exit;
  end;

  AssignFile(LResult,SaveDialog.FileName);
  ReWrite(LResult);

  Case CbPatro.ItemIndex Of
    0: GravaArqCBTU;
    1: GravaArqCFN;
    2: GravaArqCPTM;
    3: GravaArqFLUMITRENS;
    4: GravaArqFTC;
    5: GravaArqRFFSA;
  end; {Case}
  CloseFile(Mov);
  CloseFile(LResult);
  pnlOpen.Caption:='';
  pnlSave.Caption:='';
  btnSave.Enabled:=False;
  SaveDialog.FileName:='';
  OpenDialog.FileName:='';

  If iCount>0 then ShowMessage('Arquivo '+SaveDialog.FileName+#13+
                               'criado com '+IntToStr(iCount)+' registros.'+#13+
                               'OBS: Editar o arquivo gerado e fazer uma verificação '+#13+
                               'antes de enviar para patrocinadora.')
  else ShowMessage('Erro na criação do arquivo destino');

end;

procedure TFrmFormataArq.btnProcurarClick(Sender: TObject);
begin
  OpenDialog.Execute;
  PnlOpen.Caption:= OpenDialog.FileName;
end;

procedure TFrmFormataArq.btnSaveClick(Sender: TObject);
begin
  If not DirectoryExists('c:\Arquivos_Remessa') then
    CreateDir('C:\Arquivos_Remessa');

  SaveDialog.Execute;
  PnlSave.Caption:= SaveDialog.FileName;
end;

procedure TFrmFormataArq.btnSairClick(Sender: TObject);
begin
  Close;
end;

Procedure TFrmFormataArq.cbPatroChange(Sender: TObject);
begin
  cbAno.Items.Clear;
  cbAno.Items.Add(Copy(DateToStr(Date),7,4));
  btnSave.Enabled:=(cbPatro.Text<>'')And(cbMes.Text<>'')And
                    (cbAno.Text<>'');

  Case CbPatro.ItemIndex Of
    0: sPatro:='CBTU';
    1: sPatro:='CFN';
    2: sPatro:='CPTM';
    3: sPatro:='FLUMI';
    4: sPatro:='FTC';
    5: sPatro:='RFFSA';
  end; {Case}

  SaveDialog.FileName:='C:\Arquivos_Remessa\Seguros_'+sPatro+'_'+
        Copy(cbMes.Text,1,3)+Trim(cbAno.Text)+'.txt';
end;

procedure TFrmFormataArq.cbMesChange(Sender: TObject);
begin
  btnSave.Enabled:=(cbPatro.Text<>'')And(cbMes.Text<>'')And
                    (cbAno.Text<>'');
 Case CbPatro.ItemIndex Of
    0: sPatro:='CBTU';
    1: sPatro:='CFN';
    2: sPatro:='CPTM';
    3: sPatro:='FLUMI';
    4: sPatro:='FTC';
    5: sPatro:='RFFSA';
  end; {Case}

  SaveDialog.FileName:='C:\Arquivos_Remessa\Seguros_'+sPatro+'_'+
        Copy(cbMes.Text,1,3)+Trim(cbAno.Text)+'.txt';                   
                    
end;

procedure TFrmFormataArq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Free;
end;

end.


