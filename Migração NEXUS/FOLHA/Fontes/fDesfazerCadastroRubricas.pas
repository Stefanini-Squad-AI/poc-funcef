//***************************************************************************************
//Nº SOL:            192827
//Nº KINTANA         1835455
//Data da Alteração: 25/02/2014
//Alteração Form:    Modificações na rotina de validação do arquivo
//Responsável:       William Santana
//Descrição:         Criação da funcionalidade Rubricas Individuais Em Lote
//**************************************************************************************

unit fDesfazerCadastroRubricas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, DBaseDados, UMensErro;

type
  TfrmDesfazerCadastroRubricas = class(TfrmOkCancelar)
    edtArquivo: TEdit;
    btnAbrirArquivo: TSpeedButton;
    dialog: TOpenDialog;
    Label1: TLabel;
    qryDelete: TwwQuery;
    qryAux: TwwQuery;
    procedure btnAbrirArquivoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesfazerCadastroRubricas: TfrmDesfazerCadastroRubricas;

implementation

{$R *.DFM}

procedure TfrmDesfazerCadastroRubricas.btnAbrirArquivoClick(
  Sender: TObject);
begin
  inherited;
  // Pegando o arquivo
  dialog.Filter := '*.txt|*.txt';
  if not dialog.Execute then
    exit
  else
    edtArquivo.Text:= ExtractFilePath(dialog.FileName) + ExtractFileName(dialog.FileName);
end;

procedure TfrmDesfazerCadastroRubricas.bbtnConfirmarClick(Sender: TObject);
var
  Arquivo : TStrings;
  arq : TextFile;
  x, i, qtde : integer;
  linha, IdPessoa, SeqRubricaIndiv, IdProvento : String;
begin
  if Trim(edtArquivo.Text) <> '' then
    begin
      Arquivo := TStringList.Create ;
      AssignFile(arq, dialog.FileName);
      Reset(arq);
      while not eof (arq) do
        begin
          readln(arq, linha);
          if (Trim(linha) <> '') and (Pos('Fim',linha) = 0) and (Pos('Log',linha) = 0) and (Pos('IDPESSOA',linha) = 0) then
            Arquivo.Add(linha);
        end;

      x := Arquivo.Count - 1;

      if not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

      linha := '';
      qtde := 0;
      Try
        for i := 0 to x do
          begin
            linha := StringReplace(Arquivo.Strings[i],';','     ',[rfReplaceAll]);

            IdPessoa        := Trim(copy(linha,1,8));
            SeqRubricaIndiv := Trim(copy(linha,9,5));

            // Pegando o IDPROVENTO
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT P.IDPROVENTO FROM PROVDESC P ' +
                           'WHERE P.FLGTPRUBRICA LIKE ''%B%'' ' +
                           'AND P.FLGESTADORUB <> 2 ' +
                           'AND P.CODPROVDESC = ' + QuotedStr(Trim(copy(linha,14,12))));
            qryAux.Open;

            if not qryAux.IsEmpty then
              begin
                IdProvento := qryAux.FieldByName('IDPROVENTO').AsString;

                // Verificando se essa Rubrica já foi excluída
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.Add('SELECT IDRUBRICA FROM RUBRICAINDIV ' +
                               'WHERE IDPESSOA = ' + IdPessoa +
                               ' AND SEQRUBRICAINDIV = ' + SeqRubricaIndiv +
                               ' AND IDRUBRICA = ' + IdProvento);
                qryAux.Open;

                if not qryAux.IsEmpty then
                  begin
                    qryDelete.Close;
                    qryDelete.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdPessoa);
                    qryDelete.ParamByName('SEQRUBRICAINDIV').AsFloat := StrToFloat(SeqRubricaIndiv);
                    qryDelete.ParamByName('IDRUBRICA').AsFloat := StrToFloat(IdProvento);
                    qryDelete.ExecSQL;

                    qtde := qtde + 1;
                  end;
              end;
          end;

        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Commit;

        if qtde = 0 then
          MsgDlg('Não existem registros a serem excluídos.','Atenção',mtInformation,[mbOk],0)
        else
          MsgDlg('Os registros foram excluídos com sucesso.','Atenção',mtInformation,[mbOk],0);

        Arquivo.Free;
        Close;
      Except
       if dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Rollback;
      end;
    end;
end;

//Início - William Santana SOL SOL 192827 - KIN 1835455;
procedure TfrmDesfazerCadastroRubricas.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edtArquivo.clear;
end;
//Término - William Santana SOL SOL 192827 - KIN 1835455;
end.
