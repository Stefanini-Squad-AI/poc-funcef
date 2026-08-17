{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES
--------------------------------------------------------------------------------
Rotina      : (dfm) memArquivo, bbtnConfirmarClick
Pendência   : SIG111653
Responsável : edilaine
Data        : 10/12/2020
Descrição   : Ajuste para ler corretamente as colunas do arquivo
--------------------------------------------------------------------------------
Pendência   : SIG95096
Responsável : Ewerton Beltramini
Data        : 17/02/2020
Descrição   : Criação de form para alteração em lote das datas de vencimento.
-------------------------------------------------------------------------------}

unit FAlteracaoLoteDataVencimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  fcButton, fcImgBtn, fcShapeBtn, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uMensErro,dBaseDados, UDataBase,
  SdfData, Spin, ADODB, ComObj, wwdbdatetimepicker, CMDateTimePicker,
  Gauges;

type
  TFrmAlteracaoLoteDataVencimento = class(TfrmOkCancelar)
    edtArquivo: TEdit;
    btnAbreArquivo: TBitBtn;
    btnLimpaArquivo: TBitBtn;
    Label2: TLabel;
    qry: TwwQuery;
    ds: TwwDataSource;
    OpenDialog: TOpenDialog;
    memArquivo: TMemo;
    qryUpdate: TwwQuery;
    qryInsert: TwwQuery;
    tblArquivo: TSdfDataSet;
    Label1: TLabel;
    edtDataVencimento: TCMDateTimePicker;
    QryConsulta: TwwQuery;
    gBarradeProgresso: TGauge;
    procedure btnLimpaArquivoClick(Sender: TObject);
    procedure btnAbreArquivoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FazerRefresh;
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bSair : boolean;

  end;

var
  FrmAlteracaoLoteDataVencimento: TFrmAlteracaoLoteDataVencimento;

implementation

{$R *.DFM}

procedure TFrmAlteracaoLoteDataVencimento.btnLimpaArquivoClick(Sender: TObject);
begin
  inherited;
  edtArquivo.Clear;
  memArquivo.Clear;
  bSair := False;
end;

procedure TFrmAlteracaoLoteDataVencimento.btnAbreArquivoClick(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
     edtArquivo.Text := OpenDialog.FileName;
end;

procedure TFrmAlteracaoLoteDataVencimento.bbtnConfirmarClick(Sender: TObject);
var
excel :variant;
ilinha,icoluna, iLinhaAux, iAtualizados: integer;
sContrato, sItem, sDataPrevista, sDataVencimento  : String;
iColContr, iColData, iColItem : integer;   //edilaine SIG111653
begin
  inherited;

  if (edtArquivo.Text = '') then
  begin
       MsgDlg('É necessário selecionar o arquivo para carregar as informações.', 'Empréstimo', mtWarning, [mbOK], 0);
       Exit;
  end;

  if (edtDataVencimento.text = '') then
  begin
       MsgDlg('É necessário informar a Data de Vencimento.', 'Empréstimo', mtWarning, [mbOK], 0);
       Exit;
  end;

  memArquivo.lines.clear;   //edilaine SIG111653
  memArquivo.Lines.Add('Carregando os dados para a Alteração da Data de Vencimento para a data informada: ' + edtDataVencimento.text);

  try
    try
      Excel := CreateOleObject('Excel.Application');
      Excel.Visible := False;
      Excel.WorkBooks.Add(OpenDialog.FileName);

      sDataVencimento := edtDataVencimento.text;
      memArquivo.Lines.Add('Lendo o arquivo e alterando as datas de vencimento para a data informada.');

      //edilaine SIG111653 : inicio
      iColContr := -1;
      iColData  := -1;
      iColItem  := -1;
      icoluna   := 0;
      repeat
        inc(iColuna);

        if (Excel.Cells.Item[1,icoluna].Text <> '') then
        begin
          if (UpperCase(Excel.Cells.Item[1,icoluna].Text) = 'IDCONTRATOEMPTMO') or
             (UpperCase(Excel.Cells.Item[1,icoluna].Text) = 'CONTRATO') then
             iColContr := iColuna
          else if (UpperCase(Excel.Cells.Item[1,icoluna].Text) = 'DATAPREVISTA') or
                  (UpperCase(Excel.Cells.Item[1,icoluna].Text) = 'DATA PREVISTA') then
             iColData := iColuna
          else if (UpperCase(Excel.Cells.Item[1,icoluna].Text) = 'IDITEM') or
                  (UpperCase(Excel.Cells.Item[1,icoluna].Text) = 'ITEM') then
             iColItem := iColuna;
        end;

      until (Excel.Cells.Item[1,icoluna].Text = '') and (Excel.Cells.Item[2,icoluna].Text = '');

      if (iColContr = -1) or (iColData = -1) or (iColItem = -1) then
      begin
       MsgDlg('Arquivo fora do padrão. Verifique!.', 'Empréstimo', mtWarning, [mbOK], 0);
       Exit;
      end;
      //edilaine SIG111653 : fim


      iLinha := 2;
      iLinhaAux := 0;
      iAtualizados := 0;
      bSair := True;
      while bSair do
      begin
              if Excel.Cells.Item[ilinha,1].Text <> '' then
              begin

                    if (iLinhaAux = 0) and (not(dtmBaseDados.dbBaseDados.InTransaction)) then
                       StartTransacao;

                    //edilaine SIG111653 : inicio
                    sContrato        := Trim(Excel.Cells.Item[ilinha, iColContr {4}].text);
                    sItem            := Trim(Excel.Cells.Item[ilinha, iColItem {9}].text);
                    sDataPrevista    := Trim(Excel.Cells.Item[ilinha, iColData {11}].text);
                    //edilaine SIG111653 : fim

                   (*
                    QryConsulta.close;
                    QryConsulta.sql.Clear;
                    QryConsulta.sql.add(' select * from hmeall ');
                    QryConsulta.sql.add(' where IDCONTRATOEMPTMO = ' + sContrato);
                    QryConsulta.sql.add(' and DATAPREVISTA = '       + QuotedStr(sDataPrevista));
                    QryConsulta.sql.add(' and IDITEMEMPTMO = '       + sItem);
                    QryConsulta.sql.add(' and dataefetiva is null and FLGQUITABONOESTORNO = 0');
                    QryConsulta.Open;
                   *)

                    qryUpdate.Close;
                    qryUpdate.Sql.Clear;
                    qryUpdate.Sql.Add(' update hmeall set DATAVENCTO = ' + quotedStr(sDataVencimento));
                    qryUpdate.sql.add(' where IDCONTRATOEMPTMO = ' + sContrato);
                    qryUpdate.sql.add(' and DATAPREVISTA = '       + quotedStr(sDataPrevista));
                    qryUpdate.sql.add(' and IDITEMEMPTMO = '       + sItem);
                    qryUpdate.sql.add(' and dataefetiva is null and FLGQUITABONOESTORNO = 0');
                    qryUpdate.ExecSql;

                    if qryUpdate.RowsAffected > 0 then
                    begin
                       iAtualizados := iAtualizados + 1;
                       memArquivo.Lines.Add('--> Contrato: ' + sContrato + ' - Item: ' + sItem + ' - Data Prevista: ' + sDataPrevista + ' - Data Vencimento: ' + sDataVencimento + ' (Atualizado) - Linha: ' + IntToStr(iLinha));
                       iLinhaAux := iLinhaAux + 1;
                       if iLinhaAux = 50 then
                        begin
                            dtmBaseDados.dbBaseDados.Commit;
                            iLinhaAux := 0;
                        end;
                    end;

                    iLinha := iLinha + 1;
                    application.ProcessMessages;
              end
              else
                    bSair := False;
      end;

      if (iLinhaAux > 0) and (iLinhaAux < 50) then
         dtmBaseDados.dbBaseDados.Commit;
      memArquivo.Lines.Add('-------------------------------------------------------------------------');
      memArquivo.Lines.Add('Total de linhas Processadas: ' + IntToStr(iLinha-1));
      memArquivo.Lines.Add('Total de Datas Alteradas: ' + IntToStr(iAtualizados));

      //Excel.Quit;                   //edilaine SIG111653
      //Excel := Unassigned;          //edilaine SIG111653
      //btnLimpaArquivo.Click;

    Except
       dtmBaseDados.dbBaseDados.Rollback;
       btnLimpaArquivo.Click;
    end;
  //edilaine SIG111653 : inicio
  finally
     Excel.Quit;
     Excel := Unassigned;
  end;
  //edilaine SIG111653 : fim

end;

procedure TFrmAlteracaoLoteDataVencimento.FormCreate(Sender: TObject);
begin
  inherited;
  edtDataVencimento.Text := formatdatetime('dd/mm/yyyy',date);
end;

procedure TFrmAlteracaoLoteDataVencimento.FazerRefresh;
begin
  qry.close;
  qry.open;
end;

procedure TFrmAlteracaoLoteDataVencimento.bbtnSairClick(Sender: TObject);
begin
  inherited;
  bSair := False;
end;

end.
