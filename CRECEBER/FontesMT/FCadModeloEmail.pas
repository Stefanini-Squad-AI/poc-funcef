{
--------------------------------------------------------------------------------

      TELA PARA CADASTRO DE MODELO DE E-MAIL

              Módulo          :  ContasaReceber
              Autor           :  Helio Lima Custodio
              Data de Término :  29/06/2015
              SOL             :  253577/17359
              PPM             :  842402

--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}
unit FCadModeloEmail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, DBCtrls;

type
  TFrmCadModeloEmail = class(TfrmCadastroCS)
    GrpInfoEmail: TGroupBox;
    GrpCorpoEmail: TGroupBox;
    Label1: TLabel;
    txtDescModelo: TDBEdit;
    txtAssunto: TDBEdit;
    LblAssuntoEmail: TLabel;
    LblCaixaSaida: TLabel;
    txtCaixaSaida: TDBEdit;
    lblCopiaOculta: TLabel;
    txtCopiaOculta: TDBEdit;
    lblTags: TLabel;
    cmbTags: TComboBox;
    bntTag: TBitBtn;
    lblCorpoEmail: TLabel;
    txtCorpoEmail: TDBMemo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bntTagClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaDados(idModelo : Integer);
    procedure InsereTagSelecionada;
    procedure InsertTextoNoCursor(str: string; Amemo: TDBMemo);
    function VerificaPreenchimento:Boolean;
    function ValidaEMails : Boolean;
  public
    { Public declarations }
  end;

var
  FrmCadModeloEmail: TFrmCadModeloEmail;

implementation

uses uVerificaPreenchimento, uMensErro, USistema, UEmailUtil;

{$R *.DFM}

procedure TFrmCadModeloEmail.FormShow(Sender: TObject);
begin
  inherited;
  qry.Open;
end;

procedure TFrmCadModeloEmail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qry.Close;
end;

procedure TFrmCadModeloEmail.CmeCadastroFind(Sender: TObject);
var
    idModelo : Integer;
begin
  inherited;

  if MontaSelect.RetornouValor then
  begin
         idModelo := StrToInt(MontaSelect.ValoresChave[0]);
         CarregaDados(idModelo);
  end;
end;

procedure TFrmCadModeloEmail.CarregaDados(idModelo : Integer);
begin
       qry.Close;
       qry.ParamByName('IDMODELOEMAIL').AsInteger := idModelo;
       qry.Open;
end;

procedure TFrmCadModeloEmail.bbtnConfirmarClick(Sender: TObject);
begin

  if (VerificaPreenchimento) and
     (ValidaEMails) then
       inherited;
      
end;

function TFrmCadModeloEmail.VerificaPreenchimento:Boolean;
var
     ModeloPreenchido,
     AssuntoPreenchido,
     CaixaSaidaPreenchido : Boolean;
     qtNaoPreenchidos : Integer;
     ctrNaoPreenchido : TWinControl;
begin

   try

      qtNaoPreenchidos := 0;
      ModeloPreenchido := True;
      AssuntoPreenchido := True;
      CaixaSaidaPreenchido := True;


      if length(trim(txtCaixaSaida.Text)) = 0 then
      begin
         CaixaSaidaPreenchido := False;
         Inc(qtNaoPreenchidos);
         ctrNaoPreenchido := txtCaixaSaida;
      end;

      if length(trim(txtAssunto.Text)) = 0 then
      begin
         AssuntoPreenchido := False;
         Inc(qtNaoPreenchidos);
         ctrNaoPreenchido := txtAssunto;
      end;

      if length(trim(txtDescModelo.Text)) = 0 then
      begin
         ModeloPreenchido := False;
         Inc(qtNaoPreenchidos);
         ctrNaoPreenchido := txtDescModelo;
      end;




      if qtNaoPreenchidos > 1 then
         raise EValidacao.CreateVal('Faltam dados para gravação do modelo.', ctrNaoPreenchido);

      if Not ModeloPreenchido  then
         raise EValidacao.CreateVal('Modelo do E-mail é um campo obrigatório. Favor Verificar.', txtDescModelo);

      if Not AssuntoPreenchido then
         raise EValidacao.CreateVal('Assunto é um campo obrigatório. Favor verificar.', txtAssunto);

      if Not CaixaSaidaPreenchido then
         raise EValidacao.CreateVal('Caixa de saída é um campo obrigatório. Favor verificar.', txtCaixaSaida);


   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Result := False;
         Exit;
      end;
   end;

   Result := True;
end;

function TFrmCadModeloEmail.ValidaEMails : Boolean;
begin

   try
      if Length(Trim(txtCaixaSaida.Text)) > 0 then
         if Not EmailUtil.EmailValido(txtCaixaSaida.Text) then
             raise EValidacao.CreateVal('O e-mail cadastrado não é válido. Favor verificar.', txtCaixaSaida);



   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Result := False;
         Exit;
      end;
   end;

   Result := True;
end;


procedure TFrmCadModeloEmail.bntTagClick(Sender: TObject);
begin
  inherited;
  InsereTagSelecionada;
end;

procedure TFrmCadModeloEmail.InsereTagSelecionada;
var
    tag : String;
begin
        tag := '';

        case cmbTags.ItemIndex of
           0 : tag := '<NOMEPARTICIPANTE>';
           1 : tag := '<MATRICULAPARTICIPANTE>';
           2 : tag := '<DATAVENCIMENTO>';
        end;


        InsertTextoNoCursor(tag, txtCorpoEmail);
end;

procedure TFrmCadModeloEmail.InsertTextoNoCursor(str: string; Amemo: TDBMemo);
var 
  Str1: string;
  i, ui: Integer;
begin
  ui   := Length(Amemo.Lines[Amemo.CaretPos.y]);
  str1 := Amemo.Lines[Amemo.CaretPos.y];
  if Pos('<$Cursor$>', str) > 0 then
  begin
    i   := Pos('<$Cursor$>', str);
    str := StringReplace(str, '<$Cursor$>', '', [rfReplaceAll, rfIgnoreCase]);
    i   := i - 1 + ui;
  end
  else
    i := -30;
  Insert(str, Str1, Amemo.CaretPos.x + 1);
  Amemo.Lines[Amemo.CaretPos.y] := str1;
  if i <> -30 then
  begin
    Amemo.SelStart := Amemo.Perform(EM_LINEINDEX, Amemo.CaretPos.y, 0) + i;
    Amemo.SetFocus;
  end;
end;

end.
