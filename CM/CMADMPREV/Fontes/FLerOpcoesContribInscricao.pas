unit FLerOpcoesContribInscricao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TEdNum;

type
  TfrmLerOpcoesContribInscricao = class(TfrmOkCancelar)
    lblNomeContrib: TLabel;
    lblOp1: TLabel;
    lblOp2: TLabel;
    lblOp3: TLabel;
    edOp1: TEditNum;
    edOp2: TEditNum;
    edOp3: TEditNum;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edOp1Exit(Sender: TObject);
    procedure edOp2Exit(Sender: TObject);
    procedure edOp3Exit(Sender: TObject);
  private
    { Private declarations }

    function ValidaOpcoes(sOp : Char) : boolean;
  public
    { Public declarations }

    sSQLRegraValidaOpInsc,
    sRegraValidOp1, sRegraValidOp2, sRegraValidOp3 : string;
    bAlgumaOpcaoInvalida                           : boolean;
  end;

var
  frmLerOpcoesContribInscricao: TfrmLerOpcoesContribInscricao;

implementation

Uses UMensErro, UDataBase, USistema, UAdmPrev;

{$R *.DFM}

procedure TfrmLerOpcoesContribInscricao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// inherited;
// Esta em comentario para  o padrao nao dar um free no form
end;


function  TfrmLerOpcoesContribInscricao.ValidaOpcoes(sOp : Char) : boolean;
var bErroRegra   : boolean;
    sOpcao, sSQL : string;
begin
   Result      := False;

   bAlgumaOpcaoInvalida := False;

   if (edOp1.Text <> '') and (sOp = '1')
   then begin            // Validar Opcao1
     sOpcao := OraNumero(edOp1.Text);

     sSQL :=  sSQLRegraValidaOpInsc+', '+sOpcao+' AS VALORBASE1 FROM DUAL ';
     if (Trim(sRegraValidOp1) <> '') and
        (not RegraBooleana(sRegraValidOp1,sSQL,bErroRegra))
     then begin
        if not bErroRegra
        then MsgDlg(' Opção 1 não satisfaz as condições necessárias.','Informação',mtInformation,[mbOk,mbHelp],0)
        else MsgDlg(' Erro na Execução da Regra de Validação da Opção 1.','Informação',mtInformation,[mbOk,mbHelp],0);
        bAlgumaOpcaoInvalida := True;
        edOp1.SetFocus;
        Exit;
     end;
   end;

   if (edOp2.Text <> '') and (sOp = '2')
   then begin // Validar Opcao2
     sOpcao := OraNumero(edOp2.Text);
     sSQL :=  sSQLRegraValidaOpInsc+', '+sOpcao+' AS VALORBASE2 FROM DUAL ';
     if (Trim(sRegraValidOp2) <> '') and
        (not RegraBooleana(sRegraValidOp2,sSQL,bErroRegra))
     then begin  // Regra de validacao não satisfeita
        if not bErroRegra
        then MsgDlg(' Opção 2 não satisfaz as condições necessárias.','Informação',mtInformation,[mbOk,mbHelp],0)
        else MsgDlg(' Erro na Execução da Regra de Validação da Opção 2.','Informação',mtInformation,[mbOk,mbHelp],0);
        bAlgumaOpcaoInvalida := True;
        edOp2.SetFocus;
        Exit;
     end;
   end;

   if (edOp3.Text <> '') and (sOp = '3')
   then begin    // Validar Opcao3
     sOpcao := OraNumero(edOp3.Text);
     sSQL :=  sSQLRegraValidaOpInsc+', '+sOpcao+' AS VALORBASE3 FROM DUAL ';
     if (Trim(sRegraValidOp3) <> '') and
        (not RegraBooleana(sRegraValidOp3,sSQL,bErroRegra))
     then begin // Regra de validacao não satisfeita
        if not bErroRegra
        then MsgDlg(' Opção 3 não satisfaz as condições necessárias.','Informação',mtInformation,[mbOk,mbHelp],0)
        else MsgDlg(' Erro na Execução da Regra de Validação da Opção 3.','Informação',mtInformation,[mbOk,mbHelp],0);
        bAlgumaOpcaoInvalida := True;
        edOp3.SetFocus;
        Exit;
     end;
   end;
   Result := True;
end; //ValidaOpcoes

procedure TfrmLerOpcoesContribInscricao.edOp1Exit(Sender: TObject);
begin
  inherited;
  if not ValidaOpcoes('1')
  then Exit;
end;

procedure TfrmLerOpcoesContribInscricao.edOp2Exit(Sender: TObject);
begin
  inherited;
  if not ValidaOpcoes('2')
  then Exit;
end;

procedure TfrmLerOpcoesContribInscricao.edOp3Exit(Sender: TObject);
begin
  inherited;
  if not ValidaOpcoes('3')
  then Exit;
end;

end.
