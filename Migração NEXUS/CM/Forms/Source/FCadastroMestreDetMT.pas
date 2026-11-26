unit FCadastroMestreDetMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Provider, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, uCMTypes, Gauges,
  fcLabel;

type
  TFrmCadastroMestreDetMT = class(TFrmCadastroMT)
    pnlMestre: TPanel;
    tbcDetalhe: TTabControlDetalhe;
    pgctrlDetalhe: TPageControl;
    tbsDet: TTabSheet;
    dbgrdDet: TwwDBGrid;
    pnlControlesDet: TPanel;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    CmeDetalhe: TCmEventosCadastro;
    dsDet: TwwDataSource;
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  protected
    grdAtual : TwwDBGrid;
    CdsAtual : TCMClientDataSet;
    procedure FazerVoltarDet;
    procedure HabilitaPainel( panel : TPanel ; flag : boolean);    
  private
    { Private declarations }
    function VerificaMestre : boolean;
  public
    { Public declarations }
  end;

var
  FrmCadastroMestreDetMT: TFrmCadastroMestreDetMT;

implementation

Uses uMensErro, uAutorizacao;

{$R *.DFM}

{ TFrmCadastroMestreDetMT }

procedure TFrmCadastroMestreDetMT.FazerVoltarDet;
begin
   if (CdsAtual <> nil) and (CdsAtual.State in [dsEdit,dsInsert]) then
      CdsAtual.Cancel;

   tb97Detalhe.Visible := false;

   if grdAtual <> nil then grdAtual.BringToFront;

   CmeDetalhe.Atualizabotoes(Self);
end;

procedure TFrmCadastroMestreDetMT.HabilitaPainel(panel: TPanel;
  flag: boolean);
begin
   panel.Visible := flag;
   bbtnConfirmar.Enabled :=  not flag;
   bbtnCancelar.Enabled :=  not flag;
   AutorizarForm(afSoDesabilitar);
end;

function TFrmCadastroMestreDetMT.VerificaMestre: boolean;
begin
   if Cds.Active then
   begin
        if Cds.State in ([dsInsert,dsEdit]) then
           Result := true
        else
            if (Cds.IsEmpty) then
               Result := false
            else
                Result := true;
   end
   else
       Result := false;
end;

procedure TFrmCadastroMestreDetMT.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  if sbtnInsDet.Down then
  begin
       grdAtual.SendToBack;
       tb97Detalhe.Visible := true;
       CmeDetalhe.Insert(Self);
       CmeDetalhe.Atualizabotoes(Self);
       CmeDetalhe.Operacao := OpInserir;
  end
  else
      sbtnInsDet.Down := true;
end;

procedure TFrmCadastroMestreDetMT.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if sbtnAltDet.Down then
  begin
       grdAtual.SendToBack;
       tb97Detalhe.Visible := true;
       CmeDetalhe.Edit(Self);
       CmeDetalhe.Atualizabotoes(Self);
       CmeDetalhe.Operacao := OpAlterar;
  end
  else
      sbtnAltDet.Down := true;
end;

procedure TFrmCadastroMestreDetMT.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Operacao := OpApagar;
  CmeDetalhe.Delete(Self);
  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TFrmCadastroMestreDetMT.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Confirma(Self);
end;

procedure TFrmCadastroMestreDetMT.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Cancel(Self);
end;

procedure TFrmCadastroMestreDetMT.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  If (CmeCadastro.Operacao In [OpInserir, OpAlterar]) Then
     If (dbgrdDet.DataSource.DataSet.IsEmpty) Then
       sbtnInsDet.Click
     Else
       sbtnAltDet.Click;
end;

procedure TFrmCadastroMestreDetMT.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  FazerVoltarDet;
end;

procedure TFrmCadastroMestreDetMT.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  if tbcDetalhe.detdbGrids.count > 0 then
  begin
       grdAtual := TwwDBGrid(TComponent(sender).Owner.FindComponent(tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex]));
       if grdAtual <> nil then
          CdsAtual := TCMClientDataSet(grdAtual.DataSource.DataSet)
       else
           CdsAtual := nil;

       if tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex] = '' then           
          tb97BotoesDetalhe.Visible := false
       else
           tb97BotoesDetalhe.Visible := true;

       pgctrlDetalhe.ActivePageIndex := tbcDetalhe.TabIndex;

       If tbcDetalhe.TabIndex <> pgctrlDetalhe.ActivePageIndex Then
          pgctrlDetalhe.ActivePageIndex := tbcDetalhe.TabIndex;

       //pgctrlDetalhe.ActivePage := TTabSheet(pgctrlDetalhe.Pages[tbcDetalhe.TabIndex]);

       bbtnVoltarDetClick(Self);
  end;
end;

procedure TFrmCadastroMestreDetMT.FormCreate(Sender: TObject);
var
  i : integer;
begin
  CmeDetalhe.RepetirInsert := true;
  inherited;
  for i := 0 to pgctrlDetalhe.PageCount-1 do begin
      pgctrlDetalhe.Pages[i].TabVisible := false;
  end;
  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange(tbcDetalhe);
end;

procedure TFrmCadastroMestreDetMT.tbcDetalheChanging(Sender: TObject;
  var AllowChange: Boolean);
var
   mResult : TModalResult;
   sEstado,
   sEstadoCaption : string;
begin
  inherited;
  if (CdsAtual <> nil) and (CdsAtual.state in [dsInsert,dsEdit]) then
  begin
       if CdsAtual.state in [dsInsert] then
       begin
            sEstado := 'inclusão';
            sEstadoCaption := 'Inclusão';
       end
       else
       begin
            sEstado := 'alteração';
            sEstadoCaption := 'Alteração';
       end;

     mResult := MsgDlg('Você está tentando mudar de pasta sem confirmar a '+sEstado+' de '+tbcDetalhe.Tabs[tbcDetalhe.TabIndex]+'.'+#13+#10+'Confirma a '+sEstado+' de '+tbcDetalhe.Tabs[tbcDetalhe.TabIndex]+'?', sEstadoCaption+' não confirmada', mtConfirmation, [mbYes, mbNo, mbCancel],0);
     try
        if mResult = mrYes then
        begin
             CmeDetalhe.RepetirInsert := false;
             bbtnOkDet.Click;
             CmeDetalhe.RepetirInsert := true;
        end
        else if mResult = mrNo then
             bbtnCancelarDet.Click
        else if mResult = mrCancel then
             AllowChange := false;
     except end;
  end;
end;

procedure TFrmCadastroMestreDetMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;

  FazerVoltarDet;

  inherited;

  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TFrmCadastroMestreDetMT.CmeCadastroCancel(Sender: TObject);
var
   i : integer;
begin
   CmeDetalhe.Cancel(Self);

   i := 0;

   while (i < ComponentCount) do begin
         if (Components[i] Is TCmClientDataSet) and
            (TCmClientDataSet(Components[i]).Active) and
            (TCmClientDataSet(Components[i]).ChangeCount > 0) then
            TCmClientDataSet(Components[i]).CancelUpdates;
         Inc(i);
   end;
   inherited;
end;

procedure TFrmCadastroMestreDetMT.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  CmeDetalhe.Atualizabotoes(Self);
  pnlMestre.Enabled := pnlFundo.Enabled;
  pnlFundo.Enabled := true;
end;

procedure TFrmCadastroMestreDetMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsAtual.Insert;
end;

procedure TFrmCadastroMestreDetMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  CdsAtual.Edit
end;

procedure TFrmCadastroMestreDetMT.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
  CdsAtual.Delete;
  bbtnOkDetClick(Self);
end;

procedure TFrmCadastroMestreDetMT.CmeDetalheConfirma(Sender: TObject);
var
  bRepete : boolean;
begin
  if (CdsAtual <> nil ) and (CdsAtual.State in [dsInsert, dsEdit]) then
  begin
      bRepete := (CmeDetalhe.RepetirInsert) and (CdsAtual.State = dsInsert);
      try
         CdsAtual.Post;
         if bRepete then
            CmeDetalhe.Insert(Self)
         else
             FazerVoltarDet;
      except end;
      CmeDetalhe.Atualizabotoes(Self);
  end;
end;

procedure TFrmCadastroMestreDetMT.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
  if CdsAtual <> nil then
  begin
      CdsAtual.Cancel;
      grdAtual.BringToFront;
  end;

  tb97Detalhe.Visible := false;
  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TFrmCadastroMestreDetMT.CmeDetalheAtualizaBotoes(
  Sender: TObject);
var
  lTemReg : Boolean;
begin
  inherited;
  If  (CdsAtual <> nil) Then
  Begin
     //sbtnInsDet.Enabled := (CdsAtual.State = dsBrowse);
     sbtnInsDet.Down := (CdsAtual.State = dsInsert);
     //sbtnAltDet.Enabled := (CdsAtual.State = dsBrowse);
     sbtnAltDet.Down := (CdsAtual.State = dsEdit);
     //sbtnExcluiDet.Enabled := (CdsAtual.State = dsBrowse) and (not CdsAtual.IsEmpty);
  End;

  if (CmeCadastro.Operacao in [opInserir,opAlterar]) and
     (VerificaMestre) then
  begin
    if (CdsAtual <> nil) and (not CdsAtual.IsEmpty) then
       lTemReg := true
    else
        lTemReg := false;

    sbtnInsDet.Enabled := (Not sbtnAltDet.Down);
    sbtnAltDet.Enabled := lTemReg And (Not sbtnInsDet.Down);
    sbtnExcluiDet.Enabled := lTemReg And (Not sbtnInsDet.Down) And (Not sbtnAltDet.Down);
  end
  else
  begin
     sbtnInsDet.Enabled := false;
     sbtnAltDet.Enabled := false;
     sbtnExcluiDet.Enabled := false;
  end;

  AutorizarForm(afSoDesabilitar);
end;

procedure TFrmCadastroMestreDetMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  CmeDetalhe.Confirma(Self);
  Accept := CmeDetalhe.ConfirmaCadastro;
end;

end.
