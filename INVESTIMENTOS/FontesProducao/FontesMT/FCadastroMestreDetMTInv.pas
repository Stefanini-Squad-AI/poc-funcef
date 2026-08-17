//******************************************************************************
// Autor     : Marco Turon
// Data      : 28/05/2008
// Código    : AL_1
// Pendencia : 26357, 26456, 26577, 27100
// SOL       : 69119, 70156, 71040, 70122
// Desc      : Preparando o padrão do Investimento no modelo
//******************************************************************************
unit FCadastroMestreDetMTInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, fcLabel, UMensErro,
  uCtrlParamInvest, uCtrlInvestimento, uCtrlPadroes, faMensagem;

type
  TFrmCadastroMestreDetMTInv = class(TFrmCadastroMestreDetMT)
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    pnlDados: TPanel;
    sbtnConsDet: TToolbarButton97;
    fraMens: TfraMensagem;
    procedure PintaGridZebrado(Sender: TObject; Field: TField; State:
                               TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure GridRefresh(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnConsDetClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroMestreDetMTInv: TFrmCadastroMestreDetMTInv;

implementation

uses FPrincipal;

{$R *.DFM}

{ TFrmCadastroMestreDetMTInv }

//AL_x
procedure TFrmCadastroMestreDetMTInv.GridRefresh(Sender: TObject);
begin
   // Acerta as cores quando muda a linha da grid
   if Sender is TwwDBGrid then
      TwwDBGrid(Sender).Invalidate;
end;

//AL_x
procedure TFrmCadastroMestreDetMTInv.PintaGridZebrado(Sender: TObject; Field: TField; State: TGridDrawState;
                                                      Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  // Faz com que as linhas do grid tenham cores alternadas, exceto a linha selecionada
  // Se a Celula atual pertence a linha selecionada
  if TwwDBGrid(Sender).CalcCellRow = TwwDBGrid(Sender).GetActiveRow then
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
           if (TwwDBGrid(Sender).CalcCellRow mod 2) = 0 then
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

//AL_x
procedure TFrmCadastroMestreDetMTInv.FormShow(Sender: TObject);
begin
  fraMens.Apaga;
  if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
     TForm(Sender).Caption := 'Cadastro';
  inherited;
end;

//AL_x
procedure TFrmCadastroMestreDetMTInv.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  //Enter - Troca de Campo
  if Key = VK_Return then
     SelectNext(ActiveControl,True,True)
end;

//AL_x
procedure TFrmCadastroMestreDetMTInv.FormCreate(Sender: TObject);
begin
   // Maximiza a tela caso ela não caiba na área de trabalho do form principal
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

   // Ajusta o tamanho do frame de processo
   fraMens.Width := (TForm(Sender).Width - 344);
   fraMens.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 344)/2);

   inherited;
end;

//AL_x
procedure TFrmCadastroMestreDetMTInv.FormClose(Sender: TObject; var Action: TCloseAction);
var i: Integer;
begin
   // Fecha todos os Cds que ficarem abertos
   for i := 0 to TForm(Sender).ComponentCount -1 do
   begin
      if TForm(Sender).Components[i] is TCMClientDataSet then
      begin
         if TCMClientDataSet(TForm(Sender).Components[i]).State <> dsInactive then
            TCMClientDataSet(TForm(Sender).Components[i]).Close;
      end;
      if TForm(Sender).Components[i] is TClientDataSet then
      begin
         if TClientDataSet(TForm(Sender).Components[i]).State <> dsInactive then
            TClientDataSet(TForm(Sender).Components[i]).Close;
      end;
   end;

   inherited;

end;

//AL_x
procedure TFrmCadastroMestreDetMTInv.sbtnInserirClick(Sender: TObject);
var CtrlInv: TCtrlInvestimento;
begin
   try //Finally
      try
         CtrlInv := TCtrlInvestimento.Create;
         CtrlInv.InitializeAs(Padroes);
         if CtrlInv.VerEmAbertura(CtrlPInv.IdTipoInvest) then
            Raise Exception.Create(CtrlInv.MessageInfo);
         inherited;
      except
      on E: Exception do
         MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOK], 0);
      end;
   finally
      FreeAndNil(CtrlInv);
      CmeCadastro.AtualizaBotoes(Sender);
   end;
end;

//AL_x
procedure TFrmCadastroMestreDetMTInv.sbtnAlterarClick(Sender: TObject);
var CtrlInv: TCtrlInvestimento;
begin
   try //Finally
      try
         CtrlInv := TCtrlInvestimento.Create;
         CtrlInv.InitializeAs(Padroes);
         if CtrlInv.VerEmAbertura(CtrlPInv.IdTipoInvest) then
            Raise Exception.Create(CtrlInv.MessageInfo);
         inherited;
      except
      on E: Exception do
         MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOK], 0);
      end;
   finally
      FreeAndNil(CtrlInv);
      CmeCadastro.AtualizaBotoes(Sender);
   end;
end;

//AL_x
procedure TFrmCadastroMestreDetMTInv.sbtnApagarClick(Sender: TObject);
var CtrlInv: TCtrlInvestimento;
begin
   try //Finally
      try
         CtrlInv := TCtrlInvestimento.Create;
         CtrlInv.InitializeAs(Padroes);
         if CtrlInv.VerEmAbertura(CtrlPInv.IdTipoInvest) then
            Raise Exception.Create(CtrlInv.MessageInfo);
         inherited;
      except
      on E: Exception do
         MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOK], 0);
      end;
   finally
      FreeAndNil(CtrlInv);
      CmeCadastro.AtualizaBotoes(Sender);
   end;
end;

//AL_x
procedure TFrmCadastroMestreDetMTInv.sbtnConsDetClick(Sender: TObject);
begin
   if sbtnConsDet.Down then
   begin
      Dock974.Visible := True;
      tb97Detalhe.Visible := True;
      grdAtual.SendToBack;
      bbtnOkDet.Visible := False;
      bbtnCancelarDet.Visible := False;
      bbtnVoltarDet.Enabled := True;
   end
   else
      bbtnVoltarDetClick(Sender);
end;

//AL_x
procedure TFrmCadastroMestreDetMTInv.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   bbtnOkDet.Visible := True;
   bbtnCancelarDet.Visible := True;
   sbtnConsDet.Down := False;
   CmeDetalhe.AtualizaBotoes(Sender);
end;


//AL_x
procedure TFrmCadastroMestreDetMTInv.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
   inherited;
   // Controla o Status do Novo Botão
   sbtnConsDet.Enabled := ((not (grdAtual.DataSource.State in [dsInsert, dsEdit, dsInactive])) and
                           (not (grdAtual.DataSource.DataSet.IsEmpty)) and
                           (Cds.State in [dsInsert, dsEdit]));
end;

//AL_x
procedure TFrmCadastroMestreDetMTInv.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.AtualizaBotoes(Sender);
end;

//AL_x
procedure TFrmCadastroMestreDetMTInv.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.AtualizaBotoes(Sender);
end;

//AL_x
procedure TFrmCadastroMestreDetMTInv.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.AtualizaBotoes(Sender);
end;

//AL_x
procedure TFrmCadastroMestreDetMTInv.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.AtualizaBotoes(Sender);
end;

//AL_x
procedure TFrmCadastroMestreDetMTInv.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.AtualizaBotoes(Sender);
end;

procedure TFrmCadastroMestreDetMTInv.FormResize(Sender: TObject);
begin
   inherited;
   // Ajusta o tamanho do frame de processo
   fraMens.Width := (TForm(Sender).Width - 344);
   fraMens.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 344)/2);
end;

end.
