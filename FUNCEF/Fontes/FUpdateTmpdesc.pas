unit FUpdateTmpdesc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, StdCtrls, Buttons, ComCtrls, Mask;

type
  TfrmUpdateTmpdesc = class(TForm)
    pnlFundo: TPanel;
    dBase: TDatabase;
    Panel1: TPanel;
    btnSair: TBitBtn;
    Label1: TLabel;
    mskAnoMes: TMaskEdit;
    pbProgresso: TProgressBar;
    lblProgresso: TLabel;
    btnProcessar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    qryLoop: TQuery;
    qryupdate: TQuery;
    lblConexao: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
     bCancela : Boolean;
    { Public declarations }
  end;

var

  frmUpdateTmpdesc: TfrmUpdateTmpdesc;

implementation

uses uIntegraPrevRH;

{$R *.DFM}

procedure TfrmUpdateTmpdesc.btnSairClick(Sender: TObject);
begin
   close;   
end;

procedure TfrmUpdateTmpdesc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action := cafree;
end;

procedure TfrmUpdateTmpdesc.btnProcessarClick(Sender: TObject);
var iCont, iMax, icommit : Integer;

begin

   if length(trim(mskAnoMes.text)) < 7 then
   begin
      showmessage('Preencha o mês corretamente!!');
      exit;
   end;

   if not dBase.InTransaction then
   dBase.StartTransaction;

   qryLoop.close;
   qryLoop.parambyname('MES').AsString := mskAnoMes.text ;
   qryLoop.open;

   iCont := 0;
   iCommit := 0;
   iMax := qryloop.recordcount;
   pbProgresso.Max := iMax;
   pbProgresso.Min := 0;
   pbProgresso.Position := 0;
   bCancela := False;


   while (not qryloop.eof) and (not bCancela) do
   begin
      Application.ProcessMessages;
      inc(iCont);
      inc(iCommit);
      lblProgresso.caption := IntToStr(iCont)+' de '+IntToStr(iMax)+' registros.';
      pbProgresso.Position := pbProgresso.Position + 1;


      qryupdate.Close;
      qryupdate.SQL.Clear;
      qryupdate.SQL.Add(' UPDATE TMPDESC SET VALOR = '+oranumero(qryloop.fieldbyname('VALORRECEBIDO').AsString)+' , '+
                        ' VALORRECEBIDO = '+oranumero(qryloop.fieldbyname('VALORRECEBIDO').AsString)+' '+
                        ' WHERE IDPESSJUR = 91008 AND '+
                        ' IDPESSOA = '+quotedstr(qryloop.fieldbyname('IDPESSOA').AsString)+' AND '+
                        ' IDPLANOPREV = '+quotedstr(qryloop.fieldbyname('IDPLANOPREV').AsString)+' AND '+                                                
                        ' MESCOBRANCA = '+quotedstr(qryloop.fieldbyname('MESCOBRANCA').AsString)+' AND '+
                        ' MESREFERENCIA = '+quotedstr(qryloop.fieldbyname('MESREFERENCIA').AsString)+' AND '+
                        ' IDMOTIVO = '+quotedstr(qryloop.fieldbyname('IDMOTIVO').AsString)+' AND '+
                        ' IDMODULO = 32 AND '+
                        ' IDDESCONTO = 21');
      try
         qryupdate.ExecSQL;

      except

         if dBase.InTransaction then
         dBase.Rollback;

         lblProgresso.caption := lblProgresso.caption + ' - PROCESSO CANCELADO POR ERRO';
         raise;
      end;


      if (dBase.InTransaction) and (iCommit >= 500) then
      begin
         dBase.Commit;
         iCommit := 0;

         if not dBase.InTransaction then
         dBase.StartTransaction;
      end;

      qryLoop.next;
   end;

   if bCancela then
   begin
      if dBase.InTransaction then
      dBase.Rollback;

      lblProgresso.caption := lblProgresso.caption + ' - PROCESSO CANCELADO';
   end
   else
   begin
      if dBase.InTransaction then
      dBase.Commit;
   end;


end;

procedure TfrmUpdateTmpdesc.FormCreate(Sender: TObject);
begin
   dBase.KeepConnection := false;
   dBase.LoginPrompt := false;
   dBase.Open;

   lblConexao.caption := 'Conectado em: '+ copy(dBase.Params[0], pos('=',dBase.Params[0]) + 1,length(dBase.Params[0]));   
   
end;

procedure TfrmUpdateTmpdesc.SpeedButton1Click(Sender: TObject);
begin
   bCancela := true;
end;

end.


