unit FCadastroDetCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwidlg, Db, Wwdatsrc, DBCtrls, StdCtrls, Buttons, MAHlpBtn,
  ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, DBTables, wwQuery,
  cmseldlg, ToolWin, FCadastro, TB97, MontaSelect, FCadastroCS,
  uDataBase, TB97Tlbr, TB97Ctls, IvDictio, IvMulti,
  IvEMulti, TabControlDetalhe, ImgList, ActnList, CmEventosCadastro, uCMTypes,
  Gauges, fcLabel;

type
  TfrmCadastroDetCS = class(TfrmCadastroCS)
    dsDet: TwwDataSource;
    pnlMestre: TPanel;
    pnlDetalhe: TPanel;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
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
    procedure FormActivate(Sender: TObject);
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
  frmCadastroDetCS: TfrmCadastroDetCS;

implementation

{ TODO -oGustavo Viegas -cCadastros : Verificar métodos implementados no form e
  ultilizar o componente CmeCadastro verificando métodos nos cadastros
  de pessoa e outros mestra detalhe}

uses UMensErro, DBaseDados, uAutorizacao;

{$R *.DFM}


procedure TfrmCadastroDetCS.HabilitaPainel( panel : TPanel ; flag : boolean);
begin
     panel.Visible := flag;
     bbtnConfirmar.Enabled :=  not flag;
     bbtnCancelar.Enabled :=  not flag;
     AutorizarForm(afSoDesabilitar);
end;

function  TfrmCadastroDetCS.VerificaMestre : boolean;
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


procedure TfrmCadastroDetCS.sbtnInsDetClick(Sender: TObject);
begin
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

procedure TfrmCadastroDetCS.sbtnAltDetClick(Sender: TObject);
begin
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

procedure TfrmCadastroDetCS.sbtnExcluiDetClick(Sender: TObject);
begin
     inherited;
     CmeDetalhe.Delete(Self);;
     CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadastroDetCS.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  sbtnAltDet.Click;
end;

procedure TfrmCadastroDetCS.TestaAlteracao;
begin
   if TemAlteracaoPendente then
   Begin
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled := True;
   End;
end;

procedure TfrmCadastroDetCS.FazerCancelaDetalhe;
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

procedure TfrmCadastroDetCS.FazerVoltarDet;
begin
     if (qryAtual <> nil) and (qryAtual.State in [dsEdit,dsInsert]) then
        qryAtual.Cancel;
     HabilitaOkDetalhe(false);
     if grdAtual <> nil then
        grdAtual.BringToFront;
     TestaAlteracao;
     CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadastroDetCS.FormCreate(Sender: TObject);
var i : integer;
begin
   CmeDetalhe.RepetirInsert := true;
   inherited;
   for i := 0 to pgctrlDetalhe.PageCount-1 do begin
       pgctrlDetalhe.Pages[i].TabVisible := false;
   end;
end;

procedure TfrmCadastroDetCS.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadastroDetCS.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadastroDetCS.FormActivate(Sender: TObject);
begin
     inherited;
{}
end;


procedure TfrmCadastroDetCS.HabilitaOkDetalhe(h:boolean);
begin
     inherited;
     sbtnOkDet.Enabled := h;
     sbtnCancelaDet.Enabled := h;
     sbtnVoltaDet.Enabled := h;
end;

procedure TfrmCadastroDetCS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadastroDetCS.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Confirma(self);
  FazerVoltarDet;
  inherited;
  CmeDetalhe.AtualizaBotoes(Self);
end;

procedure TfrmCadastroDetCS.CmeCadastroCancel(Sender: TObject);
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

procedure TfrmCadastroDetCS.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  pnlMestre.Enabled := pnlFundo.Enabled;
  pnlFundo.Enabled := true;
end;

procedure TfrmCadastroDetCS.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryAtual.Insert;
end;

procedure TfrmCadastroDetCS.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  qryAtual.Edit;
end;

procedure TfrmCadastroDetCS.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
  qryAtual.Delete;
  CmeDetalhe.Confirma(self);
end;

procedure TfrmCadastroDetCS.CmeDetalheConfirma(Sender: TObject);
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

procedure TfrmCadastroDetCS.CmeDetalheAtualizaBotoes(Sender: TObject);
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

procedure TfrmCadastroDetCS.sbtnCancelaDetClick(Sender: TObject);
begin
  inherited;
  FazerCancelaDetalhe;
end;

procedure TfrmCadastroDetCS.sbtnOkDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Confirma(self);
end;

procedure TfrmCadastroDetCS.sbtnVoltaDetClick(Sender: TObject);
begin
  inherited;
  FazerVoltarDet;
end;

end.
