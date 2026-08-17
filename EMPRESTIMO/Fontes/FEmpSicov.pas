{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES
--------------------------------------------------------------------------------
Pendência   : SIG95372
Responsável : Ewerton Beltramini
Data        : 19/02/2019
Descrição   : Criação de form para importação de dados do SICOV.
-------------------------------------------------------------------------------}

unit FEmpSicov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  fcButton, fcImgBtn, fcShapeBtn, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uMensErro,dBaseDados, UDataBase,
  SdfData, Spin, ADODB, ComObj, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmEmpSicov = class(TfrmOkCancelar)
    edtArquivo: TEdit;
    btnAbreArquivo: TBitBtn;
    btnLimpaArquivo: TBitBtn;
    Label2: TLabel;
    qry: TwwQuery;
    ds: TwwDataSource;
    OpenDialog: TOpenDialog;
    memArquivo: TMemo;
    qryDel: TwwQuery;
    qryInsert: TwwQuery;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    procedure btnLimpaArquivoClick(Sender: TObject);
    procedure btnAbreArquivoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FazerRefresh;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmpSicov: TFrmEmpSicov;

implementation

uses FCMPrincipalForms;

{$R *.DFM}

procedure TFrmEmpSicov.btnLimpaArquivoClick(Sender: TObject);
begin
  inherited;
  edtArquivo.Clear;
  memArquivo.Clear;
  bbtnConfirmar.Enabled:= True;
    
end;

procedure TFrmEmpSicov.btnAbreArquivoClick(Sender: TObject);
begin
  inherited;
  btnLimpaArquivo.Click;
  if OpenDialog.Execute then
     edtArquivo.Text := OpenDialog.FileName;
end;

procedure TFrmEmpSicov.bbtnConfirmarClick(Sender: TObject);
var

  bSair : boolean;
  ArquivoTxt: textfile;
  slinha: string;
  iContLinha, iCont: Integer;

begin
  inherited;

  if (edtArquivo.Text = '') then
  begin
       MsgDlg('É necessário selecionar o arquivo para carregar as informações.', 'Empréstimo', mtWarning, [mbOK], 0);
       Exit;
  end;

  try

      StartTransacao;
      qry.close;
      qry.sql.clear;
      qry.sql.add('select dataimportacao from cm.EmpSicov where (dataimportacao) > sysdate - 1');
      qry.open;

      if qry.recordcount > 0 then
      begin
          if (MsgDlg('Já existe uma importação realizada no dia de hoje!' + #13 + ' Deseja apagar a importação já realizada?', 'Empréstimo', mtConfirmation, [mbYes,mbNO], 0)  = mrYes) then
          begin
               qryDel.close;
               qryDel.sql.clear;
               qryDel.sql.add('Delete cm.EmpSicov where (dataimportacao) > sysdate - 1');
               qryDel.ExecSql;
          end;
      end;

      AssignFile(ArquivoTxt, edtArquivo.Text);
      Reset(ArquivoTxt);

      memArquivo.Lines.Add('--> Carregando o Arquivo e Processando...');

      iContLinha := 0;
      iCont := 0;

      while not Eof(ArquivoTxt) do
      begin  
           if not dtmBaseDados.dbBaseDados.InTransaction then
              StartTransacao;

           Readln(ArquivoTxt, sLinha);
           if copy(sLinha,1,1) = 'F' then
           begin
                 qryInsert.close;
                 qryInsert.sql.clear;
                 qryInsert.Sql.Add('insert into cm.EmpSicov (DOCAP, AGENCIA, CONTACORRENTE, OPERACAO, DATACREDITO, VALORLIQUIDO, NUMCONTRATO, NOME, CODRETORNO, DATAIMPORTACAO) values (');
                 qryInsert.Sql.Add(QuotedStr(copy(sLinha,2,8)) + ',');   //DocAp
                 qryInsert.Sql.Add(QuotedStr(copy(sLinha,27,4)) + ',');  //AGENCIA
                 qryInsert.Sql.Add(QuotedStr(copy(sLinha,34,9)) + ',');  //CONTACORRENTE
                 qryInsert.Sql.Add(copy(sLinha,31,3) + ',');  //OPERACAO
                 qryInsert.Sql.Add(QuotedStr(copy(sLinha,51,2) + '/' + copy(sLinha,49,2) + '/' + copy(sLinha,45,4)) + ',');  //DATACREDITO
                 qryInsert.Sql.Add((IntToStr(StrToint(copy(sLinha,53,13)))) + '.' + copy(sLinha,66,2) + ','); //VALORLIQUIDO
                 qryInsert.Sql.Add(QuotedStr(copy(sLinha,78,12)) + ','); //NUMCONTRATO
                 qryInsert.Sql.Add(QuotedStr(trim(copy(sLinha,90,40))) + ','); //NOME
                 qryInsert.Sql.Add(copy(sLinha,148,2) + ',');       //CODRETORNO
                 qryInsert.Sql.Add('SysDate');  //CODRETORNO
                 qryInsert.Sql.Add(')');
                 qryInsert.ExecSql;
                 iContLinha := iContLinha + 1;
                 iCont := iCont+1;

                 memArquivo.Lines.Add('--> Contrato: ' + copy(sLinha,78,12) + ' - Linha: ' + IntToStr(iContLinha));
           end;
           if iCont = 10 then
           begin
                dtmBaseDados.dbBaseDados.Commit;
                iCont := 0;
           end;
      end;

      if iCont <> 0 then
      begin
           dtmBaseDados.dbBaseDados.Commit;
           iCont := 0;
      end;

      memArquivo.Lines.Add('Dados Importados com Sucesso! ' + ' Total de linhas Importadas: ' + IntToStr(iContLinha-1));
      bbtnConfirmar.Enabled:= False;
  Except
       dtmBaseDados.dbBaseDados.Rollback;
       memArquivo.Lines.Add('Erro no processamento!');
  end;

end;

procedure TFrmEmpSicov.FazerRefresh;
begin
  qry.close;
  qry.open;
end;

procedure TFrmEmpSicov.BitBtn1Click(Sender: TObject);
begin
  inherited;

  FrmCMPrincipalForms.Relatorios1Click(sender);
  Close;

end;

end.
