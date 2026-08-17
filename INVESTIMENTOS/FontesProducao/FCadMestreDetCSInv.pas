//*****************************************************************************
//Data	    : 05/09/2006
//Código    : Al_4
//Pendencia :
//SOL       :
//Motivo(S) : Ajusta o tamanho do frame na evento OnShow também
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_3
//Pendencia :
//SOL       :
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//*****************************************************************************
//Data	 :  18/10/2005
//Codigo :  AL_2
//Função :  Altera o Caption para 'Cadastro', quando for o caption original 'frm...'
//*****************************************************************************
//Data	 :  16/09/2005
//Codigo :  AL_1
//Função :  Criado rotina no método Close para fechar todas as queries ativas do form
//*****************************************************************************

unit FCadMestreDetCSInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, fcLabel, ExtCtrls, CmEventosCadastro, ImgList,
  MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc,
  Wwquery, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, faMensagem;

type
  TfrmCadMestreDetalheCSInv = class(TfrmCadMestreDetalheCS)
    Bevel1: TBevel;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    updDetalhe: TUpdateSQL;
    qryDetalhe: TwwQuery;
    sbtnConsDet: TToolbarButton97;
    fraMens: TfraMensagem;
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtnConsDetClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ControlaBTConsulta;
  public
    { Public declarations }
  end;

var
  frmCadMestreDetalheCSInv: TfrmCadMestreDetalheCSInv;

implementation

uses UDataBase, UmensErro, FPrincipal, URendaFixa, URendaVariavel;

{$R *.DFM}

procedure TfrmCadMestreDetalheCSInv.ControlaBTConsulta;
begin
   sbtnConsDet.Enabled := ((not (qryAtual.State in [dsInsert, dsEdit, dsInactive])) and
                           (not (qryAtual.IsEmpty)) and
                           (qry.State in [dsInsert, dsEdit]));
end;

procedure TfrmCadMestreDetalheCSInv.sbtnInsDetClick(Sender: TObject);
begin
  // AL_3 - Controle do processo de fechamento de renda variável
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

procedure TfrmCadMestreDetalheCSInv.sbtnAltDetClick(Sender: TObject);
begin
  // AL_3 - Controle do processo de fechamento de renda variável
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

procedure TfrmCadMestreDetalheCSInv.sbtnExcluiDetClick(Sender: TObject);
begin
  // AL_3 - Controle do processo de fechamento de renda variável
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

procedure TfrmCadMestreDetalheCSInv.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadMestreDetalheCSInv.sbtnConsDetClick(Sender: TObject);
begin
   inherited;
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
   begin
      bbtnVoltarDet.Click;
      bbtnOkDet.Visible := True;
      bbtnCancelarDet.Visible := True;
      bbtnVoltarDet.Enabled := True;
   end;
end;

procedure TfrmCadMestreDetalheCSInv.dsDetStateChange(Sender: TObject);
begin
   inherited;
   ControlaBTConsulta;
end;

procedure TfrmCadMestreDetalheCSInv.dsStateChange(Sender: TObject);
begin
   inherited;
   ControlaBTConsulta;
end;

procedure TfrmCadMestreDetalheCSInv.tbcDetalheChange(Sender: TObject);
begin
   inherited;
   ControlaBTConsulta;
end;

procedure TfrmCadMestreDetalheCSInv.FormShow(Sender: TObject);
begin
  //AL_4
  fraMens.Width := (TForm(Sender).Width - 345);
  fraMens.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 345)/2);
  inherited;
  fraMens.Apaga;
  // AL_2
  if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
     TForm(Sender).Caption := 'Cadastro';
end;

procedure TfrmCadMestreDetalheCSInv.FormResize(Sender: TObject);
begin
  inherited;
  fraMens.Width := (TForm(Sender).Width - 345);
  fraMens.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 345)/2);
end;

procedure TfrmCadMestreDetalheCSInv.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   bbtnOkDet.Visible := True;
   bbtnCancelarDet.Visible := True;
   bbtnVoltarDet.Enabled := True;
   ControlaBTConsulta;
end;

procedure TfrmCadMestreDetalheCSInv.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   bbtnOkDet.Visible       := True;
   bbtnCancelarDet.Visible := True;
   bbtnVoltarDet.Enabled   := True;

   ControlaBTConsulta;

   sbtnInsDet.Down         := False;
   sbtnAltDet.Down         := False;
   sbtnExcluiDet.Down      := False;
   sbtnConsDet.Down        := False;

end;

procedure TfrmCadMestreDetalheCSInv.FormCreate(Sender: TObject);
begin
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

   inherited;

end;

procedure TfrmCadMestreDetalheCSInv.FormClose(Sender: TObject;  var Action: TCloseAction);
var i: Integer;
begin
   inherited;
   // AL_1
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
end;

procedure TfrmCadMestreDetalheCSInv.sbtnInserirClick(Sender: TObject);
begin
  // AL_3 - Controle do processo de fechamento de renda variável e renda fixa
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

procedure TfrmCadMestreDetalheCSInv.sbtnAlterarClick(Sender: TObject);
begin
  // AL_3 - Controle do processo de fechamento de renda variável e renda fixa
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

procedure TfrmCadMestreDetalheCSInv.sbtnApagarClick(Sender: TObject);
begin
  // AL_3 - Controle do processo de fechamento de renda variável e renda fixa
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

end.
