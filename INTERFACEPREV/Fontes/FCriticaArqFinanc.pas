unit FCriticaArqFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Buttons, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, Wwdatsrc,
  TB97Ctls, ppComm, ppRelatv, ppDB, ppTxPipe, Grids, Wwdbigrd, Wwdbgrid,
  Wwtable, TREdit, TEdNum, DBGrids;

type
  TfrmCriticaArqFinanc = class(TfrmOkCancelar)
    qryPatroCombo: TwwQuery;
    dsPatro: TwwDataSource;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Label24: TLabel;
    edtArquivoTexto: TEdit;
    BitBtn12: TBitBtn;
    sbAbrirTxt: TSpeedButton;
    Dock97Top: TDock97;
    tb97Atalho: TToolbar97;
    ToolbarSep974: TToolbarSep97;
    ToolbarSep977: TToolbarSep97;
    btnProx: TToolbarButton97;
    lblreg: TLabel;
    ToolbarButton972: TToolbarButton97;
    ToolbarSep979: TToolbarSep97;
    tbltxt: TTable;
    bmPatro: TBatchMove;
    tblDbf: TwwTable;
    odTxt: TOpenDialog;
    lbldesc: TLabel;
    btnant: TToolbarButton97;
    ToolbarButton973: TToolbarButton97;
    dstxt: TwwDataSource;
    strlinhas: TStringGrid;
    edlinha: TEditNum;
    qryTxt: TwwQuery;
    procedure sbtndiverganalitClick(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure sbAbrirTxtClick(Sender: TObject);
    procedure btnProxClick(Sender: TObject);
    procedure btnantClick(Sender: TObject);
    procedure LimpaGrid;
    procedure ToolbarButton973Click(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCriticaArqFinanc: TfrmCriticaArqFinanc;
  F : TextFile;
  Linha : String ;
  iLinhaInicial, icontlinhas : LongInt;



implementation

uses uMensErro, fAguarde;

{$R *.DFM}

procedure TfrmCriticaArqFinanc.sbtndiverganalitClick(Sender: TObject);
begin
  inherited;
{ver em que registro está e perguntar se quer reeiniciar ou continuar de onde está}
end;

procedure TfrmCriticaArqFinanc.BitBtn12Click(Sender: TObject);
var sArquivo : String;
    i : integer;
begin
  inherited;

  if trim(edtArquivoTexto.text) = '' then
  begin
     MsgDlg('O arquivo texto deve ser selecionado.','Erro',mtError,[mbOk],0);
     exit;
  end;


  frmaguarde.Mostra('Montando consulta...');

  try
     qrytxt.close;
     tbldbf.close;
     tbltxt.close;
     closefile(f);
  except
  end;

  iLinhaInicial := 1;

  qryTxt.DatabaseName := ExtractFilePath(edtArquivoTexto.text);
  tblTxt.DatabaseName := ExtractFilePath(edtArquivoTexto.text);
  tblTxt.TableName    := ExtractFileName(edtArquivoTexto.text);
  //
  tblDbf.DatabaseName := ExtractFilePath(edtArquivoTexto.text);
  tblDbf.TableName    := 'tmptxt.DBF';
  //


  if edtArquivoTexto.text <> '*.txt' then
  begin


     with TStringList.Create do
     begin
        Add('[' + Copy(ExtractFileName(Trim(edtArquivoTexto.text)), 1,
                  Length(ExtractFileName(Trim(edtArquivoTexto.text))) - 4) + ']');

        Add('Filetype=Fixed');
        Add('CharSet=ascii');


        Add('Field1=LINHA,Char,500,00,1');


        //Salvando o arquivo de Schema(*.sch);
        SaveToFile(Copy(edtArquivoTexto.Text, 1, Length(edtArquivoTexto.Text) - 4) + '.sch');
        Free;
     end;

     //

     Screen.Cursor:=crHourGlass;

     tblTxt.Open;


     Application.ProcessMessages;
     bmPatro.RecordCount := 0;
     try
        bmPatro.Execute;
     except
        MsgDlg('Erro ao abrir arquivo texto causado por inconsistência no'+#13+
               ' cadastro de lay-out. Verifique arquivo de Esquema(sch) gerado'+#13+
               ' no mesmo diretório do arquivo texto.','Erro',mtError,[mbOk],0);
        CloseFile(F);
        frmaguarde.Apaga;
        exit;
     end;


     Application.ProcessMessages;


     Screen.Cursor:=crDefault;
 
     with qryTxt do begin
        SQL.Clear;
        SQL.Add('SELECT DBF.* ');
        SQL.Add('FROM  TMPTXT DBF ');

        Open;
     end;


     icontlinhas := qryTxt.recordcount;

     lbldesc.caption := inttostr(icontlinhas)+' registros';

     if icontlinhas <= 1000 then
     begin
        lblreg.caption := 'Registros entre 1 e '+inttostr(icontlinhas);
        btnProx.enabled := false;
        btnant.enabled := false;
     end
     else
     begin
        lblreg.caption := 'Registros entre 1 e 1000';
        btnProx.enabled := true;
        btnant.enabled := true;
     end;


     btnProxClick(self);

  end;

  frmaguarde.Apaga;

end;



procedure TfrmCriticaArqFinanc.sbAbrirTxtClick(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTexto.Text := odTxt.FileName;

end;

procedure TfrmCriticaArqFinanc.btnProxClick(Sender: TObject);
var i : Integer;
begin
  inherited;

  if (not qrytxt.eof) then LimpaGrid;


  if frmaguarde = nil then
  frmaguarde.Mostra('Montando consulta...');



  if not qrytxt.Eof then  iLinhaInicial := qrytxt.RecNo;


  i := 1;
  while (not qrytxt.eof) and (i <= 1000) do
  begin
     strlinhas.Cells[1,i-1] := qrytxt.FieldByName('linha').AsString;
     strlinhas.Cells[0,i-1] := inttostr(qrytxt.RecNo);
     qrytxt.next;
     inc(i);
  end;

  if qrytxt.eof then
  lblreg.caption := 'Registros entre '+inttostr(iLinhaInicial)+' e '+inttostr(qrytxt.RecNo)
  else
  lblreg.caption := 'Registros entre '+inttostr(iLinhaInicial)+' e '+inttostr(qrytxt.RecNo - 1);

  frmaguarde.Apaga;


end;

procedure TfrmCriticaArqFinanc.btnantClick(Sender: TObject);
var i : Integer;
begin
  inherited;


  frmaguarde.Mostra('Montando consulta...');

  if qrytxt.RecNo - 2000 <= 0 then
  iLinhaInicial := 1
  else iLinhaInicial := qrytxt.RecNo - 2000;


  limpagrid;

  while not  ( qrytxt.RecNo = iLinhaInicial) do qrytxt.prior;

  i := 1;
  while (not qrytxt.eof) and (i <= 1000) do
  begin
     strlinhas.Cells[1,i-1] := qrytxt.FieldByName('linha').AsString;
     strlinhas.Cells[0,i-1] := inttostr(qrytxt.RecNo);
     qrytxt.next;
     inc(i);
  end;


  if qrytxt.eof then
  lblreg.caption := 'Registros entre '+inttostr(iLinhaInicial)+' e '+inttostr(qrytxt.RecNo)
  else
  lblreg.caption := 'Registros entre '+inttostr(iLinhaInicial)+' e '+inttostr(qrytxt.RecNo - 1);
  frmaguarde.Apaga;


end;

procedure TfrmCriticaArqFinanc.LimpaGrid;
var i : Integer;
begin
   for i := 0 to strlinhas.RowCount -1 do
   begin
      strlinhas.Cells[0,i] := '';
      strlinhas.Cells[1,i] := '';
   end;
end;

procedure TfrmCriticaArqFinanc.ToolbarButton973Click(Sender: TObject);
var i : LongInt;
begin
  inherited;
   try
      if icontlinhas <  strtoint(edlinha.text) then
      begin
         MsgDlg('Linha inexistente no arquivo.','Operação impossível',mtInformation,[mbOk],0);
      end;

      frmaguarde.Mostra('Procurando linha...');


      if qrytxt.RecNo > strtoint(edlinha.text) then
      begin
         for i := (qrytxt.RecNo - strtoint(edlinha.text)) downto 1  do  qrytxt.prior;
      end
      else if qrytxt.RecNo < strtoint(edlinha.text) then
      begin
         for i := (strtoint(edlinha.text) - qrytxt.RecNo)  downto 1  do  qrytxt.next;
      end;

      btnProxClick(self);

      frmaguarde.apaga;
   except
   end;

   iLinhaInicial :=  strtoint(edlinha.text);


end;

procedure TfrmCriticaArqFinanc.bbtnSairClick(Sender: TObject);
begin
  inherited;
  try CloseFile(F) except end;
end;



end.
