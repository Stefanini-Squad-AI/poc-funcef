//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_2
//Pendencia :
//SOL       :
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//*****************************************************************************
// Data     : 04/08/2004
// Código   : AL_1
// Função   :
// Motivo   : Controle do processo de abertura
//*****************************************************************************
//Data	    : 07/05/2004
//Função    :   *  Implementação de botão de consulta
//*******************************************************************************

unit FCadastroMDetCSInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdbedit, Mask, wwdblook, DBCtrls2, TREdit, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, fcLabel;

type
  TfrmCadastroMDetInv = class(TfrmCadMestreDetalheCS)
    qryDetalhe: TwwQuery;
    updDetalhe: TUpdateSQL;
    pnlTitulo: TPanel;
    Bevel1: TBevel;
    lbNomItem: TfcLabel;
    sbtnConsDet: TToolbarButton97;
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtnConsDetClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure StatusNormal;
    procedure StatusIncAlt;
    procedure StatusAlteracao;
  end;

var
  frmCadastroMDetInv: TfrmCadastroMDetInv;

implementation
uses UDataBase, UmensErro, FPrincipal, URendaFixa, URendaVariavel;

{$R *.DFM}


procedure TfrmCadastroMDetInv.sbtnExcluiDetClick(Sender: TObject);
begin
  // AL_2 - Controle do processo de fechamento de renda variável
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end
  else
  // Se for Renda Variável
  if TipoMenuInvest = 'V' then
  begin
     if RendaVariavel.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;
  inherited;
  qryDetalhe.ApplyUpdates;
  qryDetalhe.CommitUpdates;
end;

procedure TfrmCadastroMDetInv.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
   StatusNormal;
end;

procedure TfrmCadastroMDetInv.StatusAlteracao;
begin
  //Fazer
end;

procedure TfrmCadastroMDetInv.StatusIncAlt;
begin
   tbcDetalhe.Enabled := True;
   pgctrlDetalhe.Enabled := True;

   sbtnInsDet.Enabled := False;
   sbtnAltDet.Enabled := False;
   sbtnExcluiDet.Enabled := False;
   sbtnConsDet.Enabled := False;

   bbtnOkDet.Enabled := True;
   bbtnCancelarDet.Enabled := True;
   bbtnVoltarDet.Enabled := True;
   pnlControlesDet.Enabled := True;
end;

procedure TfrmCadastroMDetInv.StatusNormal;
begin
   pnlFundo.Enabled := True;
   pnlMestre.Enabled := True;
   tbcDetalhe.Enabled := True;
   pgctrlDetalhe.Enabled := True;

   sbtnInsDet.Enabled := False;
   sbtnAltDet.Enabled := False;
   if qryDetalhe.IsEmpty then
   begin
      sbtnExcluiDet.Enabled := False;
      sbtnConsDet.Enabled := False;
   end
   else
   begin
      sbtnExcluiDet.Enabled := True;
      sbtnConsDet.Enabled := True;
   end;

   bbtnOkDet.Visible := True;
   bbtnOkDet.Enabled := False;
   bbtnCancelarDet.Visible := True;
   bbtnCancelarDet.Enabled := False;
   bbtnVoltarDet.Enabled := False;

   sbtnConsDet.Down := False;

end;

procedure TfrmCadastroMDetInv.sbtnInsDetClick(Sender: TObject);
begin
  // AL_2 - Controle do processo de fechamento de renda variável
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end
  else
  // Se for Renda Variável
  if TipoMenuInvest = 'V' then
  begin
     if RendaVariavel.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;
  inherited;
  StatusIncAlt;
end;

procedure TfrmCadastroMDetInv.sbtnAltDetClick(Sender: TObject);
begin
  // AL_2 - Controle do processo de fechamento de renda variável
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end
  else
  // Se for Renda Variável
  if TipoMenuInvest = 'V' then
  begin
     if RendaVariavel.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;
  inherited;
  StatusIncAlt;
end;

procedure TfrmCadastroMDetInv.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  QryDetalhe.CancelUpdates;
  StatusNormal;
end;

procedure TfrmCadastroMDetInv.FormShow(Sender: TObject);
begin
  // AL_1
  if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
     TForm(Sender).Caption := 'Cadastro';
  inherited;
  StatusNormal;
end;

procedure TfrmCadastroMDetInv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadastroMDetInv.sbtnConsDetClick(Sender: TObject);
begin
   inherited;
   if sbtnConsDet.Down then
   begin
      Dock974.Visible := True;
      tb97Detalhe.Visible := True;
      pnlControlesDet.BringToFront;
      bbtnOkDet.Visible := False;
      bbtnCancelarDet.Visible := False;
      bbtnVoltarDet.Enabled := True;
   end
   else
      bbtnVoltarDet.Click;
end;

procedure TfrmCadastroMDetInv.dsDetStateChange(Sender: TObject);
begin
   inherited;
    sbtnConsDet.Enabled := ((not (dsDet.State in [dsInsert, dsEdit, dsInactive])) and (not (dsDet.DataSet.IsEmpty)));
end;

procedure TfrmCadastroMDetInv.sbtnInserirClick(Sender: TObject);
begin
  // AL_2 - Controle do processo de fechamento de renda variável
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end
  else
  // Se for Renda Variável
  if TipoMenuInvest = 'V' then
  begin
     if RendaVariavel.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;

  inherited;

end;

procedure TfrmCadastroMDetInv.sbtnAlterarClick(Sender: TObject);
begin
  // AL_2 - Controle do processo de fechamento de renda variável
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end
  else
  // Se for Renda Variável
  if TipoMenuInvest = 'V' then
  begin
     if RendaVariavel.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;

  inherited;

end;

procedure TfrmCadastroMDetInv.sbtnApagarClick(Sender: TObject);
begin
  // AL_2 - Controle do processo de fechamento de renda variável
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end
  else
  // Se for Renda Variável
  if TipoMenuInvest = 'V' then
  begin
     if RendaVariavel.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;

  inherited;

end;

procedure TfrmCadastroMDetInv.FormCreate(Sender: TObject);
begin
   // AL_1 - Maximiza a tela caso ela não caiba na área de trabalho do form principal
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
   inherited;
end;

procedure TfrmCadastroMDetInv.FormClose(Sender: TObject; var Action: TCloseAction);
var i: Word;
begin
   // AL_1 - Fecha todas as queries que ficarem abertas
   for i := 0 to TForm(Sender).ComponentCount -1 do
   begin
      if TForm(Sender).Components[i] is TwwQuery then
      begin
         if TwwQuery(TForm(Sender).Components[i]).State <> dsInactive then
            TwwQuery(TForm(Sender).Components[i]).Close;
      end;
      if TForm(Sender).Components[i] is TQuery then
      begin
         if TQuery(TForm(Sender).Components[i]).State <> dsInactive then
            TQuery(TForm(Sender).Components[i]).Close;
      end;
   end;
   inherited;
end;

end.
