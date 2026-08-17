unit FAutorizaParametros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBTables;

type
  TfrmAutorizaParametros = class(TfrmOkCancelarInv)
    edtSenha: TEdit;
    Label1: TLabel;
    qry: TQuery;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    iTentativa: Byte;
  public
    { Public declarations }
  end;

var
  frmAutorizaParametros: TfrmAutorizaParametros;

implementation

{$R *.DFM}

uses UMensErro, USistema, fParamInvest;

procedure TfrmAutorizaParametros.bbtnCancelarClick(Sender: TObject);
begin
   edtSenha.Clear;
   if edtSenha.CanFocus then edtSenha.SetFocus;
end;

procedure TfrmAutorizaParametros.bbtnConfirmarClick(Sender: TObject);
var sSenha: String;
    Year, Month, Day: Word;
    Hour, Min, Sec, MSec: Word;
    FatorCalc : integer;
begin
   try

      //---Renan Cristiano KT 523214 SOL 74654 início.
      //Alteração da metodologia de cálculo da senha solicitada para alterar os parâmetros do sistema
      qry.Close;
      qry.Open;
      FatorCalc := strToInt(qry.FieldByName('FATORCALC').AsString);
      //---Renan Cristiano KT 523214 SOL 74654 Fim.
      DecodeDate(Date, Year, Month, Day);
      DecodeTime(Now, Hour, Min, Sec, MSec);
      //---Renan Cristiano KT 523214 SOL 74654 início.
      sSenha := IntToStr((FatorCalc + Day + Hour) * Year);
      //---Renan Cristiano KT 523214 SOL 74654 início.

      if Trim(edtSenha.Text) = sSenha then
      begin
         ModalResult := mrOk;
         inherited;
      end else begin
         if iTentativa < 3 then
         begin
            MsgDlg('A Senha Informada Não Confere, ' + #13 +
                   'Tente Novamente!',
                   'Mensagem do Sistema',
                   MtError,[MbOk],0);
            ModalResult := mrNone;
         end else begin
            MsgDlg('A Senha Informada Não Confere, ' + #13 +
                   'Esta Tela Não Será Liberada para Uso!',
                   'Mensagem do Sistema',
                   MtError,[MbOk],0);
            ModalResult := mrAbort;
         end;
      end;
   finally
      iTentativa := iTentativa + 1;
   end;
end;

procedure TfrmAutorizaParametros.FormShow(Sender: TObject);
begin
  inherited;
  iTentativa := 1;
  lbNomDescricao.Caption := Sistema.NomeUsuario;
  bbtnCancelar.Click;
end;

end.
