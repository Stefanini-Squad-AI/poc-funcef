{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES
--------------------------------------------------------------------------------
Pendência   : SIG113828
Responsável : Ewerton Beltramini
Data        : 24/02/2020
Descrição   : Criação de campo novo e alteração do layout do arquivo de importação. Campo para "Informações Complementares".
-------------------------------------------------------------------------------
Pendência   : SIG94153
Responsável : Ewerton Beltramini
Data        : 21/11/2019
Descrição   : Criação de form para importação de dados de eventos de cobrança.
-------------------------------------------------------------------------------}

unit FImportacaoIRHabitacional;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  fcButton, fcImgBtn, fcShapeBtn, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uMensErro,dBaseDados, UDataBase,
  SdfData, Spin, ADODB, ComObj;

type
  TFrmImportacaoIRHabitacional = class(TfrmOkCancelar)
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
    tblArquivo: TSdfDataSet;
    EdtNum: TSpinEdit;
    Label1: TLabel;
    procedure btnLimpaArquivoClick(Sender: TObject);
    procedure btnAbreArquivoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FazerRefresh;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImportacaoIRHabitacional: TFrmImportacaoIRHabitacional;

implementation

{$R *.DFM}

procedure TFrmImportacaoIRHabitacional.btnLimpaArquivoClick(Sender: TObject);
begin
  inherited;
  edtArquivo.Clear;
  memArquivo.Clear;
end;

procedure TFrmImportacaoIRHabitacional.btnAbreArquivoClick(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
     edtArquivo.Text := OpenDialog.FileName;
end;

procedure TFrmImportacaoIRHabitacional.bbtnConfirmarClick(Sender: TObject);
var
excel :variant;
ilinha,icoluna: integer;
bSair : boolean;
sSaldoanterior, sSaldoatual, sSaldoinadant, sSaldoinadatual, sValorespagos, sCpf, sInfComplementares : String;

begin
  inherited;

  if (edtArquivo.Text = '') then
  begin
       MsgDlg('É necessário selecionar o arquivo para carregar as informações.', 'Empréstimo', mtWarning, [mbOK], 0);
       Exit;
  end;

  if (IntToStr(edtNum.value) = '') then
  begin
       MsgDlg('É necessário informar o Ano de referência.', 'Empréstimo', mtWarning, [mbOK], 0);
       Exit;
  end;

  memArquivo.Lines.Add('Carregando os dados para importação...');

  try
       qry.sql.clear;
       qry.Sql.Add('Select count(*) as contador from cm.informefinanhab where anoinforme = ' + IntToStr(EdtNum.Value));
       qry.open;

       if qry.FieldByName('contador').AsInteger > 0 then
       begin
             If (MsgDlg('Deseja excluir as informações já importadas do Ano de ' + IntToStr(EdtNum.value) + '?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
             Begin
                  memArquivo.Lines.Add('Deseja excluir as informações já importadas do Ano de ' + IntToStr(EdtNum.value) + '? - Sim.' );
                  StartTransacao;
                  if dtmBaseDados.dbBaseDados.InTransaction then
                  begin
                        try
                           qryDel.sql.clear;
                           qryDel.Sql.Add('Delete cm.informefinanhab where anoinforme = ' + IntToStr(EdtNum.Value));
                           qryDel.ExecSQL;
                           dtmBaseDados.dbBaseDados.Commit;
                        Except
                           dtmBaseDados.dbBaseDados.RollBack;
                           MsgDlg('Não foi possível excluir os dados referentes ao ano selecionado.','Empréstimo',mtError,[mbOk],0);
                        end;
                  end;
                  memArquivo.Lines.Add('Dados do Ano de ' + IntToStr(EdtNum.value) + ' excluídos com sucesso!');
             end;
       end;

      Excel := CreateOleObject('Excel.Application');
      Excel.Visible := False;
      Excel.WorkBooks.Add(OpenDialog.FileName);

      memArquivo.Lines.Add('Lendo e importando os dados do arquivo informado...');

      StartTransacao;
      iLinha := 2;
      bSair := True;
      while bSair do
      begin
              memArquivo.Lines.Add('--> Matricula: '          +  Trim(Excel.Cells.Item[ilinha,1].text) + ' - ' +
                                   'Contrato: '               +  Trim(Excel.Cells.Item[ilinha,2].text) + ' - ' +
                                   'Ano: '                    +  IntToStr(EdtNum.Value) + ' - ' +
                                   'Nome: '                   +  Trim(Excel.Cells.Item[ilinha,3].text));

              if Excel.Cells.Item[ilinha,1].Text <> '' then
              begin
                    //Trantando os valores vindos do excel...
                    sSaldoanterior  := StringReplace(StringReplace(FormatFloat('#.##', Excel.Cells.Item[ilinha,8].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
                    sSaldoatual     := StringReplace(StringReplace(FormatFloat('#.##', Excel.Cells.Item[ilinha,9].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
                    sSaldoinadant   := StringReplace(StringReplace(FormatFloat('#.##', Excel.Cells.Item[ilinha,10].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
                    sSaldoinadatual := StringReplace(StringReplace(FormatFloat('#.##', Excel.Cells.Item[ilinha,11].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
                    sValorespagos   := StringReplace(StringReplace(FormatFloat('#.##', Excel.Cells.Item[ilinha,14].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);

                    sCpf := StringReplace(StringReplace(Trim(Excel.Cells.Item[ilinha,5].Text),'.','',[rfReplaceAll]),'-','',[rfReplaceAll]);
                    sInfComplementares := Trim(Excel.Cells.Item[ilinha,15].Text);  //Ewerton Beltramini - 24/02/2020 - SIG113828

                    if sSaldoanterior = ''     then  sSaldoanterior      := '0';
                    if sSaldoatual = ''        then  sSaldoatual         := '0';
                    if sSaldoinadant = ''      then  sSaldoinadant       := '0';
                    if sSaldoinadatual = ''    then  sSaldoinadatual     := '0';
                    if sValorespagos = ''      then  sValorespagos       := '0';

                    qryInsert.Close;
                    qryInsert.Sql.Clear;
                    qryInsert.Sql.Add('insert into cm.informefinanhab  (matricula, contrato, dataassinatura, saldoanterior, saldoatual, anoinforme, cpf, nomebenef, saldoinadant, saldoinadatual, valorespagos, INFCOMPLEMENT) values (' );
                    qryInsert.Sql.Add(Trim(Excel.Cells.Item[ilinha,1].Text) + ',');
                    qryInsert.Sql.Add(Trim(Excel.Cells.Item[ilinha,2].Text) + ',');
                    qryInsert.Sql.Add(QuotedStr(copy(Excel.Cells.Item[ilinha,6].Text,1,2) + copy(Excel.Cells.Item[ilinha,6].Text,4,2) + copy(Excel.Cells.Item[ilinha,6].Text,7,4)) + ',');
                    qryInsert.Sql.Add(sSaldoanterior + ',');
                    qryInsert.Sql.Add(sSaldoatual + ',');
                    qryInsert.Sql.Add(IntToStr(EdtNum.Value) + ',');
                    qryInsert.Sql.Add(QuotedStr(sCpf) + ',');
                    qryInsert.Sql.Add(Quotedstr(Trim(Excel.Cells.Item[ilinha,3].Text)) + ',');
                    qryInsert.Sql.Add(sSaldoinadant + ',');
                    qryInsert.Sql.Add(sSaldoinadatual + ',');
                    qryInsert.Sql.Add(sValorespagos + ' ,');
                    qryInsert.Sql.Add(QuotedStr(sInfComplementares) + ' )'); //INFCOMPLEMENT   //Ewerton Beltramini - 24/02/2020 - SIG113828
                    qryInsert.ExecSql;
                    iLinha := iLinha + 1;
              end
              else
                  bSair := False;
      end;

      dtmBaseDados.dbBaseDados.Commit;
      memArquivo.Lines.Add('Dados Importados com Sucesso! ' + 'Total de linhas Importadas: ' + IntToStr(iLinha-1));
      Excel.Quit;
      Excel := Unassigned;
      //btnLimpaArquivo.Click;

  Except
       dtmBaseDados.dbBaseDados.Rollback;
       Excel.Quit;
       Excel := Unassigned;
       btnLimpaArquivo.Click;
  end;

end;

procedure TFrmImportacaoIRHabitacional.FormCreate(Sender: TObject);
begin
  inherited;
  EdtNum.value := StrToInt(formatdatetime('yyyy',date));
end;

procedure TFrmImportacaoIRHabitacional.FazerRefresh;
begin
  qry.close;
  qry.open;
end;

end.
