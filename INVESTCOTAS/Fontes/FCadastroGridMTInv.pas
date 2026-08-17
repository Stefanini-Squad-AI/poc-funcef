//******************************************************************************
// Autor     : Fabio Fagundes
// Data      : 19/07/2007
// Código    : AL_5
// Pendencia :
// SOL       :
// Desc      : Acerto no refresh após inserir e cancelar
//*****************************************************************************
//Autor     : Marco Turon
//Data	    : 04/12/2006
//Código    : Al_4
//Pendencia : 22984
//SOL       :
//Motivo(S) : Ajusta bugs do padrão
//            para funcionamento correto da nova tela de Transferência de Custódia
//*****************************************************************************
//Autor     : Marco Turon
//Data	    : 05/09/2006
//Código    : Al_3
//Pendencia :
//SOL       :
//Motivo(S) : Ajusta o tamanho do frame na evento OnShow também
//********************************************************************************************************
// Autor    : Marco Turon
// Data     : 28/03/2006
// Código   : AL_2
// Motivo   : Implementação do separador de linhas no grid
//            Implementação de Colunas fixaveis pelo usuário
//            Rezise do form pelo tamanho relativo ao form principal
//            Implementação de Frame de progresso defaul no rodapé do form
//********************************************************************************************************
// Autor    : Fabio Fagundes
// Data     : 14/11/2005
// Código   : AL_1
// Motivo   : Controle do processo de abertura
//********************************************************************************************************

unit FCadastroGridMTInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, uCtrlPadroes, uCMTypes,
  fcLabel, Menus, faMensagem;

type
  TFrmCadastroGridMTInv = class(TFrmCadastroGridMT)
    CdsAux: TCMClientDataSet;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    pmnuFixaColunas: TPopupMenu;
    FixarColuna1: TMenuItem;
    LiberarColuna1: TMenuItem;
    N1: TMenuItem;
    LiberaTodasasColunas1: TMenuItem;
    fraMens: TfraMensagem;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pmnuFixaColunasPopup(Sender: TObject);
    procedure FixarColuna1Click(Sender: TObject);
    procedure LiberarColuna1Click(Sender: TObject);
    procedure LiberaTodasasColunas1Click(Sender: TObject);
    procedure dbGrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure FormResize(Sender: TObject);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    //AL_5
    procedure bbtnCancelarClick(Sender: TObject);

  protected
    procedure FazerRefresh; virtual;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroGridMTInv: TFrmCadastroGridMTInv;

implementation

uses uMensErro;

{$R *.DFM}

procedure TFrmCadastroGridMTInv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then     //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TFrmCadastroGridMTInv.FazerRefresh;
begin
  { o inherited deste método deve estar sempre no final da instrução }
  if (not Cds.IsEmpty) then
    if CmeCadastro.Operacao in [OpIdle, OpVazio] then begin
      CmeCadastro.Operacao := OpIdle;
      CmeCadastro.AtualizaBotoes (self);
    end;
end;

procedure TFrmCadastroGridMTInv.FormCreate(Sender: TObject);
begin
   // AL_2 - Maximiza a tela caso ela não caiba na área de trabalho do form principal
   if (TForm(Sender).Height > Application.MainForm.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > Application.MainForm.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

   inherited;

   if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
      TForm(Sender).Caption := 'Cadastro';
end;

procedure TFrmCadastroGridMTInv.dbGrdDblClick(Sender: TObject);
begin
  inherited;
  if not Cds.IsEmpty then sbtnAlterarClick( Self );
end;

procedure TFrmCadastroGridMTInv.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  //AL_4 - bug do padrão
  if not Cds.IsEmpty then
    if (Cds.State = dsbrowse) then Cds.Edit;
end;

procedure TFrmCadastroGridMTInv.CmeCadastroInsert(Sender: TObject);
begin
  //AL_4 - bug do padrão
  Cds.Close;
  Cds.CreateDataSet;
  inherited;

end;

procedure TFrmCadastroGridMTInv.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  //AL_4 - bug do padrão
  if CmeCadastro.Operacao = OpInserir then
    CmeCadastro.Operacao := opIdle;
  FazerRefresh;
end;

procedure TFrmCadastroGridMTInv.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  //AL_4 - bug do padrão
  FazerRefresh;
end;

procedure TFrmCadastroGridMTInv.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  //AL_4 - bug do padrão
  FazerRefresh;
end;

procedure TFrmCadastroGridMTInv.FormShow(Sender: TObject);
begin
   //AL_3
   fraMens.Width := (TForm(Sender).Width - 345);
   fraMens.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 345)/2);
   inherited;
   fraMens.Apaga;
   pnlControles.SendToBack;
   if not cds.IsEmpty then
   begin
      sbtnAlterar.Enabled := True;
      sbtnApagar.Enabled := True;
      dbGrd.SelectedIndex := 1;
   end;
   //AL_4 - bug do padrão
   FazerRefresh;
end;

procedure TFrmCadastroGridMTInv.pmnuFixaColunasPopup(Sender: TObject);
begin
  inherited;
  if TPopupMenu(Sender).PopupComponent.ClassNameIs('TwwDBGrid') then
  begin
     if TwwDBGrid(TPopupMenu(Sender).PopupComponent).DataSource.DataSet.Active then
     begin
        if TwwDBGrid(TPopupMenu(Sender).PopupComponent).FixedCols = 0 then
        begin
           LiberarColuna1.Enabled := False;
           LiberaTodasasColunas1.Enabled := False;
        end
        else
        begin
           LiberarColuna1.Enabled := True;
           LiberaTodasasColunas1.Enabled := True;
        end;

        if TwwDBGrid(TPopupMenu(Sender).PopupComponent).FixedCols = TwwDBGrid(TPopupMenu(Sender).PopupComponent).GetColCount then
           FixarColuna1.Enabled := False
        else
           FixarColuna1.Enabled := True;
     end
     else
     begin
        LiberarColuna1.Enabled := False;
        LiberaTodasasColunas1.Enabled := False;
        FixarColuna1.Enabled := False
     end;
   end;
end;

procedure TFrmCadastroGridMTInv.FixarColuna1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(FixarColuna1.Parent.Owner).PopupComponent).FixedCols := TwwDBGrid(TPopupMenu(FixarColuna1.Parent.Owner).PopupComponent).FixedCols + 1;
end;

procedure TFrmCadastroGridMTInv.LiberarColuna1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(FixarColuna1.Parent.Owner).PopupComponent).FixedCols := TwwDBGrid(TPopupMenu(FixarColuna1.Parent.Owner).PopupComponent).FixedCols -1;
end;

procedure TFrmCadastroGridMTInv.LiberaTodasasColunas1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(FixarColuna1.Parent.Owner).PopupComponent).FixedCols := 0;
end;

procedure TFrmCadastroGridMTInv.dbGrdCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
//  inherited;

  // faz com que as linhas do grid tenham cores alternadas, exceto a linha selecionada

  // Se a Celula atual pertence a linha selecionada
  if (Sender as TwwDBGrid).CalcCellRow = (Sender as TwwDBGrid).GetActiveRow then
  begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end
  else
  begin
     // Se a celula atual não está selecionada nem fixada
     if (not (gdSelected in State)) and (not (gdFixed in State)) then
     begin
        if not Highlight then
        begin
           // linhas ímpares = amarelo, linhas pares = branco
           if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
              ABrush.Color := $00C0FFFF // amarelo bebê
           else
              ABrush.Color := clWhite;
        end;
     end
     else
     // Se a celula atual é a selecionada
     if State = [gdSelected] then
     begin
        ABrush.Color := clHighLight;
        AFont.Color  := clHighLightText;
     end;
  end;
end;

procedure TFrmCadastroGridMTInv.FormResize(Sender: TObject);
begin
   inherited;
   //AL_3
   fraMens.Width := (TForm(Sender).Width - 345);
   fraMens.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 345)/2);
end;

procedure TFrmCadastroGridMTInv.dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  //AL_4 - Não previsto no padrão
  { aqui que vc programa a ordenação do grid - programar no filho
    ex:
    Cds.IndexFiedName := aFiedName; }
end;

//AL_5
procedure TFrmCadastroGridMTInv.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   FazerRefresh;
end;

end.
