unit fImportCapSeg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, DBTables,
  Wwquery, OpenArqText, wwdblook, Wwdatsrc, ComCtrls,  TB97, IvDictio,
  IvMulti, IvEMulti, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmImportCapSeg = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    qryCpLayout: TwwQuery;
    dsCpLayout: TwwDataSource;
    dsTpLayout: TwwDataSource;
    qryTpLayout: TwwQuery;
    Label1: TLabel;
    dbgTpLayout: TwwDBGrid;
    OpenDialog: TOpenDialog;
    qryIns: TwwQuery;
    qryCapSegAss: TwwQuery;
    wwDBGrid1: TwwDBGrid;
    Label2: TLabel;
    procedure bbtnCancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
    Function OkFields: Boolean;
    Function CamposInseridosVar: Boolean;
    Function VerificaValor(St:String;Tp:Integer): String;
    Function ProcuraPlano(St: String):String;

  public

    { Public declarations }
  end;

var
  frmImportCapSeg: TfrmImportCapSeg;
  FArq: TextFile;
  sCpIns,
  sVlIns,
  sFlgValor,
  sLinha,
  sIdCapSeg: String;

implementation

uses FCadEventAss, DBaseDados, UDataBase, UMensErro;

{$R *.DFM}

procedure TfrmImportCapSeg.bbtnCancelaClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmImportCapSeg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryTpLayout.Close;
  qryCpLayout.Close;
  qryCapSegAss.Close;
  qryIns.Close;
  action := cafree;
end;

procedure TfrmImportCapSeg.FormCreate(Sender: TObject);
begin
  inherited;
  qryTpLayout.open;
  qryCpLayout.open;
  qryCapSegAss.Open;
end;

Function TfrmImportCapSeg.OkFields: Boolean;
Var A,TCp: Integer;
begin
  qryCpLayout.First;
  Repeat
    TCp:=0;
    A:=0;
    Repeat
      Inc(A,1);
      If Trim(UpperCase(qryCpLayout.FieldByName('NomeCpo').AsString))=
          Trim(UpperCase(qryCapSegAss.Fields[A].FieldName)) then Inc(TCp,1);
    Until(A>=qryCapSegAss.FieldCount)Or(TcP>=1);
    qryCpLayout.Next;
  Until(qryCpLayout.Eof)Or(TCp=0);
  qryCpLayout.First;
  Result:=TCp>0;
end;

Function TfrmImportCapSeg.VerificaValor(St:String;Tp:Integer): String;
Var StA: String;
    Ch : Char;
    A  : Integer;
begin
  StA:='';
  For A:=1 to Length(St) do
  begin
    Ch:=St[A];
    If Ch In ['0'..'9'] then StA:=StA+Ch;
  end;
  If (Tp In [2..Length(StA)-1])And(StA<>'') then
    StA:=Copy(StA,1,Length(StA)-(Tp))+'.'+
          Copy(StA,Length(StA)-(Tp-1),Tp);
  If StA='' then StA:='0';
  Result:=StA;
end;

Function TfrmImportCapSeg.ProcuraPlano(St: String):String;
begin
  With qryIns do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT DISTINCT IDPLANASS'+
            ' FROM PLANASS'+
            ' WHERE OPCAOAIDENT = '+Chr(39)+St+Chr(39));
    Open;
    If IsEmpty then
    begin
      Close;
      MsgDlg('ERRO! '+#13+'PLANO NÃO FOI IDENTIFICADO.','Erro',mtError,[mbOk,mbHelp],0);
      Result:='';
    end
    else Result:=FieldByName('IdPlanass').AsString;
    Close;
  end; {With}
end;

Function TfrmImportCapSeg.CamposInseridosVar: Boolean;
Var A,B,TCp,
    Tam,
    iPosIn,
    iPosFi    : Integer;
    sIdPlanass: String;

begin
  TCp:=0;
  sCpIns:='';
  sVlIns:='';
  qryCpLayout.First;
  Repeat
    For A:=0 to qryCapSegAss.FieldCount-2 do
    begin
      If Trim(UpperCase(qryCpLayout.FieldByName('NomeCpo').AsString))=
          Trim(UpperCase(qryCapSegAss.Fields[A].FieldName)) then
      begin
        Inc(TCp,1);
        iPosIn:=qryCpLayout.FieldByName('PosInicial').AsInteger;
        iPosFi:=qryCpLayout.FieldByName('PosFinal').AsInteger;
        sFlgValor:=qryCpLayout.FieldByName('FlgValor').AsString;
        sCpIns:=sCpIns+qryCapSegAss.Fields[A].FieldName+',';

        Tam:=0;
        For B:=iPosIn to iPosfi do Inc(Tam,1);

        (* Procura IdPlanass na tabela Planass *)
        sIdPlanass:='';
        If qryCapSegAss.Fields[A].FieldName='IDPLANASS' then
        begin
          sIdPlanass:=ProcuraPlano(copy(sLinha,iPosIn,Tam));
          sFlgValor:='1';
          If sIdPlanass='' then Abort;
        end;
        If sFlgValor='0' then
          sVlIns:=sVlIns+Chr(39)+copy(sLinha,iPosIn,Tam)+Chr(39)+','
        else
        begin
          If sIdPlanass<>'' then
            sVlIns:=sVlIns+VerificaValor(sIdPlanass,StrToInt(sFlgValor))+','
          else sVlIns:=sVlIns+VerificaValor(copy(sLinha,iPosIn,Tam),StrToInt(sFlgValor))+',';
        end;
      end;
    end; {For}
    qryCpLayout.Next;
  Until(qryCpLayout.Eof);
  sCpIns:=Copy(sCpIns,1,Length(sCpIns)-1);
  sVlIns:=Copy(sVlIns,1,Length(sVlIns)-1);
  qryCpLayout.First;
  Result:=Tcp<>0;
end;

procedure TfrmImportCapSeg.bbtnConfirmarClick(Sender: TObject);
var sSql,
    sIdLayout: string;
    iIdCapSeg: Integer;

begin
  inherited;
  sIdLayout:=qryTpLayout.FieldByName('IdLayout').AsString;
  With qryCpLayout do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM CPLAYOUT'+
            ' WHERE IDLAYOUT = '+sIdLayout+
            ' ORDER BY IDCPLAYOUT');
    Open;
    If IsEmpty then
    begin
      Close;
      MsgDlg('ERRO! '+#13+'NÃO FORAM CADASTRADOS OS CAMPOS DO LAYOUT.',
              'Erro',mtError,[mbOk,mbHelp],0);
      Exit;
    end;
  end; {With}

  If OkFields then
  begin
    OpenDialog.execute;
    If FileExists(OpenDialog.FileName) then
    begin
      Try
       AssignFile(FArq,OpenDialog.FileName);
       Reset(FArq);
       Repeat
         ReadLn(FArq,sLinha);
         If CamposInseridosVar then
         begin
           iIdCapSeg:= LeUltRegistro(nil,'CAPSEGASS');
           If not dtmBaseDados.dbBaseDados.InTransaction then
             dtmBaseDados.dbBaseDados.StartTransaction;
           sSql:='INSERT INTO CAPSEGASS (IDCAPSEGASS,'+
                   sCpIns+') VALUES ('+IntToStr(iIdCapSeg)+','+sVlIns+')';
           With qryIns do
           begin
             Close;
             SQL.Clear;
             SQL.Add(sSqL);
             try
               ExecSQL;
             except
               dtmBaseDados.dbBaseDados.Rollback;
               MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
                       'Erro',mtError,[mbOk,mbHelp],0);
               Abort;
             end;
             dtmBaseDados.dbBaseDados.Commit;
           end; {With}
         end; {CamposInseridosVar}
       Until(Eof(FArq));
       CloseFile(FArq);
      except
        MsgDlg('Ocorreu um erro. Operação será cancelada.',
                       'Erro',mtError,[mbOk,mbHelp],0);
        Abort;
      end;
    end; {FileExists}
  end else MsgDlg('Layout não está correto!','Erro',mtError,[mbOk,mbHelp],0);
  MsgDlg('Importação Concluida!','Erro',mtError,[mbOk,mbHelp],0);
  bbtnConfirmar.Enabled:=False;
end;

procedure TfrmImportCapSeg.bbtnSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

end.
