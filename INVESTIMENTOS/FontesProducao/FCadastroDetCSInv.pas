//********************************************************************************************************
// Data     : 10/11/2005
// Código   : AL_2
// Motivo   : Fecha todas as queries que estiverem abertas no fechamento do form
//            Ajuste no LayOut do Painel de dados
//            Caption automático = 'Cadastro'
//********************************************************************************************************
// Data     : 04/08/2004
// Código   : AL_1
// Função   :
// Motivo   : Controle do processo de abertura
//********************************************************************************************************
unit FCadastroDetCSInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwidlg, Db, Wwdatsrc, DBCtrls, StdCtrls, Buttons, MAHlpBtn,
  ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, DBTables, wwQuery,
  cmseldlg, ToolWin, FCadastro, TB97, MontaSelect, FCadastroCS,
  uDataBase, TB97Tlbr, TB97Ctls, IvDictio, IvMulti,
  IvEMulti, TabControlDetalhe, ImgList, ActnList, CmEventosCadastro
  {$IFNDEF VER0505}, uCMTypes {$ENDIF};

type
  TfrmCadastroDetCSInv = class(TfrmCadastroCS)
    dsDet: TwwDataSource;
    pnlMestre: TPanel;
    pnlDetalhe: TPanel;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    pgctrlDetalhe: TPageControl;
    tbsDet: TTabSheet;
    pnlControlesDet: TPanel;
    dbgrdDet: TwwDBGrid;
    CmeDetalhe: TCmEventosCadastro;
    sbtnInsDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    sbtnOkDet: TToolbarButton97;
    sbtnCancelaDet: TToolbarButton97;
    sbtnVoltaDet: TToolbarButton97;
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure HabilitaPainel( panel : TPanel ; flag : boolean);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure sbtnCancelaDetClick(Sender: TObject);
    procedure sbtnOkDetClick(Sender: TObject);
    procedure sbtnVoltaDetClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

  protected
     procedure TestaAlteracao; virtual;
     procedure FazerCancelaDetalhe;
     procedure FazerVoltarDet;
     procedure HabilitaOkDetalhe(h:boolean);
  private
     grdAtual : TwwDBGrid;
     qryAtual : TwwQuery;
     function VerificaMestre : boolean;     
  public
    { Public declarations }
  end;

var
  frmCadastroDetCSInv: TfrmCadastroDetCSInv;

implementation

uses UMensErro, DBaseDados, uAutorizacao, FPrincipal, URendaFixa;

{$R *.DFM}


procedure TfrmCadastroDetCSInv.HabilitaPainel( panel : TPanel ; flag : boolean);
begin
     panel.Visible := flag;
     bbtnConfirmar.Enabled :=  not flag;
     bbtnCancelar.Enabled :=  not flag;
     AutorizarForm(afSoDesabilitar);
end;

function  TfrmCadastroDetCSInv.VerificaMestre : boolean;
begin
     if qry.Active then
     begin
          if qry.State in ([dsInsert,dsEdit]) then
             Result := true
          else
              if (qry.IsEmpty) then
                 Result := false
              else
                  Result := true;
     end
     else
         Result := false;
end;


procedure TfrmCadastroDetCSInv.sbtnInsDetClick(Sender: TObject);
begin
   // AL_1 - Controle do processo de abertura de renda fixa
   // Se for Renda Fixa
   if TipoMenuInvest = 'F' then
   begin
      if RendaFixa.VerEmAbertura then
      begin
         CmeCadastro.AtualizaBotoes(Self);
         Exit;
      end;
   end;

   inherited;

   if sbtnInsDet.Down then
    begin
         grdAtual.SendToBack;
         HabilitaOkDetalhe(true);
         CmeDetalhe.Insert(Self);;
    end
    else
        sbtnInsDet.Down := true;
end;

procedure TfrmCadastroDetCSInv.sbtnAltDetClick(Sender: TObject);
begin
   // AL_1 - Controle do processo de abertura de renda fixa
   // Se for Renda Fixa
   if TipoMenuInvest = 'F' then
   begin
      if RendaFixa.VerEmAbertura then
      begin
         CmeCadastro.AtualizaBotoes(Self);
         Exit;
      end;
   end;
   inherited;
   if sbtnAltDet.Down then
   begin
        grdAtual.SendToBack;
        HabilitaOkDetalhe(true);
        CmeDetalhe.Edit(Self);;
   end
   else
       sbtnAltDet.Down := true;
end;

procedure TfrmCadastroDetCSInv.sbtnExcluiDetClick(Sender: TObject);
begin
   // AL_1 - Controle do processo de abertura de renda fixa
   // Se for Renda Fixa
   if TipoMenuInvest = 'F' then
   begin
      if RendaFixa.VerEmAbertura then
      begin
         CmeCadastro.AtualizaBotoes(Self);
         Exit;
      end;
   end;
   inherited;
   CmeDetalhe.Delete(Self);;
   CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadastroDetCSInv.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  sbtnAltDet.Click;
end;

procedure TfrmCadastroDetCSInv.TestaAlteracao;
begin
   if TemAlteracaoPendente then
   Begin
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled := True;
   End;
end;

procedure TfrmCadastroDetCSInv.FazerCancelaDetalhe;
begin
     if qryAtual <> nil then
     begin
          qryAtual.Cancel;
          grdAtual.BringToFront;
     end;

     HabilitaOkDetalhe(false);
     TestaAlteracao;
     CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadastroDetCSInv.FazerVoltarDet;
begin
     if (qryAtual <> nil) and (qryAtual.State in [dsEdit,dsInsert]) then
        qryAtual.Cancel;
     HabilitaOkDetalhe(false);
     if grdAtual <> nil then
        grdAtual.BringToFront;
     TestaAlteracao;
     CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadastroDetCSInv.FormCreate(Sender: TObject);
var i : integer;
begin
   // AL_2 - Maximiza a tela caso ela não caiba na área de trabalho do form principal
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

   CmeDetalhe.RepetirInsert := true;
   inherited;
   for i := 0 to pgctrlDetalhe.PageCount-1 do begin
       pgctrlDetalhe.Pages[i].TabVisible := false;
   end;
end;

procedure TfrmCadastroDetCSInv.sbtnInserirClick(Sender: TObject);
begin
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;
  inherited;
  CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadastroDetCSInv.sbtnAlterarClick(Sender: TObject);
begin
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;
  inherited;
  CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadastroDetCSInv.HabilitaOkDetalhe(h:boolean);
begin
     inherited;
     sbtnOkDet.Enabled := h;
     sbtnCancelaDet.Enabled := h;
     sbtnVoltaDet.Enabled := h;
end;

procedure TfrmCadastroDetCSInv.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadastroDetCSInv.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Confirma(self);
  FazerVoltarDet;
  inherited;
  CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadastroDetCSInv.CmeCadastroCancel(Sender: TObject);
var
   i : integer;
begin
   FazerCancelaDetalhe;
   RollBackTransacao;
   i := 0;
   while (i < ComponentCount) do begin
         if (TObject(Components[i]).ClassType = TwwQuery) and
            (TwwQuery(Components[i]).Active) and
            (TwwQuery(Components[i]).CachedUpdates) then
            TwwQuery(Components[i]).CancelUpdates;
         Inc(i);
   end;
   CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadastroDetCSInv.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  pnlMestre.Enabled := pnlFundo.Enabled;
  pnlFundo.Enabled := true;
end;

procedure TfrmCadastroDetCSInv.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryAtual.Insert;
end;

procedure TfrmCadastroDetCSInv.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  qryAtual.Edit;
end;

procedure TfrmCadastroDetCSInv.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
  qryAtual.Delete;
  CmeDetalhe.Confirma(self);
end;

procedure TfrmCadastroDetCSInv.CmeDetalheConfirma(Sender: TObject);
var
  bRepete : boolean;
begin
  if (qryAtual <> nil ) and (qryAtual.State in [dsInsert, dsEdit]) then
  begin
      bRepete := (CmeDetalhe.RepetirInsert) and (qryAtual.State = dsInsert);
      qryAtual.Post;
      TestaAlteracao;
      if bRepete then
         CmeDetalhe.Insert(Self)
      else
          FazerVoltarDet;
      CmeDetalhe.AtualizaBotoes(Self);
  end;
end;

procedure TfrmCadastroDetCSInv.CmeDetalheAtualizaBotoes(Sender: TObject);
var
  lTemReg : Boolean;
begin
  inherited;
  CmeCadastro.AtualizaBotoes(Self);
  sbtnInsDet.Down := false;
  sbtnAltDet.Down := false;
  sbtnExcluiDet.Down := false;

  if (CmeCadastro.Operacao in [opInserir,opAlterar]) and (VerificaMestre) then
  begin
    sbtnInsDet.Enabled := true;
    if (qryAtual <> nil) and (not qryAtual.IsEmpty) then
       lTemReg := true
    else
        lTemReg := false;

    sbtnExcluiDet.Enabled := lTemReg;
    sbtnAltDet.Enabled := lTemReg;
  end
  else begin
     sbtnInsDet.Enabled := false;
     sbtnAltDet.Enabled := false;
     sbtnExcluiDet.Enabled := false;
  end;
  AutorizarForm(afSoDesabilitar);
end;

procedure TfrmCadastroDetCSInv.sbtnCancelaDetClick(Sender: TObject);
begin
  inherited;
  FazerCancelaDetalhe;
end;

procedure TfrmCadastroDetCSInv.sbtnOkDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Confirma(self);
end;

procedure TfrmCadastroDetCSInv.sbtnVoltaDetClick(Sender: TObject);
begin
  inherited;
  FazerVoltarDet;
end;

procedure TfrmCadastroDetCSInv.sbtnApagarClick(Sender: TObject);
begin
  // AL_1 - Controle do processo de abertura de renda fixa
  // Se for Renda Fixa
  if TipoMenuInvest = 'F' then
  begin
     if RendaFixa.VerEmAbertura then
     begin
        CmeCadastro.AtualizaBotoes(Self);
        Exit;
     end;
  end;

  inherited;

end;

procedure TfrmCadastroDetCSInv.FormClose(Sender: TObject;  var Action: TCloseAction);
var i: Word;
begin
   // AL_2 - Fecha todas as queries que ficarem abertas
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

procedure TfrmCadastroDetCSInv.FormShow(Sender: TObject);
begin
   // AL_2
   if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
      TForm(Sender).Caption := 'Cadastro';
   inherited;
end;

end.
